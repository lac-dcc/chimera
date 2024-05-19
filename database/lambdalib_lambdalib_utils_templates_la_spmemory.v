// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: Single Port {{ type }}
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 * This is a wrapper for selecting from a set of hardened memory macros.
 *
 * A synthesizable reference model is used when the TYPE is DEFAULT. The
 * synthesizable model does not implement the cfg and test interface and should
 * only be used for basic testing and for synthesizing for FPGA devices.
 * Advanced ASIC development should rely on complete functional models
 * supplied on a per macro basis.
 *
 * Technologoy specific implementations of "la_sp{{ type }}" would generally include
 * one ore more hardcoded instantiations of {{ type }} modules with a generate
 * statement relying on the "TYPE" to select between the list of modules
 * at build time.
 *
 ****************************************************************************/

module la_sp{{ type }}
  #(parameter DW     = 32,          // Memory width
    parameter AW     = 10,          // Address width (derived)
    parameter TYPE   = "DEFAULT",   // Pass through variable for hard macro
    parameter CTRLW  = 128,         // Width of asic ctrl interface
    parameter TESTW  = 128          // Width of asic test interface
    )
   (// Memory interface
    input clk, // write clock
    input ce, // chip enable
    input we, // write enable
    input [DW-1:0] wmask, //per bit write mask
    input [AW-1:0] addr, //write address
    input [DW-1:0] din, //write data
    output [DW-1:0] dout, //read output data
    // Power signals
    input vss, // ground signal
    input vdd, // memory core array power
    input vddio, // periphery/io power
    // Generic interfaces
    input [CTRLW-1:0] ctrl, // pass through ASIC control interface
    input [TESTW-1:0] test // pass through ASIC test interface
    );

    // Determine which memory to select
    localparam MEM_TYPE = (TYPE != "DEFAULT") ? TYPE :{% for aw, dw_select in selection_table.items() %}
      {% if loop.nextitem is defined %}(AW {% if loop.previtem is defined %}=={% else %}>={% endif %} {{ aw }}) ? {% endif %}{% for dw, memory in dw_select.items() %}{% if loop.nextitem is defined %}(DW {% if loop.previtem is defined %}=={% else %}>={% endif %} {{dw}}) ? {% endif %}"{{ memory}}"{% if loop.nextitem is defined %} : {% endif%}{% endfor %}{% if loop.nextitem is defined %} :{% else %};{% endif %}{% endfor %}

    localparam MEM_WIDTH = {% for memory, width in width_table %}
      (MEM_TYPE == "{{ memory }}") ? {{ width }} :{% endfor %}
      0;
 
    localparam MEM_DEPTH = {% for memory, depth in depth_table %}
      (MEM_TYPE == "{{ memory }}") ? {{ depth }} :{% endfor %}
      0;

    // Create memories
    localparam MEM_ADDRS = 2**(AW - MEM_DEPTH) < 1 ? 1 : 2**(AW - MEM_DEPTH);

    {% if control_signals %}// Control signals{% for line in control_signals %}
    {{ line }}{% endfor %}{% endif %}

    generate
      genvar o;
      for (o = 0; o < DW; o = o + 1) begin: OUTPUTS
        wire [MEM_ADDRS-1:0] mem_outputs;
        assign dout[o] = |mem_outputs;
      end

      genvar a;
      for (a = 0; a < MEM_ADDRS; a = a + 1) begin: ADDR
        wire selected;
        wire [MEM_DEPTH-1:0] mem_addr;

        if (MEM_ADDRS == 1) begin: FITS
          assign selected = 1'b1;
          assign mem_addr = addr;
        end else begin: NOFITS
          assign selected = addr[AW-1:MEM_DEPTH] == a;
          assign mem_addr = addr[MEM_DEPTH-1:0];
        end

        genvar n;
        for (n = 0; n < DW; n = n + MEM_WIDTH) begin: WORD
          wire [MEM_WIDTH-1:0] mem_din;
          wire [MEM_WIDTH-1:0] mem_dout;
          wire [MEM_WIDTH-1:0] mem_wmask;

          genvar i;
          for (i = 0; i < MEM_WIDTH; i = i + 1) begin: WORD_SELECT
            if (n + i < DW) begin: ACTIVE
              assign mem_din[i] = din[n + i];
              assign mem_wmask[i] = wmask[n + i];
              assign OUTPUTS[n + i].mem_outputs[a] = selected ? mem_dout[i] : 1'b0;
            end
            else begin: INACTIVE
              assign mem_din[i] = 1'b0;
              assign mem_wmask[i] = 1'b0;
            end
          end

          wire ce_in;
          wire we_in;
          assign ce_in = ce && selected;
          assign we_in = we && selected;
          {% for memory, inst_name in inst_map.items() %}
          {% if loop.previtem is defined %}else {% endif %}if (MEM_TYPE == "{{ memory }}")
            {{ inst_name }} memory ({% for port, net in port_mapping[memory] %}
              .{{ port }}({{ net }}){% if loop.nextitem is defined %},{% endif %}{% endfor %}
            );{% endfor %}
        end
      end
    endgenerate
endmodule
