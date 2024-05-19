// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// tdms encode

module encode (
    input clk,
    input rst_n,
    input c0,
    input c1,
    input de,
    input [7:0] data_in,
    output reg [9:0] data_out
);

    wire condition_1;
    wire condition_2;
    wire condition_3;
    wire [8:0] q_m;

    reg [3:0] data_in_n1;
    reg [7:0] data_in_reg;
    reg [3:0] q_m_n1;
    reg [3:0] q_m_n0;
    reg [4:0] cnt;
    reg de_reg1;
    reg de_reg2;
    reg c0_reg1;
    reg c0_reg2;
    reg c1_reg1;
    reg c1_reg2;
    reg [8:0] q_m_reg;

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            data_in_n1 <= 4'd0;
        end else begin
            data_in_n1 <= data_in[0] + data_in[1] + data_in[2] + data_in[3] + data_in[4] + data_in[5] + data_in[6] + data_in[7];
        end
    end

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            data_in_reg <= 8'b0;
        end else begin
            data_in_reg <= data_in;
        end
    end

    assign condition_1 = ((data_in_n1 > 4'd4) || ((data_in_n1 == 4'd4) && (data_in_reg[0] == 1'b0)));

    assign q_m[0] = data_in_reg[0];
    assign q_m[1] = (condition_1) ? (q_m[0] ^~ data_in_reg[1]) : (q_m[0] ^ data_in_reg[1]);
    assign q_m[2] = (condition_1) ? (q_m[1] ^~ data_in_reg[2]) : (q_m[1] ^ data_in_reg[2]);
    assign q_m[3] = (condition_1) ? (q_m[2] ^~ data_in_reg[3]) : (q_m[2] ^ data_in_reg[3]);
    assign q_m[4] = (condition_1) ? (q_m[3] ^~ data_in_reg[4]) : (q_m[3] ^ data_in_reg[4]);
    assign q_m[5] = (condition_1) ? (q_m[4] ^~ data_in_reg[5]) : (q_m[4] ^ data_in_reg[5]);
    assign q_m[6] = (condition_1) ? (q_m[5] ^~ data_in_reg[6]) : (q_m[5] ^ data_in_reg[6]);
    assign q_m[7] = (condition_1) ? (q_m[6] ^~ data_in_reg[7]) : (q_m[6] ^ data_in_reg[7]);
    assign q_m[8] = (condition_1) ? 1'b0 : 1'b1;

    always@(posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            q_m_n1 <= 4'd0;
            q_m_n0 <= 4'd0;
        end else begin
            q_m_n1 <= q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7];
            q_m_n0 <= 4'd8 - (q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7]);
        end
    end

    assign condition_2 = ((cnt == 5'd0) || (q_m_n1 == q_m_n0));

    assign condition_3 = (((~cnt[4] == 1'b1) && (q_m_n1 > q_m_n0)) || ((cnt[4] == 1'b1) && (q_m_n0 > q_m_n1)));

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            de_reg1 <= 1'b0;
            de_reg2 <= 1'b0;
            c0_reg1 <= 1'b0;
            c0_reg2 <= 1'b0;
            c1_reg1 <= 1'b0;
            c1_reg2 <= 1'b0;
            q_m_reg <= 9'b0;
        end else begin
            de_reg1 <= de;
            de_reg2 <= de_reg1;
            c0_reg1 <= c0;
            c0_reg2 <= c0_reg1;
            c1_reg1 <= c1;
            c1_reg2 <= c1_reg1;
            q_m_reg <= q_m;
        end
    end

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            data_out <= 10'b0;
            cnt <= 5'b0;
        end else begin
            if (de_reg2 == 1'b1) begin
                if (condition_2 == 1'b1) begin
                    data_out[9] <= ~q_m_reg[8]; 
                    data_out[8] <= q_m_reg[8]; 
                    data_out[7:0] <= (q_m_reg[8]) ? q_m_reg[7:0] : ~q_m_reg[7:0];
                    cnt <= (~q_m_reg[8]) ? (cnt + q_m_n0 - q_m_n1) : (cnt + q_m_n1 - q_m_n0);
                end else begin
                    if (condition_3 == 1'b1) begin
                        data_out[9] <= 1'b1;
                        data_out[8] <= q_m_reg[8];
                        data_out[7:0] <= ~q_m_reg[7:0];
                        cnt <=  cnt + {q_m_reg[8], 1'b0} + (q_m_n0 - q_m_n1);
                    end else begin
                        data_out[9] <= 1'b0;
                        data_out[8] <= q_m_reg[8];
                        data_out[7:0] <= q_m_reg[7:0];
                        cnt <= cnt - {~q_m_reg[8], 1'b0} + (q_m_n1 - q_m_n0);
                    end
                end
            end else begin
                case ({c1_reg2, c0_reg2})
                    2'b00:   data_out <= 10'b1101010100;
                    2'b01:   data_out <= 10'b0010101011;
                    2'b10:   data_out <= 10'b0101010100;
                    default: data_out <= 10'b1010101011;
                endcase
                cnt <= 5'b0;
            end
        end
    end
endmodule
