// This program was cloned from: https://github.com/zhangmozhe/microshift_compression
// License: Apache License 2.0

`define HORIZONTAL 216
`define VERTICAL 256
`define PIXEL_TOTAL 55296
`define INITIAL_DELAY 3000 // >DUMP_TIME
`define PORCH 20-1
`define DUMP_TIME 200
`timescale 1 ns / 100 ps

module my_testbench();
    reg clk;
    reg resetx;
    reg enb;
    reg [15:0] h_count; // horizontal pixel index
    reg [15:0] v_count; // vertical line index
    reg [15:0] space_count;
    reg [15:0] initial_count;

    reg hStart;
    reg hEnd;
    reg vStart;
    reg vEnd;
    wire valid;
    reg [1:0] mode;

    reg [15:0] h_count_delay;
    reg [15:0] v_count_delay;
    reg hStart_delay;
    reg hEnd_delay;
    reg vStart_delay;
    reg vEnd_delay;
    reg read_reset;
    reg valid_delay;
    reg [32:0] pixel_count_delay;

    reg [7:0] pixelin;
    reg [7:0] pixelin_ram;
    reg [7:0] ram[0:`PIXEL_TOTAL];
    reg signed [31:0] fp_pixelin, fp_psd, fp_bitstream, fp_bitstream_index, fp_bitstream_length;    
    reg signed [31:0] status_pixelin, status_psd, status_bitstream, status_bitstreasm_index, status_bitstream_length;

    reg [31:0] pixelin_addr;
    reg read_enable;
    // reg vendoutput_delay1, vendoutput_delay2;
    reg dump_start;
    reg [15:0] dump_count;


    wire bitstreamready;
    wire [3:0] bitstreamlengt;  // uint8
    wire [3:0] subimageindexo;  // ufix4 (represents 1~9)
    wire [9:0] bitstreamoutpu;  // ufix10

    // control output
    wire hstartoutput;
    wire hendoutput;
    wire vstartoutput;
    wire vendoutput;
    wire validoutput;

    // debug signals
    wire ceout;
    wire [7:0] psdout;  // uint8


    reg [15:0] h_count_dec;
    reg [15:0] v_count_dec;
    reg [32:0] pixel_count_dec;



    always
        begin : clk_gen
            clk <= 1'b1;
            # (50);
            clk <= 1'b0;
            # (50);
        end

    initial
        begin : resetx_gen
            resetx <= 1'b0;
            # (50000);
            @ (posedge clk)
                # (50000);
            resetx <= 1'b1;
            @ (posedge clk)
                # (50000);
            resetx <= 1'b0;
            @ (posedge clk)
                # (50000);
            resetx <= 1'b1;
        end

    initial
        begin : clock_enable_gen
            enb <= 1'b0;
            # (200);
            @ (posedge clk)
                # (40);
            enb <= 1'b1;
        end


    assign valid = (h_count > 0)? 1'b1:1'b0;


    always @(posedge clk or negedge resetx)
        begin : intial_count_gen
            if(~resetx) begin
                initial_count <= 0;
            end
            else begin
                if (vEnd_delay) begin
                    initial_count <= 0;
                end
                else begin
                    if (initial_count < `INITIAL_DELAY) begin
                        initial_count <= initial_count + 16'd1;
                    end
                end
            end
        end

    always @(posedge clk or negedge resetx)
        begin : space_count_gen
            if (~resetx) begin
                space_count <= 16'd0;
            end
            else begin
                if (~valid && initial_count >= `INITIAL_DELAY)
                    space_count <= space_count + 1;
                if (space_count >= `PORCH ) begin
                    space_count <= 16'd0;
                end
            end
        end


    always @(posedge clk or negedge resetx)
        begin : horizontal_count
            if (~resetx) begin
                h_count <= 16'd0;
            end
            else begin
                if (h_count == 0) begin
                    if (space_count == `PORCH)
                        h_count <= h_count + 16'd1;
                end
                else begin
                    h_count <= h_count + 16'd1;
                    if (h_count >= `HORIZONTAL)
                        h_count <= 0;
                end
            end
        end

    always @(posedge clk or negedge resetx)
        begin : vertical_count
            if (~resetx) begin
                v_count <= 16'd0;
            end
            else begin
                if (h_count >= `HORIZONTAL)  begin
                    if (v_count >= `VERTICAL)
                        v_count <= 16'd0;
                    else
                        v_count <= v_count + 16'd1;
                end
                else begin
                    if (v_count == 0) begin
                        if (space_count == `PORCH)
                            v_count <= v_count + 16'd1;
                    end
                end
            end
        end

    always @(posedge clk or negedge resetx)
        begin : mode_gen
            if (~resetx) begin
                mode <= 2'd0;
                # (10)
                    mode <= 2'd2;
            end
            else begin
                if (dump_start) begin
                    mode <= 2'd3;
                end
                else begin
                    if (dump_count >= `DUMP_TIME) begin
                        mode <= 2'd2;
                    end
                end
            end
        end


    always @(h_count)
        begin : hStart_gen
            if(h_count == 16'b01)
                hStart <= 1'b1;
            else
                hStart <= 1'b0;
        end

    always @(h_count)
        begin : hEnd_gen
            if(h_count == `HORIZONTAL)
                hEnd <= 1'b1;
            else
                hEnd <= 1'b0;
        end

    always @(h_count or v_count)
        begin : vstart_gen
            if(h_count == 16'd1 && v_count == 16'd1)
                vStart <= 1'b1;
            else
                vStart <=1'b0;
        end

    always @(h_count or v_count)
        begin : vEnd_gen
            if(h_count == `HORIZONTAL && v_count == `VERTICAL)
                vEnd <= 1'b1;
            else
                vEnd <=1'b0;
        end

    always @(posedge clk or negedge resetx)
        begin : hStart_delay_gen
            if(~resetx) begin
                hStart_delay <= 0;
            end
            else begin
                hStart_delay <= hStart;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : h_count_delay_gen
            if(~resetx) begin
                h_count_delay <= 0;
            end
            else begin
                h_count_delay <= h_count;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : v_count_delay_gen
            if(~resetx) begin
                v_count_delay <= 0;
            end
            else begin
                v_count_delay <= v_count;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : hEnd_delay_gen
            if(~resetx) begin
                hEnd_delay <= 0;
            end
            else begin
                hEnd_delay <= hEnd;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : vStart_delay_gen
            if(~resetx) begin
                vStart_delay <= 0;
            end
            else begin
                vStart_delay <= vStart;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : vEnd_delay_gen
            if(~resetx) begin
                vEnd_delay <= 0;
            end
            else begin
                vEnd_delay <= vEnd;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : read_reset_gen
            if(~resetx) begin
                read_reset <= 0;
            end
            else begin
                read_reset <= vEnd_delay;
            end
        end

    always @(posedge clk or negedge resetx)
        begin : valid_delay_gen
            if(~resetx) begin
                valid_delay <= 0;
            end
            else begin
                valid_delay <= valid;
            end
        end



    always @(posedge clk or negedge resetx)
        begin : pixel_count_delay_gen
            if (~resetx) begin
                pixel_count_delay <= 16'd0;
            end
            else begin
                if (valid)
                    pixel_count_delay <= pixel_count_delay + 32'd1;
                else begin
                    if (vEnd_delay)
                        pixel_count_delay <= 32'd0;
                end
            end
        end


    // read pixel data and initialize RAM
    initial
        begin : init_ram
            $readmemh("image.dat", ram, 0, `PIXEL_TOTAL-1);
        end

    initial
        begin : read_pixelin
            fp_pixelin = $fopen("image.dat", "r");
            status_pixelin = $rewind(fp_pixelin);
        end

    always @(posedge clk or negedge resetx)
        begin : read_enable_gen
            if(~resetx) begin
                read_enable <= 0;
            end else begin
                read_enable <= enb;
            end
        end

    always @(pixelin_addr, resetx, read_reset)
        begin
            if (~resetx) begin
                pixelin <= 0;
                pixelin_ram <= 0;
            end
            else
                if (read_reset) begin
                    status_pixelin <= $rewind(fp_pixelin);
                    pixelin <= 0;
                    pixelin_ram <= 0;
                end
            else begin
                if (read_enable && space_count == 0) begin
                    status_pixelin <= $fscanf(fp_pixelin, "%h", pixelin);
                    if (pixelin_addr > 0)
                        //pixelin_ram <= 8'd255;
                        pixelin_ram <= ram[pixelin_addr-1];
                    else
                        pixelin_ram <= 0;
                end
            end
        end

    always @(posedge clk or negedge resetx or read_reset)
        begin : pxielin_addr_gen
            if(~resetx || read_reset) begin
                pixelin_addr <= 32'd0;
            end
            else begin
                if (valid) begin
                    if (pixelin_addr == `PIXEL_TOTAL) begin
                        pixelin_addr <= 32'd0;
                    end
                    else begin
                        pixelin_addr <= pixelin_addr + 32'd1;
                    end
                end
            end
        end

    compression_hdl_lowpower   u_compression_hdl_lowpower   (
        .clk(clk),
        .resetx(resetx),
        .clkenable(enb),

        //control signals
        .pixelin(pixelin_ram),  // uint8
        .hstart(hStart_delay),
        .hend(hEnd_delay),
        .vstart(vStart_delay),
        .vend(vEnd_delay),
        .valid(valid_delay),
        .mode(mode),  // ufix2

        //bitstream
        .bitstreamready(bitstreamready),
        .bitstreamlengt(bitstreamlengt),  // ufix4
        .subimageindexo(subimageindexo),  // ufix4 (represents 1~9)
        .bitstreamoutpu(bitstreamoutpu),  // ufix10

        //debugging outputs
        .hstartoutput(hstartoutput),
        .hendoutput(hendoutput),
        .vstartoutput(vstartoutput),
        .vendoutput(vendoutput),
        .validoutput(validoutput),
        .ceout(ceout)
    );


    
    //horizontal index
    always @(posedge clk or negedge resetx)
        begin : h_count_dec_gen
            if(~resetx) begin
                h_count_dec <= 0;
            end
            else begin
                if (h_count_dec >= `HORIZONTAL) begin
                    h_count_dec <= 0;
                end
                else begin
                    if (validoutput) begin
                        h_count_dec <= h_count_dec + 1;
                    end
                end
            end
        end

    //vertical index
    always @(posedge clk or negedge resetx)
        begin : v_count_dec_gen
            if (~resetx) begin
                v_count_dec <= 16'd0;
            end
            else begin
                if (v_count_dec == 16'd0) begin
                    if (validoutput) begin
                        v_count_dec = 16'd1;
                    end
                end
                else begin
                    if (h_count_dec >= `HORIZONTAL)  begin
                        if (v_count_dec >= `VERTICAL)
                            v_count_dec <= 16'd0;
                        else
                            v_count_dec <= v_count_dec + 16'd1;
                    end
                end
            end
        end


    //pixel index
    always @(posedge clk or negedge resetx)
        begin : pixel_count_dec_gen
            if(~resetx) begin
                pixel_count_dec <= 0;
            end
            else begin
                if (pixel_count_dec >= `PIXEL_TOTAL) begin
                    pixel_count_dec <= 32'd0;
                end
                else begin
                    if (validoutput) begin
                        pixel_count_dec <= pixel_count_dec + 32'd1;
                    end
                end
            end
        end


    /**********************************************/
    /**********************************************/
    // initialize the data writing
    initial
        begin : psd_output_file
            fp_psd = $fopen("fp_psdoutput.dat", "w");
            fp_bitstream = $fopen("fp_bitstream.dat", "w");
            fp_bitstream_index = $fopen("fp_bitstream_index.dat", "w");
            fp_bitstream_length = $fopen("fp_bitstream_length.dat", "w");
            status_psd = $rewind(fp_psd);
            status_bitstream = $rewind(fp_bitstream);
            status_bitstreasm_index = $rewind(fp_bitstream_index);
            status_bitstream_length = $rewind(fp_bitstream_length);
            //$display("%d", status_pixelin);
        end

    always @(posedge clk)
        begin : close_files
            if (vendoutput && ~resetx && enb) begin
                $fclose(fp_psd);
                $fclose(fp_bitstream);
                $fclose(fp_bitstream_index);
                $fclose(fp_bitstream_length);
            end
        end

    always @(posedge clk)
        begin : output_psd_values
            if (validoutput) begin
                $fwrite(fp_psd,"%x\n",psdout);
                //$display("%d", psdout);
            end
        end

    always @(posedge clk)
        begin : output_bitstream
            if (bitstreamready) begin
                $fwrite(fp_bitstream,"%d\n",bitstreamoutpu);
                //$display("%d", psdout);
            end
        end

    always @(posedge clk)
        begin : output_bitstream_index
            if (bitstreamready) begin
                $fwrite(fp_bitstream_index,"%d\n",subimageindexo);
                //$display("%d", psdout);
            end
        end

    always @(posedge clk)
        begin : output_fp_bitstream_length
            if (bitstreamready) begin
                $fwrite(fp_bitstream_length,"%d\n",bitstreamlengt);
                //$display("%d", psdout);
            end
        end

    // integer i;
    // // reg write_bit;

    // always @(posedge clk)
    //     begin
    //         if (validoutput && bitstreamready) begin
    //             //combined_bitstream = 0;
    //             for(i=0; i<bitstreamlengt; i=i+1)
    //             begin
    //               $display("%b", bitstreamoutpu);
    //               // write_bit = bitstreamoutpu[10-i];
    //               case (subimageindexo)
    //                 1: $fwrite(fp_subimage1,"%b\n",bitstreamoutpu[10-i]);
    //                 2: $fwrite(fp_subimage2,"%b\n",bitstreamoutpu[10-i]);
    //                 3: $fwrite(fp_subimage3,"%b\n",bitstreamoutpu[10-i]);
    //                 4: $fwrite(fp_subimage4,"%b\n",bitstreamoutpu[10-i]);
    //                 5: $fwrite(fp_subimage5,"%b\n",bitstreamoutpu[10-i]);
    //                 6: $fwrite(fp_subimage6,"%b\n",bitstreamoutpu[10-i]);
    //                 7: $fwrite(fp_subimage7,"%b\n",bitstreamoutpu[10-i]);
    //                 8: $fwrite(fp_subimage8,"%b\n",bitstreamoutpu[10-i]);
    //                 9: $fwrite(fp_subimage9,"%b\n",bitstreamoutpu[10-i]);
    //                 default: $display("OTHER TX CHANNEL NUMBER");
    //               endcase // txdatavalid
    //             end
    //         end
    //     end








endmodule