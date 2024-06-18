// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_fifo
//
// Description     :
//
// Limitation      :
//
// Results expected:
//
//END_MODULE_NAME--------------------------------------------------------------

`timescale 1 ps / 1 ps

/*verilator lint_off CASEX*/
/*verilator lint_off COMBDLY*/
/*verilator lint_off INITIALDLY*/
/*verilator lint_off LITENDIAN*/
/*verilator lint_off MULTIDRIVEN*/
/*verilator lint_off UNOPTFLAT*/
/*verilator lint_off BLKANDNBLK*/
module lpm_fifo (   data,
                    clock,
                    wrreq,
                    rdreq,
                    aclr,
                    sclr,
                    q,
                    usedw,
                    full,
                    empty );

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;
    parameter lpm_widthu = 1;
    parameter lpm_numwords = 2;
    parameter lpm_showahead = "OFF";
    parameter lpm_type = "lpm_fifo";
    parameter lpm_hint = "";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  clock;
    input  wrreq;
    input  rdreq;
    input  aclr;
    input  sclr;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;
    output [lpm_widthu-1:0] usedw;
    output full;
    output empty;

// INTERNAL REGISTERS DECLARATION
    reg [lpm_width-1:0] mem_data [(1<<lpm_widthu):0];
    reg [lpm_width-1:0] tmp_data;
    reg [lpm_widthu-1:0] count_id;
    reg [lpm_widthu-1:0] read_id;
    reg [lpm_widthu-1:0] write_id;
    reg write_flag;
    reg full_flag;
    reg empty_flag;
    reg [lpm_width-1:0] tmp_q;

    reg [8*5:1] overflow_checking;
    reg [8*5:1] underflow_checking;
    reg [8*20:1] allow_rwcycle_when_full;
    reg [8*20:1] intended_device_family;

// INTERNAL WIRE DECLARATION
    wire valid_rreq;
    wire valid_wreq;

// INTERNAL TRI DECLARATION
    logic aclr; // -- converted tristate to logic

// LOCAL INTEGER DECLARATION
    integer i;

// COMPONENT INSTANTIATIONS
    LPM_DEVICE_FAMILIES dev ();
    LPM_HINT_EVALUATION eva();

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display ("Error! LPM_WIDTH must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end
        if (lpm_numwords <= 1)
        begin
            $display ("Error! LPM_NUMWORDS must be greater than or equal to 2.");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end
        if ((lpm_widthu !=1) && (lpm_numwords > (1 << lpm_widthu)))
        begin
            $display ("Error! LPM_NUMWORDS must equal to the ceiling of log2(LPM_WIDTHU).");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end
        if (lpm_numwords <= (1 << (lpm_widthu - 1)))
        begin
            $display ("Error! LPM_WIDTHU is too big for the specified LPM_NUMWORDS.");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        overflow_checking = eva.GET_PARAMETER_VALUE(lpm_hint, "OVERFLOW_CHECKING");
        if(overflow_checking == "")
            overflow_checking = "ON";
        else if ((overflow_checking != "ON") && (overflow_checking != "OFF"))
        begin
            $display ("Error! OVERFLOW_CHECKING must equal to either 'ON' or 'OFF'");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        underflow_checking = eva.GET_PARAMETER_VALUE(lpm_hint, "UNDERFLOW_CHECKING");
        if(underflow_checking == "")
            underflow_checking = "ON";
        else if ((underflow_checking != "ON") && (underflow_checking != "OFF"))
        begin
            $display ("Error! UNDERFLOW_CHECKING must equal to either 'ON' or 'OFF'");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        allow_rwcycle_when_full = eva.GET_PARAMETER_VALUE(lpm_hint, "ALLOW_RWCYCLE_WHEN_FULL");
        if (allow_rwcycle_when_full == "")
            allow_rwcycle_when_full = "OFF";
        else if ((allow_rwcycle_when_full != "ON") && (allow_rwcycle_when_full != "OFF"))
        begin
            $display ("Error! ALLOW_RWCYCLE_WHEN_FULL must equal to either 'ON' or 'OFF'");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        intended_device_family = eva.GET_PARAMETER_VALUE(lpm_hint, "INTENDED_DEVICE_FAMILY");
        if (intended_device_family == "")
            intended_device_family = "Stratix II";
        else if (dev.IS_VALID_FAMILY(intended_device_family) == 0)
        begin
            $display ("Error! Unknown INTENDED_DEVICE_FAMILY=%s.", intended_device_family);
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end
        for (i = 0; i < (1<<lpm_widthu); i = i + 1)
        begin
            if (dev.FEATURE_FAMILY_BASE_STRATIX(intended_device_family) ||
                dev.FEATURE_FAMILY_BASE_CYCLONE(intended_device_family))
                mem_data[i] <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
            else
                mem_data[i] <= {lpm_width{1'b0}};
        end

        tmp_data <= 0;
        if (dev.FEATURE_FAMILY_BASE_STRATIX(intended_device_family) ||
            dev.FEATURE_FAMILY_BASE_CYCLONE(intended_device_family))
            tmp_q <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        else
            tmp_q <= {lpm_width{1'b0}};
        write_flag <= 1'b0;
        count_id <= 0;
        read_id <= 0;
        write_id <= 0;
        full_flag <= 1'b0;
        empty_flag <= 1'b1;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(posedge clock or posedge aclr)
    begin
        if (aclr)
        begin
            if (!(dev.FEATURE_FAMILY_BASE_STRATIX(intended_device_family) ||
                dev.FEATURE_FAMILY_BASE_CYCLONE(intended_device_family)))
            begin
                if (lpm_showahead == "ON")
                    tmp_q <= mem_data[0];
                else
                    tmp_q <= {lpm_width{1'b0}};
            end

            read_id <= 0;
            count_id <= 0;
            full_flag <= 1'b0;
            empty_flag <= 1'b1;

            if (valid_wreq && (dev.FEATURE_FAMILY_BASE_STRATIX(intended_device_family) ||
                dev.FEATURE_FAMILY_BASE_CYCLONE(intended_device_family)))
            begin
                tmp_data <= data;
                write_flag <= 1'b1;
            end
            else
                write_id <= 0;
        end
        else if (sclr)
        begin
            if ((lpm_showahead == "ON") || (dev.FEATURE_FAMILY_BASE_STRATIX(intended_device_family) ||
                dev.FEATURE_FAMILY_BASE_CYCLONE(intended_device_family)))
                tmp_q <= mem_data[0];
            else
                tmp_q <= mem_data[read_id];
            read_id <= 0;
            count_id <= 0;
            full_flag <= 1'b0;
            empty_flag <= 1'b1;

            if (valid_wreq)
            begin
                tmp_data <= data;
                write_flag <= 1'b1;
            end
            else
                write_id <= 0;
        end
        else
        begin
            // Both WRITE and READ operations
            if (valid_wreq && valid_rreq)
            begin
                tmp_data <= data;
                write_flag <= 1'b1;
                empty_flag <= 1'b0;
                if (allow_rwcycle_when_full == "OFF")
                begin
                    full_flag <= 1'b0;
                end

                if (read_id >= ((1 << lpm_widthu) - 1))
                begin
                    if (lpm_showahead == "ON")
                        tmp_q <= mem_data[0];
                    else
                        tmp_q <= mem_data[read_id];
                    read_id <= 0;
                end
                else
                begin
                    if (lpm_showahead == "ON")
                        tmp_q <= mem_data[read_id + 1];
                    else
                        tmp_q <= mem_data[read_id];
                    read_id <= read_id + 1;
                end
            end
            // WRITE operation only
            else if (valid_wreq)
            begin
                tmp_data <= data;
                empty_flag <= 1'b0;
                write_flag <= 1'b1;

                if (count_id >= (1 << lpm_widthu) - 1)
                    count_id <= 0;
                else
                    count_id <= count_id + 1;

                if ((count_id == lpm_numwords - 1) && (empty_flag == 1'b0))
                    full_flag <= 1'b1;

                if (lpm_showahead == "ON")
                    tmp_q <= mem_data[read_id];
            end
            // READ operation only
            else if (valid_rreq)
            begin
                full_flag <= 1'b0;

                if (count_id <= 0)
                    count_id <= {lpm_widthu{1'b1}};
                else
                    count_id <= count_id - 1;

                if ((count_id == 1) && (full_flag == 1'b0))
                    empty_flag <= 1'b1;

                if (read_id >= ((1<<lpm_widthu) - 1))
                begin
                    if (lpm_showahead == "ON")
                        tmp_q <= mem_data[0];
                    else
                        tmp_q <= mem_data[read_id];
                    read_id <= 0;
                end
                else
                begin
                    if (lpm_showahead == "ON")
                        tmp_q <= mem_data[read_id + 1];
                    else
                        tmp_q <= mem_data[read_id];
                    read_id <= read_id + 1;
                end
            end // if Both WRITE and READ operations

        end // if aclr
    end // @(posedge clock)

    always @(negedge clock)
    begin
        if (write_flag)
        begin
            write_flag <= 1'b0;
            mem_data[write_id] <= tmp_data;

            if (sclr || aclr || (write_id >= ((1 << lpm_widthu) - 1)))
                write_id <= 0;
            else
                write_id <= write_id + 1;
        end

        if ((lpm_showahead == "ON") && ($time > 0))
            tmp_q <= ((write_flag == 1'b1) && (write_id == read_id)) ?
                        tmp_data : mem_data[read_id];

    end // @(negedge clock)

// CONTINOUS ASSIGNMENT
    assign valid_rreq = (underflow_checking == "OFF") ? rdreq : rdreq && ~empty_flag;
    assign valid_wreq = (overflow_checking == "OFF") ? wrreq :
                        (allow_rwcycle_when_full == "ON") ? wrreq && (!full_flag || rdreq) :
                        wrreq && !full_flag;
    assign q = tmp_q;
    assign full = full_flag;
    assign empty = empty_flag;
    assign usedw = count_id;

endmodule // lpm_fifo

