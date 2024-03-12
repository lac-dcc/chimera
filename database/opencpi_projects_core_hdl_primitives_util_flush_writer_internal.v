/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// Simple module to allow for write writing with flushing
// which VHDL cannot do.
module flush_writer_internal(clk, reset, name, valid, flush, close, data);
  parameter nbytes = 1;
  parameter namelength = 100;
  input clk;
  input reset;
  input [0:namelength*8-1]name;
  input valid;
  input flush;
  input close;
  input [nbytes*8-1:0]data;
  reg 	init;
  reg 	closed;
  reg   [31:0]fd;
  localparam i0 = 0;
  localparam i1 = nbytes > 1 ? 1 : nbytes - 1;
  localparam i2 = nbytes > 2 ? 2 : nbytes - 1;
  localparam i3 = nbytes - 1;

  always@(posedge clk)
  begin
    if (reset)
      begin
	init = 0;
	closed = 0;
	fd = 32'hFFFFFFFF;
      end
    else
      if (!init) begin
	  fd = $fopen(name, "wb");
	  $display("Verilog open file for writing with flush: %s", name);
	  if (fd == 0) begin
	    $display("Verilog open failed");
	    $finish;
	  end
	  init = 1;
	end
      else
	if (!closed) begin
	  if (valid)
	    case (nbytes)
	      1: begin
		$fwrite(fd, "%c", data);
	      end
	      2: begin
		$fwrite(fd, "%c%c", data[i0*8+7:i0*8], data[i1*8+7:i1*8]);
	      end
	      4: begin
		$fwrite(fd, "%c%c%c%c", data[i0*8+7:i0*8], data[i1*8+7:i1*8], data[i2*8+7:i2*8],
			data[i3*8+7:i3*8]);
	      end
	      default: begin
		$display("Unsupported data width %u bytes", nbytes);
	      end
	    endcase    
	  if (flush)
	    $fflush(fd);
	  if (close)
	    $fclose(fd);
	end    
end
endmodule  

