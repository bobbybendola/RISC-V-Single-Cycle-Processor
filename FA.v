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


module FA(
    A,
    B,
    Cin,
    Sum,
    Cout 
    );
    
    //Define the input and output signals 
    
    input A;
    input B;
    input Cin;
    output Sum;
    output Cout;
    
    //Define the modules behaviour
    assign Sum = A^B^Cin; 
    assign Cout= (A&B) | (A&Cin)| (B&Cin);
endmodule
