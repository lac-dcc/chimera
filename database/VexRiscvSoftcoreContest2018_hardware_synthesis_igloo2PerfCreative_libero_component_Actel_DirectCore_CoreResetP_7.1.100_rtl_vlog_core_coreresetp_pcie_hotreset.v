// ***********************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2013 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreResetP PCIe HotReset Fix.
//				This module is intended for use when an SDIF block has been
//              configured for PCIe. This module provides a PCIe HotReset
//              fix/workaround by tracking the LTSSM state machine inside
//              the SDIF block and asserting the CORE reset input to the
//              block when appropriate.
//
//              It is intended that inclusion/use of this module is
//              selected at a higher level using parameter setting(s).
//
//              LTSSM status information is available on the PRDATA bus
//              from the SDIF block when an APB read is not in progress.
//
//
// SVN Revision Information:
// SVN $Revision: 21127 $
// SVN $Date: 2013-09-17 18:02:47 +0100 (Tue, 17 Sep 2013) $
//
// Notes:
//
// ***********************************************************************/

module coreresetp_pcie_hotreset (
    input               CLK_BASE,
    input               CLK_LTSSM,
    input               psel,
    input               pwrite,
    input        [31:0] prdata,
    input               sdif_core_reset_n_0,
    output  reg         sdif_core_reset_n
    );

    // Parameters for state machine states
    parameter           IDLE            = 2'b00;
    parameter           HOTRESET_DETECT = 2'b01;
    parameter           DETECT_QUIET    = 2'b10;
    parameter           RESET_ASSERT    = 2'b11;

    // LTSSM state values (on prdata[30:26])
    parameter           LTSSM_STATE_HotReset    = 5'b10100;
    parameter           LTSSM_STATE_DetectQuiet = 5'b00000;
    parameter           LTSSM_STATE_Disabled    = 5'b10000;

    reg                 no_apb_read;
    reg          [1:0]  state;
    reg                 hot_reset_n;
    reg          [6:0]  count;

    reg                 core_areset_n;

    reg                 LTSSM_HotReset;
    reg                 LTSSM_DetectQuiet;
    reg                 LTSSM_Disabled;

    reg                 LTSSM_HotReset_q;
    reg                 LTSSM_DetectQuiet_q;
    reg                 LTSSM_Disabled_q;

    reg                 LTSSM_HotReset_entry_p;
    reg                 LTSSM_DetectQuiet_entry_p;
    reg                 LTSSM_Disabled_entry_p;

    reg                 reset_n_q1;
    reg                 reset_n_clk_ltssm;

    reg          [4:0]  ltssm_q1;
    reg          [4:0]  ltssm_q2;
    reg                 psel_q1;
    reg                 psel_q2;
    reg                 pwrite_q1;
    reg                 pwrite_q2;

    reg                 sdif_core_reset_n_q1;

    // Synchronize reset to CLK_LTSSM domain
    always @(posedge CLK_LTSSM or negedge sdif_core_reset_n_0)
    begin
        if (!sdif_core_reset_n_0)
        begin
            reset_n_q1        <= 1'b0;
            reset_n_clk_ltssm <= 1'b0;
        end
        else
        begin
            reset_n_q1        <= 1'b1;
            reset_n_clk_ltssm <= reset_n_q1;
        end
    end

    // Synchronize APB signals to CLK_LTSSM domain
    always @(posedge CLK_LTSSM or negedge reset_n_clk_ltssm)
    begin
        if (!reset_n_clk_ltssm)
        begin
            ltssm_q1  <= 5'b0;
            ltssm_q2  <= 5'b0;
            psel_q1   <= 1'b0;
            psel_q2   <= 1'b0;
            pwrite_q1 <= 1'b0;
            pwrite_q2 <= 1'b0;
        end
        else
        begin
            ltssm_q1  <= prdata[30:26];
            ltssm_q2  <= ltssm_q1;
            psel_q1   <= psel;
            psel_q2   <= psel_q1;
            pwrite_q1 <= pwrite;
            pwrite_q2 <= pwrite_q1;
        end
    end

    always @(*)
    begin
        if ( (psel_q2 == 1'b0) || (pwrite_q2 == 1'b1) )
        begin
            no_apb_read = 1'b1;
        end
        else
        begin
            no_apb_read = 1'b0;
        end
    end

    // Create pulse signals to indicate LTSSM state transitions.
    always @(posedge CLK_LTSSM or negedge reset_n_clk_ltssm)
    begin
        if (!reset_n_clk_ltssm)
        begin
            LTSSM_HotReset      <= 1'b0;
            LTSSM_Disabled      <= 1'b0;
            LTSSM_DetectQuiet   <= 1'b0;

            LTSSM_HotReset_q    <= 1'b0;
            LTSSM_Disabled_q    <= 1'b0;
            LTSSM_DetectQuiet_q <= 1'b0;

            LTSSM_HotReset_entry_p    <= 1'b0;
            LTSSM_Disabled_entry_p    <= 1'b0;
            LTSSM_DetectQuiet_entry_p <= 1'b0;
        end
        else
        begin
            if (no_apb_read)
            begin
                if (ltssm_q2 == LTSSM_STATE_HotReset   ) LTSSM_HotReset    <= 1'b1; else LTSSM_HotReset    <= 1'b0;
                if (ltssm_q2 == LTSSM_STATE_Disabled   ) LTSSM_Disabled    <= 1'b1; else LTSSM_Disabled    <= 1'b0;
                if (ltssm_q2 == LTSSM_STATE_DetectQuiet) LTSSM_DetectQuiet <= 1'b1; else LTSSM_DetectQuiet <= 1'b0;
            end
            else
            begin
                LTSSM_HotReset    <= 1'b0;
                LTSSM_Disabled    <= 1'b0;
                LTSSM_DetectQuiet <= 1'b0;
            end

            LTSSM_HotReset_q          <= LTSSM_HotReset;
            LTSSM_Disabled_q          <= LTSSM_Disabled;
            LTSSM_DetectQuiet_q       <= LTSSM_DetectQuiet;

            LTSSM_HotReset_entry_p    <= !LTSSM_HotReset_q    & LTSSM_HotReset;
            LTSSM_Disabled_entry_p    <= !LTSSM_Disabled_q    & LTSSM_Disabled;
            LTSSM_DetectQuiet_entry_p <= !LTSSM_DetectQuiet_q & LTSSM_DetectQuiet;
        end
    end

    //---------------------------------------------------------------------
    // State machine to control SDIF hot reset.
    // Tracks LTSSM in SDIF and can cause assertion of core reset to SDIF.
    //---------------------------------------------------------------------
    always @(posedge CLK_LTSSM or negedge reset_n_clk_ltssm)
    begin
        if (!reset_n_clk_ltssm)
        begin
            state <= IDLE;
            hot_reset_n <= 1'b1;
        end
        else
        begin
            case (state)
                IDLE:
                begin
                    if (LTSSM_HotReset_entry_p | LTSSM_Disabled_entry_p)
                    begin
                        state <= HOTRESET_DETECT;
                    end
                end
                HOTRESET_DETECT:
                begin
                    if (LTSSM_DetectQuiet_entry_p)
                    begin
                        state <= DETECT_QUIET;
                        hot_reset_n <= 1'b0;
                    end
                end
                DETECT_QUIET:
                begin
                    state <= RESET_ASSERT;
                end
                RESET_ASSERT:
                begin
                    if (count == 7'b1100011)
                    begin
                        state <= IDLE;
                        hot_reset_n <= 1'b1;
                    end
                end
                default:
                begin
                    state <= IDLE;
                    hot_reset_n <= 1'b1;
                end
            endcase
        end
    end

    // Counter used to ensure that the hot_reset_n signal is asserted for
    // a sufficient amount of time.
    always @(posedge CLK_LTSSM or negedge reset_n_clk_ltssm)
    begin
        if (!reset_n_clk_ltssm)
        begin
            count <= 7'b0000000;
        end
        else
        begin
            if (state == DETECT_QUIET)
            begin
                count <= 7'b0000000;
            end
            else
            begin
                if (state == RESET_ASSERT)
                begin
                    count <= count + 1'b1;
                end
            end
        end
    end

    // Async core reset signal
    always @(*)
    begin
        core_areset_n = hot_reset_n && sdif_core_reset_n_0;
    end

    // Create reset signal to SDIF core.
    // (Synchronize core_areset_n signal to CLK_BASE domain.)
    always @(posedge CLK_BASE or negedge core_areset_n)
    begin
        if (!core_areset_n)
        begin
            sdif_core_reset_n_q1 <= 1'b0;
            sdif_core_reset_n    <= 1'b0;
        end
        else
        begin
            sdif_core_reset_n_q1 <= 1'b1;
            sdif_core_reset_n    <= sdif_core_reset_n_q1;
        end
    end

endmodule
