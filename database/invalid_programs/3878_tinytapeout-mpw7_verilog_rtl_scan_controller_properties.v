// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

always @(*) begin
    if(driver_sel == 2'b00) begin // external driver
        assert(outputs[0]    == scan_clk_in);
        assert(outputs[1]    == scan_data_in);
        assert(scan_clk_out  == inputs[0]);
        assert(scan_data_out == inputs[1]);
        assert(scan_select   == inputs[2]);
        assert(scan_latch_en == inputs[3]);
    end else
    if(driver_sel == 2'b01) begin // la
        assert(la_scan_data_out == scan_data_in);
        assert(scan_clk_out  == la_scan_clk_in);
        assert(scan_data_out == la_scan_data_in);
        assert(scan_select   == la_scan_select);
        assert(scan_latch_en == la_scan_latch_en);
    end else
    if(driver_sel == 2'b10) begin // internal driver
        assert(int_scan_data_out == scan_data_out);
        assert(scan_clk_out  == int_scan_clk_out);
        assert(scan_data_in  == int_scan_data_in);
        assert(scan_clk_in   == int_scan_clk_in);
        assert(scan_select   == int_scan_select);
        assert(scan_latch_en == int_scan_latch_en);
    end
end
