//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//

`include "../src/airi5c_uart_constants.vh"

module airi5c_uart_tb();
    localparam      BASE_ADDR           = 'h00000000;
    localparam      DATA_ADDR           = BASE_ADDR + 0;
    localparam      CTRL_REG_ADDR       = BASE_ADDR + 4;
    localparam      CTRL_SET_ADDR       = BASE_ADDR + 8;
    localparam      CTRL_CLR_ADDR       = BASE_ADDR + 12;
    localparam      TX_STAT_REG_ADDR    = BASE_ADDR + 16;
    localparam      TX_STAT_SET_ADDR    = BASE_ADDR + 20;
    localparam      TX_STAT_CLR_ADDR    = BASE_ADDR + 24;
    localparam      RX_STAT_REG_ADDR    = BASE_ADDR + 28;
    localparam      RX_STAT_SET_ADDR    = BASE_ADDR + 32;
    localparam      RX_STAT_CLR_ADDR    = BASE_ADDR + 36;


    reg             clk;
    reg             reset;

    wire            tx_1;
    reg             tx_2;

    reg             switch_tx;

    reg   [31:0]    address;
    reg             write;
    reg   [31:0]    wdata;
    wire  [31:0]    rdata;
    reg   [1:0]     trans;
    wire            ready;
    wire            response;

    reg   [31:0]    uart_din;
    reg   [31:0]    uart_dout;

    reg   [7:0]     tx_size;
    reg   [7:0]     rx_size;

    reg   [12*8:1]  tx_msg      = "Hello World!";
    reg   [5:0]     tx_msg_len  = 12;
    reg   [12*8:1]  rx_msg;
    reg   [5:0]     rx_msg_len;

    reg   [2:0]     data_bits;    // 5, 6, 7, 8, 9 (if parity is none)
    reg   [1:0]     parity;       // none, odd, even
    reg   [1:0]     stop_bits;    // 1, 1.5, 2
    reg             flow_ctrl;    // off, on (RTS/CTS)
    reg   [23:0]    baud_reg;     // = c_bit = clock_freq / baud rate (system clock cycles per bit)

    reg             noise_error;
    reg             parity_error;
    reg             frame_error;
    
    reg             test_txrx;
    reg             test_noise;
    reg             test_parity;
    reg             test_frame;

    reg   [31:0]    counter;
    integer         errorcount;
    integer         i;
    integer         j;
    integer         k;

    task write_uart;
        input       [31:0] waddress;
        input       [31:0] data_in;

        begin
            // address phase
            @(posedge clk)
            address   <= waddress;
            write     <= 1'b1;
            wdata     <= 32'h00000000;
            trans     <= 2'd2;

            // data phase
            @(posedge clk)
            address   <= 32'h00000000;
            write     <= 1'b0;
            wdata     <= data_in;
            trans     <= 2'd0;
        end
    endtask

    task read_uart;
        input       [31:0]  raddress;
        output  reg [31:0]  data_out;

        begin
            // Steuersignale anlegen
            @(posedge clk)
            address   <= raddress;
            write     <= 1'b0;
            wdata     <= 32'h00000000;
            trans     <= 2'd2;

            // Steuersignale übernehmen
            // adress phase
            @(posedge clk)
            address   <= 32'h00000000;
            write     <= 1'b0;
            wdata     <= 32'h00000000;
            trans     <= 2'd0;

            // data phase
            @(posedge clk)
            address   <= 32'h00000000;
            write     <= 1'b0;
            wdata     <= 32'h00000000;
            trans     <= 2'd0;
            data_out  = rdata;
        end
    endtask

    task transmit_string;
        input [32*8:1]  tx_msg;
        input [5:0]     size;
        begin
            // write message to tx fifo stack
            for (i = 1; i <= size; i = i + 1)
                write_uart(DATA_ADDR, tx_msg >> ((size-i)*8));
            // wait until the message is transmitted
            read_uart(TX_STAT_REG_ADDR, uart_dout);
            tx_size = uart_dout[7:0];
            while (tx_size > 0) begin
                read_uart(TX_STAT_REG_ADDR, uart_dout);
                tx_size = uart_dout[7:0];
            end
        end
    endtask

    task receive_string;
        output  reg [32*8:1]  msg;
        output  reg [5:0]     size;
        begin
            msg = "";
            read_uart(RX_STAT_REG_ADDR, uart_dout);
            rx_size = uart_dout[7:0];

            for (i = 1; i <= 32 && rx_size > 0; i = i + 1) begin
                read_uart(DATA_ADDR, uart_dout);
                msg = {msg[31*8:1],  uart_dout[7:0]};
                read_uart(RX_STAT_REG_ADDR, uart_dout);
                rx_size = uart_dout[7:0];
            end
            size = i;
        end
    endtask


    task generate_tx;
        input       [8:0]     data;
        input                 gen_noise_error;
        input                 gen_parity_error;
        input                 gen_frame_error;
        begin
            read_uart(CTRL_REG_ADDR, uart_dout);
            data_bits = uart_dout[31:29];
            parity    = uart_dout[28:27];
            stop_bits = uart_dout[26:25];
            flow_ctrl = uart_dout[24];
            baud_reg  = uart_dout[23:0];
            tx_2      = 1'b1;

            // start bit
            for (i = 1; i <= baud_reg; i = i + 1) begin
                @(posedge clk)
                tx_2 = 1'b0;
            end
            // data bits
            for (j = 0; j < (data_bits + 5); j = j + 1) begin
                for (i = 1; i <= baud_reg; i = i + 1) begin
                    @(posedge clk)
                    // generate single noise error at data[5]
                    if ((i >= ((baud_reg >> 1) + (baud_reg >> 4) - (baud_reg >> 5))) && (j == 5) &&
                        (i <= ((baud_reg >> 1) + (baud_reg >> 4) + (baud_reg >> 5))) && gen_noise_error)
                        tx_2 = !data[j];
                    else
                        tx_2 = data[j];
                end
            end
            // parity bit
            for (i = 1; (i <= baud_reg) && (parity != `UART_PARITY_NONE); i = i + 1) begin
                @(posedge clk)
                if (parity == `UART_PARITY_EVEN)
                    tx_2 = gen_parity_error ? ~^data : ^data;
                else
                    tx_2 = gen_parity_error ? ^data : ~^data;
            end
            // stop bit
            for (i = 1;
                ((i <= baud_reg) && (stop_bits == `UART_STOP_BITS_1)) ||
                ((i <= 1.5*baud_reg) && (stop_bits == `UART_STOP_BITS_15)) ||
                ((i <= 2*baud_reg) && (stop_bits == `UART_STOP_BITS_2)); i = i + 1) begin
                @(posedge clk)
                tx_2 = gen_frame_error ? 1'b0 : 1'b1;
            end
        end
    endtask

    initial begin
        clk         = 1'b0;
        reset       = 1'b1;
        address     = 32'h00000000;
        write       = 1'b0;
        wdata       = 32'h00000000;
        trans       = 2'd0;
        uart_din    = 32'h00000000;
        uart_dout   = 32'h00000000;
        tx_size     = 6'h00;
        rx_size     = 6'h00;
        tx_2        = 1'b1;
        switch_tx   = 1'b0;
        counter     = 32'h00000000;
        errorcount  = 0;
        
        test_txrx   = 1'b0;
        test_noise  = 1'b0;
        test_parity = 1'b0;
        test_frame  = 1'b0;

        @(posedge clk)
        reset   = 1'b0;

        // transmit/receive a simple message
        test_txrx   = 1'b1;
        $write("\nUART Test 1: transmit/receive a simple message ... ");
        write_uart(CTRL_REG_ADDR, {`UART_DATA_BITS_8, `UART_PARITY_NONE, `UART_STOP_BITS_1, `UART_FLOW_CTRL_OFF, 24'd3333});
        transmit_string(tx_msg, tx_msg_len);
        receive_string(rx_msg, rx_msg_len);
        if (tx_msg != rx_msg) begin
            $write("Fail!\n");
            errorcount = errorcount + 1;
        end

        else
            $write("Success!\n");
        test_txrx   = 1'b0;


        // transmit data with forced errors
        switch_tx = 1'b1;

        // noise error
        test_noise  = 1'b1;
        $write("UART Test 2: receive data with noise ... ");
        write_uart(RX_STAT_CLR_ADDR, 32'h00f80000);                                                                           // clear errors
        write_uart(CTRL_REG_ADDR, {`UART_DATA_BITS_8, `UART_PARITY_NONE, `UART_STOP_BITS_1, `UART_FLOW_CTRL_OFF, 24'd278});   // change UART config
        generate_tx(9'b010000001, 1'b1, 1'b0, 1'b0);                                                                          // transmit faulty data
        for (k = 1; k <= 3; k = k + 1)                                                                                        // rx is double registered, to remove metastability problems
            @(posedge clk);                                                                                                   // so we need to wait 3 clock cycles until the data is received completely
        read_uart(RX_STAT_REG_ADDR, uart_dout);                                                                               // read error flags
        noise_error   = uart_dout[21];
        parity_error  = uart_dout[22];
        frame_error   = uart_dout[23];
        read_uart(DATA_ADDR, uart_dout);                                                                                     // read data
        if (noise_error == 1'b0 || parity_error == 1'b1 || frame_error == 1'b1 || uart_dout[8:0] != 9'b010000001) begin
            $write("Fail!\n");
            errorcount = errorcount + 1;
        end

        else
            $write("Success!\n");
        test_noise  = 1'b0;

        // parity error
        test_parity = 1'b1;
        $write("UART Test 3: receive data with parity error ... ");
        write_uart(RX_STAT_CLR_ADDR, 32'h00f80000);                                                                           // clear errors
        write_uart(CTRL_REG_ADDR, {`UART_DATA_BITS_7, `UART_PARITY_EVEN, `UART_STOP_BITS_15, `UART_FLOW_CTRL_OFF, 24'd1667}); // change UART config
        generate_tx(9'b001100001, 1'b0, 1'b1, 1'b0);                                                                          // transmit faulty data
        for (k = 1; k <= 3; k = k + 1)
            @(posedge clk);
        read_uart(RX_STAT_REG_ADDR, uart_dout);                                                                               // read error flags
        noise_error   = uart_dout[21];
        parity_error  = uart_dout[22];
        frame_error   = uart_dout[23];
        read_uart(DATA_ADDR, uart_dout);                                                                                     // read data
        if (noise_error == 1'b1 || parity_error == 1'b0 || frame_error == 1'b1 || uart_dout[8:0] != 9'b001100001) begin
            $write("Fail!\n");
            errorcount = errorcount + 1;
        end

        else
            $write("Success!\n");
        test_parity = 1'b0;

        // frame error
        test_frame = 1'b1;
        $write("UART Test 4: receive data with frame error ... ");
        write_uart(RX_STAT_CLR_ADDR, 32'h00f80000);                                                                           // clear errors
        write_uart(CTRL_REG_ADDR, {`UART_DATA_BITS_6, `UART_PARITY_ODD, `UART_STOP_BITS_2, `UART_FLOW_CTRL_OFF, 24'd556});    // change UART config
        generate_tx(9'b000101010, 1'b0, 1'b0, 1'b1);                                                                          // transmit faulty data
        for (k = 1; k <= 3; k = k + 1)
            @(posedge clk);
        read_uart(RX_STAT_REG_ADDR, uart_dout);                                                                               // read error flags
        noise_error   = uart_dout[21];
        parity_error  = uart_dout[22];
        frame_error   = uart_dout[23];
        read_uart(DATA_ADDR, uart_dout);                                                                                     // read data
        if (noise_error == 1'b1 || parity_error == 1'b1 || frame_error == 1'b0 || uart_dout[8:0] != 9'b000101010) begin
            $write("Fail!\n");
            errorcount = errorcount + 1;
        end

        else
            $write("Success!\n");
        test_frame = 1'b0;

        if (errorcount == 0)
            $write("passed\n\n");
        else
            $write("failed\n\n");

        $finish();
    end

    always #10 clk = !clk;

    airi5c_uart
    #(
        .BASE_ADDR(BASE_ADDR),
        .TX_ADDR_WIDTH(5),
        .RX_ADDR_WIDTH(5)
    ) uart_inst
    (
        .n_reset(!reset),
        .clk(clk),

        .tx(tx_1),
        .rx(switch_tx ? tx_2 : tx_1),
        .cts(1'b1),
        .rts(),

        .int_any(),
        .int_tx_empty(),
        .int_tx_watermark_reached(),
        .int_tx_overflow_error(),
        .int_rx_full(),
        .int_rx_watermark_reached(),
        .int_rx_overflow_error(),
        .int_rx_underflow_error(),
        .int_rx_noise_error(),
        .int_rx_parity_error(),
        .int_rx_frame_error(),

        // AHB-Lite interface
        .haddr(address),      // address
        .hwrite(write),       // write enable
      //.hsize(),             // unused
      //.hburst(),            // unused
      //.hmastlock(),         // unused
      //.hprot(),             // unused
        .htrans(trans),       // transfer type (IDLE or NONSEQUENTIAL)
        .hwdata(wdata),       // data in
        .hrdata(rdata),       // data out
        .hready(ready),       // transfer finished
        .hresp(response)      // transfer status (OKAY or ERROR)*/
    );
endmodule