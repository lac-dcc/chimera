// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

    pll_osc u_pll_osc(.clki_i(clki_i),
        .rstn_i(rstn_i),
        .clkop_o(clkop_o),
        .lock_o(lock_o));
