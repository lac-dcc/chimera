// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

`ifndef __REGISTERS__
`define __REGISTERS__

//write registers
`define reg_bpio_oe wreg[6'h00][BP_PINS-1:0]
`define reg_bpio_od wreg[6'h00][BP_PINS-1+8:8]
`define reg_bpio_hl wreg[6'h01][BP_PINS-1:0]
`define reg_bpio_dir wreg[6'h01][BP_PINS-1+8:8]

`define reg_la_write wreg[6'h02]

`define reg_la_config wreg[6'h03]
`define reg_la_io_quad wreg[6'h03][0]
`define reg_la_io_quad_direction wreg[6'h03][1]
`define reg_la_io_spi wreg[6'h03][2]
`define reg_la_clear_sample_counter wreg[6'h03][3]
`define reg_la_start wreg[6'h03][4]
`define reg_la_active wreg[6'h03][5]
`define reg_la_max_samples_reached wreg[6'h03][6]
`define reg_bpsm_reset wreg[6'h03][7]

`define reg_la_io_cs0 wreg[6'h03][8] //reserve upper bits for more SRAMs
`define reg_la_io_cs1 wreg[6'h03][9]

//`define reg_la_sample_count wreg[6'h04]

`define reg_pwm_on wreg[6'h05]
`define reg_pwm_off wreg[6'h06]

`define reg_fifo_in wreg[6'h07]
`define reg_fifo_in_shift wreg[6'h08][0]
`define reg_fifo_out_pop wreg[6'h08][1]
`define reg_fifo_in_test wreg[6'h09]

`define reg_adc_en wreg[6'h0A][0]
`define reg_adc_s wreg[6'h0A][4:1]

//read registers
`define reg_la_read rreg[6'h02]
//`define reg_la_config wreg[6'h03]
`define reg_la_sample_count rreg[6'h04]
`define reg_fifo_out rreg[6'h07]
`define reg_fifo_status rreg[6'h08]
`define reg_fifo_status_full rreg[6'h08][0]
`define reg_fifo_status_nempty rreg[6'h08][1]
`define reg_fifo_status_out_nempty rreg[6'h08][2]


`endif
