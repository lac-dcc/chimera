module pll_main(
    input clock,
    input reset,
    input [7:0] data, 

    output clock_out,
    output clock_out_video,
    output locked
);
    wire pll_areset;
    wire pll_scanclk;
    wire pll_scandata;
    wire pll_scanclkena;
    wire pll_configupdate;
    wire pll_locked;
    wire pll_scandataout;
    wire pll_scandone;

    wire pll_reconfig;
    wire pll_reconf_busy;
    wire pll_write_from_rom;
    wire pll_rom_data_in;
    wire [7:0] pll_rom_address_out;
    wire pll_write_rom_ena;
    wire pll_lockloss;

    edge_detect pll_lockloss_check(
        .async_sig(~pll_locked),
        .clk(clock),
        .rise(pll_lockloss)
    );

    pll pll (
        .inclk0(clock),
        .c0(clock_out),
        .c1(clock_out_video),
        .locked(pll_locked),

        .areset(pll_areset),
        .scanclk(pll_scanclk),
        .scandata(pll_scandata),
        .scanclkena(pll_scanclkena),
        .configupdate(pll_configupdate),
        .scandataout(pll_scandataout),
        .scandone(pll_scandone)
    );

    pll_reconf pll_reconf(
        .clock(clock),
        .reconfig(pll_reconfig),
        .busy(pll_reconf_busy),
        .data_in(9'b0),
        .counter_type(4'b0),
        .counter_param(3'b0),

        .pll_areset_in(reset || pll_lockloss),

        .pll_scandataout(pll_scandataout),
        .pll_scandone(pll_scandone),
        .pll_areset(pll_areset),
        .pll_configupdate(pll_configupdate),
        .pll_scanclk(pll_scanclk),
        .pll_scanclkena(pll_scanclkena),
        .pll_scandata(pll_scandata),

        .write_from_rom(pll_write_from_rom),
        .rom_data_in(pll_rom_data_in),
        .rom_address_out(pll_rom_address_out),
        .write_rom_ena(pll_write_rom_ena)
    );

    pll_reconf_rom reconf_rom(
        .clock(clock),
        .address(pll_rom_address_out),
        .read_ena(pll_write_rom_ena),
        .data(data),
        .q(pll_rom_data_in),
        .reconfig(pll_reconfig),
        .trigger_read(pll_write_from_rom),
        .pll_reconf_busy(pll_reconf_busy)
    );

    assign locked = pll_locked;

endmodule