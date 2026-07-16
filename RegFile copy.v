`timescale 1ns / 1ps

module RegFile(
    clk, reset, rg_wrt_en,
     rg_wrt_addr,
     rg_rd_addr1,
     rg_rd_addr2,
     rg_wrt_data,
     rg_rd_data1,
     rg_rd_data2
    );
    
    //Define the I/O signals
    input wire [4:0] rg_wrt_addr; 
    input wire [4:0] rg_rd_addr1;
    input wire [4:0] rg_rd_addr2; 
    input wire clk;
    input wire reset; 
    input wire rg_wrt_en; 
    input [31:0] rg_wrt_data; 
    
    output wire [31:0] rg_rd_data1;
    output wire [31:0] rg_rd_data2;
   
    reg [31:0] register_file [31:0]; 
    
    integer i;   //for the for loop
    
    assign rg_rd_data1= register_file [rg_rd_addr1];
    assign rg_rd_data2= register_file [rg_rd_addr2];
  
   //defining module behaviour  
    always@(posedge clk or posedge reset)
    begin 
    if(reset) begin
    for(i=0; i<32; i=i+1) begin
    register_file[i]<=32'h00000000;
    end //end of for loop
    
    end //end of reset if statement 
    
    else if(rg_wrt_en) begin 
        register_file[rg_wrt_addr] <= rg_wrt_data;
    end// end of else if
    
    end //end of always block
endmodule
