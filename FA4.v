`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2026 11:07:34 AM
// Design Name: 
// Module Name: HA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA4(
    input [3:0] A,
    input [3:0] B,
    input Cin,  //single bit Cin input
    output [3:0] Sum, 
    output Final_Cout
     );
     
     
     
    //defining all internal carryIn wires, along with final Cout wire
    wire Carry_0;
    wire Carry_1;
    wire Carry_2;
    
    //Port_Mapping
    FA instant_0
    (
        .A(A[0]),
        .B(B[0]),
	    .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(Carry_0)   //Cout signal being mapped to Carry_0
     );
     
    FA instant_1
    (
        .A(A[1]),
        .B(B[1]),
	    .Cin(Carry_0),  //Carry_0 will be the Cin 
        .Sum(Sum[1]),
        .Cout(Carry_1)   //Cout signal being mapped to Carry_0
     );
     
     FA instant_2
    (
        .A(A[2]),
        .B(B[2]),
	    .Cin(Carry_1),  //Carry_1 will be the Cin 
        .Sum(Sum[2]),
        .Cout(Carry_2)   //Cout signal being mapped to Carry_0
     );
     
     FA instant_3
    (
        .A(A[3]),
        .B(B[3]),
	    .Cin(Carry_2),  //Carry_2 will be the Cin 
        .Sum(Sum[3]),
        .Cout(Final_Cout) //Cout signal being mapped to Carry_0
     );
endmodule
