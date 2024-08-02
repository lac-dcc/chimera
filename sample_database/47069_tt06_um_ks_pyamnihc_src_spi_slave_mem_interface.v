// This program was cloned from: https://github.com/pyamnihc/tt06_um_ks_pyamnihc
// License: Apache License 2.0

module spi_slave_mem_interface #(
    parameter INST_WIDTH = 1,
    parameter ADDR_WIDTH = 7,
    parameter DATA_WIDTH = 8
) (
    input sck_i,
    input sdi_i,
    output sdo_o,
    input cs_ni,
    output [ADDR_WIDTH-1:0] addr_o,
    output [DATA_WIDTH-1:0] write_data_o,
    output write_en_o,
    input [DATA_WIDTH-1:0] read_data_i,
    output read_en_o
);
// CPOL: 0, CPHA: 0

localparam SPI_FRAME_WIDTH = INST_WIDTH + ADDR_WIDTH + DATA_WIDTH;
localparam BIT_COUNT_WIDTH = $clog2(SPI_FRAME_WIDTH) + 1;

// shift register buffer
reg [SPI_FRAME_WIDTH-1:0] pico_reg;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) pico_reg <= 'b0;
    else pico_reg <= {pico_reg[SPI_FRAME_WIDTH-2:0], sdi_i};
end 

// keeps track of current bit position
reg [BIT_COUNT_WIDTH-1:0] bit_count;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        bit_count <= 'b0;
    end else if ((read_flag || write_flag) && 
                    (bit_count == (SPI_FRAME_WIDTH))) begin
        bit_count <= INST_WIDTH+ADDR_WIDTH+1;
    end else begin
        bit_count <= bit_count + 1'b1;
    end
end

// instruction decode
reg read_flag, write_flag;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        read_flag <= 'b0;
        write_flag <= 'b0;
    end else if (bit_count < INST_WIDTH) begin
        read_flag <= sdi_i;
        write_flag <= !sdi_i;
    end
end

// address decode and latch
reg [ADDR_WIDTH-1:0] addr_reg;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        addr_reg <= 'b0; 
    end else if (bit_count == (INST_WIDTH + ADDR_WIDTH - 1)) begin 
        addr_reg <= {pico_reg[ADDR_WIDTH-2:0], sdi_i};
    end else if (bit_count == (SPI_FRAME_WIDTH)) begin
        addr_reg <= addr_reg + 1'b1;
    end
end

assign addr_o = addr_reg;

// write data latch
reg [DATA_WIDTH-1:0] write_data;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        write_data <= 'b0;
    end else if ((write_flag == 1'b1) 
                    && (bit_count == (SPI_FRAME_WIDTH - 1))) begin
        write_data <= {pico_reg[DATA_WIDTH-2:0], sdi_i};
    end
end

// write enable strobe
reg write_en;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        write_en <= 'b0;
    end else if ((write_flag == 1'b1) 
                    && (bit_count == (SPI_FRAME_WIDTH - 1))) begin
        write_en <= 1'b1;
    end else begin
        write_en <= 1'b0;
    end
end

assign write_data_o = write_data;
assign write_en_o = write_en;

// read enable strobe
reg read_en;
always @(posedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        read_en <= 'b0;
    end else if ((read_flag == 1'b1) 
                    && ((bit_count == (INST_WIDTH + ADDR_WIDTH - 1)
                        || bit_count == (SPI_FRAME_WIDTH)))) begin
        read_en <= 1'b1;
    end else begin
        read_en <= 1'b0;
    end
end

assign read_en_o = read_en;

// shift out read data
reg sdo_reg;
always @(negedge sck_i or posedge cs_ni) begin
    if (cs_ni) begin
        sdo_reg <= 'b0;
    end else if ((read_flag == 1'b1) 
                    && (bit_count > (INST_WIDTH + ADDR_WIDTH - 1)) 
                    && (bit_count < SPI_FRAME_WIDTH)) begin
        sdo_reg <= read_data_i[(SPI_FRAME_WIDTH - 1) - bit_count];
    end else begin
        sdo_reg <= 1'b0;
    end
end

assign sdo_o = sdo_reg;

endmodule
