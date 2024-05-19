// This program was cloned from: https://github.com/WangXuan95/FPGA-LZMA-compressor
// License: GNU General Public License v3.0


`define FILE_COUNT 20


module tb_random_data_source (
    input  wire        clk,
    // output : AXI stream
    input  wire        tready,
    output reg         tvalid,
    output reg  [ 7:0] tdata,
    output reg         tlast
);



initial tvalid = 1'b0;
initial tdata  = 1'b0;
initial tlast  = 1'b0;



//---------------------------------------------------------------------------------------------------------------------------------------------------------------
// function : generate random unsigned integer
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
function  [31:0] randuint;
    input [31:0] min;
    input [31:0] max;
begin
    randuint = $random;
    if ( min != 0 || max != 'hFFFFFFFF )
        randuint = (randuint % (1+max-min)) + min;
end
endfunction



//---------------------------------------------------------------------------------------------------------------------------------------------------------------
// tasks : send random data
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
task gen_chunk_rand;
    input [31:0] max_bubble_cnt;
    input [31:0] length;
    input [ 7:0] min;
    input [ 7:0] max;
begin
    while (length>0) begin
        @ (posedge clk);
        if (tready) begin
            repeat (randuint(0, max_bubble_cnt)) begin
                tvalid <= 1'b0;
                @ (posedge clk);
            end
        end
        if (~tvalid | tready) begin
            length = length - 1;
            tvalid <= 1'b1;
            tlast  <= 1'b0;
            tdata <= randuint(min, max);
        end
    end
end
endtask


task gen_chunk_sqrt4_rand;
    input [31:0] max_bubble_cnt;
    input [31:0] length;
begin
    while (length>0) begin
        @ (posedge clk);
        if (tready) begin
            repeat (randuint(0, max_bubble_cnt)) begin
                tvalid <= 1'b0;
                @ (posedge clk);
            end
        end
        if (~tvalid | tready) begin
            length = length - 1;
            tvalid <= 1'b1;
            tlast  <= 1'b0;
            tdata  <= $sqrt($sqrt(randuint(0, 'hFFFFFFFF)));
        end
    end
end
endtask


task gen_chunk_inc;
    input [31:0] max_bubble_cnt;
    input [31:0] length;
    input [ 7:0] min;
    input [ 7:0] max;
begin
    while (length>0) begin
        @ (posedge clk);
        if (tready) begin
            repeat (randuint(0, max_bubble_cnt)) begin
                tvalid <= 1'b0;
                @ (posedge clk);
            end
        end
        if (~tvalid | tready) begin
            length = length - 1;
            tvalid <= 1'b1;
            tlast  <= 1'b0;
            if ( randuint(0,1) )
                tdata <= tdata + randuint(min, max);
            else
                tdata <= tdata - randuint(min, max);
        end
    end
end
endtask


task gen_chunk_scatter;
    input [31:0] max_bubble_cnt;
    input [31:0] length;
    input [31:0] prob;
begin
    while (length>0) begin
        @ (posedge clk);
        if (tready) begin
            repeat (randuint(0, max_bubble_cnt)) begin
                tvalid <= 1'b0;
                @ (posedge clk);
            end
        end
        if (~tvalid | tready) begin
            length = length - 1;
            tvalid <= 1'b1;
            tlast  <= 1'b0;
            if ( randuint(0, prob) == 0 )
                tdata <= randuint(1, 255);
            else
                tdata <= 8'h0;
        end
    end
end
endtask


task gen_stream;
    input [31:0] length;
    input [31:0] max_bubble_cnt;
    reg   [31:0] remain_length;
    reg   [31:0] chunk_length;
    reg   [ 7:0] min;
    reg   [ 7:0] max;
begin
    if (length > 0) begin
        remain_length = length - 1;
        
        while (remain_length > 0) begin
            chunk_length   = randuint(1, 10000);
            if (chunk_length > remain_length)
                chunk_length = remain_length;
            remain_length = remain_length - chunk_length;
            
            case ( randuint(0, 3) )
                0       : begin
                    min = randuint(0  , 255);
                    max = randuint(min, 255);
                    gen_chunk_rand      (max_bubble_cnt, chunk_length, min, max);
                end
                1       :
                    gen_chunk_sqrt4_rand(max_bubble_cnt, chunk_length);
                2       : begin
                    min = randuint(1  , 3);
                    max = randuint(min, 4);
                    gen_chunk_inc       (max_bubble_cnt, chunk_length, min, max);
                end
                default :
                    gen_chunk_scatter   (max_bubble_cnt, chunk_length, randuint(1, 600));
            endcase
        end
        
        remain_length = 1;
        while (remain_length>0) begin
            @ (posedge clk);
            if (~tvalid | tready) begin
                remain_length = 0;
                tvalid <= 1'b1;
                tlast  <= 1'b1;
                tdata  <= randuint(0,255);
            end
        end
    end
end
endtask



//---------------------------------------------------------------------------------------------------------------------------------------------------------------
// send random data
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
reg [31:0] stream_len, bubble_cnt;
reg [63:0] cycle_start, cycle_comsume;
reg [63:0] cycle_count = 64'd0;

always @ (posedge clk) cycle_count <= cycle_count + 64'd1;

initial begin
    repeat (1000) @ (posedge clk);
    
    repeat (`FILE_COUNT) begin
        stream_len = randuint(1, 2000000);
        bubble_cnt = randuint(0, 5);
        
        cycle_start = cycle_count;
        gen_stream(stream_len, bubble_cnt);
        cycle_comsume = cycle_count - cycle_start;
        
        $display("compressed stream length = %-8d      cycle consumed = %-8d      cycle per byte = %.2f", stream_len, cycle_comsume, 1.0*cycle_comsume/stream_len );
    end
    
    @ (posedge clk);
    while ( !(~tvalid | tready) ) begin
        @ (posedge clk);
    end
    tvalid <= 1'b0;
end


endmodule

