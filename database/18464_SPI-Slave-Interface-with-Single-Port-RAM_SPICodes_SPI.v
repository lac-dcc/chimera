// This program was cloned from: https://github.com/3b3al-MV/SPI-Slave-Interface-with-Single-Port-RAM
// License: MIT License

module spi_slave (
    input clk,
    input rst_n,
    input SS_n,
    input MOSI,
    output reg MISO,
    output reg [9:0] din,
    output reg rx_valid,
    input [7:0] dout,
    input tx_valid
);

    parameter IDLE = 3'b000;
    parameter CHK_CMD = 3'b001;
    parameter WRITE = 3'b010;
    parameter READ_ADD = 3'b011;
    parameter READ_DATA = 3'b100;

    (* fsm_encoding="one_hot" *)
    reg [2:0] cs, ns;
    reg [9:0] rx_data, tx_data;
    reg [3:0] bit_count;
    reg [7:0] read_reg;
    wire flag;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            read_reg <= 0;
        else 
            read_reg <= dout;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cs <= IDLE;
        end else begin
            cs <= ns;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            bit_count <= 0;
        else if ((cs == WRITE || cs == READ_ADD) && (bit_count < 10)) begin
            rx_data[9 - bit_count] <= MOSI;
            bit_count <= bit_count + 1;
        end else if (flag) begin
            bit_count <= bit_count + 1;   
        end else
            bit_count <= 0;    
    end

    always @(*) begin
        case (cs)
            IDLE: begin
                if (SS_n) begin
                    ns = IDLE;
                end else begin
                    ns = CHK_CMD;
                end
            end
            CHK_CMD: begin
                if(SS_n)
                    ns = IDLE;
                else if (MOSI == 1'b0) begin
                    ns = WRITE;
                end else begin
                    ns = READ_ADD;
                end
            end
            WRITE: begin
                if (SS_n) begin
                    ns = IDLE;
                end else begin
                    ns = WRITE;
                end
            end
            READ_ADD: begin
                if (SS_n) begin
                    ns = IDLE;
                end else if((rx_data[8] == 1) && (bit_count == 4'd10))
                    ns = READ_DATA;
                else
                    ns = READ_ADD;
            end
            READ_DATA: begin
                if (SS_n) begin
                    ns = IDLE;
                end else begin
                    ns = READ_DATA;
                end
            end
            default: ns = IDLE;
        endcase
    end

    always @(*) begin
        case (cs)
            WRITE, READ_ADD: begin
                din = rx_data;
                rx_valid = (bit_count == 4'd10) ? 1 : 0;
                MISO = 1'b0;
            end
            READ_DATA: begin
                din = rx_data;
                rx_valid = (bit_count == 4'd10) ? 1 : 0;
                MISO = (flag) ? read_reg[7 - bit_count] : 0;
            end
            default: begin
                din = 0;
                rx_valid = 1'b0;
                MISO = 1'b0;
            end
        endcase
    end

    assign flag = ((cs == READ_DATA) && (tx_valid == 1) && (bit_count < 8)) ? 1 : 0;

endmodule
