`timescale 1ns / 1ps

module DataMem(MemRead , MemWrite , addr , write_data , read_data ); 

//Define I/O ports
input wire [8:0] addr; 
input wire MemRead; 
input wire MemWrite; 
input wire [31:0] write_data;
output reg [31:0] read_data;    //read data will hold the value from the previous call, it is syrchonous


//Data Memory
reg [31:0] Data_memory [127:0];
//initializing memory to all 0s.
integer i; 
initial
begin
    for(i=0; i<128; i=i+1)
    begin 
        Data_memory[i]=32'h0;
    end
end

//need to change name; reg because it is static, does not need to be always assigned a value 

//Behaviour
always@(*)
begin
    if(MemWrite)
    begin
        Data_memory[addr[8:2]]= write_data;
    end
    if(MemRead)
    begin
        read_data=Data_memory[addr[8:2]] ;  //if MemRead is HIGH, then store the data into memory 
    end
end

endmodule 

