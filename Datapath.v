    `timescale 1ns / 1ps
    
    module data_path #(
        parameter PC_W = 8,              // Program Counter Width
        parameter INS_W = 32,            // Instruction Width
        parameter RF_ADDRESS = 5,        // Register File Address
        parameter DATA_W = 32,           // Data WriteData
        parameter DM_ADDRESS = 9,        // Data Memory Address
        parameter ALU_CC_W = 4           // ALU Control Code Width
    )(
        input clk,                       // CLK in Datapath figure
        input reset,                     // Reset in Datapath figure
        input reg_write,                 // RegWrite in Datapath figure
        input mem2reg,                   // MemtoReg in Datapath figure
        input alu_src,                   // ALUSrc in Datapath figure
        input mem_write,                 // MemWrite in Datapath Figure
        input mem_read,                  // MemRead in Datapath Figure
        input [ALU_CC_W-1:0] alu_cc,     // ALUCC in Datapath Figure
        output [6:0] opcode,             // opcode in Datapath Figure
        output [6:0] funct7,             // Funct7 in Datapath Figure
        output [2:0] funct3,             // Funct3 in Datapath Figure
        output [DATA_W-1:0] alu_result   // Datapath_Result in Datapath Figure
    ) ;
    
    //FlipFlop Instant
    wire [PC_W-1: 0] pc_next, pc_current; //Used for the Flipflop wire
    FlipFlop pc_reg( .clk(clk), .reset(reset), .d(pc_next), .q(pc_current) ); 
    assign pc_next= pc_current+4;  // PC Adder logic 
    
    //Instruction Memory instant 
    wire [INS_W-1: 0] instruction; 
    InstMem Instr_mem(.addr(pc_current), .instruction(instruction) ) ; 
    
    //Now I can fill in the opcode, Funct3, Funct7
    assign opcode = instruction[6:0];
    assign funct3= instruction[14:12];
    assign funct7= instruction[31:25];
    
    
    //Register File instant
    wire [ RF_ADDRESS -1:0] rd_rg_wrt_wire ;  //writing address
    wire [ RF_ADDRESS -1:0] rd_rg_addr_wire1 ; //reading address 1 
    wire [ RF_ADDRESS -1:0] rd_rg_addr_wire2 ; //reading address 2
    wire [DATA_W -1:0] Reg1;  
    wire [DATA_W -1:0] Reg2;
    
    
    assign rd_rg_wrt_wire = instruction [11: 7];
    assign rd_rg_addr_wire1 = instruction [19: 15];
    assign rd_rg_addr_wire2 = instruction [24: 20];
    
    RegFile rf(
        .clk(clk),
        .reset(reset),
        .rg_wrt_en(reg_write),     //add the write enable line, is this teh write input wire assigned from the assignment pdf
        .rg_wrt_addr(rd_rg_wrt_wire),
        .rg_rd_addr1 (rd_rg_addr_wire1),
        .rg_rd_addr2 (rd_rg_addr_wire2),
        .rg_wrt_data (WriteBack_Data),
        .rg_rd_data1 (Reg1),
        .rg_rd_data2 (Reg2)
        ); 
    
    // Immediate Generator Instant 
    wire [INS_W -1:0] ExtImm;
    wire [INS_W -1:0] SrcB;
    ImmGen img(
        .InstCode(instruction),
        .ImmOut(ExtImm)
        ); 
    
    //ALU Left MUX
    Mux_2_To_1 muxLeftALU (
            .S(alu_src),
            .D1(ExtImm),
            .D0(Reg2),
            .Y(SrcB)
        );
     
    //ALU Instant
    //wire [INS_W -1:0] ALU_Result;
    
    alu_32 ALU(
         .A_in(Reg1) ,
         .B_in(SrcB) ,                     // ALU 32 bit inputs
         .ALU_Sel(alu_cc) ,                 // Select pin is ALUCC ? ALU 4 bits selection
         .ALU_Out(alu_result) ,                        // ALU 32 bits output
         .Carry_Out() , //set to be empty
         .Zero(),                           // 1 bit Zero Flag, set to be emptt
         .Overflow()                   // 1 bit Overflow flag, set to empty
     );
      
      
    //Data Memory Instant
    wire [INS_W -1:0] DataMem_read;
    
    DataMem data_mem (
        .MemRead(mem_read) , 
        .MemWrite(mem_write) , 
        .addr(alu_result[8:0]), 
        .write_data(Reg2) , 
        .read_data(DataMem_read)
       );
       
    //ALU Right MUX
    wire [DATA_W -1:0] WriteBack_Data;
    Mux_2_To_1 muxRightALU (
            .S(mem2reg),
            .D1(DataMem_read),
            .D0(alu_result),
            .Y(WriteBack_Data)
        );
     
    endmodule
