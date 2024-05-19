// This program was cloned from: https://github.com/WangXuan95/FPGA-LZMA-compressor
// License: GNU General Public License v3.0



`define   OUT_FILE_PATH      "./sim_data"
`define   OUT_FILE_FORMAT    "out%03d.hex.lzma"


module tb_save_result_to_file (
    input  wire        clk,
    // input : AXI-stream
    input  wire        tvalid,
    input  wire [ 7:0] tdata,
    input  wire        tlast
);


integer        fidx = 0;
integer        fptr = 0;
reg [1024*8:1] fname_format;    // 1024 bytes string buffer
reg [1024*8:1] fname;           // 1024 bytes string buffer

initial $sformat(fname_format, "%s\\%s", `OUT_FILE_PATH, `OUT_FILE_FORMAT);

always @ (posedge clk)
    if (tvalid) begin
        if (fptr == 0) begin
            fidx = fidx + 1;
            $sformat(fname, fname_format, fidx);
            fptr = $fopen(fname, "wb");
            if (fptr == 0) begin
                $display("***error : cannot open %s", fname);
                $stop;
            end
            
            $display("open  %10s", fname);
            
            // when opening the file for the first time, write the LZMA header (fixed 13Bytes)
            $fwrite(fptr, "%c"              , 8'h5E);
            $fwrite(fptr, "%c%c%c%c"        , 8'h00, 8'h00, 8'h02, 8'h00);
            $fwrite(fptr, "%c%c%c%c%c%c%c%c", 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF);
        end
        
        $fwrite(fptr, "%c", tdata);
        
        if (tlast) begin
            $display("close %10s", fname);
            $fclose(fptr);
            fptr = 0;
        end
    end


endmodule

