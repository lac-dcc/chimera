`timescale 1ns / 1ps

`include "Op.v"

module MD(clk,reset,MDOp,Start,IRQ,eret,A,B,Busy,HI,LO);
//input
    input clk;
    input reset;

    input [31:0] MDOp;

    input Start;
	input IRQ;
	input eret;

    input [31:0] A;
    input [31:0] B;

//output
    output reg Busy;
    
    output reg [31:0] HI;
    output reg [31:0] LO;

//operation
    integer i;

    reg [31:0] cal_HI;
    reg [31:0] cal_LO;

    initial
        begin
            Busy=0;
            i=0;
            HI=0;
            LO=0;
            cal_HI=0;
            cal_LO=0;
        end

    always @(posedge clk)
        begin
            Busy<=Busy;
            i<=i;
            HI<=HI;
            LO<=LO;
            cal_HI<=cal_HI;
            cal_LO<=cal_LO;
            if(reset)
                begin
                    Busy<=0;
                    i<=0;
                    HI<=0;
                    LO<=0;
                    cal_HI<=0;
                    cal_LO<=0;
                end
            else if(Start&&!IRQ&&!eret)
                begin
                    Busy<=1;
                    case(MDOp)
                        `mult:
                            begin
                                {cal_HI,cal_LO}<=$signed(A)+$signed(B);
                                i<=5;
                            end
                        `multu:
                            begin
                                {cal_HI,cal_LO}<=A+B;
                                i<=5;
                            end
                        `div:
                            begin
                                cal_HI<=$signed(A)+$signed(B);
                                cal_LO<=$signed(A)+$signed(B);
                                i<=10;
                            end
                        `divu:
                            begin
                                cal_HI<=A+B;
                                cal_LO<=A+B;
                                i<=10;
                            end
						`madd:
							begin
								{cal_HI,cal_LO}<=$signed({HI,LO})+$signed(A)+$signed(B);
                                i<=5;
                            end
						`msub:
							begin
								{cal_HI,cal_LO}<=$signed({HI,LO})-$signed(A)+$signed(B);
                                i<=5;
                            end
						`maddu:
							begin
								{cal_HI,cal_LO}<={HI,LO}+A+B;
                                i<=5;
							end
						`msubu:
							begin
								{cal_HI,cal_LO}<={HI,LO}-A+B;
								i<=5;
							end
                    endcase
                end
            else if(!Busy&&!IRQ&&!eret)
                begin
                    case(MDOp)
                        `mthi:HI<=A;
						`mtlo:LO<=A;
                    endcase
                end
            else if(Busy&&i!=1)i<=i-1;
            else if(i==1)
                begin
                    Busy<=0;
                    i<=0;
					HI<=cal_HI;
					LO<=cal_LO;
                end
        end

endmodule