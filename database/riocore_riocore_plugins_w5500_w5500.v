// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module w5500
    #(
         parameter BUFFER_SIZE=16'd64,
         parameter MSGID=32'h74697277,
         parameter TIMEOUT=32'd4800000,
         parameter IP_ADDR={8'd192, 8'd168, 8'd10, 8'd194},
         parameter MAC_ADDR={8'hAA, 8'hAF, 8'hFA, 8'hCC, 8'hE3, 8'h1C},
         parameter PORT=2390,
         parameter DIVIDER=3
     )
     (
         input clk,
         output mosi,
         input miso,
         output sclk,
         output sel,
         input [BUFFER_SIZE-1:0] tx_data,
         output [BUFFER_SIZE-1:0] rx_data,
         output reg sync = 0,
         output reg pkg_timeout = 0
     );
    reg [31:0] timeout_counter = 0;


    reg [31:0] clk_counter = 0;
    reg mclk = 0;
    always @(posedge clk) begin
        if (clk_counter == 0) begin
            clk_counter <= DIVIDER;
            mclk <= ~mclk;
        end else begin
            clk_counter <= clk_counter - 1;
        end
    end

    wire data_output_valid;

    reg [15:0] counter = 16'd0;
    reg flush_requested = 1'b0;
    reg [BUFFER_SIZE-1:0] data_to_ethernet = 0;
    reg data_out_valid = 1'b0;
`ifdef WIZNET5500_ACCEPT_INSTRUCTIONS
    reg [31:0] instruction_input = 32'd0;
    reg instruction_input_valid = 1'b0;
`endif
    wire ethernet_available;
    reg do_transmit = 0;

    always @(posedge mclk) begin
        sync <= 0;
        if (data_output_valid == 1) begin
            do_transmit <= 1;
            timeout_counter <= 0;
            pkg_timeout <= 0;
            sync <= 1;
        end else begin
            if (timeout_counter < TIMEOUT) begin
                timeout_counter <= timeout_counter + 1;
                pkg_timeout <= 0;
            end else begin
                pkg_timeout <= 1;
            end
            if (do_transmit == 1) begin
                if (ethernet_available) begin
                    if (counter < 1) begin
                        data_to_ethernet <= tx_data;
                        data_out_valid <= 1'b1;
                        counter <= counter + 1'b1;
                    end else begin
                        flush_requested <= 1'b1;
                        counter <= 0;
                    end
                end else begin
                    data_out_valid <= 1'b0;
                    if (flush_requested == 1) begin
                        flush_requested <= 1'b0;
                        do_transmit <= 0;
                    end
                end
            end
        end
    end

    wiznet5500 #(.IP_ADDR(IP_ADDR), .MAC_ADDR(MAC_ADDR), .PORT(PORT), .BUFFER_SIZE_RX(BUFFER_SIZE), .BUFFER_SIZE_TX(BUFFER_SIZE), .MSGID(MSGID)) eth_iface (
                   .clk(mclk),
                   .miso(miso),
                   .mosi(mosi),
                   .spi_clk(sclk),
                   .spi_chip_select_n(sel),
    `ifdef WIZNET5500_READ_DATA
                   .data_read(data_read),
                   .data_read_valid(data_read_valid),
    `endif
    `ifdef WIZNET5500_ACCEPT_INSTRUCTIONS
                   .instruction_input_valid(instruction_input_valid),
                   .instruction_input(instruction_input),
    `endif
                   .is_available(ethernet_available),
                   .data_input(data_to_ethernet),
                   .data_input_valid(data_out_valid),
                   .data_output(rx_data),
                   .data_output_valid(data_output_valid),
                   .flush_requested(flush_requested)
               );
endmodule



// based on: https://github.com/harout/concurrent-data-capture
module wiznet5500
    #(
         parameter IP_ADDR = {8'd192, 8'd168, 8'd10, 8'd194},
         parameter MAC_ADDR = {8'hAA, 8'hAF, 8'hFA, 8'hCC, 8'hE3, 8'h1C},
         parameter PORT = 2390,
         parameter BUFFER_SIZE_RX = 192,
         parameter BUFFER_SIZE_TX = 192,
         parameter MSGID=32'h74697277
     )
     (
         input clk,
         input miso,
   `ifdef WIZNET5500_ACCEPT_INSTRUCTIONS
         input instruction_input_valid,
         input [31:0] instruction_input,
   `endif
         input data_input_valid,
         input [BUFFER_SIZE_TX-1:0] data_input,
         output reg [BUFFER_SIZE_RX-1:0] data_output,
         input flush_requested,
         output reg mosi,
         output reg spi_clk = 1'b0,
         output reg spi_chip_select_n,
         output reg[7:0] data_read = 8'd0,
   `ifdef WIZNET5500_READ_DATA
         output reg data_read_valid = 1'b0,
   `endif
         output reg data_output_valid = 0,
         output is_available
     );

    localparam HEADER_SIZE  = 8'd64;
    localparam HEADER_IP_OFFSET  = 8'd0;
    localparam HEADER_PORT_OFFSET  = 8'd32;

    localparam WRITE_S0  = 8'b00001100;
    localparam READ_S0   = 8'b00001000;
    localparam WRITE_REG = 8'b00000100;

    localparam STAT_SOCK_UDP = 8'h22;

    // Set PHY to 100 megabits / second, full duplex
    localparam SET_PHY_MODE = 32'b00000000_00101110_00000100_11011000;

    // Set/read our MAC address.
    localparam SET_MAC_ADDRESS_BYTE_0  =  {8'h00, 8'b00001001, WRITE_REG};
    localparam SET_MAC_ADDRESS_BYTE_1  =  {8'h00, 8'b00001010, WRITE_REG};
    localparam SET_MAC_ADDRESS_BYTE_2  =  {8'h00, 8'b00001011, WRITE_REG};
    localparam SET_MAC_ADDRESS_BYTE_3  =  {8'h00, 8'b00001100, WRITE_REG};
    localparam SET_MAC_ADDRESS_BYTE_4  =  {8'h00, 8'b00001101, WRITE_REG};
    localparam SET_MAC_ADDRESS_BYTE_5  =  {8'h00, 8'b00001110, WRITE_REG};

    // Set/read our IP address.
    localparam SET_SOURCE_IP_ADDRESS_0  =  {8'h00, 8'b00001111, WRITE_REG};
    localparam SET_SOURCE_IP_ADDRESS_1  =  {8'h00, 8'b00010000, WRITE_REG};
    localparam SET_SOURCE_IP_ADDRESS_2  =  {8'h00, 8'b00010001, WRITE_REG};
    localparam SET_SOURCE_IP_ADDRESS_3  =  {8'h00, 8'b00010010, WRITE_REG};

    // Set/read out gateway address.
    localparam SET_GATEWAY_ADDRESS_0    = {8'h00, 8'b00000001, WRITE_REG, 8'd192};
    localparam SET_GATEWAY_ADDRESS_1    = {8'h00, 8'b00000010, WRITE_REG, 8'd168};
    localparam SET_GATEWAY_ADDRESS_2    = {8'h00, 8'b00000011, WRITE_REG, 8'd10};
    localparam SET_GATEWAY_ADDRESS_3    = {8'h00, 8'b00000100, WRITE_REG, 8'd1};

    // Set/read out subnet mask.
    localparam SET_SUBNET_MASK_0  = {8'h00, 8'b00000101, WRITE_REG, 8'd255};
    localparam SET_SUBNET_MASK_1  = {8'h00, 8'b00000110, WRITE_REG, 8'd255};
    localparam SET_SUBNET_MASK_2  = {8'h00, 8'b00000111, WRITE_REG, 8'd255};
    localparam SET_SUBNET_MASK_3  = {8'h00, 8'b00001000, WRITE_REG, 8'd0};

    // Set the socket mode to UDP with no blocking
    localparam SET_SOCKET_0_MODE  = {16'h0000, WRITE_S0, 8'b00000010};

    // Set socket 0's destination IP address (169.254.0.123)
    localparam SET_SOCKET_0_DST_IP_0 = {8'h00, 8'b00001100, WRITE_S0};
    localparam SET_SOCKET_0_DST_IP_1 = {8'h00, 8'b00001101, WRITE_S0};
    localparam SET_SOCKET_0_DST_IP_2 = {8'h00, 8'b00001110, WRITE_S0};
    localparam SET_SOCKET_0_DST_IP_3 = {8'h00, 8'b00001111, WRITE_S0};

    // Set socket 0's destination port to 5000. Requires two commands.
    localparam SET_SOCKET_0_DST_PRT_0 = {8'h00, 8'b00010000, WRITE_S0};
    localparam SET_SOCKET_0_DST_PRT_1 = {8'h00, 8'b00010001, WRITE_S0};

    // Set the socket source port number to 5000. Requires two commands.
    localparam SET_SOCKET_0_SRC_PORT_0 = {8'h00, 8'b00000100, WRITE_S0};
    localparam SET_SOCKET_0_SRC_PORT_1 = {8'h00, 8'b00000101, WRITE_S0};

    // Set socket 0's TX buffer size to 16kilobytes
    localparam S0_RXBUF_SIZE  = 16'h1E;
    localparam SET_SOCKET_0_RX_BFR_SZ = {S0_RXBUF_SIZE, WRITE_S0, 8'd16};
    localparam S0_TXBUF_SIZE  = 16'h1F;
    localparam SET_SOCKET_0_TX_BFR_SZ = {S0_TXBUF_SIZE, WRITE_S0, 8'd16};

    localparam OPEN_SOCKET_0 =       {8'h00, 8'b00000001, WRITE_S0, 8'b00000001};
    localparam READ_SOCKET_0_STATE = {8'h00, 8'b00000011, READ_S0,  8'b00100010};

    localparam SEND_PACKET_SOCKET_0 = {8'h00, 8'b00000001, WRITE_S0, 8'b00100000};

    localparam GET_S0_RX_RSR0 = {16'h0026, READ_S0, 8'd0};
    localparam GET_S0_RX_RSR1 = {16'h0027, READ_S0, 8'd0};
    localparam S0_CR_40 = {16'h0001, WRITE_S0, 8'b01000000};

    localparam SET_S0_RX_RD0 = {16'h0028, WRITE_S0};
    localparam SET_S0_RX_RD1 = {16'h0029, WRITE_S0};

    localparam SET_S0_TX_WR0 = {16'h0024, WRITE_S0};
    localparam SET_S0_TX_WR1 = {16'h0025, WRITE_S0};

    localparam BSB_S0_TX_RWB_WRITE = 8'b00010100;
    localparam BSB_S0_RX_RWB_READ  = 8'b00011000;

    localparam STATE_UNDEFINED =	     5'd0;
    localparam STATE_IDLE =              5'd1;
    localparam STATE_SENDING_COMMAND =   5'd2;
    localparam STATE_INITIALIZING =      5'd3;
    localparam STATE_PUSHING_DATA =      5'd4;
    localparam STATE_UPDATING_TX_PTR =   5'd5;
    localparam STATE_SENDING_PACKET =	 5'd6;
    localparam STATE_PULLING_DATA =	     5'd7;
    localparam STATE_RX_START =	         5'd8;
    localparam STATE_RX_WRITE_PTR1 =     5'd9;
    localparam STATE_RX_WRITE_PTR0 =     5'd10;
    localparam STATE_RX_DONE =	         5'd11;
    localparam STATE_SET_IP_0 =	         5'd12;
    localparam STATE_SET_IP_1 =	         5'd13;
    localparam STATE_SET_IP_2 =	         5'd14;
    localparam STATE_SET_IP_3 =	         5'd15;
    localparam STATE_SET_PORT_0 =	     5'd16;
    localparam STATE_SET_PORT_1 =	     5'd17;


    reg is_busy = 1'b0;
    reg [BUFFER_SIZE_RX+HEADER_SIZE+24-1:0] rx_buffer = 0;
    reg [31:0] current_instruction;
    reg [9:0] spi_clock_count;
    reg [4:0] state = STATE_INITIALIZING;
    reg [4:0] next_state = STATE_UNDEFINED;
    reg [5:0] initialization_progress = 6'b000000;
    reg waiting_for_socket = 1'b0;
    reg is_initialized = 1'b0;
    reg is_check_rx = 0;
    reg [(BUFFER_SIZE_TX+24-1):0] tx_buffer;

`ifdef WIZNET5500_ACCEPT_INSTRUCTIONS
    assign is_available = !is_busy && !data_input_valid && !flush_requested && !instruction_input_valid;
`else
    assign is_available = !is_busy && !data_input_valid && !flush_requested;
`endif

    reg [31:0] local_ip = IP_ADDR;
    reg [31:0] dst_ip = {8'd192, 8'd168, 8'd10, 8'd0};
    reg [15:0] dst_port = 16'd2390;
    reg [10:0] rx_size = 11'd0;
    reg [3:0] rx_timer = 4'd0;
    reg rx_buffer_valid = 0;
    reg [15:0] tx_buffer_write_pointer = 16'd0;
    reg [15:0] rx_buffer_read_pointer = 16'd0;

    always @(posedge clk) begin
        data_output_valid <= 0;

        if (state == STATE_IDLE && flush_requested) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_S0_TX_WR1, tx_buffer_write_pointer[7:0]};
            next_state <= STATE_UPDATING_TX_PTR;
         `ifdef WIZNET5500_READ_DATA
            data_read_valid <= 1'b0;
         `endif         
        end else if (state == STATE_UPDATING_TX_PTR) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_S0_TX_WR0, tx_buffer_write_pointer[15:8]};
            next_state <= STATE_SENDING_PACKET;
         `ifdef WIZNET5500_READ_DATA
            data_read_valid <= 1'b0;
         `endif         
        end else if (state == STATE_SENDING_PACKET) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= SEND_PACKET_SOCKET_0;
            next_state <= STATE_UNDEFINED;
         `ifdef WIZNET5500_READ_DATA         
            data_read_valid <= 1'b0;
         `endif


        end else if (state == STATE_RX_START) begin
            rx_buffer_read_pointer <= rx_buffer_read_pointer + data_read[7:0];
            if (rx_size == (BUFFER_SIZE_RX+HEADER_SIZE)) begin
                rx_buffer_valid <= 1;
                current_instruction <= {8'd0, rx_buffer_read_pointer, BSB_S0_RX_RWB_READ};
                spi_clk <= 1'b0;
                state <= STATE_PULLING_DATA;
                spi_chip_select_n <= 1'b0;
                spi_clock_count <= 10'd0;
                is_busy <= 1'b1;
            end else begin
                rx_buffer_valid <= 0;
                state <= STATE_RX_WRITE_PTR1;
                is_busy <= 1'b1;
            end
        end else if (state == STATE_PULLING_DATA && spi_clock_count > (rx_size+24-1)) begin
            spi_chip_select_n <= 1'b1;
            state <= STATE_RX_WRITE_PTR1;
            is_busy <= 1'b1;
            if (rx_buffer[BUFFER_SIZE_RX-1:BUFFER_SIZE_RX-32] == MSGID) begin
                dst_ip <= rx_buffer[BUFFER_SIZE_RX+HEADER_SIZE-HEADER_IP_OFFSET-1:BUFFER_SIZE_RX+HEADER_SIZE-HEADER_IP_OFFSET-32];
                dst_port <= rx_buffer[BUFFER_SIZE_RX+HEADER_SIZE-HEADER_PORT_OFFSET-1:BUFFER_SIZE_RX+HEADER_SIZE-HEADER_PORT_OFFSET-16];
                data_output <= rx_buffer[BUFFER_SIZE_RX-1:0];
                data_output_valid <= 1;
            end
        end else if (state == STATE_RX_WRITE_PTR1) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_S0_RX_RD1, rx_buffer_read_pointer[7:0]};
            next_state <= STATE_RX_WRITE_PTR0;
        end else if (state == STATE_RX_WRITE_PTR0) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_S0_RX_RD0, rx_buffer_read_pointer[15:8]};
            next_state <= STATE_RX_DONE;
        end else if (state == STATE_RX_DONE) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= S0_CR_40;
            if (rx_buffer_valid == 1) begin
                next_state <= STATE_SET_IP_0;
            end else begin
                next_state <= STATE_UNDEFINED;
            end


        end else if (state == STATE_SET_IP_0) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_SOCKET_0_DST_IP_0, dst_ip[31:24]};
            next_state <= STATE_SET_IP_1;
        end else if (state == STATE_SET_IP_1) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_SOCKET_0_DST_IP_1, dst_ip[23:16]};
            next_state <= STATE_SET_IP_2;
        end else if (state == STATE_SET_IP_2) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_SOCKET_0_DST_IP_2, dst_ip[15:8]};
            next_state <= STATE_SET_IP_3;
        end else if (state == STATE_SET_IP_3) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_SOCKET_0_DST_IP_3, dst_ip[7:0]};
            next_state <= STATE_SET_PORT_0;
        end else if (state == STATE_SET_PORT_0) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_SOCKET_0_DST_PRT_0, dst_port[15:8]};
            next_state <= STATE_SET_PORT_1;
        end else if (state == STATE_SET_PORT_1) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
            current_instruction <= {SET_SOCKET_0_DST_PRT_1, dst_port[7:0]};
            next_state <= STATE_UNDEFINED;


        end else if (state == STATE_INITIALIZING && waiting_for_socket == 1'b1) begin
            // If the socket is open, then we are done initializing
            if (data_read[7:0] == STAT_SOCK_UDP) begin
                state <= STATE_IDLE;
                is_initialized <= 1'b1;
                is_busy <= 1'b0;
                waiting_for_socket <= 1'b0;
            end else begin
                spi_clk <= 1'b0;
                state <= STATE_SENDING_COMMAND;
                spi_chip_select_n <= 1'b0;
                spi_clock_count <= 10'd0;
                is_busy <= 1'b1;
                current_instruction <= READ_SOCKET_0_STATE;
         `ifdef WIZNET5500_READ_DATA         
                data_read_valid <= 1'b0;
         `endif
            end
        end else if (state == STATE_INITIALIZING) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            initialization_progress <= initialization_progress + 6'b000001;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;

            case (initialization_progress)
                // TODO: Perhaps add software reset here?

                0: current_instruction <= SET_PHY_MODE;

                // Set our MAC address
                1: current_instruction <= {SET_MAC_ADDRESS_BYTE_0, MAC_ADDR[47:40]};
                2: current_instruction <= {SET_MAC_ADDRESS_BYTE_1, MAC_ADDR[39:32]};
                3: current_instruction <= {SET_MAC_ADDRESS_BYTE_2, MAC_ADDR[31:24]};
                4: current_instruction <= {SET_MAC_ADDRESS_BYTE_3, MAC_ADDR[23:16]};
                5: current_instruction <= {SET_MAC_ADDRESS_BYTE_4, MAC_ADDR[15:8]};
                6: current_instruction <= {SET_MAC_ADDRESS_BYTE_5, MAC_ADDR[7:0]};

                // Set our IP address
                7: current_instruction <= {SET_SOURCE_IP_ADDRESS_0, local_ip[31:24]};
                8: current_instruction <= {SET_SOURCE_IP_ADDRESS_1, local_ip[23:16]};
                9: current_instruction <= {SET_SOURCE_IP_ADDRESS_2, local_ip[15:8]};
                10: current_instruction <= {SET_SOURCE_IP_ADDRESS_3, local_ip[7:0]};

                // Set the gateway address
                11: current_instruction <= SET_GATEWAY_ADDRESS_0;
                12: current_instruction <= SET_GATEWAY_ADDRESS_1;
                13: current_instruction <= SET_GATEWAY_ADDRESS_2;
                14: current_instruction <= SET_GATEWAY_ADDRESS_3;

                // Set the subnet mask
                15: current_instruction <= SET_SUBNET_MASK_0;
                16: current_instruction <= SET_SUBNET_MASK_1;
                17: current_instruction <= SET_SUBNET_MASK_2;
                18: current_instruction <= SET_SUBNET_MASK_3;

                // Set socket 0's mode
                19: current_instruction <= SET_SOCKET_0_MODE;

                // Set the size of socket 0's RX buffer
                20: current_instruction <= SET_SOCKET_0_RX_BFR_SZ;

                // Set the size of socket 0's TX buffer
                21: current_instruction <= SET_SOCKET_0_TX_BFR_SZ;

                // Set the source port for socket 0
                22: current_instruction <= {SET_SOCKET_0_SRC_PORT_0, PORT[15:8]};
                23: current_instruction <= {SET_SOCKET_0_SRC_PORT_1, PORT[7:0]};

                // Send the command to open the socket
                24: current_instruction <= OPEN_SOCKET_0;

                // Set the destination IP address for socket 0
                25: current_instruction <= {SET_SOCKET_0_DST_IP_0, dst_ip[31:24]};
                26: current_instruction <= {SET_SOCKET_0_DST_IP_1, dst_ip[23:16]};
                27: current_instruction <= {SET_SOCKET_0_DST_IP_2, dst_ip[15:8]};
                28: current_instruction <= {SET_SOCKET_0_DST_IP_3, dst_ip[7:0]};

                // Set the destination port to socket 0
                29: current_instruction <= {SET_SOCKET_0_DST_PRT_0, dst_port[15:8]};
                30: current_instruction <= {SET_SOCKET_0_DST_PRT_1, dst_port[7:0]};

                // Send the command to read the socket state
                31: begin
                    current_instruction <= READ_SOCKET_0_STATE;
                    waiting_for_socket <= 1'b1;
                end
            endcase
   `ifdef WIZNET5500_ACCEPT_INSTRUCTIONS      
        end else if (state == STATE_IDLE && instruction_input_valid == 1'b1) begin
            spi_clk <= 1'b0;
            state <= STATE_SENDING_COMMAND;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            current_instruction <= instruction_input;
      `ifdef WIZNET5500_READ_DATA
            data_read_valid <= 1'b0;
      `endif
            is_busy <= 1'b1;
   `endif
        end else if (state == STATE_IDLE && data_input_valid == 1'b1) begin
            tx_buffer <= {tx_buffer_write_pointer, 8'b00010100, data_input};
            spi_clk <= 1'b0;
            state <= STATE_PUSHING_DATA;
            spi_chip_select_n <= 1'b0;
            spi_clock_count <= 10'd0;
            is_busy <= 1'b1;
        end else if (state == STATE_SENDING_COMMAND && spi_clock_count > 31) begin
            spi_chip_select_n <= 1'b1;

            if (is_initialized == 1'b1) begin
                if (next_state == STATE_UNDEFINED) begin
                    is_busy <= 1'b0;
                    state <= STATE_IDLE;
                end else begin
                    state <= next_state;
                end
            end else begin
                state <= STATE_INITIALIZING;
            end
        end else if (state == STATE_PUSHING_DATA && spi_clock_count > (BUFFER_SIZE_TX+16'd23)) begin
            spi_chip_select_n <= 1'b1;
            state <= STATE_IDLE;
            // n bytes are pushed per message
            tx_buffer_write_pointer <= tx_buffer_write_pointer + (BUFFER_SIZE_TX/16'd8);
            is_busy <= 1'b0;
        end else if (state == STATE_SENDING_COMMAND || state == STATE_PUSHING_DATA || state == STATE_PULLING_DATA) begin
            // We are effectively clocking the module at half the clock rate
            // of the FPGA itself.
            spi_clk <= ~spi_clk;
            if (spi_clk == 1'b0) begin
                spi_clock_count <= spi_clock_count + 10'd1;
            end

        end else if (state == STATE_IDLE) begin
            if (rx_timer == 4'd10) begin
                // check for new data
                if (is_check_rx == 1) begin
                    is_busy <= 1'b0;
                    is_check_rx <= 0;
                    rx_timer <= 0;
                    rx_size <= {data_read[7:0], 3'd0};
                    if (data_read[7:0] > 8'b0) begin
                        state <= STATE_RX_START;
                    end
                end else begin
                    spi_clk <= 1'b0;
                    state <= STATE_SENDING_COMMAND;
                    spi_chip_select_n <= 1'b0;
                    spi_clock_count <= 10'd0;
                    is_check_rx <= 1'b1;
                    is_busy <= 1'b1;
                    current_instruction <= GET_S0_RX_RSR1;
                end
            end else begin
                rx_timer <= rx_timer + 4'd1;
            end
        end

    end

    always @(posedge clk) begin
        if (spi_clk == 1'b0 && state == STATE_SENDING_COMMAND && spi_clock_count >= 24 && spi_clock_count <= 31) begin
            data_read <= {data_read[6:0], miso};
        end else if (spi_clk == 1'b0 && state == STATE_PULLING_DATA && spi_clock_count) begin
            rx_buffer <= {rx_buffer[BUFFER_SIZE_RX+HEADER_SIZE+24 - 2:0], miso};
        end
    end

    always @(posedge clk) begin
        if (spi_clk == 1'b1 && state == STATE_SENDING_COMMAND && spi_clock_count < 32) begin
            mosi <= current_instruction[8'd31 - spi_clock_count];
        end else if (spi_clk == 1'b1 && state == STATE_PUSHING_DATA && spi_clock_count < BUFFER_SIZE_TX+24) begin
            mosi <= tx_buffer[(BUFFER_SIZE_TX+24-1) - spi_clock_count];
        end else if (spi_clk == 1'b1 && state == STATE_PULLING_DATA && spi_clock_count < 24) begin
            mosi <= current_instruction[8'd23 - spi_clock_count];
        end
    end



endmodule

