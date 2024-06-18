// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： weight_preload

	input  ： weight_from_BRAM、Control Signal

	output ： weight_from_preload
	
	因BRAM所儲存的是一個address所存的為一column，而ALU需要不只一個column故讀取多次BRAM才可得到完整的weight再一次輸入至ALU，
    其中當load_weight_preload時weight_reg會左移。
*/
`timescale  10ns / 10ns

module weight_preload 
(
    //golbal
    input wire clk,
    input wire rst_n,

    //data
    input wire [5-1:0] weight_from_bram,
    
    output wire [25-1:0] weight_from_preload,

    //control
    input wire load_weight_preload

);
    reg [4:0] weight_reg_0,weight_reg_1,weight_reg_2,weight_reg_3,weight_reg_4;

    assign weight_from_preload={weight_reg_4[4:0],weight_reg_3[4:0],weight_reg_2[4:0],weight_reg_1[4:0],weight_reg_0[4:0]};


    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_reg_0<=0;
        end
        else begin
            if(load_weight_preload) begin
                weight_reg_0[4]<=weight_from_bram[0];
                weight_reg_0[3]<=weight_reg_0[4];
                weight_reg_0[2]<=weight_reg_0[3];
                weight_reg_0[1]<=weight_reg_0[2];
                weight_reg_0[0]<=weight_reg_0[1];   
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_reg_1<=0;
        end
        else begin
            if(load_weight_preload) begin
                weight_reg_1[4]<=weight_from_bram[1];
                weight_reg_1[3]<=weight_reg_1[4];
                weight_reg_1[2]<=weight_reg_1[3];
                weight_reg_1[1]<=weight_reg_1[2];
                weight_reg_1[0]<=weight_reg_1[1]; 
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_reg_2<=0;
        end
        else begin
            if(load_weight_preload) begin
                weight_reg_2[4]<=weight_from_bram[2];
                weight_reg_2[3]<=weight_reg_2[4];
                weight_reg_2[2]<=weight_reg_2[3];
                weight_reg_2[1]<=weight_reg_2[2];
                weight_reg_2[0]<=weight_reg_2[1]; 
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_reg_3<=0;
        end
        else begin
            if(load_weight_preload) begin
                weight_reg_3[4]<=weight_from_bram[3];
                weight_reg_3[3]<=weight_reg_3[4];
                weight_reg_3[2]<=weight_reg_3[3];
                weight_reg_3[1]<=weight_reg_3[2];
                weight_reg_3[0]<=weight_reg_3[1]; 
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
            if(!rst_n) begin
            weight_reg_4<=0;
        end
        else begin
            if(load_weight_preload) begin
                weight_reg_4[4]<=weight_from_bram[4];
                weight_reg_4[3]<=weight_reg_4[4];
                weight_reg_4[2]<=weight_reg_4[3];
                weight_reg_4[1]<=weight_reg_4[2];
                weight_reg_4[0]<=weight_reg_4[1]; 
            end
        end
    end


endmodule