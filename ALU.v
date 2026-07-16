`timescale 1ns / 1ps

module alu_32( A_in , B_in , ALU_Sel , ALU_Out , Carry_Out , Zero , Overflow);

//Define I/O Ports
    output reg [31:0] ALU_Out; 
    output reg Carry_Out;
    output wire Zero;   //zero must be a wire than changes value based on the ALU_Out
    output reg Overflow;
    
    input wire [31:0] A_in;
    input wire [31:0] B_in;
    input wire [3:0] ALU_Sel;
    
    reg [32:0] unsign_A;   //to hold the unsigned addition along with the carryOut bit. 


//Define ALU Behaviour
    always@(*)
     begin
        case (ALU_Sel)
        
        4'b0000: //BITWISE AND
        begin 
            ALU_Out= A_in & B_in;
            Overflow=1'b0;  //Setting overflow to 0
            Carry_Out=1'b0; //Setting Carryout to 0
         end
         
        4'b0001: //BITWISE OR
            begin
            ALU_Out= A_in | B_in; 
            Overflow=1'b0;  //TO BE CHANGED Setting overflow to 0 FOR NOW
            Carry_Out=1'b0; //Setting Carryout to 0
            end
         
        4'b0010: //ARTHEMETIC ADDITION - A SIGNED OPERATION
            begin
            unsign_A = A_in + B_in; 
            Carry_Out= unsign_A[32]; //the last bit of the unassigned addition sum will be the carryOut
            ALU_Out = $signed(A_in) + $signed(B_in);
                    //POSITIVE NUMBERS LEADING TO NEGATIVE OUTPUT     ;NEGATIVE NUMBERS LEADING TO POSITIVE OUTPUT
            Overflow = ( (!A_in[31] && !B_in[31] && ALU_Out[31]) ) || (A_in[31] && B_in[31] && !ALU_Out[31]);
            end  //end of Addition   

            
            
        4'b0110: //ARTHEMETIC SUBTRACTION - A SIGNED OPERATION
           begin 
           ALU_Out = $signed(A_in) - $signed(B_in); 
                     //POSITIVE-NEGATIVE NUMBER=NEGATIVE NUMBER;  NEGATIVE-POSITIVE=POSITIVE OUTPUT
           Overflow= (!A_in[31] && B_in[31] && ALU_Out[31]) || (A_in[31] && !B_in[31] && !ALU_Out[31]);
           Carry_Out=1'b0;
           end  //end of subtraction 

       
        4'b0111: //Set less than - A SIGNED OPERATION
          begin
          if($signed(A_in) < $signed(B_in)) begin
            ALU_Out=32'b1;
          end
          else begin
            ALU_Out=32'b0;
          end
               
          Overflow=1'b0;  //Setting overflow to 0
          Carry_Out=1'b0; //Setting Carryout to 0
          end 
           
         4'b1100: //BITWISE NOR
         begin
         ALU_Out= ~(A_in | B_in);
         Overflow=1'b0;  //Setting overflow to 0
         Carry_Out=1'b0; //Setting Carryout to 0
         end 
    
         4'b1111: //Equal Comparision
         begin
         if(A_in===B_in) 
         begin
            ALU_Out=32'b1;
         end else begin
            ALU_Out=32'b0;
             end
         Overflow=1'b0;  //Setting overflow to 0
         Carry_Out=1'b0; //Setting Carryout to 0
         end
         
       default: // Default case is Addition
        begin
        unsign_A = A_in + B_in; 
        Carry_Out= unsign_A[32]; //the last bit of the unassigned addition sum will be the carryOut
        ALU_Out = $signed(A_in) + $signed(B_in);
        Overflow = ( (!A_in[31] && !B_in[31] && ALU_Out[31]) ) || (A_in[31] && B_in[31] && !ALU_Out[31]);
        end  //end of Addition  
             
     endcase                 
    end //Always block ending        
    
//setting of Zero Flag based on ALU_Out    
assign Zero = (ALU_Out === 32'b0) ? 1'b1 : 1'b0;
    

endmodule  // 32- bit ALU
