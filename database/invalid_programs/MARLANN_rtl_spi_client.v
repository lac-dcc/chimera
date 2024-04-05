`default_nettype none
module spi_client (
    input               i_clock,
    input               i_reset,
    output              o_active,           // high whenever chip selected

    input               i_spi_clk,          // spi clock
    input               i_spi_cs_n,         // spi chip select, low to select

    output reg          o_miso,             // output to master
    input               i_mosi,             // input from master
   
    output reg          o_data_in_valid,    // data from master is ready to read on the data_in_data reg
    output reg          o_data_in_start,    // high for first byte received after cs goes low
    output reg [7:0]    o_data_in_data,     // data register from master

    input               i_data_out_valid,   // data in the input data bus is valid to read
    output reg          o_data_out_ready,   // data has been registered
    input [7:0]         i_data_out_data     // input data to send to the master
);


    assign o_active = !i_spi_cs_n;

    // data coming from master goes here
    reg [2:0] in_bit = 0;
    reg [7:0] data_in = 8'b 0x;

    // data to send goes here
    reg [2:0] out_bit = 0;
    reg [7:0] data_out = 0;
    // copy of data_out for the spi_clock domain
    reg [7:0] data_out_spi = 0;
    reg [7:0] data_in_spi = 0;


    reg first_byte = 0;
    reg start_status = 0; // registers data_in_start


    always @(posedge i_spi_clk, posedge i_spi_cs_n) begin
        if(i_spi_cs_n) begin                  // reset state
            in_bit <= 0;
            first_byte <= 1;
        end else begin                      // receiving data
            data_in[3'd7-in_bit] <= i_mosi;
            in_bit <= in_bit + 1;
            if(in_bit == 7) begin
                data_in_spi <= { data_in[7:1], i_mosi };
                first_byte <= 0;
            end
        end
    end

    always @(negedge i_spi_clk, posedge i_spi_cs_n) begin
        if(i_spi_cs_n) begin                  // reset state
            out_bit <= 0;
        end else begin
            if(out_bit == 7)                  // get a local copy of the data to send out - guaranteed stable
                data_out_spi <= data_out;
            o_miso <= data_out_spi[3'd7-out_bit];
            out_bit <= out_bit + 1;
        end
    end

    localparam DATA_IN_WAIT = 0;
    localparam DATA_IN_RX = 1;
    localparam DATA_IN_READY = 2;
    localparam DATA_IN_ENDSTATE = 3;
    reg [$clog2(DATA_IN_ENDSTATE)-1:0] data_in_state = DATA_IN_WAIT;

    localparam DATA_OUT_WAIT = 0;
    localparam DATA_OUT_TX = 1;
    localparam DATA_OUT_ENDSTATE = 2;
    reg [$clog2(DATA_OUT_ENDSTATE)-1:0] data_out_state = DATA_OUT_WAIT;

    // clock domain crossing with 2 flip flops and one for what happened one clock ago
    reg out_bit_clock, out_bit_clock_past, out_bit_clock_pipe;
    reg in_bit_clock, in_bit_clock_past, in_bit_clock_pipe;
    reg fb_clock, fb_clock_past, fb_clock_pipe;

    initial begin
        { out_bit_clock_past, out_bit_clock, out_bit_clock_pipe } = 0;
        { in_bit_clock_past, in_bit_clock, in_bit_clock_pipe } = 0;
        { fb_clock, fb_clock_past, fb_clock_pipe } = 3'b111;
    end

    always @(posedge i_clock) begin
        { out_bit_clock_past, out_bit_clock, out_bit_clock_pipe } <= { out_bit_clock, out_bit_clock_pipe, out_bit[2] };
        { in_bit_clock_past, in_bit_clock, in_bit_clock_pipe } <= { in_bit_clock, in_bit_clock_pipe, in_bit == 7 };
        { fb_clock_past, fb_clock, fb_clock_pipe } <= { fb_clock, fb_clock_pipe, first_byte };
    end

    initial begin
        data_in_state <= DATA_IN_WAIT;
        data_out_state <= DATA_OUT_WAIT;
        o_data_in_start <= 0;
        o_data_out_ready <= 0;
        start_status <= 0;
    end

    always @(posedge i_clock) begin
        if(i_reset) begin
            data_in_state <= DATA_IN_WAIT;
            data_out_state <= DATA_OUT_WAIT;
            o_data_in_start <= 0;
            o_data_out_ready <= 0;
            start_status <= 0;
        end
        else begin

            case(data_in_state)
                DATA_IN_WAIT: begin
                    start_status <= fb_clock;
                    o_data_in_valid <= 0;
                    if(in_bit_clock == 1)
                        data_in_state <= DATA_IN_RX;
                end
                DATA_IN_RX: begin
                    if(in_bit_clock == 0)
                        data_in_state <= DATA_IN_READY;
                end 
                DATA_IN_READY: begin
                    o_data_in_valid <= 1;
                    o_data_in_start <= start_status;
                    o_data_in_data <= data_in_spi;
                    data_in_state <= DATA_IN_WAIT;
                end
            endcase

            case(data_out_state)
                DATA_OUT_WAIT: begin
                    if({out_bit_clock, out_bit_clock_past} == 2'b10)
                        if(i_data_out_valid) begin
                            data_out <= i_data_out_data;
                            o_data_out_ready <= 1;
                            data_out_state <= DATA_OUT_TX;
                        end
                end
                DATA_OUT_TX: begin
                    o_data_out_ready <= 0;
                    if({out_bit_clock, out_bit_clock_past} == 2'b01)
                        data_out_state <= DATA_OUT_WAIT;
                end

            endcase
        end
    end

`ifdef FORMAL
    reg [3:0] f_clk_counter;
    initial f_clk_counter = 0;

    // ASSUMPTIONS

    initial assume(i_reset);
    initial assume(i_spi_cs_n);
    
    // past valid signal
    reg f_past_valid = 0;
    always @($global_clock)
        f_past_valid <= 1'b1;

    // stop reset from happening after start
    always @($global_clock)
        if(f_past_valid)
            assume(i_reset == 0);

    // fix sys clock
    wire [7:0] f_sys_step = 8'h40;
    reg [7:0] f_sys_counter;
    reg [7:0] f_spi_counter;

    // system clock
    always @($global_clock) begin
        f_sys_counter <= f_sys_counter + f_sys_step;
        assume ( i_clock == f_sys_counter [7]);
    end

    // spi clock
    // allow spi clock to be around 1/4 sys clock
    (* anyconst *) wire [7:0] f_spi_step;
    always @(*)
        assume ((f_spi_step > 8'h05) && (f_spi_step <= 8'h15));

    // spi clock if spi_cs_n
    always @($global_clock) begin
        f_spi_counter <= f_spi_counter + f_spi_step;
        assume ( i_spi_cs_n || i_spi_clk == f_spi_counter [7]);
    end

    // inputs only can change on system clock
    always @($global_clock) 
        if(f_past_valid && !$rose(i_clock)) begin
            assume($stable(i_data_out_valid));
            assume($stable(i_data_out_data));
            assume($stable(i_reset));
        end

    // SPI assumptions
    // mosi is stable as spi clock rises
    always @($global_clock) 
        if(f_past_valid && i_spi_clk) begin
            assume($stable(i_mosi));
        end
    
    // if no clock, no chip select
    always @(*)
        if(!i_spi_clk)
            assume(!i_spi_cs_n);

    // no chip select, no clock
    always @($global_clock)
        if(f_past_valid)
            if($rose(i_spi_cs_n) || $fell(i_spi_cs_n))
                assume($stable(i_spi_clk) && i_spi_clk);

    // controller behaves by keeping valid line high and not changing data until we are ready
    always @(posedge i_clock)
        if(f_past_valid)
            if($past(i_data_out_valid) && $past(!o_data_out_ready))
                assume($stable(i_data_out_data) && i_data_out_valid);

    // ensure chip select is held long enough to be effective
    reg [2:0] chip_select_count = 0;
    always @($global_clock) 
        if(i_spi_cs_n == 1 && chip_select_count < 7)
            chip_select_count <= chip_select_count + 1;
        else if(i_spi_cs_n == 0)
            chip_select_count <= 0;

    always @($global_clock)
        if(f_past_valid)
            if(chip_select_count < 3)
                assume(!$fell(i_spi_cs_n));


    // ASSERTIONS


    // assert everything is zeroed on the reset signal
    always @($global_clock)
        if (f_past_valid)
            if ($past(i_reset) && $rose(i_clock)) begin
                assert(data_out_state == DATA_OUT_WAIT);
                assert(data_in_state == DATA_IN_WAIT);
                assert(o_data_in_start == 0);
            end

    // spi counters are reset on cs_n
    always @($global_clock)
        if (f_past_valid)
            if ($past(i_spi_cs_n) && $stable(i_spi_clk)) begin
                assert(in_bit == 0);
                assert(out_bit == 0);
                assert(first_byte == 1);
            end

    // counters increase
    always @($global_clock) begin
        if (f_past_valid) begin
            if(!i_spi_cs_n && $rose(i_spi_clk))
                assert(in_bit != $past(in_bit));
            if(!i_spi_cs_n && $fell(i_spi_clk))
                assert(out_bit != $past(out_bit));
        end
    end
    
    // state machines: so simple just make sure they stay bounded
    always @($global_clock) begin
        assert(data_out_state < DATA_OUT_ENDSTATE);
        assert(data_in_state < DATA_IN_ENDSTATE);
    end

    // CDC ensure data_out doesn't change while it's being copied to data_out_spi
    always @($global_clock)
        if(f_past_valid)
            if(out_bit == 6 || out_bit == 7)
                assert($stable(data_out));

    // CDC: capturing data from mosi and putting into controller's clock domain
    always @($global_clock) 
        if(f_past_valid)
            if($rose(i_clock) && data_in_state == DATA_IN_READY)
                assert($stable(data_in_spi));

`endif
endmodule
