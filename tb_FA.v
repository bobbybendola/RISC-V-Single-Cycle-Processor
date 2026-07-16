`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2026 12:44:21 PM
// Design Name: 
// Module Name: tb_FA
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


module tb_FA();
// Define the input and output ports 
    reg A_tb = 0;
    reg B_tb=0;
    reg Cin_tb=0;
    wire Sum_tb;
    wire Cout_tb;
   
    //Port_Mapping
    FA instant
    (
        .A(A_tb),
        .B(B_tb),
	    .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Cout(Cout_tb)
     );
     
  //Test Samples
  initial  //initial block executes only once
  begin
    //Test 1 
    A_tb=1'b0;
    B_tb=1'b1; 
    Cin_tb=1'b0;
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 2
    A_tb=1'b1;
    B_tb=1'b1; 
    Cin_tb=1'b0;
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 3
    A_tb=1'b1;
    B_tb=1'b1;
    Cin_tb=1'b1;
    #20;  //wait for 20 time units (20ns in this case)
  end
  
endmodule  //FA_tb

