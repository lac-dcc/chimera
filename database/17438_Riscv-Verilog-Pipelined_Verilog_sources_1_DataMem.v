// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:52:45 PM
// Design Name: 
// Module Name: DataMem
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

// ------------------ BYte Addressable Memory-------------------//
module DataMem                                 
(input clk, input MemRead, input MemWrite,input[2:0]fun3,input [7:0] addr, input [31:0] data_in, output [31:0] data_out);

    reg [7:0] mem [0:255];
    
    reg[31:0] temp;
                        
    initial begin
// mem[0]=10;
// mem[1]=13;
// mem[2]=30;
// mem[0]=8'd17;
// mem[1]=8'd9;
// mem[2]=8'd25; 


      
mem[0]=8'd5;
mem[1]=8'd0;
mem[2]=8'd0;
mem[3]=8'd0;

mem[4]=8'd2;
mem[5]=8'd0;
mem[6]=8'd0;
mem[7]=8'd0;

mem[8]=8'd3;
mem[9]=8'd0;
mem[10]=8'd0;
mem[11]=8'd0;

mem[12]=8'd12;
mem[13]=8'd13;
mem[14]=8'd14;
mem[15]=8'd15;
mem[16]=8'd16;
mem[17]=8'd17;
mem[18]=8'd18;
mem[19]=8'd19;
mem[20]=8'd20;
mem[21]=8'd21;
mem[22]=8'd22;
mem[23]=8'd23;
mem[24]=8'd24;
mem[25]=8'd25;
mem[26]=8'd26;
mem[27]=8'd27;
mem[28]=8'd28;
mem[29]=8'd29;
mem[30]=8'd30;
mem[31]=8'd31;
mem[32]=8'd32;
mem[33]=8'd33;
mem[34]=8'd34;
mem[35]=8'd35;
mem[36]=8'd36;
mem[37]=8'd37;
mem[38]=8'd38;
mem[39]=8'd39;
mem[40]=8'd40;
mem[41]=8'd41;
mem[42]=8'd42;
mem[43]=8'd43;
mem[44]=8'd44;
mem[45]=8'd45;
mem[46]=8'd46;
mem[47]=8'd47;
mem[48]=8'd48;
mem[49]=8'd49;
mem[50]=8'd50;
mem[51]=8'd51;
mem[52]=8'd52;
mem[53]=8'd53;
mem[54]=8'd54;
mem[55]=8'd55;
mem[56]=8'd56;
mem[57]=8'd57;
mem[58]=8'd58;
mem[59]=8'd59;
mem[60]=8'd60;
mem[61]=8'd61;
mem[62]=8'd62;
mem[63]=8'd63;

    end

//  Little Indian [mem3][mem2][mem1][mem0]

    always @(posedge clk) begin
        if(MemWrite)begin
        case(fun3)
        3'b000: mem[addr]=data_in[7:0]; //SB
        3'b001:       {mem[addr+1],mem[addr]}=data_in[15:0]; //SH
        3'b010:     {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]}=data_in;   //SW
        endcase
        end
           
    end
    
    always @(*) begin
        case(fun3)
        3'b000:temp = {{24{mem[addr][7]}}, mem[addr]};      //LB
        3'b001:temp={{16{mem[addr+1][7]}},mem[addr+1],mem[addr]};      //LH
        3'b010:temp={mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};      //LW
        3'b100:temp= {24'b0, mem[addr]};    //LBU
        3'b101:temp={16'b0, mem[addr+1],mem[addr]};      //LHU
        
        default:temp=0;
       
        endcase

    
    end
     assign data_out = (MemRead)?temp:0;


endmodule 






//-----------------------------------------------------Old Version------------------------------------------------------\\
//module DataMem                                 //[7:0]
//(input clk, input MemRead, input MemWrite,input [5:0] addr, input [31:0] data_in, output [31:0] data_out);
//    reg [31:0] mem [0:63];
 

                        
//    initial begin
//        mem[0]=17;
//        mem[1]=9;
//        mem[2]=25;
//    end



//    always @(posedge clk) begin
//        if(MemWrite)
//            mem[addr]=data_in;
//    end
//    assign data_out = (MemRead)?mem[addr]:0;

//endmodule 
