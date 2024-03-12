module gpio_top(/*autoport*/
//inout
            gpio0,
            gpio1,
//output
            bus_data_o,
//input
            clk_bus,
            rst_n,
            bus_address,
            bus_data_i,
            bus_read,
            bus_write);

`define REG_GPIO_IO0 5'h0
`define REG_GPIO_DIR0 5'h4
`define REG_GPIO_IO1 5'h8
`define REG_GPIO_DIR1 5'hc

input wire clk_bus;
input wire rst_n;

input wire[7:0] bus_address;
input wire[31:0] bus_data_i;
output reg[31:0] bus_data_o;
input wire bus_read;
input wire bus_write;

inout tri[31:0] gpio0;
inout tri[31:0] gpio1;

reg[31:0] mode[0:1];
reg[31:0] value[0:1];

reg[31:0] gpio0_gated;
reg[31:0] gpio0_value;
reg[31:0] gpio1_gated;
reg[31:0] gpio1_value;

always @(posedge clk_bus) begin
    gpio1_value <= gpio1_gated;
    gpio1_gated <= gpio1;
    gpio0_value <= gpio0_gated;
    gpio0_gated <= gpio0;
end

always @(posedge clk_bus or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        value[0] <= 32'h0;
        value[1] <= 32'h0;
        mode[0] <= 32'h0;
        mode[1] <= 32'h0;
    end
    else if (bus_write) begin
        case(bus_address)
        `REG_GPIO_IO0: begin
            value[0] <= bus_data_i;
        end
        `REG_GPIO_IO1: begin
            value[1] <= bus_data_i;
        end
        `REG_GPIO_DIR0: begin
            mode[0] <= bus_data_i;
        end
        `REG_GPIO_DIR1: begin
            mode[1] <= bus_data_i;
        end
        endcase
    end
end

genvar i;
generate
for(i=0; i<32; i=i+1) begin:label
    assign gpio0[i] = mode[0][i] ? value[0][i] : 1'bz;
    assign gpio1[i] = mode[1][i] ? value[1][i] : 1'bz;
end
endgenerate

always @(*) begin
    if(bus_read) begin
        case(bus_address)
        `REG_GPIO_IO0: begin
            bus_data_o <= gpio0_value;
        end
        `REG_GPIO_IO1: begin
            bus_data_o <= gpio1_value;
        end
        default: begin
            bus_data_o <= 32'h0;
        end
        endcase
    end else begin
        bus_data_o <= 32'h0;
    end

end

endmodule
