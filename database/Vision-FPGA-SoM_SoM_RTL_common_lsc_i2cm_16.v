`timescale 1ns / 100ps

module lsc_i2cm_16(
input		clk,     	// clk 24MHz
input           enable,
input		rw,    		// read/write, 1:read, 0:write
input		run,    	// start (level sensitive for repeat run)
input   [5:0]   interval,
input	[6:0]	dev_addr, 
input	[15:0]	ofs_addr, 
input   [7:0]   wr_data,
input		scl_in, 
input		sda_in,  
output    	scl_out, 
output    	sda_out, 
output reg      running,
output reg	done,    	// done (pulse)
output reg [7:0]rd_data, 
input		resetn
);

reg	[5:0]	interval_cnt;
reg	[7:0]   main_cnt;
wire	[1:0]	tick_cnt;
wire	[5:0]	seq_cnt;
wire		tick;

reg	[6:0]	dev_addr_lat;
reg	[15:0]	ofs_addr_lat;
reg	[7:0]	wr_data_lat;
reg		rw_lat;

reg		r_scl_out;
reg		r_sda_out;

always @(posedge clk)
begin
    if(running != 1'b1) begin
	dev_addr_lat <= dev_addr;
	ofs_addr_lat <= ofs_addr;
	wr_data_lat  <= wr_data ;
	rw_lat       <= rw;
    end
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0)
	interval_cnt <= 6'b0;
    else if(running == 1'b0)
	interval_cnt <= 6'b0;
    else if(tick)
	interval_cnt <= 6'b0;
    else 
	interval_cnt <= interval_cnt + 6'b1;
end

assign tick = (interval_cnt == interval);

assign tick_cnt = main_cnt[1:0];
assign seq_cnt  = main_cnt[7:2];

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0)
	main_cnt <= 8'b0;
    else if(running == 1'b0)
	main_cnt <= 8'b0;
    else if(running && tick && (((rw_lat == 1'b1) && (main_cnt == 8'd195)) || ((rw_lat == 1'b0) && (main_cnt == 8'd151))))
	main_cnt <= 8'b0;
    else if(tick)
	main_cnt <= main_cnt + 8'd1;
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0) running <= 1'b0;
    else if(done)      running <= 1'b0;
    else if(run)       running <= 1'b1;
end

always @(posedge clk)
begin
    if(running && tick && (((rw_lat == 1'b1) && (main_cnt == 8'd195)) || ((rw_lat == 1'b0) && (main_cnt == 8'd151))))
	done <= 1'b1;
    else
	done <= 1'b0;
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0) 
	r_scl_out <= 1'b1;
    else if(rw_lat == 1'b1)
	case(seq_cnt)
	    6'd0, 6'd29: // start
		r_scl_out <= (tick_cnt == 2'd0) || (tick_cnt == 2'd1) || (tick_cnt == 2'd2);
	    6'd28: // restart
		r_scl_out <= (tick_cnt == 2'd2) || (tick_cnt == 2'd3);
	    6'd48: // stop
		r_scl_out <= (tick_cnt == 2'd1) || (tick_cnt == 2'd2) || (tick_cnt == 2'd3);
	    default: // normal bit, restart
		r_scl_out <= (tick_cnt == 2'd1) || (tick_cnt == 2'd2);
	endcase
    else case (seq_cnt)
	    6'd0: // start
		r_scl_out <= (tick_cnt == 2'd0) || (tick_cnt == 2'd1) || (tick_cnt == 2'd2);
	    6'd37: // stop
		r_scl_out <= (tick_cnt == 2'd1) || (tick_cnt == 2'd2) || (tick_cnt == 2'd3);
	    default: // normal bit
		r_scl_out <= (tick_cnt == 2'd1) || (tick_cnt == 2'd2);
	endcase
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0) 
	r_sda_out <= 1'b1;
    else if(rw_lat == 1'b1)
	case(seq_cnt)
	    6'd0: // start
		r_sda_out <= (tick_cnt == 2'd0) || (tick_cnt == 2'd1);
	    6'd1:
		r_sda_out <= dev_addr_lat[6];
	    6'd2:
		r_sda_out <= dev_addr_lat[5];
	    6'd3:
		r_sda_out <= dev_addr_lat[4];
	    6'd4:
		r_sda_out <= dev_addr_lat[3];
	    6'd5:
		r_sda_out <= dev_addr_lat[2];
	    6'd6:
		r_sda_out <= dev_addr_lat[1];
	    6'd7:
		r_sda_out <= dev_addr_lat[0];
	    6'd8: // rw - write
		r_sda_out <= 1'b0;
	    // d9: ack
	    6'd10:
		r_sda_out <= ofs_addr_lat[15];
	    6'd11:
		r_sda_out <= ofs_addr_lat[14];
	    6'd12:
		r_sda_out <= ofs_addr_lat[13];
	    6'd13:
		r_sda_out <= ofs_addr_lat[12];
	    6'd14:
		r_sda_out <= ofs_addr_lat[11];
	    6'd15:
		r_sda_out <= ofs_addr_lat[10];
	    6'd16:
		r_sda_out <= ofs_addr_lat[9];
	    6'd17:
		r_sda_out <= ofs_addr_lat[8];
	    // d18: ack
	    6'd19:
		r_sda_out <= ofs_addr_lat[7];
	    6'd20:
		r_sda_out <= ofs_addr_lat[6];
	    6'd21:
		r_sda_out <= ofs_addr_lat[5];
	    6'd22:
		r_sda_out <= ofs_addr_lat[4];
	    6'd23:
		r_sda_out <= ofs_addr_lat[3];
	    6'd24:
		r_sda_out <= ofs_addr_lat[2];
	    6'd25:
		r_sda_out <= ofs_addr_lat[1];
	    6'd26:
		r_sda_out <= ofs_addr_lat[0];
	    // d27: ack
	    6'd28: // restart
		r_sda_out <= (tick_cnt == 2'd1) || (tick_cnt == 2'd2) || (tick_cnt == 2'd3);
	    6'd29: // start
		r_sda_out <= (tick_cnt == 2'd0) || (tick_cnt == 2'd1);
	    6'd30:
		r_sda_out <= dev_addr_lat[6];
	    6'd31:
		r_sda_out <= dev_addr_lat[5];
	    6'd32:
		r_sda_out <= dev_addr_lat[4];
	    6'd33:
		r_sda_out <= dev_addr_lat[3];
	    6'd34:
		r_sda_out <= dev_addr_lat[2];
	    6'd35:
		r_sda_out <= dev_addr_lat[1];
	    6'd36:
		r_sda_out <= dev_addr_lat[0];
	    // d37: rw - read
	    // d38: ack
	    // d39 ~ 46: data read
	    // d47: ack_bar
	    6'd48: // stop
		r_sda_out <= (tick_cnt == 2'd2) || (tick_cnt == 2'd3);
	    default:
		r_sda_out <= 1'b1;
	endcase
    else case (seq_cnt)
	    6'd0: // start
		r_sda_out <= (tick_cnt == 2'd0) || (tick_cnt == 2'd1);
	    6'd1:
		r_sda_out <= dev_addr_lat[6];
	    6'd2:
		r_sda_out <= dev_addr_lat[5];
	    6'd3:
		r_sda_out <= dev_addr_lat[4];
	    6'd4:
		r_sda_out <= dev_addr_lat[3];
	    6'd5:
		r_sda_out <= dev_addr_lat[2];
	    6'd6:
		r_sda_out <= dev_addr_lat[1];
	    6'd7:
		r_sda_out <= dev_addr_lat[0];
	    6'd8: // rw - write
		r_sda_out <= 1'b0;
	    // d9: ack
	    6'd10:
		r_sda_out <= ofs_addr_lat[15];
	    6'd11:
		r_sda_out <= ofs_addr_lat[14];
	    6'd12:
		r_sda_out <= ofs_addr_lat[13];
	    6'd13:
		r_sda_out <= ofs_addr_lat[12];
	    6'd14:
		r_sda_out <= ofs_addr_lat[11];
	    6'd15:
		r_sda_out <= ofs_addr_lat[10];
	    6'd16:
		r_sda_out <= ofs_addr_lat[9];
	    6'd17:
		r_sda_out <= ofs_addr_lat[8];
	    // d18: ack
	    6'd19:
		r_sda_out <= ofs_addr_lat[7];
	    6'd20:
		r_sda_out <= ofs_addr_lat[6];
	    6'd21:
		r_sda_out <= ofs_addr_lat[5];
	    6'd22:
		r_sda_out <= ofs_addr_lat[4];
	    6'd23:
		r_sda_out <= ofs_addr_lat[3];
	    6'd24:
		r_sda_out <= ofs_addr_lat[2];
	    6'd25:
		r_sda_out <= ofs_addr_lat[1];
	    6'd26:
		r_sda_out <= ofs_addr_lat[0];
	    // d27: ack
	    6'd28:
		r_sda_out <= wr_data_lat[7];
	    6'd29:
		r_sda_out <= wr_data_lat[6];
	    6'd30:
		r_sda_out <= wr_data_lat[5];
	    6'd31:
		r_sda_out <= wr_data_lat[4];
	    6'd32:
		r_sda_out <= wr_data_lat[3];
	    6'd33:
		r_sda_out <= wr_data_lat[2];
	    6'd34:
		r_sda_out <= wr_data_lat[1];
	    6'd35:
		r_sda_out <= wr_data_lat[0];
	    // d36: ack
	    6'd37: // stop
		r_sda_out <= (tick_cnt == 2'd2) || (tick_cnt == 2'd3);
	    default:
		r_sda_out <= 1'b1;
	endcase
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0) rd_data <= 8'b0;
    else if((rw_lat == 1'b1) && (tick_cnt == 2'd2) && tick)
	case(seq_cnt)
	    6'd39:
		rd_data[7] <= sda_in;
	    6'd40:
		rd_data[6] <= sda_in;
	    6'd41:
		rd_data[5] <= sda_in;
	    6'd42:
		rd_data[4] <= sda_in;
	    6'd43:
		rd_data[3] <= sda_in;
	    6'd44:
		rd_data[2] <= sda_in;
	    6'd45:
		rd_data[1] <= sda_in;
	    6'd46:
		rd_data[0] <= sda_in;
	endcase
end

assign scl_out = r_scl_out | (!enable);
assign sda_out = r_sda_out | (!enable);

endmodule
