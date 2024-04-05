module sram(
    clock, clock115200hz, clock460800hz, resetn,
    address, indata, outdata, load, store, prog, 
    
    //////////// Uart to USB //////////
	UART_RX,
    UART_TX,
    
    //////////// SRAM //////////
	SRAM_A,
	SRAM_CE_n,
	SRAM_D,
	SRAM_LB_n,
	SRAM_OE_n,
	SRAM_UB_n,
	SRAM_WE_n
);

input clock;
input clock115200hz;
input clock460800hz;
input resetn;

input [18:0] address;
input [7:0] indata;
output reg [7:0] outdata;
input load;
input store;
input prog;

//////////// Uart to USB //////////
input UART_RX;
output UART_TX;

//////////// SRAM //////////
output [17:0] SRAM_A = ram_address[18:1];
inout [15:0] SRAM_D = ram_bus;
output SRAM_CE_n = ~1'b1;
output SRAM_UB_n = ~ram_bytes[1];
output SRAM_LB_n = ~ram_bytes[0];
output SRAM_OE_n = ~ram_load;
output SRAM_WE_n = ~ram_store;


wire [15:0] ram_bus = ram_store ? {ram_outdata, ram_outdata} : 16'hzzzz;
wire [1:0] ram_bytes = ram_address[0] ? 2'b01 : 2'b10;

reg [18:0] ram_address;
reg [7:0] ram_outdata;
reg ram_load;
reg ram_store;

wire [7:0] ram_indata = ram_address[0] ? SRAM_D[7:0] : SRAM_D[15:8];


wire [7:0] uart_data;
wire uart_recv;
reg uart_recv_ack;

uartrx comm_uart (clock460800hz, resetn, uart_data, uart_recv, UART_RX);
uarttx check_uart (clock115200hz, resetn, uart_data, uart_recv, , UART_TX);


reg [31:0] flash_address;
reg [31:0] flash_count;
reg [3:0] flash_state;

always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        ram_address <= 0;
        ram_outdata <= 0;
        ram_load <= 0;
        ram_store <= 0;
        outdata <= 0;

        flash_state <= 0;
        uart_recv_ack <= 0;
    end else if (prog) begin
        uart_recv_ack <= uart_recv;
    
        if (uart_recv && !uart_recv_ack) begin
            case (flash_state)
            4'h0: begin flash_state <= 4'h1; flash_address <= {flash_address[23:0], uart_data}; end
            4'h1: begin flash_state <= 4'h2; flash_address <= {flash_address[23:0], uart_data}; end
            4'h2: begin flash_state <= 4'h3; flash_address <= {flash_address[23:0], uart_data}; end
            4'h3: begin flash_state <= 4'h4; flash_address <= {flash_address[23:0], uart_data}; end
            4'h4: begin flash_state <= 4'h5; flash_count <= {flash_count[23:0], uart_data}; end
            4'h5: begin flash_state <= 4'h6; flash_count <= {flash_count[23:0], uart_data}; end
            4'h6: begin flash_state <= 4'h7; flash_count <= {flash_count[23:0], uart_data}; end
            4'h7: begin flash_state <= 4'h8; flash_count <= {flash_count[23:0], uart_data}; end
            4'h8: begin 
                if (flash_count == 0) begin
                    flash_state <= 4'h0;
                end else begin
                    flash_address <= flash_address + 1'b1;
                    flash_count <= flash_count - 1'b1;
                    ram_address <= flash_address[18:0];
                    ram_outdata <= uart_data;
                    ram_load <= 1'b0;
                    ram_store <= 1'b1;
                end
            end
            endcase
        end
    end else begin
        ram_address <= address;
        ram_outdata <= indata;
        ram_load <= load;
        ram_store <= store;
        outdata <= ram_indata;
        
        flash_state <= 0;
        uart_recv_ack <= 0;
    end 
end

endmodule
