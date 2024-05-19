// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0


module SPI_master(
    input i_sclk,
    input i_reset,
    output o_ss,
    output o_mosi,
    input i_miso,
    input i_send,
    input[7:0] i_send_byte,
    input i_receive,
    output [7:0] o_receive_byte,
    output o_period,
    output o_cnt_end
);

    parameter [1:0] s_Idle_M = 0,						// Initialization states
                    s_Master_send = 1,
                    s_Master_receive = 2;
    reg [1:0] stCur_master_spi;
    reg [7:0] byte_send;
    reg [2:0] counter;
    reg [7:0] rec_byte;
    reg [7:0] receive_byte_r;
    wire counter_end;
    reg o_ss_r;
    wire counter_end_send;
    always @(posedge i_sclk)
    begin
        if (i_reset == 0) begin
            stCur_master_spi <= s_Idle_M;
            rec_byte <= 8'b00000000;
            byte_send <= 8'b00000000;
            o_ss_r <= 1'b1;
            receive_byte_r <= 0;
        end
        else begin
            case (stCur_master_spi)
                s_Idle_M : begin
                    if (i_send) begin
                        byte_send <= i_send_byte;
                        stCur_master_spi <= s_Master_send;
                        o_ss_r <= 1'b0;
                    end
                    else if (i_receive) begin
                        stCur_master_spi <= s_Master_receive;
                        rec_byte <= {rec_byte[6:0], i_miso};
                        receive_byte_r <= {rec_byte[6:0], i_miso};
                        o_ss_r <= 1'b0;
                    end
                    else if (!o_ss_r) begin
                        o_ss_r <= 1'b1;
                        rec_byte <= {rec_byte[6:0], i_miso};
                        receive_byte_r <= {rec_byte[6:0], i_miso};
                    end 
                end
                s_Master_send : begin
                    byte_send <= {byte_send[6:0], 1'b0};
                    if (counter_end_send) begin
                        stCur_master_spi <= s_Idle_M;
                    end
                end
                s_Master_receive : begin
                    rec_byte <= {rec_byte[6:0], i_miso};
                    if (counter_end) begin
                        stCur_master_spi <= s_Idle_M;
                    end
                end
            endcase
        end
    end

    always @(posedge i_sclk)
    begin
        if (!i_reset) begin
            counter <= 3'b000;
        end 
        else begin
            if (!o_ss_r) begin
                counter <= counter + 1;
            end
            else begin
                counter <= 0;
            end
        end
    end
    assign o_ss = o_ss_r;
    assign o_mosi = byte_send[7];
    assign counter_end = (counter == 3'b111);
    assign counter_end_send = (counter == 3'b110);
    assign o_cnt_end = (stCur_master_spi == s_Idle_M);
    assign o_period = (counter == 3'b001);
    assign o_receive_byte = receive_byte_r;
endmodule
