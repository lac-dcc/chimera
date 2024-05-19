// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module configs_latches(input clk, input reset,
    input [31:0] io_d_in,
    input [25:0] io_configs_en,
    output reg [831:0] io_configs_out);

    always @ (io_configs_en[0] or io_d_in)
        begin
             if (io_configs_en[0])
                  begin
                      io_configs_out[31:0] = io_d_in;
                  end
        end

    always @ (io_configs_en[1] or io_d_in)
        begin
             if (io_configs_en[1])
                  begin
                      io_configs_out[63:32] = io_d_in;
                  end
        end

    always @ (io_configs_en[2] or io_d_in)
        begin
             if (io_configs_en[2])
                  begin
                      io_configs_out[95:64] = io_d_in;
                  end
        end

    always @ (io_configs_en[3] or io_d_in)
        begin
             if (io_configs_en[3])
                  begin
                      io_configs_out[127:96] = io_d_in;
                  end
        end

    always @ (io_configs_en[4] or io_d_in)
        begin
             if (io_configs_en[4])
                  begin
                      io_configs_out[159:128] = io_d_in;
                  end
        end

    always @ (io_configs_en[5] or io_d_in)
        begin
             if (io_configs_en[5])
                  begin
                      io_configs_out[191:160] = io_d_in;
                  end
        end

    always @ (io_configs_en[6] or io_d_in)
        begin
             if (io_configs_en[6])
                  begin
                      io_configs_out[223:192] = io_d_in;
                  end
        end

    always @ (io_configs_en[7] or io_d_in)
        begin
             if (io_configs_en[7])
                  begin
                      io_configs_out[255:224] = io_d_in;
                  end
        end

    always @ (io_configs_en[8] or io_d_in)
        begin
             if (io_configs_en[8])
                  begin
                      io_configs_out[287:256] = io_d_in;
                  end
        end

    always @ (io_configs_en[9] or io_d_in)
        begin
             if (io_configs_en[9])
                  begin
                      io_configs_out[319:288] = io_d_in;
                  end
        end

    always @ (io_configs_en[10] or io_d_in)
        begin
             if (io_configs_en[10])
                  begin
                      io_configs_out[351:320] = io_d_in;
                  end
        end

    always @ (io_configs_en[11] or io_d_in)
        begin
             if (io_configs_en[11])
                  begin
                      io_configs_out[383:352] = io_d_in;
                  end
        end

    always @ (io_configs_en[12] or io_d_in)
        begin
             if (io_configs_en[12])
                  begin
                      io_configs_out[415:384] = io_d_in;
                  end
        end

    always @ (io_configs_en[13] or io_d_in)
        begin
             if (io_configs_en[13])
                  begin
                      io_configs_out[447:416] = io_d_in;
                  end
        end

    always @ (io_configs_en[14] or io_d_in)
        begin
             if (io_configs_en[14])
                  begin
                      io_configs_out[479:448] = io_d_in;
                  end
        end

    always @ (io_configs_en[15] or io_d_in)
        begin
             if (io_configs_en[15])
                  begin
                      io_configs_out[511:480] = io_d_in;
                  end
        end

    always @ (io_configs_en[16] or io_d_in)
        begin
             if (io_configs_en[16])
                  begin
                      io_configs_out[543:512] = io_d_in;
                  end
        end

    always @ (io_configs_en[17] or io_d_in)
        begin
             if (io_configs_en[17])
                  begin
                      io_configs_out[575:544] = io_d_in;
                  end
        end

    always @ (io_configs_en[18] or io_d_in)
        begin
             if (io_configs_en[18])
                  begin
                      io_configs_out[607:576] = io_d_in;
                  end
        end

    always @ (io_configs_en[19] or io_d_in)
        begin
             if (io_configs_en[19])
                  begin
                      io_configs_out[639:608] = io_d_in;
                  end
        end

    always @ (io_configs_en[20] or io_d_in)
        begin
             if (io_configs_en[20])
                  begin
                      io_configs_out[671:640] = io_d_in;
                  end
        end

    always @ (io_configs_en[21] or io_d_in)
        begin
             if (io_configs_en[21])
                  begin
                      io_configs_out[703:672] = io_d_in;
                  end
        end

    always @ (io_configs_en[22] or io_d_in)
        begin
             if (io_configs_en[22])
                  begin
                      io_configs_out[735:704] = io_d_in;
                  end
        end

    always @ (io_configs_en[23] or io_d_in)
        begin
             if (io_configs_en[23])
                  begin
                      io_configs_out[767:736] = io_d_in;
                  end
        end

    always @ (io_configs_en[24] or io_d_in)
        begin
             if (io_configs_en[24])
                  begin
                      io_configs_out[799:768] = io_d_in;
                  end
        end

    always @ (io_configs_en[25] or io_d_in)
        begin
             if (io_configs_en[25])
                  begin
                      io_configs_out[831:800] = io_d_in;
                  end
        end

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module configs_latches(input clk, input reset,
    input [31:0] io_d_in,
    input [25:0] io_configs_en,
    output reg [831:0] io_configs_out);

    always @ (io_configs_en[0] or io_d_in)
        begin
             if (io_configs_en[0])
                  begin
                      io_configs_out[31:0] = io_d_in;
                  end
        end

    always @ (io_configs_en[1] or io_d_in)
        begin
             if (io_configs_en[1])
                  begin
                      io_configs_out[63:32] = io_d_in;
                  end
        end

    always @ (io_configs_en[2] or io_d_in)
        begin
             if (io_configs_en[2])
                  begin
                      io_configs_out[95:64] = io_d_in;
                  end
        end

    always @ (io_configs_en[3] or io_d_in)
        begin
             if (io_configs_en[3])
                  begin
                      io_configs_out[127:96] = io_d_in;
                  end
        end

    always @ (io_configs_en[4] or io_d_in)
        begin
             if (io_configs_en[4])
                  begin
                      io_configs_out[159:128] = io_d_in;
                  end
        end

    always @ (io_configs_en[5] or io_d_in)
        begin
             if (io_configs_en[5])
                  begin
                      io_configs_out[191:160] = io_d_in;
                  end
        end

    always @ (io_configs_en[6] or io_d_in)
        begin
             if (io_configs_en[6])
                  begin
                      io_configs_out[223:192] = io_d_in;
                  end
        end

    always @ (io_configs_en[7] or io_d_in)
        begin
             if (io_configs_en[7])
                  begin
                      io_configs_out[255:224] = io_d_in;
                  end
        end

    always @ (io_configs_en[8] or io_d_in)
        begin
             if (io_configs_en[8])
                  begin
                      io_configs_out[287:256] = io_d_in;
                  end
        end

    always @ (io_configs_en[9] or io_d_in)
        begin
             if (io_configs_en[9])
                  begin
                      io_configs_out[319:288] = io_d_in;
                  end
        end

    always @ (io_configs_en[10] or io_d_in)
        begin
             if (io_configs_en[10])
                  begin
                      io_configs_out[351:320] = io_d_in;
                  end
        end

    always @ (io_configs_en[11] or io_d_in)
        begin
             if (io_configs_en[11])
                  begin
                      io_configs_out[383:352] = io_d_in;
                  end
        end

    always @ (io_configs_en[12] or io_d_in)
        begin
             if (io_configs_en[12])
                  begin
                      io_configs_out[415:384] = io_d_in;
                  end
        end

    always @ (io_configs_en[13] or io_d_in)
        begin
             if (io_configs_en[13])
                  begin
                      io_configs_out[447:416] = io_d_in;
                  end
        end

    always @ (io_configs_en[14] or io_d_in)
        begin
             if (io_configs_en[14])
                  begin
                      io_configs_out[479:448] = io_d_in;
                  end
        end

    always @ (io_configs_en[15] or io_d_in)
        begin
             if (io_configs_en[15])
                  begin
                      io_configs_out[511:480] = io_d_in;
                  end
        end

    always @ (io_configs_en[16] or io_d_in)
        begin
             if (io_configs_en[16])
                  begin
                      io_configs_out[543:512] = io_d_in;
                  end
        end

    always @ (io_configs_en[17] or io_d_in)
        begin
             if (io_configs_en[17])
                  begin
                      io_configs_out[575:544] = io_d_in;
                  end
        end

    always @ (io_configs_en[18] or io_d_in)
        begin
             if (io_configs_en[18])
                  begin
                      io_configs_out[607:576] = io_d_in;
                  end
        end

    always @ (io_configs_en[19] or io_d_in)
        begin
             if (io_configs_en[19])
                  begin
                      io_configs_out[639:608] = io_d_in;
                  end
        end

    always @ (io_configs_en[20] or io_d_in)
        begin
             if (io_configs_en[20])
                  begin
                      io_configs_out[671:640] = io_d_in;
                  end
        end

    always @ (io_configs_en[21] or io_d_in)
        begin
             if (io_configs_en[21])
                  begin
                      io_configs_out[703:672] = io_d_in;
                  end
        end

    always @ (io_configs_en[22] or io_d_in)
        begin
             if (io_configs_en[22])
                  begin
                      io_configs_out[735:704] = io_d_in;
                  end
        end

    always @ (io_configs_en[23] or io_d_in)
        begin
             if (io_configs_en[23])
                  begin
                      io_configs_out[767:736] = io_d_in;
                  end
        end

    always @ (io_configs_en[24] or io_d_in)
        begin
             if (io_configs_en[24])
                  begin
                      io_configs_out[799:768] = io_d_in;
                  end
        end

    always @ (io_configs_en[25] or io_d_in)
        begin
             if (io_configs_en[25])
                  begin
                      io_configs_out[831:800] = io_d_in;
                  end
        end

endmodule
