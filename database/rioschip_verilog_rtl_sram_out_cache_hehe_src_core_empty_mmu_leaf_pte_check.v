// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`include "../params.vh"
module leaf_pte_check
    #(
    parameter PTE_SIZE_IN_BIT = 64
)
    (

    input [1:0] access_mode_i,
    input csr_sstatus_mxr_i,
    input csr_sstatus_sum_i,
    input [1:0] priviledge_level_i,
    input [1:0] page_table_level_i,

    input pte_active_i,
    input [PTE_SIZE_IN_BIT - 1 : 0] pte_i,
    input pte_is_leaf_i,

    output pte_valid_o,
    output page_fault_valid_o
);
    reg page_fault_valid;


    initial begin
        page_fault_valid = 0;
    end


    always @(*) begin
        if (pte_active_i && pte_is_leaf_i) begin
            // Step 5: Check access mode
            if ((access_mode_i == ACCESS_MODE_READ)
            && (!pte_i[`pte_r] && !(pte_i[`pte_x] && csr_sstatus_mxr_i)))begin
                page_fault_valid = 1;
                $display("cause : 1");
            end
            else if ((access_mode_i == ACCESS_MODE_WRITE)
            && (!pte_i[`pte_w]))begin
                page_fault_valid = 1;
                $display("cause : 2");
            end
            else if ((access_mode_i == ACCESS_MODE_EXECUTE)
            && (!pte_i[`pte_x]))begin
                page_fault_valid = 1;
                $display("cause : 3");
            end


            // Step 5: Check priviledge level
            else if ((priviledge_level_i == U_MODE) && !pte_i[`pte_u])begin
                page_fault_valid = 1;
                $display("cause : 4");
            end
            else if ((priviledge_level_i == S_MODE) && pte_i[`pte_u] && !csr_sstatus_sum_i)begin
                page_fault_valid = 1;
                $display("cause : 5");
            end

            // Step 6: misaligned superpage check
            else if (((pte_i[`pte_ppn0] != 0) && (page_table_level_i > 0)) ||
            ((pte_i[`pte_ppn1]!= 0) && (page_table_level_i > 1)))begin
                page_fault_valid = 1;
                $display("cause : 6");
            end


            // Step 7: 
            else if (!pte_i[`pte_a] || ((access_mode_i == ACCESS_MODE_WRITE) && !pte_i[`pte_d]))begin
                page_fault_valid = 1;
                $display("cause : 7");
            end
            else
                page_fault_valid = 0;

        end else begin
            page_fault_valid = 0;
        end
    end

    assign pte_valid_o = ~page_fault_valid;
    assign page_fault_valid_o = page_fault_valid;

endmodule : leaf_pte_check
