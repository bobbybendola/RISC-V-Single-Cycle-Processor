`timescale 1ns / 1ps

module ALUController(
    ALUOp ,
    Funct7 , 
    Funct3 , 
    Operation
    );
 
 //define I/O signals   
 input [1:0] ALUOp;
 input [2:0] Funct3;
 input [6:0] Funct7;
 output [3:0] Operation;
 
 //define module behaviour 
  
 assign Operation [0]=
 ( ( (Funct3==3'b110) ||  ( (Funct3==3'b010) && (ALUOp[0]==1'b0) ) ) )  ? 1'b1: 1'b0; 
 
assign Operation[1] =
    ((Funct3 == 3'b000) || (Funct3 == 3'b010)) ? 1'b1 : 1'b0;
    
assign Operation[2] =
    ((Funct3 == 3'b100) ||
     ((Funct3 == 3'b010) && (ALUOp[0] == 1'b0)) ||
     ((Funct7 == 7'b0100000) && (ALUOp[1] == 1'b1)))
    ? 1'b1 : 1'b0;
    
assign Operation[3] =
    (Funct3 == 3'b100)
     ? 1'b1 : 1'b0;
    

    
endmodule
