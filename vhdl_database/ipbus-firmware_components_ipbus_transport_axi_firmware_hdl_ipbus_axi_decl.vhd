---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- ipbus_axi_decl
--
-- Defines records for AXI4 interface
--
-- Tom Williams, April 2018


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ipbus_axi_decl is

	constant AXI4MM_ID_WIDTH: positive := 4;

	type axi4mm_ms is
		record
			aclk: std_logic;
			aresetn: std_logic;

			-- Read address interface
			araddr: std_logic_vector;
			arid: std_logic_vector(AXI4MM_ID_WIDTH - 1 downto 0);
			arlen: std_logic_vector(7 downto 0);
			arsize: std_logic_vector(2 downto 0);
			arprot: std_logic_vector(2 downto 0);
			arvalid: std_logic;
			arlock: std_logic;
			arcache: std_logic_vector(3 downto 0);
			arburst: std_logic_vector(1 downto 0);

			-- Read interface
			rready: std_logic;

			-- Write address interface
			awaddr: std_logic_vector;
			awid: std_logic_vector(AXI4MM_ID_WIDTH - 1 downto 0);
			awlen: std_logic_vector(7 downto 0);
			awsize: std_logic_vector(2 downto 0);
			awburst: std_logic_vector(1 downto 0);
			awprot: std_logic_vector(2 downto 0);
			awvalid: std_logic;
			awlock: std_logic;
			awcache: std_logic_vector(3 downto 0);

			-- Write interface
			wdata: std_logic_vector;
			wlast: std_logic;
			wstrb: std_logic_vector(7 downto 0);
			wvalid: std_logic;

			-- Write response interface
			bready: std_logic;

		end record;

	type axi4mm_sm is
		record
			-- Read address interface
			arready: std_logic;

			-- Read interface
			rdata: std_logic_vector;
			rid: std_logic_vector(AXI4MM_ID_WIDTH - 1 downto 0);
			rresp: std_logic_vector(1 downto 0);
			rlast: std_logic;
			rvalid: std_logic;

			-- Write address interface
			awready: std_logic;

			-- Write interface
			wready: std_logic;

			-- Write response interface
			bvalid: std_logic;
			bresp: std_logic_vector(1 downto 0);
			bid: std_logic_vector(AXI4MM_ID_WIDTH - 1 downto 0);

		end record;


end ipbus_axi_decl;
