`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2026 04:30:14 PM
// Design Name: 
// Module Name: tb_mux21
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


module tb_mux41();
    
    reg [1:0]tb_S=2'b00;
    reg tb_D1=0;
    reg tb_D2=0;
    reg tb_D3=0;
    reg tb_D4=0;
    wire tb_Y;
    
    //Port_Mapping
    Mux_4_To_1 instant
    (
        .S(tb_S),
        .D1(tb_D1),
	    .D2(tb_D2),
	    .D3(tb_D3),
	    .D4(tb_D4),
        .Y(tb_Y)
     );
     
  //Test Samples
  initial  //initial block executes only once
  begin
    //Test 1 
    tb_S=2'b00;
    tb_D1=1'b0;
    tb_D2=1'b1;
    tb_D3=1'b0;
    tb_D4=1'b1; 
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 2
    tb_S=2'b01;
    tb_D1=1'b0;
    tb_D2=1'b1;
    tb_D3=1'b0;
    tb_D4=1'b1; 
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 3
    tb_S=2'b10;
    tb_D1=1'b0;
    tb_D2=1'b1;
    tb_D3=1'b0;
    tb_D4=1'b1; 
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 4
    tb_S=2'b11;
    tb_D1=1'b0;
    tb_D2=1'b1;
    tb_D3=1'b0;
    tb_D4=1'b1; 
    #20;  //wait for 20 time units (20ns in this case)
    
  end
  
endmodule