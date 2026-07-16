`timescale 1ns / 1ps

module Controller (
Opcode , 
ALUSrc , 
MemtoReg ,  
RegWrite , 
MemRead , 
MemWrite ,
ALUOp
);

//define I/O signals
input [6:0] Opcode;
output ALUSrc; 
output MemtoReg; 
output RegWrite;
output MemRead;
output MemWrite;
output [1:0] ALUOp;

//Define Module Behaviour
//making the opcodes into wires
wire [6:0] Opcode_1 = 7'b0110011; // R-type
wire [6:0] Opcode_2 = 7'b0010011; // I-type
wire [6:0] Opcode_3 = 7'b0000011; // LW
wire [6:0] Opcode_4 = 7'b0100011; // SW

//Define Module Behaviour
assign MemtoReg = (Opcode == Opcode_3) ? 1'b1 : 1'b0; 

assign MemWrite = (Opcode == Opcode_4) ? 1'b1 : 1'b0; 

assign MemRead  = (Opcode == Opcode_3) ? 1'b1 : 1'b0; 

assign ALUSrc   = (Opcode == Opcode_1) ? 1'b0 : 1'b1; 

assign RegWrite = (Opcode == Opcode_4) ? 1'b0 : 1'b1;

assign ALUOp    = (Opcode == Opcode_1)? 2'b10 : // R-type
                  (Opcode == Opcode_2)? 2'b00 : // I-type
                  (Opcode == Opcode_3 || Opcode == Opcode_4) ? 2'b01 : // LW and SW
                  2'b00; // Default
                  
                  
endmodule
