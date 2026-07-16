`timescale 1ns / 1ps

module processor(
    input clk, reset, 
    output [31:0] Result
    );
    
//Datapath Instant 
wire RegWrite; 
wire MemtoReg; 
wire ALUSrc; 
wire MemWrite; 
wire MemRead; 
wire [3:0] Operation  ; 
wire [6:0] Opcode; 
wire [2:0] Funct3; 
wire [6:0] Funct7; 

data_path Datapath ( 
        .clk(clk),                       // CLK in Datapath figure
        .reset(reset),                     // Reset in Datapath figure
        .reg_write(RegWrite),                 // RegWrite in Datapath figure
        .mem2reg(MemtoReg),                   // MemtoReg in Datapath figure
        .alu_src(ALUSrc),                   // ALUSrc in Datapath figure
        .mem_write(MemWrite),                 // MemWrite in Datapath Figure
        .mem_read(MemRead),                  // MemRead in Datapath Figure
        .alu_cc(Operation),     // ALUCC in Datapath Figure
        .opcode(Opcode),             // opcode in Datapath Figure
        .funct7(Funct7),             // Funct7 in Datapath Figure
        .funct3(Funct3),             // Funct3 in Datapath Figure
        .alu_result(Result)   // Datapath_Result in Datapath Figure
); 

//Controller Instant 
wire [1:0] ALUOp; 
Controller controller (
    .Opcode(Opcode) , 
    .ALUSrc(ALUSrc) , 
    .MemtoReg(MemtoReg) ,  
    .RegWrite(RegWrite) , 
    .MemRead(MemRead) , 
    .MemWrite(MemWrite) ,
    .ALUOp(ALUOp)
);


//ALU Controller Instant
ALUController alucontroller(
    .ALUOp(ALUOp) ,
    .Funct7(Funct7) , 
    .Funct3(Funct3) , 
    .Operation(Operation)
    );

endmodule
