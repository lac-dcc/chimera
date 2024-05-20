// This program was cloned from: https://github.com/Santeep/TT_UM_SERDES
// License: Apache License 2.0

module serdes_top(
    input           clk,
    input           rst_n,
    input           data_en,
    input           ser_in,
    input           par_en,
    input           ser_en,
    output wire      ser_out,
    output wire [7:0]    data_out,
    input [7:0]     data_8b_in
);

    // Serializer module
    wire [7:0]       data_8b_latched;
    wire [9:0]       data_10b_encoded;
    wire [9:0]       data_10b_latched;

    latch_8bit latch_8b_inst (
        .clk(clk),
        .rst_n(rst_n),
        .data_8b_in(data_8b_in),
        .data_en(data_en),
        .data_8b_out(data_8b_latched)
    );  
    
    encoder_8b_10b encoder_inst (
        .clk(clk),
        .rst_n(rst_n),
        .data_8b_in(data_8b_latched),
        .ser_en(ser_en),
        .data_10b_out(data_10b_encoded)
    );
    
    latch_10bit latch_10b_inst (
        .clk(clk),
        .rst_n(rst_n),
        .data_10b_in(data_10b_encoded),
        .data_en(data_en),
        .data_10b_out(data_10b_latched)
    );

    piso_10bit piso_inst (
        .clk(clk),
        .rst_n(rst_n),
        .par_in(data_10b_latched),
        .load_en(ser_en),
        .ser_out(ser_out)
    );

    // Deserializer module
    wire [9:0]       data_10b;
    wire[9:0]	    data_10b_latched_d;
    wire [7:0]       data_8b_decoded;

    // Instantiate the SIPO module
    sipo_10bit sipo_inst_d (
        .clk(clk),
        .rst_n(rst_n),
        .ser_in(ser_in),
        .shift_en(par_en),
        .par_out(data_10b)
    );

    // Instantiate the 10-bit latch
    latch_10bit latch_10b_inst_d (
        .clk(clk),
        .rst_n(rst_n),
        .data_10b_in(data_10b),
        .data_en(data_en),
        .data_10b_out(data_10b_latched_d)
    );

    // Instantiate the 10b/8b decoder
    decoder_10b_8b decoder_inst_d (
        .clk(clk),
        .rst_n(rst_n),
        .data_10b_in(data_10b_latched_d),
        .par_en(par_en),
        .data_8b_out(data_8b_decoded)
    );

    // Instantiate the 8-bit latch
    latch_8bit latch_8b_inst_d (
        .clk(clk),
        .rst_n(rst_n),
        .data_8b_in(data_8b_decoded),
        .data_en(data_en),
        .data_8b_out(data_out)
    );
endmodule

module latch_8bit(
    input           clk,
    input           rst_n,
    input [7:0]     data_8b_in,
    input           data_en,
    output reg [7:0]    data_8b_out
);

    always @ ( posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_8b_out <= 8'h00;
        end
        else begin
            if (data_en) begin
                data_8b_out <= data_8b_in;
            end
            else data_8b_out <= data_8b_out;
        end
    end

endmodule


module encoder_8b_10b(
    input           clk,
    input           rst_n,
    input [7:0]     data_8b_in,
    input           ser_en,
    output reg[9:0]    data_10b_out
);

    reg [3:0]       temp_4b;
    reg [5:0]       temp_6b;

    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            temp_4b <= 4'b0000;
            temp_6b <= 6'b000000;
        end
        else begin
            if (!ser_en) begin
                case (data_8b_in[7:5])
                3'b000: temp_4b <= 4'b0100;
                3'b001: temp_4b <= 4'b1001;
                3'b010: temp_4b <= 4'b0101;
                3'b011: temp_4b <= 4'b0011;
                3'b100: temp_4b <= 4'b0010;
                3'b101: temp_4b <= 4'b1010;
                3'b110: temp_4b <= 4'b0110;
                3'b111: temp_4b <= 4'b0001;
                default: temp_4b <= 4'b0000;    
                endcase
                case (data_8b_in[4:0])
                5'b00000: temp_6b <= 6'b011000;
                5'b00001: temp_6b <= 6'b011101;
                5'b00010: temp_6b <= 6'b010010;     
                5'b00011: temp_6b <= 6'b110001;
                5'b00100: temp_6b <= 6'b110101;
                5'b00101: temp_6b <= 6'b101001;
                5'b00110: temp_6b <= 6'b011001;
                5'b00111: temp_6b <= 6'b111000;
                5'b01000: temp_6b <= 6'b111001;
                5'b01001: temp_6b <= 6'b100101;
                5'b01010: temp_6b <= 6'b010101;
                5'b01011: temp_6b <= 6'b110100;
                5'b01100: temp_6b <= 6'b001101;
                5'b01101: temp_6b <= 6'b101100;
                5'b01110: temp_6b <= 6'b011100;
                5'b01111: temp_6b <= 6'b010111;
                5'b10000: temp_6b <= 6'b011011;
                5'b10001: temp_6b <= 6'b100011;
                5'b10010: temp_6b <= 6'b010011;
                5'b10011: temp_6b <= 6'b110010;
                5'b10100: temp_6b <= 6'b001011;
                5'b10101: temp_6b <= 6'b101010;
                5'b10110: temp_6b <= 6'b011010;
                5'b10111: temp_6b <= 6'b111010;
                5'b11000: temp_6b <= 6'b110011;
                5'b11001: temp_6b <= 6'b100110;
                5'b11010: temp_6b <= 6'b010110;
                5'b11011: temp_6b <= 6'b110110;
                5'b11100: temp_6b <= 6'b001110;
                5'b11101: temp_6b <= 6'b101110;
                5'b11110: temp_6b <= 6'b011110;
                5'b11111: temp_6b <= 6'b101011;
                default: temp_6b <= 6'b000000;
                endcase
            end
            else data_10b_out <= {temp_4b, temp_6b};
        end
    end 
endmodule

module latch_10bit(
    input           clk,
    input           rst_n,
    input [9:0]     data_10b_in,
    input           data_en,
    output reg [9:0]    data_10b_out
);
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_10b_out <= 10'h00;
        end
        else begin
            if (data_en) begin
                data_10b_out <= data_10b_in;
            end
            else data_10b_out <= data_10b_out;
        end
    end
endmodule

module piso_10bit(
    input           clk,
    input           rst_n,
    input [9:0]     par_in,
    input           load_en,
    output reg      ser_out
);

    reg [9:0]       shift_reg;

    always @(posedge clk) begin
        if (!rst_n) begin
            shift_reg <= 10'b0000000000;
        end 
        else begin 
            if (load_en) begin
                shift_reg <= par_in;
            end
            else begin
                ser_out <= shift_reg[0];
                shift_reg <= {1'b0, shift_reg[9:1]};  
            end
        end
    end

endmodule

module sipo_10bit(
    input           clk,
    input           rst_n,
    input           ser_in,
    input           shift_en,
    output reg [9:0]    par_out
);

    reg [9:0]       shift_reg;

    always @ (posedge clk)begin
        if (!rst_n) begin
            shift_reg <= 10'b0000000000;
        end
        else begin
            if (shift_en) begin
                par_out <= shift_reg;
            end
            else shift_reg <= {shift_reg[8:0], ser_in};
        end
    end

endmodule

module decoder_10b_8b(
    input           clk,
    input           rst_n,
    input [9:0]     data_10b_in,
    input           par_en,
    output reg [7:0]    data_8b_out
);

    reg [2:0]       temp_3b;
    reg [4:0]       temp_5b;

    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            temp_3b <= 3'b000;
            temp_5b <= 5'b00000;
        end
        else begin
            if (!par_en) begin
                case (data_10b_in[9:6])
                4'b0100: temp_3b <= 3'b000;
                4'b1001: temp_3b <= 3'b001;
                4'b0101: temp_3b <= 3'b010;
                4'b0011: temp_3b <= 3'b011;
                4'b0010: temp_3b <= 3'b100;
                4'b1010: temp_3b <= 3'b101;
                4'b0110: temp_3b <= 3'b110;
                4'b0001: temp_3b <= 3'b111;
                default: temp_3b <= 3'b000;    
                endcase
                case (data_10b_in[5:0])
                6'b011000: temp_5b <= 5'b00000;
                6'b011101: temp_5b <= 5'b00001;
                6'b010010: temp_5b <= 5'b00010;     
                6'b110001: temp_5b <= 5'b00011;
                6'b110101: temp_5b <= 5'b00100;
                6'b101001: temp_5b <= 5'b00101;
                6'b011001: temp_5b <= 5'b00110;
                6'b111000: temp_5b <= 5'b00111;
                6'b111001: temp_5b <= 5'b01000;
                6'b100101: temp_5b <= 5'b01001;
                6'b010101: temp_5b <= 5'b01010;
                6'b110100: temp_5b <= 5'b01011;
                6'b001101: temp_5b <= 5'b01100;
                6'b101100: temp_5b <= 5'b01101;
                6'b011100: temp_5b <= 5'b01110;
                6'b010111: temp_5b <= 5'b01111;
                6'b011011: temp_5b <= 5'b10000;
                6'b100011: temp_5b <= 5'b10001;
                6'b010011: temp_5b <= 5'b10010;
                6'b110010: temp_5b <= 5'b10011;
                6'b001011: temp_5b <= 5'b10100;
                6'b101010: temp_5b <= 5'b10101;
                6'b011010: temp_5b <= 5'b10110;
                6'b111010: temp_5b <= 5'b10111;
                6'b110011: temp_5b <= 5'b11000;
                6'b100110: temp_5b <= 5'b11001;
                6'b010110: temp_5b <= 5'b11010;
                6'b110110: temp_5b <= 5'b11011;
                6'b001110: temp_5b <= 5'b11100;
                6'b101110: temp_5b <= 5'b11101;
                6'b011110: temp_5b <= 5'b11110;
                6'b101011: temp_5b <= 5'b11111;
                default: temp_5b <= 5'b00000;
                endcase
            end
            else data_8b_out <= {temp_3b,temp_5b};
        end
    end
endmodule
