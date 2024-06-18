// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`timescale 1 ns / 1 ps

module MAC_ifmaps_FIFO #
(
    parameter integer DATA_WIDTH = 1
)
(
    input wire clk,
    input wire rst_n,

    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row0_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row1_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row2_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row3_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row4_in,

    input ifmaps_input_valid,

    output reg [DATA_WIDTH-1:0] ifmaps_fifo_row0_out,
    output reg [DATA_WIDTH-1:0] ifmaps_fifo_row1_out,
    output reg [DATA_WIDTH-1:0] ifmaps_fifo_row2_out,
    output reg [DATA_WIDTH-1:0] ifmaps_fifo_row3_out,
    output reg [DATA_WIDTH-1:0] ifmaps_fifo_row4_out,

    input wire fifo_read,

    output wire fifo_full,
    output wire fifo_empty
);

    function integer clogb2 (input integer bit_depth);
	  begin
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
	      bit_depth = bit_depth >> 1;
	  end
	endfunction

	//FIFO_SIZE
	localparam FIFO_SIZE  = 2;
	// bit_num gives the minimum number of bits needed to address 'FIFO_SIZE' size of FIFO.
	localparam bit_num  = clogb2(FIFO_SIZE-1);

    integer idx;

    reg [DATA_WIDTH-1:0] ifmaps_fifo_row0 [0:FIFO_SIZE-1];
    reg [DATA_WIDTH-1:0] ifmaps_fifo_row1 [0:FIFO_SIZE-1];
    reg [DATA_WIDTH-1:0] ifmaps_fifo_row2 [0:FIFO_SIZE-1];
    reg [DATA_WIDTH-1:0] ifmaps_fifo_row3 [0:FIFO_SIZE-1];
    reg [DATA_WIDTH-1:0] ifmaps_fifo_row4 [0:FIFO_SIZE-1];

    

    reg [bit_num-1:0] fifo_write_ptr;
	reg [bit_num-1:0] fifo_read_ptr;
	reg [bit_num:0] fifo_cnt;

    wire write_en;
    wire read_en;
    
    assign fifo_full=(fifo_cnt==FIFO_SIZE);
	assign fifo_empty=(fifo_cnt==0);

    assign write_en=~fifo_full & ifmaps_input_valid;
    assign read_en=~fifo_empty & fifo_read;

	//////////////////////////////////////////////////////
    //                                                  //
    //                  fifo                            //
    //                                                  //
    //////////////////////////////////////////////////////

    always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			for(idx=0;idx<FIFO_SIZE;idx=idx+1)
			begin
				ifmaps_fifo_row0[idx]<=32'd0;
                ifmaps_fifo_row1[idx]<=32'd0;
                ifmaps_fifo_row2[idx]<=32'd0;
                ifmaps_fifo_row3[idx]<=32'd0;
                ifmaps_fifo_row4[idx]<=32'd0;
			end			
		end
		else begin
			if(write_en) begin
				ifmaps_fifo_row0[fifo_write_ptr]<=ifmaps_fifo_row0_in;
				ifmaps_fifo_row1[fifo_write_ptr]<=ifmaps_fifo_row1_in;
				ifmaps_fifo_row2[fifo_write_ptr]<=ifmaps_fifo_row2_in;
				ifmaps_fifo_row3[fifo_write_ptr]<=ifmaps_fifo_row3_in;
				ifmaps_fifo_row4[fifo_write_ptr]<=ifmaps_fifo_row4_in;
			end
		end
	end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ifmaps_fifo_row0_out<=0;
            ifmaps_fifo_row1_out<=0;
            ifmaps_fifo_row2_out<=0;
            ifmaps_fifo_row3_out<=0;
            ifmaps_fifo_row4_out<=0;
        end
        else begin
            if(read_en) begin
                ifmaps_fifo_row0_out<=ifmaps_fifo_row0[fifo_read_ptr];
                ifmaps_fifo_row1_out<=ifmaps_fifo_row1[fifo_read_ptr];
                ifmaps_fifo_row2_out<=ifmaps_fifo_row2[fifo_read_ptr];
                ifmaps_fifo_row3_out<=ifmaps_fifo_row3[fifo_read_ptr];
                ifmaps_fifo_row4_out<=ifmaps_fifo_row4[fifo_read_ptr];
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fifo_write_ptr<=0;
        end
        else begin
            if(write_en) begin
                fifo_write_ptr<=fifo_write_ptr+1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			fifo_read_ptr<=0;
		end
		else begin
			if(read_en) begin
				fifo_read_ptr<=fifo_read_ptr+1;
			end
		end
	end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fifo_cnt<=0;
        end
        else begin
            if(read_en & write_en) begin
                fifo_cnt<=fifo_cnt;
            end
            else if(write_en) begin
                fifo_cnt<=fifo_cnt+1;
            end
            else if(read_en) begin
                fifo_cnt<=fifo_cnt-1;
            end 
            else begin
                fifo_cnt<=fifo_cnt;
            end
        end
    end

    //////////////////////////////////////////////////////
    //                                                  //
    //                  fifo                            //
    //                                                  //
    //////////////////////////////////////////////////////




endmodule