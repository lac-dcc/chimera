// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module Tube(clk,reset,We,ADDR,Tube_WD,digital_tube0,digital_tube1,digital_tube2,digital_Sel0,digital_Sel1,digital_Sel2,Tube_RD);
//input     
    input clk;
    input reset;

    input We;

    input [31:0] ADDR;
    input [31:0] Tube_WD;

//output
    output reg [7:0] digital_tube0;
    output reg [7:0] digital_tube1;
    output reg [7:0] digital_tube2;

    output [3:0] digital_Sel0;
    output [3:0] digital_Sel1;
    output digital_Sel2;

    output reg [31:0] Tube_RD;

//dynamic display logic
    parameter cnt_val=32'd15000,
              zero=8'b10000001,     //common anode
               one=8'b11001111,
               two=8'b10010010,
             three=8'b10000110,
              four=8'b11001100,
              five=8'b10100100,
               six=8'b10100000,
             seven=8'b10001111,
             eight=8'b10000000,
              nine=8'b10000100,
                 A=8'b10001000,
                 B=8'b11100000,
                 C=8'b10110001,
                 D=8'b11000010,
                 E=8'b10110000,
                 F=8'b10111000,
             minus=8'b11111110;
    
    reg [3:0] Sel0,Sel1;              //which sub-tube to be lightened
    reg [3:0] data0,data1,data2;      //the data to display

    reg [35:0] data;

    integer count;

//Tube_Sel
    assign digital_Sel0=Sel0;
    assign digital_Sel1=Sel1;
    assign digital_Sel2=1;

//tube0
    always @(*)
        begin
        //select data to display
            data0=data[3:0];
            case(Sel0)
                4'b0001:data0=data[3:0];
                4'b0010:data0=data[7:4];
                4'b0100:data0=data[11:8];
                4'b1000:data0=data[15:12];
            endcase
        //decode data to display
            digital_tube0=zero;
            case(data0)
                0:digital_tube0=zero;
                1:digital_tube0=one;
                2:digital_tube0=two;
                3:digital_tube0=three;
                4:digital_tube0=four;
                5:digital_tube0=five;
                6:digital_tube0=six;
                7:digital_tube0=seven;
                8:digital_tube0=eight;
                9:digital_tube0=nine;
                10:digital_tube0=A;
                11:digital_tube0=B;
                12:digital_tube0=C;
                13:digital_tube0=D;
                14:digital_tube0=E;
                15:digital_tube0=F;
            endcase
        end
//tube1
    always @(*)
        begin
        //select data to display
            data1=data[19:16];
            case(Sel1)
                4'b0001:data1=data[19:16];
                4'b0010:data1=data[23:20];
                4'b0100:data1=data[27:24];
                4'b1000:data1=data[31:28];
            endcase
        //decode data to display
            digital_tube1=zero;
            case(data1)
                0:digital_tube1=zero;
                1:digital_tube1=one;
                2:digital_tube1=two;
                3:digital_tube1=three;
                4:digital_tube1=four;
                5:digital_tube1=five;
                6:digital_tube1=six;
                7:digital_tube1=seven;
                8:digital_tube1=eight;
                9:digital_tube1=nine;
                10:digital_tube1=A;
                11:digital_tube1=B;
                12:digital_tube1=C;
                13:digital_tube1=D;
                14:digital_tube1=E;
                15:digital_tube1=F;
            endcase
        end

//tube2
    always @(*)
        begin
            data2=data[35:32];
			if($signed(data[31:0])<0)digital_tube2=F;
			else digital_tube2=zero;
        end

//Tube_RD
    always @(*)
        begin
            if(ADDR>=32'h0000_7f38&&ADDR<32'h0000_7f3c)Tube_RD=data[31:0];
            else if(ADDR>=32'h0000_7f3c&&ADDR<32'h0000_7f40)Tube_RD={28'd0,data[35:32]};
            else Tube_RD=-1;
        end

//count down logic
    always @(posedge clk)
        begin
            if(reset)
                begin
                    data<=35'b0;
                    Sel0<=0;
                    Sel1<=0;
                    count<=cnt_val;  	//10ns per cycle so count for 100000 to meet 1ms
                end
            else if(We)
                begin
                    if(ADDR>=32'h0000_7f38&&ADDR<32'h0000_7f3c)data[31:0]<=Tube_WD;
                    else data[35:32]<=Tube_WD[3:0];
                end
            else if(count<=0)
                begin
                    count<=cnt_val;
                    if(Sel0==0)Sel0<=1;
                    else Sel0<=Sel0<<1;
                    if(Sel1==0)Sel1<=1;
                    else Sel1<=Sel1<<1;
                end
            else count<=count-1;
        end

endmodule