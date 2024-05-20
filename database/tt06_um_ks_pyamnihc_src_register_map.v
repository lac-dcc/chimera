// This program was cloned from: https://github.com/pyamnihc/tt06_um_ks_pyamnihc
// License: Apache License 2.0

module register_map #(
    parameter ADDR_WIDTH = 7,
    parameter DATA_WIDTH = 8,
    parameter NUM_CONFIG_REG = 12,
    parameter NUM_STATUS_REG = 4
) (
    input clk_i,
    input rst_ni,
    input [ADDR_WIDTH-1:0] addr_i,
    input [DATA_WIDTH-1:0] write_data_i,
    input write_en_i,
    output [DATA_WIDTH-1:0] read_data_o,
    input read_en_i,
    output [DATA_WIDTH*NUM_CONFIG_REG-1:0] config_bus_o,
    input [DATA_WIDTH*NUM_STATUS_REG-1:0] status_bus_i
);

    // packed to unpacked conversion
    reg [DATA_WIDTH-1:0] register_map_mem [NUM_CONFIG_REG-1:0];
    genvar i;
    generate 
        for (i = 0; i < NUM_CONFIG_REG; i = i + 1) begin
            assign config_bus_o[DATA_WIDTH*(i+1)-1: DATA_WIDTH*i] = register_map_mem[i];
        end
    endgenerate

    wire [DATA_WIDTH*(NUM_CONFIG_REG+NUM_STATUS_REG)-1:0] csr_read_bus;
    assign csr_read_bus = {status_bus_i, config_bus_o};
    
    wire [DATA_WIDTH-1:0] csr_read_arr [NUM_CONFIG_REG+NUM_STATUS_REG-1:0];
    generate
        for (i = 0; i < (NUM_CONFIG_REG + NUM_STATUS_REG); i = i + 1) begin
            assign csr_read_arr[i] = csr_read_bus[DATA_WIDTH*(i+1)-1:DATA_WIDTH*i];
        end
    endgenerate
    
    // synchronize to clk_i domain
    // write_data should be stable when write_en is asserted
    reg [3:0] write_en_shift_reg;
    always @(posedge clk_i) begin
        if (!rst_ni) begin
            write_en_shift_reg <= 'b0;
        end else begin
            write_en_shift_reg <= {write_en_shift_reg[2:0], write_en_i};
        end
    end

    wire write_en_rise_pulse;
    assign write_en_rise_pulse = !write_en_shift_reg[3] && write_en_shift_reg[2];
    
    reg [DATA_WIDTH-1:0] read_data_1, read_data_2;
    always @(posedge clk_i) begin
        if (!rst_ni) begin
            read_data_1 <= 'b0;
            read_data_2 <= 'b0;
        end else if (read_en_i == 1) begin
            if (addr_i < (NUM_CONFIG_REG + NUM_STATUS_REG)) begin
                read_data_1 <= csr_read_arr[addr_i];
                read_data_2 <= read_data_1;
            end
            else begin
                read_data_2 <= 8'hff;
            end
        end
    end
    assign read_data_o = read_data_2; 

    // attempt to non-zero init. can't make it work with skywater-pdk
    always @(posedge clk_i) begin
        if (!rst_ni) begin
            register_map_mem[0] <= 'b0;
        end else if ((addr_i == 0) && (addr_i < NUM_CONFIG_REG)) begin
            if (write_en_rise_pulse == 1) register_map_mem[0] <= write_data_i;
        end
    end
    
    generate 
        for (i = 1; i < NUM_CONFIG_REG; i = i + 1) begin
            always @(posedge clk_i) begin
                if (!rst_ni) begin
                    register_map_mem[i] <= 'b0;
                end else if ((addr_i == i) && (addr_i < NUM_CONFIG_REG)) begin
                    if (write_en_rise_pulse == 1) register_map_mem[i] <= write_data_i;
                end
            end
        end
    endgenerate

endmodule
    

