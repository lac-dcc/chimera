// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module lpm_rom0 (
        address,
        q);

        input   [9:0]  address;
        output  [7:0]  q;

        wire [7:0] sub_wire0;
        wire [7:0] q = sub_wire0[7:0];

        lpm_rom lpm_rom_component (
                                .address (address),
                                .q (sub_wire0),
                                .inclock (1'b1),
                                .memenab (1'b1),
                                .outclock (1'b1));
        defparam
                lpm_rom_component.intended_device_family = "ACEX1K",
                lpm_rom_component.lpm_address_control = "UNREGISTERED",
                lpm_rom_component.lpm_file = "ZX_FONT.HEX",
                lpm_rom_component.lpm_outdata = "UNREGISTERED",
                lpm_rom_component.lpm_type = "LPM_ROM",
                lpm_rom_component.lpm_width = 8,
                lpm_rom_component.lpm_widthad = 10;


endmodule
