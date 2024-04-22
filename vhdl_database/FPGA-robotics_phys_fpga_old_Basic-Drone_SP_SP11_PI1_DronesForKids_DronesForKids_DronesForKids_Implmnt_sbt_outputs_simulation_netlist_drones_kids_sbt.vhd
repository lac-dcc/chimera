-- ******************************************************************************

-- iCEcube Netlister

-- Version:            2017.08.27940

-- Build Date:         Sep 11 2017 17:29:57

-- File Generated:     Mar 8 2019 19:59:30

-- Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

-- Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

-- ******************************************************************************

-- VHDL file for cell "drones_kids" view "INTERFACE"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library ice;
use ice.vcomponent_vital.all;

-- Entity of drones_kids
entity drones_kids is
port (
    source_data : out std_logic_vector(2 downto 0);
    s1 : in std_logic;
    reset_system : in std_logic;
    sdin : in std_logic;
    ppm_output : out std_logic;
    debug : out std_logic;
    data_debug : out std_logic;
    source_data_rdy : out std_logic;
    led : out std_logic;
    clk_system : in std_logic);
end drones_kids;

-- Architecture of drones_kids
-- View name is \INTERFACE\
architecture \INTERFACE\ of drones_kids is

signal \N__6380\ : std_logic;
signal \N__6379\ : std_logic;
signal \N__6378\ : std_logic;
signal \N__6369\ : std_logic;
signal \N__6368\ : std_logic;
signal \N__6367\ : std_logic;
signal \N__6360\ : std_logic;
signal \N__6359\ : std_logic;
signal \N__6358\ : std_logic;
signal \N__6351\ : std_logic;
signal \N__6350\ : std_logic;
signal \N__6349\ : std_logic;
signal \N__6342\ : std_logic;
signal \N__6341\ : std_logic;
signal \N__6340\ : std_logic;
signal \N__6333\ : std_logic;
signal \N__6332\ : std_logic;
signal \N__6331\ : std_logic;
signal \N__6324\ : std_logic;
signal \N__6323\ : std_logic;
signal \N__6322\ : std_logic;
signal \N__6315\ : std_logic;
signal \N__6314\ : std_logic;
signal \N__6313\ : std_logic;
signal \N__6306\ : std_logic;
signal \N__6305\ : std_logic;
signal \N__6304\ : std_logic;
signal \N__6297\ : std_logic;
signal \N__6296\ : std_logic;
signal \N__6295\ : std_logic;
signal \N__6288\ : std_logic;
signal \N__6287\ : std_logic;
signal \N__6286\ : std_logic;
signal \N__6279\ : std_logic;
signal \N__6278\ : std_logic;
signal \N__6277\ : std_logic;
signal \N__6260\ : std_logic;
signal \N__6259\ : std_logic;
signal \N__6258\ : std_logic;
signal \N__6257\ : std_logic;
signal \N__6252\ : std_logic;
signal \N__6247\ : std_logic;
signal \N__6242\ : std_logic;
signal \N__6241\ : std_logic;
signal \N__6240\ : std_logic;
signal \N__6237\ : std_logic;
signal \N__6236\ : std_logic;
signal \N__6233\ : std_logic;
signal \N__6226\ : std_logic;
signal \N__6221\ : std_logic;
signal \N__6218\ : std_logic;
signal \N__6215\ : std_logic;
signal \N__6212\ : std_logic;
signal \N__6209\ : std_logic;
signal \N__6208\ : std_logic;
signal \N__6205\ : std_logic;
signal \N__6202\ : std_logic;
signal \N__6199\ : std_logic;
signal \N__6196\ : std_logic;
signal \N__6191\ : std_logic;
signal \N__6188\ : std_logic;
signal \N__6187\ : std_logic;
signal \N__6186\ : std_logic;
signal \N__6183\ : std_logic;
signal \N__6182\ : std_logic;
signal \N__6179\ : std_logic;
signal \N__6178\ : std_logic;
signal \N__6175\ : std_logic;
signal \N__6170\ : std_logic;
signal \N__6165\ : std_logic;
signal \N__6158\ : std_logic;
signal \N__6155\ : std_logic;
signal \N__6152\ : std_logic;
signal \N__6151\ : std_logic;
signal \N__6148\ : std_logic;
signal \N__6145\ : std_logic;
signal \N__6140\ : std_logic;
signal \N__6139\ : std_logic;
signal \N__6134\ : std_logic;
signal \N__6131\ : std_logic;
signal \N__6130\ : std_logic;
signal \N__6127\ : std_logic;
signal \N__6124\ : std_logic;
signal \N__6119\ : std_logic;
signal \N__6116\ : std_logic;
signal \N__6115\ : std_logic;
signal \N__6110\ : std_logic;
signal \N__6107\ : std_logic;
signal \N__6104\ : std_logic;
signal \N__6101\ : std_logic;
signal \N__6098\ : std_logic;
signal \N__6095\ : std_logic;
signal \N__6094\ : std_logic;
signal \N__6093\ : std_logic;
signal \N__6086\ : std_logic;
signal \N__6083\ : std_logic;
signal \N__6082\ : std_logic;
signal \N__6081\ : std_logic;
signal \N__6080\ : std_logic;
signal \N__6079\ : std_logic;
signal \N__6078\ : std_logic;
signal \N__6073\ : std_logic;
signal \N__6070\ : std_logic;
signal \N__6065\ : std_logic;
signal \N__6062\ : std_logic;
signal \N__6053\ : std_logic;
signal \N__6050\ : std_logic;
signal \N__6049\ : std_logic;
signal \N__6048\ : std_logic;
signal \N__6047\ : std_logic;
signal \N__6046\ : std_logic;
signal \N__6043\ : std_logic;
signal \N__6034\ : std_logic;
signal \N__6031\ : std_logic;
signal \N__6028\ : std_logic;
signal \N__6025\ : std_logic;
signal \N__6022\ : std_logic;
signal \N__6017\ : std_logic;
signal \N__6014\ : std_logic;
signal \N__6013\ : std_logic;
signal \N__6008\ : std_logic;
signal \N__6005\ : std_logic;
signal \N__6002\ : std_logic;
signal \N__5999\ : std_logic;
signal \N__5998\ : std_logic;
signal \N__5995\ : std_logic;
signal \N__5992\ : std_logic;
signal \N__5987\ : std_logic;
signal \N__5986\ : std_logic;
signal \N__5985\ : std_logic;
signal \N__5984\ : std_logic;
signal \N__5983\ : std_logic;
signal \N__5982\ : std_logic;
signal \N__5981\ : std_logic;
signal \N__5980\ : std_logic;
signal \N__5979\ : std_logic;
signal \N__5978\ : std_logic;
signal \N__5977\ : std_logic;
signal \N__5976\ : std_logic;
signal \N__5975\ : std_logic;
signal \N__5974\ : std_logic;
signal \N__5973\ : std_logic;
signal \N__5972\ : std_logic;
signal \N__5971\ : std_logic;
signal \N__5970\ : std_logic;
signal \N__5969\ : std_logic;
signal \N__5968\ : std_logic;
signal \N__5967\ : std_logic;
signal \N__5966\ : std_logic;
signal \N__5965\ : std_logic;
signal \N__5964\ : std_logic;
signal \N__5963\ : std_logic;
signal \N__5962\ : std_logic;
signal \N__5961\ : std_logic;
signal \N__5960\ : std_logic;
signal \N__5959\ : std_logic;
signal \N__5900\ : std_logic;
signal \N__5897\ : std_logic;
signal \N__5894\ : std_logic;
signal \N__5891\ : std_logic;
signal \N__5888\ : std_logic;
signal \N__5887\ : std_logic;
signal \N__5884\ : std_logic;
signal \N__5881\ : std_logic;
signal \N__5876\ : std_logic;
signal \N__5875\ : std_logic;
signal \N__5872\ : std_logic;
signal \N__5871\ : std_logic;
signal \N__5870\ : std_logic;
signal \N__5869\ : std_logic;
signal \N__5868\ : std_logic;
signal \N__5861\ : std_logic;
signal \N__5854\ : std_logic;
signal \N__5851\ : std_logic;
signal \N__5850\ : std_logic;
signal \N__5847\ : std_logic;
signal \N__5844\ : std_logic;
signal \N__5841\ : std_logic;
signal \N__5834\ : std_logic;
signal \N__5831\ : std_logic;
signal \N__5830\ : std_logic;
signal \N__5825\ : std_logic;
signal \N__5824\ : std_logic;
signal \N__5821\ : std_logic;
signal \N__5818\ : std_logic;
signal \N__5813\ : std_logic;
signal \N__5810\ : std_logic;
signal \N__5807\ : std_logic;
signal \N__5804\ : std_logic;
signal \N__5803\ : std_logic;
signal \N__5802\ : std_logic;
signal \N__5797\ : std_logic;
signal \N__5794\ : std_logic;
signal \N__5789\ : std_logic;
signal \N__5788\ : std_logic;
signal \N__5787\ : std_logic;
signal \N__5784\ : std_logic;
signal \N__5779\ : std_logic;
signal \N__5776\ : std_logic;
signal \N__5771\ : std_logic;
signal \N__5770\ : std_logic;
signal \N__5769\ : std_logic;
signal \N__5766\ : std_logic;
signal \N__5765\ : std_logic;
signal \N__5764\ : std_logic;
signal \N__5763\ : std_logic;
signal \N__5762\ : std_logic;
signal \N__5761\ : std_logic;
signal \N__5760\ : std_logic;
signal \N__5759\ : std_logic;
signal \N__5758\ : std_logic;
signal \N__5753\ : std_logic;
signal \N__5750\ : std_logic;
signal \N__5743\ : std_logic;
signal \N__5738\ : std_logic;
signal \N__5731\ : std_logic;
signal \N__5728\ : std_logic;
signal \N__5717\ : std_logic;
signal \N__5716\ : std_logic;
signal \N__5713\ : std_logic;
signal \N__5712\ : std_logic;
signal \N__5711\ : std_logic;
signal \N__5710\ : std_logic;
signal \N__5709\ : std_logic;
signal \N__5708\ : std_logic;
signal \N__5707\ : std_logic;
signal \N__5704\ : std_logic;
signal \N__5701\ : std_logic;
signal \N__5698\ : std_logic;
signal \N__5687\ : std_logic;
signal \N__5678\ : std_logic;
signal \N__5675\ : std_logic;
signal \N__5672\ : std_logic;
signal \N__5671\ : std_logic;
signal \N__5670\ : std_logic;
signal \N__5669\ : std_logic;
signal \N__5664\ : std_logic;
signal \N__5659\ : std_logic;
signal \N__5654\ : std_logic;
signal \N__5653\ : std_logic;
signal \N__5652\ : std_logic;
signal \N__5651\ : std_logic;
signal \N__5650\ : std_logic;
signal \N__5645\ : std_logic;
signal \N__5638\ : std_logic;
signal \N__5633\ : std_logic;
signal \N__5632\ : std_logic;
signal \N__5629\ : std_logic;
signal \N__5624\ : std_logic;
signal \N__5621\ : std_logic;
signal \N__5618\ : std_logic;
signal \N__5615\ : std_logic;
signal \N__5614\ : std_logic;
signal \N__5609\ : std_logic;
signal \N__5606\ : std_logic;
signal \N__5603\ : std_logic;
signal \N__5600\ : std_logic;
signal \N__5599\ : std_logic;
signal \N__5598\ : std_logic;
signal \N__5591\ : std_logic;
signal \N__5588\ : std_logic;
signal \N__5585\ : std_logic;
signal \N__5584\ : std_logic;
signal \N__5581\ : std_logic;
signal \N__5578\ : std_logic;
signal \N__5575\ : std_logic;
signal \N__5572\ : std_logic;
signal \N__5569\ : std_logic;
signal \N__5566\ : std_logic;
signal \N__5561\ : std_logic;
signal \N__5558\ : std_logic;
signal \N__5557\ : std_logic;
signal \N__5556\ : std_logic;
signal \N__5555\ : std_logic;
signal \N__5546\ : std_logic;
signal \N__5543\ : std_logic;
signal \N__5540\ : std_logic;
signal \N__5539\ : std_logic;
signal \N__5536\ : std_logic;
signal \N__5533\ : std_logic;
signal \N__5530\ : std_logic;
signal \N__5525\ : std_logic;
signal \N__5522\ : std_logic;
signal \N__5519\ : std_logic;
signal \N__5518\ : std_logic;
signal \N__5517\ : std_logic;
signal \N__5516\ : std_logic;
signal \N__5513\ : std_logic;
signal \N__5510\ : std_logic;
signal \N__5505\ : std_logic;
signal \N__5502\ : std_logic;
signal \N__5495\ : std_logic;
signal \N__5492\ : std_logic;
signal \N__5491\ : std_logic;
signal \N__5488\ : std_logic;
signal \N__5485\ : std_logic;
signal \N__5484\ : std_logic;
signal \N__5483\ : std_logic;
signal \N__5478\ : std_logic;
signal \N__5473\ : std_logic;
signal \N__5468\ : std_logic;
signal \N__5465\ : std_logic;
signal \N__5462\ : std_logic;
signal \N__5461\ : std_logic;
signal \N__5458\ : std_logic;
signal \N__5455\ : std_logic;
signal \N__5450\ : std_logic;
signal \N__5447\ : std_logic;
signal \N__5444\ : std_logic;
signal \N__5441\ : std_logic;
signal \N__5438\ : std_logic;
signal \N__5435\ : std_logic;
signal \N__5432\ : std_logic;
signal \N__5431\ : std_logic;
signal \N__5428\ : std_logic;
signal \N__5425\ : std_logic;
signal \N__5422\ : std_logic;
signal \N__5419\ : std_logic;
signal \N__5414\ : std_logic;
signal \N__5413\ : std_logic;
signal \N__5412\ : std_logic;
signal \N__5411\ : std_logic;
signal \N__5410\ : std_logic;
signal \N__5409\ : std_logic;
signal \N__5408\ : std_logic;
signal \N__5407\ : std_logic;
signal \N__5406\ : std_logic;
signal \N__5405\ : std_logic;
signal \N__5404\ : std_logic;
signal \N__5403\ : std_logic;
signal \N__5402\ : std_logic;
signal \N__5401\ : std_logic;
signal \N__5396\ : std_logic;
signal \N__5391\ : std_logic;
signal \N__5382\ : std_logic;
signal \N__5379\ : std_logic;
signal \N__5368\ : std_logic;
signal \N__5367\ : std_logic;
signal \N__5366\ : std_logic;
signal \N__5363\ : std_logic;
signal \N__5358\ : std_logic;
signal \N__5353\ : std_logic;
signal \N__5348\ : std_logic;
signal \N__5347\ : std_logic;
signal \N__5344\ : std_logic;
signal \N__5341\ : std_logic;
signal \N__5336\ : std_logic;
signal \N__5333\ : std_logic;
signal \N__5324\ : std_logic;
signal \N__5321\ : std_logic;
signal \N__5318\ : std_logic;
signal \N__5317\ : std_logic;
signal \N__5316\ : std_logic;
signal \N__5315\ : std_logic;
signal \N__5314\ : std_logic;
signal \N__5313\ : std_logic;
signal \N__5312\ : std_logic;
signal \N__5311\ : std_logic;
signal \N__5310\ : std_logic;
signal \N__5291\ : std_logic;
signal \N__5288\ : std_logic;
signal \N__5285\ : std_logic;
signal \N__5284\ : std_logic;
signal \N__5283\ : std_logic;
signal \N__5280\ : std_logic;
signal \N__5277\ : std_logic;
signal \N__5274\ : std_logic;
signal \N__5271\ : std_logic;
signal \N__5264\ : std_logic;
signal \N__5263\ : std_logic;
signal \N__5262\ : std_logic;
signal \N__5259\ : std_logic;
signal \N__5256\ : std_logic;
signal \N__5253\ : std_logic;
signal \N__5246\ : std_logic;
signal \N__5243\ : std_logic;
signal \N__5242\ : std_logic;
signal \N__5239\ : std_logic;
signal \N__5238\ : std_logic;
signal \N__5235\ : std_logic;
signal \N__5232\ : std_logic;
signal \N__5229\ : std_logic;
signal \N__5222\ : std_logic;
signal \N__5221\ : std_logic;
signal \N__5220\ : std_logic;
signal \N__5217\ : std_logic;
signal \N__5214\ : std_logic;
signal \N__5211\ : std_logic;
signal \N__5208\ : std_logic;
signal \N__5201\ : std_logic;
signal \N__5198\ : std_logic;
signal \N__5195\ : std_logic;
signal \N__5192\ : std_logic;
signal \N__5189\ : std_logic;
signal \N__5188\ : std_logic;
signal \N__5187\ : std_logic;
signal \N__5184\ : std_logic;
signal \N__5181\ : std_logic;
signal \N__5178\ : std_logic;
signal \N__5175\ : std_logic;
signal \N__5168\ : std_logic;
signal \N__5167\ : std_logic;
signal \N__5166\ : std_logic;
signal \N__5163\ : std_logic;
signal \N__5160\ : std_logic;
signal \N__5157\ : std_logic;
signal \N__5150\ : std_logic;
signal \N__5147\ : std_logic;
signal \N__5144\ : std_logic;
signal \N__5141\ : std_logic;
signal \N__5138\ : std_logic;
signal \N__5137\ : std_logic;
signal \N__5136\ : std_logic;
signal \N__5133\ : std_logic;
signal \N__5130\ : std_logic;
signal \N__5127\ : std_logic;
signal \N__5124\ : std_logic;
signal \N__5117\ : std_logic;
signal \N__5116\ : std_logic;
signal \N__5115\ : std_logic;
signal \N__5112\ : std_logic;
signal \N__5109\ : std_logic;
signal \N__5106\ : std_logic;
signal \N__5099\ : std_logic;
signal \N__5098\ : std_logic;
signal \N__5097\ : std_logic;
signal \N__5094\ : std_logic;
signal \N__5091\ : std_logic;
signal \N__5088\ : std_logic;
signal \N__5085\ : std_logic;
signal \N__5082\ : std_logic;
signal \N__5075\ : std_logic;
signal \N__5074\ : std_logic;
signal \N__5073\ : std_logic;
signal \N__5070\ : std_logic;
signal \N__5067\ : std_logic;
signal \N__5064\ : std_logic;
signal \N__5057\ : std_logic;
signal \N__5054\ : std_logic;
signal \N__5051\ : std_logic;
signal \N__5048\ : std_logic;
signal \N__5045\ : std_logic;
signal \N__5044\ : std_logic;
signal \N__5043\ : std_logic;
signal \N__5040\ : std_logic;
signal \N__5037\ : std_logic;
signal \N__5036\ : std_logic;
signal \N__5035\ : std_logic;
signal \N__5034\ : std_logic;
signal \N__5033\ : std_logic;
signal \N__5030\ : std_logic;
signal \N__5025\ : std_logic;
signal \N__5020\ : std_logic;
signal \N__5017\ : std_logic;
signal \N__5014\ : std_logic;
signal \N__5013\ : std_logic;
signal \N__5010\ : std_logic;
signal \N__5009\ : std_logic;
signal \N__5004\ : std_logic;
signal \N__5003\ : std_logic;
signal \N__4996\ : std_logic;
signal \N__4993\ : std_logic;
signal \N__4990\ : std_logic;
signal \N__4987\ : std_logic;
signal \N__4984\ : std_logic;
signal \N__4973\ : std_logic;
signal \N__4972\ : std_logic;
signal \N__4971\ : std_logic;
signal \N__4970\ : std_logic;
signal \N__4969\ : std_logic;
signal \N__4964\ : std_logic;
signal \N__4963\ : std_logic;
signal \N__4962\ : std_logic;
signal \N__4961\ : std_logic;
signal \N__4958\ : std_logic;
signal \N__4957\ : std_logic;
signal \N__4954\ : std_logic;
signal \N__4951\ : std_logic;
signal \N__4948\ : std_logic;
signal \N__4945\ : std_logic;
signal \N__4940\ : std_logic;
signal \N__4937\ : std_logic;
signal \N__4934\ : std_logic;
signal \N__4931\ : std_logic;
signal \N__4928\ : std_logic;
signal \N__4927\ : std_logic;
signal \N__4926\ : std_logic;
signal \N__4925\ : std_logic;
signal \N__4924\ : std_logic;
signal \N__4923\ : std_logic;
signal \N__4916\ : std_logic;
signal \N__4915\ : std_logic;
signal \N__4912\ : std_logic;
signal \N__4909\ : std_logic;
signal \N__4904\ : std_logic;
signal \N__4895\ : std_logic;
signal \N__4892\ : std_logic;
signal \N__4889\ : std_logic;
signal \N__4886\ : std_logic;
signal \N__4871\ : std_logic;
signal \N__4868\ : std_logic;
signal \N__4867\ : std_logic;
signal \N__4864\ : std_logic;
signal \N__4861\ : std_logic;
signal \N__4856\ : std_logic;
signal \N__4853\ : std_logic;
signal \N__4852\ : std_logic;
signal \N__4851\ : std_logic;
signal \N__4850\ : std_logic;
signal \N__4849\ : std_logic;
signal \N__4848\ : std_logic;
signal \N__4845\ : std_logic;
signal \N__4844\ : std_logic;
signal \N__4841\ : std_logic;
signal \N__4836\ : std_logic;
signal \N__4835\ : std_logic;
signal \N__4832\ : std_logic;
signal \N__4829\ : std_logic;
signal \N__4822\ : std_logic;
signal \N__4821\ : std_logic;
signal \N__4820\ : std_logic;
signal \N__4819\ : std_logic;
signal \N__4816\ : std_logic;
signal \N__4813\ : std_logic;
signal \N__4806\ : std_logic;
signal \N__4805\ : std_logic;
signal \N__4798\ : std_logic;
signal \N__4795\ : std_logic;
signal \N__4792\ : std_logic;
signal \N__4789\ : std_logic;
signal \N__4786\ : std_logic;
signal \N__4775\ : std_logic;
signal \N__4772\ : std_logic;
signal \N__4771\ : std_logic;
signal \N__4768\ : std_logic;
signal \N__4765\ : std_logic;
signal \N__4764\ : std_logic;
signal \N__4763\ : std_logic;
signal \N__4762\ : std_logic;
signal \N__4757\ : std_logic;
signal \N__4752\ : std_logic;
signal \N__4749\ : std_logic;
signal \N__4748\ : std_logic;
signal \N__4747\ : std_logic;
signal \N__4746\ : std_logic;
signal \N__4745\ : std_logic;
signal \N__4738\ : std_logic;
signal \N__4737\ : std_logic;
signal \N__4732\ : std_logic;
signal \N__4729\ : std_logic;
signal \N__4726\ : std_logic;
signal \N__4723\ : std_logic;
signal \N__4720\ : std_logic;
signal \N__4709\ : std_logic;
signal \N__4706\ : std_logic;
signal \N__4703\ : std_logic;
signal \N__4702\ : std_logic;
signal \N__4699\ : std_logic;
signal \N__4696\ : std_logic;
signal \N__4691\ : std_logic;
signal \N__4688\ : std_logic;
signal \N__4685\ : std_logic;
signal \N__4682\ : std_logic;
signal \N__4679\ : std_logic;
signal \N__4676\ : std_logic;
signal \N__4673\ : std_logic;
signal \N__4670\ : std_logic;
signal \N__4667\ : std_logic;
signal \N__4666\ : std_logic;
signal \N__4663\ : std_logic;
signal \N__4660\ : std_logic;
signal \N__4655\ : std_logic;
signal \N__4654\ : std_logic;
signal \N__4651\ : std_logic;
signal \N__4648\ : std_logic;
signal \N__4643\ : std_logic;
signal \N__4642\ : std_logic;
signal \N__4639\ : std_logic;
signal \N__4636\ : std_logic;
signal \N__4633\ : std_logic;
signal \N__4630\ : std_logic;
signal \N__4627\ : std_logic;
signal \N__4622\ : std_logic;
signal \N__4619\ : std_logic;
signal \N__4618\ : std_logic;
signal \N__4617\ : std_logic;
signal \N__4616\ : std_logic;
signal \N__4615\ : std_logic;
signal \N__4614\ : std_logic;
signal \N__4613\ : std_logic;
signal \N__4612\ : std_logic;
signal \N__4611\ : std_logic;
signal \N__4610\ : std_logic;
signal \N__4609\ : std_logic;
signal \N__4608\ : std_logic;
signal \N__4607\ : std_logic;
signal \N__4606\ : std_logic;
signal \N__4605\ : std_logic;
signal \N__4604\ : std_logic;
signal \N__4603\ : std_logic;
signal \N__4602\ : std_logic;
signal \N__4601\ : std_logic;
signal \N__4598\ : std_logic;
signal \N__4591\ : std_logic;
signal \N__4580\ : std_logic;
signal \N__4575\ : std_logic;
signal \N__4566\ : std_logic;
signal \N__4565\ : std_logic;
signal \N__4564\ : std_logic;
signal \N__4555\ : std_logic;
signal \N__4550\ : std_logic;
signal \N__4547\ : std_logic;
signal \N__4542\ : std_logic;
signal \N__4539\ : std_logic;
signal \N__4536\ : std_logic;
signal \N__4535\ : std_logic;
signal \N__4534\ : std_logic;
signal \N__4529\ : std_logic;
signal \N__4524\ : std_logic;
signal \N__4519\ : std_logic;
signal \N__4516\ : std_logic;
signal \N__4513\ : std_logic;
signal \N__4502\ : std_logic;
signal \N__4499\ : std_logic;
signal \N__4496\ : std_logic;
signal \N__4493\ : std_logic;
signal \N__4492\ : std_logic;
signal \N__4489\ : std_logic;
signal \N__4488\ : std_logic;
signal \N__4485\ : std_logic;
signal \N__4482\ : std_logic;
signal \N__4479\ : std_logic;
signal \N__4472\ : std_logic;
signal \N__4471\ : std_logic;
signal \N__4468\ : std_logic;
signal \N__4467\ : std_logic;
signal \N__4466\ : std_logic;
signal \N__4463\ : std_logic;
signal \N__4458\ : std_logic;
signal \N__4457\ : std_logic;
signal \N__4454\ : std_logic;
signal \N__4451\ : std_logic;
signal \N__4448\ : std_logic;
signal \N__4445\ : std_logic;
signal \N__4444\ : std_logic;
signal \N__4441\ : std_logic;
signal \N__4440\ : std_logic;
signal \N__4439\ : std_logic;
signal \N__4438\ : std_logic;
signal \N__4437\ : std_logic;
signal \N__4434\ : std_logic;
signal \N__4431\ : std_logic;
signal \N__4428\ : std_logic;
signal \N__4425\ : std_logic;
signal \N__4422\ : std_logic;
signal \N__4417\ : std_logic;
signal \N__4412\ : std_logic;
signal \N__4397\ : std_logic;
signal \N__4396\ : std_logic;
signal \N__4395\ : std_logic;
signal \N__4394\ : std_logic;
signal \N__4391\ : std_logic;
signal \N__4390\ : std_logic;
signal \N__4389\ : std_logic;
signal \N__4388\ : std_logic;
signal \N__4383\ : std_logic;
signal \N__4382\ : std_logic;
signal \N__4379\ : std_logic;
signal \N__4376\ : std_logic;
signal \N__4371\ : std_logic;
signal \N__4370\ : std_logic;
signal \N__4367\ : std_logic;
signal \N__4364\ : std_logic;
signal \N__4361\ : std_logic;
signal \N__4356\ : std_logic;
signal \N__4353\ : std_logic;
signal \N__4350\ : std_logic;
signal \N__4337\ : std_logic;
signal \N__4334\ : std_logic;
signal \N__4331\ : std_logic;
signal \N__4328\ : std_logic;
signal \N__4327\ : std_logic;
signal \N__4326\ : std_logic;
signal \N__4319\ : std_logic;
signal \N__4316\ : std_logic;
signal \N__4313\ : std_logic;
signal \N__4312\ : std_logic;
signal \N__4311\ : std_logic;
signal \N__4310\ : std_logic;
signal \N__4309\ : std_logic;
signal \N__4308\ : std_logic;
signal \N__4307\ : std_logic;
signal \N__4306\ : std_logic;
signal \N__4289\ : std_logic;
signal \N__4286\ : std_logic;
signal \N__4283\ : std_logic;
signal \N__4282\ : std_logic;
signal \N__4281\ : std_logic;
signal \N__4278\ : std_logic;
signal \N__4275\ : std_logic;
signal \N__4272\ : std_logic;
signal \N__4269\ : std_logic;
signal \N__4262\ : std_logic;
signal \N__4259\ : std_logic;
signal \N__4258\ : std_logic;
signal \N__4255\ : std_logic;
signal \N__4254\ : std_logic;
signal \N__4251\ : std_logic;
signal \N__4248\ : std_logic;
signal \N__4245\ : std_logic;
signal \N__4238\ : std_logic;
signal \N__4235\ : std_logic;
signal \N__4234\ : std_logic;
signal \N__4233\ : std_logic;
signal \N__4230\ : std_logic;
signal \N__4225\ : std_logic;
signal \N__4220\ : std_logic;
signal \N__4217\ : std_logic;
signal \N__4214\ : std_logic;
signal \N__4211\ : std_logic;
signal \N__4208\ : std_logic;
signal \N__4207\ : std_logic;
signal \N__4206\ : std_logic;
signal \N__4203\ : std_logic;
signal \N__4200\ : std_logic;
signal \N__4197\ : std_logic;
signal \N__4192\ : std_logic;
signal \N__4187\ : std_logic;
signal \N__4184\ : std_logic;
signal \N__4181\ : std_logic;
signal \N__4180\ : std_logic;
signal \N__4179\ : std_logic;
signal \N__4176\ : std_logic;
signal \N__4173\ : std_logic;
signal \N__4170\ : std_logic;
signal \N__4167\ : std_logic;
signal \N__4164\ : std_logic;
signal \N__4157\ : std_logic;
signal \N__4154\ : std_logic;
signal \N__4151\ : std_logic;
signal \N__4148\ : std_logic;
signal \N__4145\ : std_logic;
signal \N__4144\ : std_logic;
signal \N__4143\ : std_logic;
signal \N__4140\ : std_logic;
signal \N__4137\ : std_logic;
signal \N__4134\ : std_logic;
signal \N__4127\ : std_logic;
signal \N__4124\ : std_logic;
signal \N__4121\ : std_logic;
signal \N__4120\ : std_logic;
signal \N__4119\ : std_logic;
signal \N__4116\ : std_logic;
signal \N__4111\ : std_logic;
signal \N__4106\ : std_logic;
signal \N__4103\ : std_logic;
signal \N__4102\ : std_logic;
signal \N__4099\ : std_logic;
signal \N__4098\ : std_logic;
signal \N__4095\ : std_logic;
signal \N__4092\ : std_logic;
signal \N__4089\ : std_logic;
signal \N__4082\ : std_logic;
signal \N__4079\ : std_logic;
signal \N__4076\ : std_logic;
signal \N__4073\ : std_logic;
signal \N__4070\ : std_logic;
signal \N__4067\ : std_logic;
signal \N__4064\ : std_logic;
signal \N__4063\ : std_logic;
signal \N__4060\ : std_logic;
signal \N__4057\ : std_logic;
signal \N__4056\ : std_logic;
signal \N__4055\ : std_logic;
signal \N__4054\ : std_logic;
signal \N__4053\ : std_logic;
signal \N__4052\ : std_logic;
signal \N__4051\ : std_logic;
signal \N__4050\ : std_logic;
signal \N__4049\ : std_logic;
signal \N__4046\ : std_logic;
signal \N__4043\ : std_logic;
signal \N__4040\ : std_logic;
signal \N__4037\ : std_logic;
signal \N__4034\ : std_logic;
signal \N__4031\ : std_logic;
signal \N__4028\ : std_logic;
signal \N__4025\ : std_logic;
signal \N__4022\ : std_logic;
signal \N__4019\ : std_logic;
signal \N__4016\ : std_logic;
signal \N__4013\ : std_logic;
signal \N__4010\ : std_logic;
signal \N__4001\ : std_logic;
signal \N__3994\ : std_logic;
signal \N__3991\ : std_logic;
signal \N__3982\ : std_logic;
signal \N__3977\ : std_logic;
signal \N__3974\ : std_logic;
signal \N__3971\ : std_logic;
signal \N__3968\ : std_logic;
signal \N__3965\ : std_logic;
signal \N__3962\ : std_logic;
signal \N__3959\ : std_logic;
signal \N__3956\ : std_logic;
signal \N__3953\ : std_logic;
signal \N__3950\ : std_logic;
signal \N__3947\ : std_logic;
signal \N__3944\ : std_logic;
signal \N__3941\ : std_logic;
signal \N__3938\ : std_logic;
signal \N__3935\ : std_logic;
signal \N__3932\ : std_logic;
signal \N__3929\ : std_logic;
signal \N__3926\ : std_logic;
signal \N__3923\ : std_logic;
signal \N__3920\ : std_logic;
signal \N__3917\ : std_logic;
signal \N__3914\ : std_logic;
signal \N__3911\ : std_logic;
signal \N__3908\ : std_logic;
signal \N__3905\ : std_logic;
signal \N__3902\ : std_logic;
signal \N__3901\ : std_logic;
signal \N__3898\ : std_logic;
signal \N__3895\ : std_logic;
signal \N__3892\ : std_logic;
signal \N__3887\ : std_logic;
signal \N__3884\ : std_logic;
signal \N__3881\ : std_logic;
signal \N__3878\ : std_logic;
signal \N__3875\ : std_logic;
signal \N__3872\ : std_logic;
signal \N__3869\ : std_logic;
signal \N__3866\ : std_logic;
signal \N__3863\ : std_logic;
signal \N__3860\ : std_logic;
signal \N__3857\ : std_logic;
signal \N__3854\ : std_logic;
signal \N__3853\ : std_logic;
signal \N__3852\ : std_logic;
signal \N__3849\ : std_logic;
signal \N__3846\ : std_logic;
signal \N__3843\ : std_logic;
signal \N__3836\ : std_logic;
signal \N__3835\ : std_logic;
signal \N__3834\ : std_logic;
signal \N__3831\ : std_logic;
signal \N__3826\ : std_logic;
signal \N__3821\ : std_logic;
signal \N__3818\ : std_logic;
signal \N__3815\ : std_logic;
signal \N__3812\ : std_logic;
signal \N__3811\ : std_logic;
signal \N__3808\ : std_logic;
signal \N__3805\ : std_logic;
signal \N__3800\ : std_logic;
signal \N__3799\ : std_logic;
signal \N__3796\ : std_logic;
signal \N__3793\ : std_logic;
signal \N__3788\ : std_logic;
signal \N__3787\ : std_logic;
signal \N__3784\ : std_logic;
signal \N__3781\ : std_logic;
signal \N__3776\ : std_logic;
signal \N__3773\ : std_logic;
signal \N__3770\ : std_logic;
signal \N__3769\ : std_logic;
signal \N__3768\ : std_logic;
signal \N__3765\ : std_logic;
signal \N__3760\ : std_logic;
signal \N__3755\ : std_logic;
signal \N__3754\ : std_logic;
signal \N__3753\ : std_logic;
signal \N__3750\ : std_logic;
signal \N__3747\ : std_logic;
signal \N__3742\ : std_logic;
signal \N__3737\ : std_logic;
signal \N__3734\ : std_logic;
signal \N__3731\ : std_logic;
signal \N__3728\ : std_logic;
signal \N__3725\ : std_logic;
signal \N__3722\ : std_logic;
signal \N__3719\ : std_logic;
signal \N__3716\ : std_logic;
signal \N__3713\ : std_logic;
signal \N__3710\ : std_logic;
signal \N__3707\ : std_logic;
signal \N__3704\ : std_logic;
signal \N__3701\ : std_logic;
signal \N__3698\ : std_logic;
signal \N__3695\ : std_logic;
signal \N__3692\ : std_logic;
signal \N__3691\ : std_logic;
signal \N__3688\ : std_logic;
signal \N__3685\ : std_logic;
signal \N__3682\ : std_logic;
signal \N__3679\ : std_logic;
signal \N__3674\ : std_logic;
signal \N__3671\ : std_logic;
signal \N__3668\ : std_logic;
signal \N__3665\ : std_logic;
signal \N__3662\ : std_logic;
signal \N__3659\ : std_logic;
signal \N__3656\ : std_logic;
signal \N__3653\ : std_logic;
signal \N__3650\ : std_logic;
signal \N__3647\ : std_logic;
signal \N__3644\ : std_logic;
signal \N__3643\ : std_logic;
signal \N__3640\ : std_logic;
signal \N__3637\ : std_logic;
signal \N__3632\ : std_logic;
signal \N__3629\ : std_logic;
signal \N__3626\ : std_logic;
signal \N__3623\ : std_logic;
signal \N__3620\ : std_logic;
signal \N__3619\ : std_logic;
signal \N__3616\ : std_logic;
signal \N__3615\ : std_logic;
signal \N__3612\ : std_logic;
signal \N__3607\ : std_logic;
signal \N__3602\ : std_logic;
signal \N__3601\ : std_logic;
signal \N__3600\ : std_logic;
signal \N__3597\ : std_logic;
signal \N__3592\ : std_logic;
signal \N__3587\ : std_logic;
signal \N__3584\ : std_logic;
signal \N__3583\ : std_logic;
signal \N__3580\ : std_logic;
signal \N__3577\ : std_logic;
signal \N__3574\ : std_logic;
signal \N__3569\ : std_logic;
signal \N__3566\ : std_logic;
signal \N__3563\ : std_logic;
signal \N__3562\ : std_logic;
signal \N__3559\ : std_logic;
signal \N__3556\ : std_logic;
signal \N__3551\ : std_logic;
signal \N__3548\ : std_logic;
signal \N__3545\ : std_logic;
signal \N__3544\ : std_logic;
signal \N__3541\ : std_logic;
signal \N__3538\ : std_logic;
signal \N__3533\ : std_logic;
signal \N__3530\ : std_logic;
signal \N__3529\ : std_logic;
signal \N__3526\ : std_logic;
signal \N__3523\ : std_logic;
signal \N__3522\ : std_logic;
signal \N__3519\ : std_logic;
signal \N__3516\ : std_logic;
signal \N__3513\ : std_logic;
signal \N__3506\ : std_logic;
signal \N__3503\ : std_logic;
signal \N__3502\ : std_logic;
signal \N__3499\ : std_logic;
signal \N__3496\ : std_logic;
signal \N__3493\ : std_logic;
signal \N__3490\ : std_logic;
signal \N__3485\ : std_logic;
signal \N__3482\ : std_logic;
signal \N__3481\ : std_logic;
signal \N__3478\ : std_logic;
signal \N__3475\ : std_logic;
signal \N__3472\ : std_logic;
signal \N__3469\ : std_logic;
signal \N__3464\ : std_logic;
signal \N__3461\ : std_logic;
signal \N__3460\ : std_logic;
signal \N__3457\ : std_logic;
signal \N__3454\ : std_logic;
signal \N__3449\ : std_logic;
signal \N__3446\ : std_logic;
signal \N__3443\ : std_logic;
signal \N__3440\ : std_logic;
signal \N__3437\ : std_logic;
signal \N__3434\ : std_logic;
signal \N__3433\ : std_logic;
signal \N__3430\ : std_logic;
signal \N__3427\ : std_logic;
signal \N__3422\ : std_logic;
signal \N__3419\ : std_logic;
signal \N__3416\ : std_logic;
signal \N__3413\ : std_logic;
signal \N__3410\ : std_logic;
signal \N__3407\ : std_logic;
signal \N__3404\ : std_logic;
signal \N__3401\ : std_logic;
signal \N__3398\ : std_logic;
signal \N__3395\ : std_logic;
signal \N__3392\ : std_logic;
signal \N__3389\ : std_logic;
signal \N__3386\ : std_logic;
signal \N__3383\ : std_logic;
signal \N__3380\ : std_logic;
signal \N__3377\ : std_logic;
signal \N__3374\ : std_logic;
signal \N__3371\ : std_logic;
signal \N__3368\ : std_logic;
signal \N__3367\ : std_logic;
signal \N__3364\ : std_logic;
signal \N__3361\ : std_logic;
signal \N__3356\ : std_logic;
signal \N__3355\ : std_logic;
signal \N__3352\ : std_logic;
signal \N__3349\ : std_logic;
signal \N__3346\ : std_logic;
signal \N__3343\ : std_logic;
signal \N__3338\ : std_logic;
signal \N__3335\ : std_logic;
signal \N__3332\ : std_logic;
signal \N__3331\ : std_logic;
signal \N__3330\ : std_logic;
signal \N__3329\ : std_logic;
signal \N__3328\ : std_logic;
signal \N__3327\ : std_logic;
signal \N__3326\ : std_logic;
signal \N__3325\ : std_logic;
signal \N__3324\ : std_logic;
signal \N__3321\ : std_logic;
signal \N__3318\ : std_logic;
signal \N__3315\ : std_logic;
signal \N__3312\ : std_logic;
signal \N__3311\ : std_logic;
signal \N__3310\ : std_logic;
signal \N__3307\ : std_logic;
signal \N__3304\ : std_logic;
signal \N__3301\ : std_logic;
signal \N__3298\ : std_logic;
signal \N__3295\ : std_logic;
signal \N__3294\ : std_logic;
signal \N__3293\ : std_logic;
signal \N__3292\ : std_logic;
signal \N__3291\ : std_logic;
signal \N__3290\ : std_logic;
signal \N__3283\ : std_logic;
signal \N__3280\ : std_logic;
signal \N__3279\ : std_logic;
signal \N__3276\ : std_logic;
signal \N__3273\ : std_logic;
signal \N__3268\ : std_logic;
signal \N__3263\ : std_logic;
signal \N__3258\ : std_logic;
signal \N__3255\ : std_logic;
signal \N__3252\ : std_logic;
signal \N__3249\ : std_logic;
signal \N__3246\ : std_logic;
signal \N__3245\ : std_logic;
signal \N__3244\ : std_logic;
signal \N__3239\ : std_logic;
signal \N__3232\ : std_logic;
signal \N__3229\ : std_logic;
signal \N__3224\ : std_logic;
signal \N__3219\ : std_logic;
signal \N__3210\ : std_logic;
signal \N__3205\ : std_logic;
signal \N__3200\ : std_logic;
signal \N__3191\ : std_logic;
signal \N__3188\ : std_logic;
signal \N__3185\ : std_logic;
signal \N__3184\ : std_logic;
signal \N__3181\ : std_logic;
signal \N__3178\ : std_logic;
signal \N__3173\ : std_logic;
signal \N__3172\ : std_logic;
signal \N__3169\ : std_logic;
signal \N__3166\ : std_logic;
signal \N__3161\ : std_logic;
signal \N__3160\ : std_logic;
signal \N__3157\ : std_logic;
signal \N__3154\ : std_logic;
signal \N__3149\ : std_logic;
signal \N__3146\ : std_logic;
signal \N__3143\ : std_logic;
signal \N__3140\ : std_logic;
signal \N__3137\ : std_logic;
signal \N__3134\ : std_logic;
signal \N__3131\ : std_logic;
signal \N__3128\ : std_logic;
signal \N__3125\ : std_logic;
signal \N__3122\ : std_logic;
signal \N__3119\ : std_logic;
signal \N__3116\ : std_logic;
signal \N__3115\ : std_logic;
signal \N__3114\ : std_logic;
signal \N__3113\ : std_logic;
signal \N__3112\ : std_logic;
signal \N__3111\ : std_logic;
signal \N__3110\ : std_logic;
signal \N__3109\ : std_logic;
signal \N__3108\ : std_logic;
signal \N__3107\ : std_logic;
signal \N__3106\ : std_logic;
signal \N__3105\ : std_logic;
signal \N__3104\ : std_logic;
signal \N__3103\ : std_logic;
signal \N__3096\ : std_logic;
signal \N__3085\ : std_logic;
signal \N__3082\ : std_logic;
signal \N__3079\ : std_logic;
signal \N__3078\ : std_logic;
signal \N__3077\ : std_logic;
signal \N__3076\ : std_logic;
signal \N__3075\ : std_logic;
signal \N__3066\ : std_logic;
signal \N__3063\ : std_logic;
signal \N__3058\ : std_logic;
signal \N__3055\ : std_logic;
signal \N__3050\ : std_logic;
signal \N__3045\ : std_logic;
signal \N__3042\ : std_logic;
signal \N__3037\ : std_logic;
signal \N__3026\ : std_logic;
signal \N__3023\ : std_logic;
signal \N__3020\ : std_logic;
signal \N__3017\ : std_logic;
signal \N__3016\ : std_logic;
signal \N__3013\ : std_logic;
signal \N__3010\ : std_logic;
signal \N__3005\ : std_logic;
signal \N__3002\ : std_logic;
signal \N__3001\ : std_logic;
signal \N__2998\ : std_logic;
signal \N__2995\ : std_logic;
signal \N__2990\ : std_logic;
signal \N__2989\ : std_logic;
signal \N__2986\ : std_logic;
signal \N__2983\ : std_logic;
signal \N__2978\ : std_logic;
signal \N__2975\ : std_logic;
signal \N__2972\ : std_logic;
signal \N__2971\ : std_logic;
signal \N__2968\ : std_logic;
signal \N__2965\ : std_logic;
signal \N__2960\ : std_logic;
signal \N__2959\ : std_logic;
signal \N__2956\ : std_logic;
signal \N__2953\ : std_logic;
signal \N__2948\ : std_logic;
signal \N__2945\ : std_logic;
signal \N__2942\ : std_logic;
signal \N__2939\ : std_logic;
signal \N__2936\ : std_logic;
signal \N__2933\ : std_logic;
signal \N__2930\ : std_logic;
signal \N__2927\ : std_logic;
signal \N__2924\ : std_logic;
signal \N__2921\ : std_logic;
signal \N__2918\ : std_logic;
signal \N__2915\ : std_logic;
signal \N__2912\ : std_logic;
signal \N__2909\ : std_logic;
signal \N__2906\ : std_logic;
signal \N__2903\ : std_logic;
signal \N__2900\ : std_logic;
signal \N__2897\ : std_logic;
signal \N__2894\ : std_logic;
signal \N__2891\ : std_logic;
signal \N__2888\ : std_logic;
signal \N__2885\ : std_logic;
signal \N__2882\ : std_logic;
signal \N__2879\ : std_logic;
signal \N__2876\ : std_logic;
signal \N__2873\ : std_logic;
signal \N__2870\ : std_logic;
signal \N__2867\ : std_logic;
signal \N__2864\ : std_logic;
signal \N__2863\ : std_logic;
signal \N__2860\ : std_logic;
signal \N__2857\ : std_logic;
signal \N__2856\ : std_logic;
signal \N__2855\ : std_logic;
signal \N__2850\ : std_logic;
signal \N__2847\ : std_logic;
signal \N__2844\ : std_logic;
signal \N__2841\ : std_logic;
signal \N__2836\ : std_logic;
signal \N__2831\ : std_logic;
signal \N__2828\ : std_logic;
signal \N__2825\ : std_logic;
signal \N__2822\ : std_logic;
signal \N__2819\ : std_logic;
signal \N__2816\ : std_logic;
signal \N__2813\ : std_logic;
signal \N__2810\ : std_logic;
signal \N__2807\ : std_logic;
signal \N__2804\ : std_logic;
signal \N__2801\ : std_logic;
signal \N__2798\ : std_logic;
signal \N__2795\ : std_logic;
signal \N__2792\ : std_logic;
signal \N__2789\ : std_logic;
signal \N__2786\ : std_logic;
signal \N__2783\ : std_logic;
signal \N__2780\ : std_logic;
signal \N__2777\ : std_logic;
signal \N__2774\ : std_logic;
signal \N__2771\ : std_logic;
signal \N__2768\ : std_logic;
signal \N__2765\ : std_logic;
signal \N__2764\ : std_logic;
signal \N__2763\ : std_logic;
signal \N__2762\ : std_logic;
signal \N__2757\ : std_logic;
signal \N__2754\ : std_logic;
signal \N__2751\ : std_logic;
signal \N__2744\ : std_logic;
signal \N__2741\ : std_logic;
signal \N__2738\ : std_logic;
signal \N__2735\ : std_logic;
signal \N__2732\ : std_logic;
signal \N__2729\ : std_logic;
signal \N__2726\ : std_logic;
signal \N__2723\ : std_logic;
signal \N__2720\ : std_logic;
signal \N__2717\ : std_logic;
signal \N__2714\ : std_logic;
signal \N__2711\ : std_logic;
signal \N__2710\ : std_logic;
signal \N__2709\ : std_logic;
signal \N__2706\ : std_logic;
signal \N__2705\ : std_logic;
signal \N__2702\ : std_logic;
signal \N__2699\ : std_logic;
signal \N__2694\ : std_logic;
signal \N__2687\ : std_logic;
signal \N__2684\ : std_logic;
signal \N__2681\ : std_logic;
signal \N__2680\ : std_logic;
signal \N__2679\ : std_logic;
signal \N__2676\ : std_logic;
signal \N__2673\ : std_logic;
signal \N__2672\ : std_logic;
signal \N__2671\ : std_logic;
signal \N__2668\ : std_logic;
signal \N__2665\ : std_logic;
signal \N__2662\ : std_logic;
signal \N__2655\ : std_logic;
signal \N__2648\ : std_logic;
signal \N__2647\ : std_logic;
signal \N__2646\ : std_logic;
signal \N__2645\ : std_logic;
signal \N__2644\ : std_logic;
signal \N__2641\ : std_logic;
signal \N__2638\ : std_logic;
signal \N__2631\ : std_logic;
signal \N__2624\ : std_logic;
signal \N__2621\ : std_logic;
signal \N__2620\ : std_logic;
signal \N__2619\ : std_logic;
signal \N__2618\ : std_logic;
signal \N__2615\ : std_logic;
signal \N__2614\ : std_logic;
signal \N__2609\ : std_logic;
signal \N__2602\ : std_logic;
signal \N__2597\ : std_logic;
signal \N__2594\ : std_logic;
signal \N__2591\ : std_logic;
signal \N__2590\ : std_logic;
signal \N__2587\ : std_logic;
signal \N__2584\ : std_logic;
signal \N__2579\ : std_logic;
signal \N__2576\ : std_logic;
signal \N__2573\ : std_logic;
signal \N__2570\ : std_logic;
signal \N__2567\ : std_logic;
signal \N__2564\ : std_logic;
signal \N__2561\ : std_logic;
signal \N__2558\ : std_logic;
signal \N__2555\ : std_logic;
signal \N__2552\ : std_logic;
signal \VCCG0\ : std_logic;
signal \GNDG0\ : std_logic;
signal led_c : std_logic;
signal \ppm_encoder1.N_46_cascade_\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_0\ : std_logic;
signal \ppm_encoder1.un14_0_iv_1_12_cascade_\ : std_logic;
signal \ppm_encoder1.un14_0_12_cascade_\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_3\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_1\ : std_logic;
signal \ppm_encoder1.init_pulses39_2_0_cascade_\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_2\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIINM32Z0Z_2\ : std_logic;
signal \ppm_encoder1.un14_0_12\ : std_logic;
signal \bfn_8_23_0_\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_0\ : std_logic;
signal \ppm_encoder1.PPM_STATE_RNIH6OE8_0Z0Z_0\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_1\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_3\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_2\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_4\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_3\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_4\ : std_logic;
signal \ppm_encoder1.un14_0_i_0_0\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_5\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_7\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_6\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_7\ : std_logic;
signal \bfn_8_24_0_\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_9\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_8\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_10\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_9\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_11\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_10\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_11\ : std_logic;
signal \ppm_encoder1.PPM_STATE_RNIH6OE8Z0Z_0\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_13\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_12\ : std_logic;
signal \ppm_encoder1.N_355_i\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_14\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_13\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_15\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_14\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_15\ : std_logic;
signal \bfn_8_25_0_\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_16\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_cry_17\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_18_cascade_\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_16\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_17\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_12\ : std_logic;
signal \ppm_encoder1.N_39_i\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_6\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_1\ : std_logic;
signal \ppm_encoder1.un1_init_pulses_axb_0\ : std_logic;
signal \ppm_encoder1.pulses2count39_0_cascade_\ : std_logic;
signal \ppm_encoder1.init_pulses_0_sqmuxa_0_cascade_\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_2\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_5\ : std_logic;
signal \ppm_encoder1.init_pulses_0_sqmuxa_0\ : std_logic;
signal \ppm_encoder1.init_pulses_RNO_0Z0Z_8\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_13\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_15\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_5\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_4\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_17\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_18\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_16\ : std_logic;
signal \bfn_9_28_0_\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_0\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_1\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_2\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_3\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_4\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_5\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_6\ : std_logic;
signal \uart1.un1_count_pulses_needed_6_cry_7\ : std_logic;
signal \bfn_9_29_0_\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_9\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_8\ : std_logic;
signal \ppm_encoder1.PPM_STATE_e_1_0\ : std_logic;
signal \ppm_encoder1.init_pulses_6_sqmuxa\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_10\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_6\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_7\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_14\ : std_logic;
signal \ppm_encoder1.init_pulses39_2_0\ : std_logic;
signal \ppm_encoder1.N_47\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_3\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_2\ : std_logic;
signal \ppm_encoder1.pulses2count_8_0_iv_0_1_10_0\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_11\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_4\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_5\ : std_logic;
signal \ppm_encoder1.PPM_STATE_r_1_1\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_14\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_15\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_17\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_16\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_13\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_12\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_12\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_18\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_7\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_4\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_5\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_1\ : std_logic;
signal \uart1.m9_i_o2_1_cascade_\ : std_logic;
signal \uart1.m9_i_o2_0\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_6\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_0\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_8\ : std_logic;
signal \uart1.m9_i_o2_0_2\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_3\ : std_logic;
signal \uart1.count_pulses_neededZ0Z_2\ : std_logic;
signal \uart1.m9_i_o2_0_2_cascade_\ : std_logic;
signal \uart1.m9_i_o2_1_2\ : std_logic;
signal \uart1.N_23_cascade_\ : std_logic;
signal \uart1.N_5\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_8\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_9\ : std_logic;
signal ppm_output_c : std_logic;
signal \bfn_11_24_0_\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_0\ : std_logic;
signal \ppm_encoder1.counter11_0_I_15_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_1\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_2\ : std_logic;
signal \ppm_encoder1.counter11_0_I_27_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_3\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_4\ : std_logic;
signal \ppm_encoder1.counter11_0_I_39_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_5\ : std_logic;
signal \ppm_encoder1.counter11_0_I_45_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_6\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_7\ : std_logic;
signal \ppm_encoder1.counter11_0_I_51_c_RNOZ0\ : std_logic;
signal \bfn_11_25_0_\ : std_logic;
signal \ppm_encoder1.counter11_0_I_57_c_RNOZ0\ : std_logic;
signal \CONSTANT_ONE_NET\ : std_logic;
signal \ppm_encoder1.counter11_0_data_tmp_8\ : std_logic;
signal \ppm_encoder1.counter11_0_N_2\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_10\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_11\ : std_logic;
signal \ppm_encoder1.counter11_0_I_33_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_6\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_7\ : std_logic;
signal \ppm_encoder1.counter11_0_I_21_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_12\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_2_cascade_\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_2\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_3\ : std_logic;
signal \ppm_encoder1.counter11_0_I_9_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.N_35_i_i\ : std_logic;
signal \bfn_11_26_0_\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_0\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_1\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_2\ : std_logic;
signal \ppm_encoder1.counterZ0Z_4\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_3\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_4\ : std_logic;
signal \ppm_encoder1.counterZ0Z_6\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_5\ : std_logic;
signal \ppm_encoder1.counterZ0Z_7\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_6\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_7\ : std_logic;
signal \bfn_11_27_0_\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_8\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_9\ : std_logic;
signal \ppm_encoder1.counterZ0Z_11\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_10\ : std_logic;
signal \ppm_encoder1.counterZ0Z_12\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_11\ : std_logic;
signal \ppm_encoder1.counterZ0Z_13\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_12\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_13\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_14\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_15\ : std_logic;
signal \ppm_encoder1.counterZ0Z_16\ : std_logic;
signal \bfn_11_28_0_\ : std_logic;
signal \ppm_encoder1.counterZ0Z_17\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_16\ : std_logic;
signal \ppm_encoder1.un1_counter_13_cry_17\ : std_logic;
signal \ppm_encoder1.un1_PPM_STATE_0_sqmuxa_0_i_g\ : std_logic;
signal \uart1.un1_state_bus_1_0\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\ : std_logic;
signal \ppm_encoder1.N_146_1\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\ : std_logic;
signal \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\ : std_logic;
signal \ppm_encoder1.N_146_1_cascade_\ : std_logic;
signal \ppm_encoder1.N_39\ : std_logic;
signal \ppm_encoder1.N_31_i\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_16\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1\ : std_logic;
signal \ppm_encoder1.pulses2count39_0\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_cascade_\ : std_logic;
signal \ppm_encoder1.counter11_0_N_2_THRU_CO\ : std_logic;
signal \ppm_encoder1.un1_PPM_STATE_0_sqmuxa_0_i\ : std_logic;
signal \ppm_encoder1.counterZ0Z_5\ : std_logic;
signal \ppm_encoder1.PPM_STATEZ0Z_1\ : std_logic;
signal \ppm_encoder1.PPM_STATEZ0Z_0\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_15\ : std_logic;
signal \ppm_encoder1.un1_init_pulses39_2_0\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_1\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_1\ : std_logic;
signal \ppm_encoder1.counter11_0_I_1_c_RNOZ0\ : std_logic;
signal \ppm_encoder1.init_pulsesZ0Z_0\ : std_logic;
signal \ppm_encoder1.pulses2count22_0\ : std_logic;
signal \ppm_encoder1.pulses2countZ0Z_0\ : std_logic;
signal \ppm_encoder1.N_31_i_g\ : std_logic;
signal \ppm_encoder1.counterZ0Z_15\ : std_logic;
signal \ppm_encoder1.counterZ0Z_1\ : std_logic;
signal \ppm_encoder1.counterZ0Z_18\ : std_logic;
signal \ppm_encoder1.counterZ0Z_8\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_14\ : std_logic;
signal \ppm_encoder1.counterZ0Z_14\ : std_logic;
signal \ppm_encoder1.counterZ0Z_0\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_0\ : std_logic;
signal \ppm_encoder1.counterZ0Z_9\ : std_logic;
signal \ppm_encoder1.counterZ0Z_3\ : std_logic;
signal \ppm_encoder1.counterZ0Z_10\ : std_logic;
signal \ppm_encoder1.counterZ0Z_2\ : std_logic;
signal \ppm_encoder1.PPM_STATE_0_sqmuxa_1_13\ : std_logic;
signal \uart1.position_RNO_0Z0Z_1_cascade_\ : std_logic;
signal \uart1.positionZ1Z_1\ : std_logic;
signal \uart1.un1_position_c2\ : std_logic;
signal \uart1.positionZ0Z_2\ : std_logic;
signal \uart1.un1_position_c2_cascade_\ : std_logic;
signal \uart1.positionZ1Z_0\ : std_logic;
signal sdin_c : std_logic;
signal \uart1.N_9_i_N_2L1_cascade_\ : std_logic;
signal \uart1.data_rdy_reg13_0\ : std_logic;
signal \uart1.data_rdy_reg13_0_cascade_\ : std_logic;
signal \uart1.data_rdy_reg13_i_0\ : std_logic;
signal \uart1.positionZ0Z_3\ : std_logic;
signal \uart1.flag_reg_0_sqmuxa_0_a2_0_cascade_\ : std_logic;
signal data_debug_c : std_logic;
signal \uart1.N_23\ : std_logic;
signal \uart1.N_29\ : std_logic;
signal \uart1.un1_state_bus_0_a2_iso\ : std_logic;
signal data_6 : std_logic;
signal data_7 : std_logic;
signal \uart1.state_busZ0Z_0\ : std_logic;
signal \uart1.state_busZ0Z_1\ : std_logic;
signal data_rdy : std_logic;
signal data_4 : std_logic;
signal data_1 : std_logic;
signal data_5 : std_logic;
signal data_0 : std_logic;
signal \KeyPress1.N_42_cascade_\ : std_logic;
signal \KeyPress1.N_54\ : std_logic;
signal source_data_c_2 : std_logic;
signal \KeyPress1.N_43_0_cascade_\ : std_logic;
signal data_2 : std_logic;
signal source_data_c_0 : std_logic;
signal \KeyPress1.N_44\ : std_logic;
signal \KeyPress1.source_data_ready_reg_4_i_0_a3_2\ : std_logic;
signal \KeyPress1.N_62\ : std_logic;
signal source_data_rdy_c : std_logic;
signal \KeyPress1.N_11_i\ : std_logic;
signal data_3 : std_logic;
signal reset_system_c : std_logic;
signal \KeyPress1.N_15_cascade_\ : std_logic;
signal \KeyPress1.N_43_0\ : std_logic;
signal source_data_c_1 : std_logic;
signal clk_system_c_g : std_logic;
signal \_gnd_net_\ : std_logic;

signal clk_system_wire : std_logic;
signal reset_system_wire : std_logic;
signal led_wire : std_logic;
signal source_data_wire : std_logic_vector(2 downto 0);
signal source_data_rdy_wire : std_logic;
signal sdin_wire : std_logic;
signal s1_wire : std_logic;
signal debug_wire : std_logic;
signal ppm_output_wire : std_logic;
signal data_debug_wire : std_logic;

begin
    clk_system_wire <= clk_system;
    reset_system_wire <= reset_system;
    led <= led_wire;
    source_data <= source_data_wire;
    source_data_rdy <= source_data_rdy_wire;
    sdin_wire <= sdin;
    s1_wire <= s1;
    debug <= debug_wire;
    ppm_output <= ppm_output_wire;
    data_debug <= data_debug_wire;

    \clk_system_ibuf_gb_io_preiogbuf\ : PRE_IO_GBUF
    port map (
            PADSIGNALTOGLOBALBUFFER => \N__6378\,
            GLOBALBUFFEROUTPUT => clk_system_c_g
        );

    \clk_system_ibuf_gb_io_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6380\,
            DIN => \N__6379\,
            DOUT => \N__6378\,
            PACKAGEPIN => clk_system_wire
        );

    \clk_system_ibuf_gb_io_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__6380\,
            PADOUT => \N__6379\,
            PADIN => \N__6378\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \reset_system_ibuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6369\,
            DIN => \N__6368\,
            DOUT => \N__6367\,
            PACKAGEPIN => reset_system_wire
        );

    \reset_system_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__6369\,
            PADOUT => \N__6368\,
            PADIN => \N__6367\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => reset_system_c,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \led_obuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6360\,
            DIN => \N__6359\,
            DOUT => \N__6358\,
            PACKAGEPIN => led_wire
        );

    \led_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6360\,
            PADOUT => \N__6359\,
            PADIN => \N__6358\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__2576\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \source_data_obuf_2_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6351\,
            DIN => \N__6350\,
            DOUT => \N__6349\,
            PACKAGEPIN => source_data_wire(2)
        );

    \source_data_obuf_2_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6351\,
            PADOUT => \N__6350\,
            PADIN => \N__6349\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__6212\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \source_data_rdy_obuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6342\,
            DIN => \N__6341\,
            DOUT => \N__6340\,
            PACKAGEPIN => source_data_rdy_wire
        );

    \source_data_rdy_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6342\,
            PADOUT => \N__6341\,
            PADIN => \N__6340\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__6107\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \sdin_ibuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6333\,
            DIN => \N__6332\,
            DOUT => \N__6331\,
            PACKAGEPIN => sdin_wire
        );

    \sdin_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__6333\,
            PADOUT => \N__6332\,
            PADIN => \N__6331\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => sdin_c,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \s1_ibuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6324\,
            DIN => \N__6323\,
            DOUT => \N__6322\,
            PACKAGEPIN => s1_wire
        );

    \s1_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000000"
        )
    port map (
            PADOEN => \N__6324\,
            PADOUT => \N__6323\,
            PADIN => \N__6322\,
            CLOCKENABLE => \VCCG0\,
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => led_c,
            DOUT0 => '0',
            INPUTCLK => \N__5970\,
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \source_data_obuf_1_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6315\,
            DIN => \N__6314\,
            DOUT => \N__6313\,
            PACKAGEPIN => source_data_wire(1)
        );

    \source_data_obuf_1_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6315\,
            PADOUT => \N__6314\,
            PADIN => \N__6313\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__6005\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \debug_obuft_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__6306\,
            DIN => \N__6305\,
            DOUT => \N__6304\,
            PACKAGEPIN => debug_wire
        );

    \debug_obuft_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "101001"
        )
    port map (
            PADOEN => \N__6306\,
            PADOUT => \N__6305\,
            PADIN => \N__6304\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \GNDG0\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \ppm_output_obuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6297\,
            DIN => \N__6296\,
            DOUT => \N__6295\,
            PACKAGEPIN => ppm_output_wire
        );

    \ppm_output_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6297\,
            PADOUT => \N__6296\,
            PADIN => \N__6295\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__3695\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \data_debug_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__6288\,
            DIN => \N__6287\,
            DOUT => \N__6286\,
            PACKAGEPIN => data_debug_wire
        );

    \data_debug_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6288\,
            PADOUT => \N__6287\,
            PADIN => \N__6286\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__5891\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \source_data_obuf_0_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__6279\,
            DIN => \N__6278\,
            DOUT => \N__6277\,
            PACKAGEPIN => source_data_wire(0)
        );

    \source_data_obuf_0_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__6279\,
            PADOUT => \N__6278\,
            PADIN => \N__6277\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__6158\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \I__1456\ : InMux
    port map (
            O => \N__6260\,
            I => \N__6252\
        );

    \I__1455\ : InMux
    port map (
            O => \N__6259\,
            I => \N__6252\
        );

    \I__1454\ : InMux
    port map (
            O => \N__6258\,
            I => \N__6247\
        );

    \I__1453\ : InMux
    port map (
            O => \N__6257\,
            I => \N__6247\
        );

    \I__1452\ : LocalMux
    port map (
            O => \N__6252\,
            I => data_5
        );

    \I__1451\ : LocalMux
    port map (
            O => \N__6247\,
            I => data_5
        );

    \I__1450\ : CascadeMux
    port map (
            O => \N__6242\,
            I => \N__6237\
        );

    \I__1449\ : InMux
    port map (
            O => \N__6241\,
            I => \N__6233\
        );

    \I__1448\ : InMux
    port map (
            O => \N__6240\,
            I => \N__6226\
        );

    \I__1447\ : InMux
    port map (
            O => \N__6237\,
            I => \N__6226\
        );

    \I__1446\ : InMux
    port map (
            O => \N__6236\,
            I => \N__6226\
        );

    \I__1445\ : LocalMux
    port map (
            O => \N__6233\,
            I => data_0
        );

    \I__1444\ : LocalMux
    port map (
            O => \N__6226\,
            I => data_0
        );

    \I__1443\ : CascadeMux
    port map (
            O => \N__6221\,
            I => \KeyPress1.N_42_cascade_\
        );

    \I__1442\ : InMux
    port map (
            O => \N__6218\,
            I => \N__6215\
        );

    \I__1441\ : LocalMux
    port map (
            O => \N__6215\,
            I => \KeyPress1.N_54\
        );

    \I__1440\ : IoInMux
    port map (
            O => \N__6212\,
            I => \N__6209\
        );

    \I__1439\ : LocalMux
    port map (
            O => \N__6209\,
            I => \N__6205\
        );

    \I__1438\ : CascadeMux
    port map (
            O => \N__6208\,
            I => \N__6202\
        );

    \I__1437\ : Span12Mux_s0_v
    port map (
            O => \N__6205\,
            I => \N__6199\
        );

    \I__1436\ : InMux
    port map (
            O => \N__6202\,
            I => \N__6196\
        );

    \I__1435\ : Odrv12
    port map (
            O => \N__6199\,
            I => source_data_c_2
        );

    \I__1434\ : LocalMux
    port map (
            O => \N__6196\,
            I => source_data_c_2
        );

    \I__1433\ : CascadeMux
    port map (
            O => \N__6191\,
            I => \KeyPress1.N_43_0_cascade_\
        );

    \I__1432\ : CascadeMux
    port map (
            O => \N__6188\,
            I => \N__6183\
        );

    \I__1431\ : CascadeMux
    port map (
            O => \N__6187\,
            I => \N__6179\
        );

    \I__1430\ : InMux
    port map (
            O => \N__6186\,
            I => \N__6175\
        );

    \I__1429\ : InMux
    port map (
            O => \N__6183\,
            I => \N__6170\
        );

    \I__1428\ : InMux
    port map (
            O => \N__6182\,
            I => \N__6170\
        );

    \I__1427\ : InMux
    port map (
            O => \N__6179\,
            I => \N__6165\
        );

    \I__1426\ : InMux
    port map (
            O => \N__6178\,
            I => \N__6165\
        );

    \I__1425\ : LocalMux
    port map (
            O => \N__6175\,
            I => data_2
        );

    \I__1424\ : LocalMux
    port map (
            O => \N__6170\,
            I => data_2
        );

    \I__1423\ : LocalMux
    port map (
            O => \N__6165\,
            I => data_2
        );

    \I__1422\ : IoInMux
    port map (
            O => \N__6158\,
            I => \N__6155\
        );

    \I__1421\ : LocalMux
    port map (
            O => \N__6155\,
            I => \N__6152\
        );

    \I__1420\ : Span4Mux_s0_v
    port map (
            O => \N__6152\,
            I => \N__6148\
        );

    \I__1419\ : InMux
    port map (
            O => \N__6151\,
            I => \N__6145\
        );

    \I__1418\ : Odrv4
    port map (
            O => \N__6148\,
            I => source_data_c_0
        );

    \I__1417\ : LocalMux
    port map (
            O => \N__6145\,
            I => source_data_c_0
        );

    \I__1416\ : InMux
    port map (
            O => \N__6140\,
            I => \N__6134\
        );

    \I__1415\ : InMux
    port map (
            O => \N__6139\,
            I => \N__6134\
        );

    \I__1414\ : LocalMux
    port map (
            O => \N__6134\,
            I => \KeyPress1.N_44\
        );

    \I__1413\ : CascadeMux
    port map (
            O => \N__6131\,
            I => \N__6127\
        );

    \I__1412\ : CascadeMux
    port map (
            O => \N__6130\,
            I => \N__6124\
        );

    \I__1411\ : InMux
    port map (
            O => \N__6127\,
            I => \N__6119\
        );

    \I__1410\ : InMux
    port map (
            O => \N__6124\,
            I => \N__6119\
        );

    \I__1409\ : LocalMux
    port map (
            O => \N__6119\,
            I => \KeyPress1.source_data_ready_reg_4_i_0_a3_2\
        );

    \I__1408\ : InMux
    port map (
            O => \N__6116\,
            I => \N__6110\
        );

    \I__1407\ : InMux
    port map (
            O => \N__6115\,
            I => \N__6110\
        );

    \I__1406\ : LocalMux
    port map (
            O => \N__6110\,
            I => \KeyPress1.N_62\
        );

    \I__1405\ : IoInMux
    port map (
            O => \N__6107\,
            I => \N__6104\
        );

    \I__1404\ : LocalMux
    port map (
            O => \N__6104\,
            I => \N__6101\
        );

    \I__1403\ : Span4Mux_s0_v
    port map (
            O => \N__6101\,
            I => \N__6098\
        );

    \I__1402\ : Odrv4
    port map (
            O => \N__6098\,
            I => source_data_rdy_c
        );

    \I__1401\ : InMux
    port map (
            O => \N__6095\,
            I => \N__6086\
        );

    \I__1400\ : InMux
    port map (
            O => \N__6094\,
            I => \N__6086\
        );

    \I__1399\ : InMux
    port map (
            O => \N__6093\,
            I => \N__6086\
        );

    \I__1398\ : LocalMux
    port map (
            O => \N__6086\,
            I => \KeyPress1.N_11_i\
        );

    \I__1397\ : InMux
    port map (
            O => \N__6083\,
            I => \N__6073\
        );

    \I__1396\ : InMux
    port map (
            O => \N__6082\,
            I => \N__6073\
        );

    \I__1395\ : InMux
    port map (
            O => \N__6081\,
            I => \N__6070\
        );

    \I__1394\ : InMux
    port map (
            O => \N__6080\,
            I => \N__6065\
        );

    \I__1393\ : InMux
    port map (
            O => \N__6079\,
            I => \N__6065\
        );

    \I__1392\ : InMux
    port map (
            O => \N__6078\,
            I => \N__6062\
        );

    \I__1391\ : LocalMux
    port map (
            O => \N__6073\,
            I => data_3
        );

    \I__1390\ : LocalMux
    port map (
            O => \N__6070\,
            I => data_3
        );

    \I__1389\ : LocalMux
    port map (
            O => \N__6065\,
            I => data_3
        );

    \I__1388\ : LocalMux
    port map (
            O => \N__6062\,
            I => data_3
        );

    \I__1387\ : CascadeMux
    port map (
            O => \N__6053\,
            I => \N__6050\
        );

    \I__1386\ : InMux
    port map (
            O => \N__6050\,
            I => \N__6043\
        );

    \I__1385\ : InMux
    port map (
            O => \N__6049\,
            I => \N__6034\
        );

    \I__1384\ : InMux
    port map (
            O => \N__6048\,
            I => \N__6034\
        );

    \I__1383\ : InMux
    port map (
            O => \N__6047\,
            I => \N__6034\
        );

    \I__1382\ : InMux
    port map (
            O => \N__6046\,
            I => \N__6034\
        );

    \I__1381\ : LocalMux
    port map (
            O => \N__6043\,
            I => \N__6031\
        );

    \I__1380\ : LocalMux
    port map (
            O => \N__6034\,
            I => \N__6028\
        );

    \I__1379\ : IoSpan4Mux
    port map (
            O => \N__6031\,
            I => \N__6025\
        );

    \I__1378\ : Span4Mux_h
    port map (
            O => \N__6028\,
            I => \N__6022\
        );

    \I__1377\ : Odrv4
    port map (
            O => \N__6025\,
            I => reset_system_c
        );

    \I__1376\ : Odrv4
    port map (
            O => \N__6022\,
            I => reset_system_c
        );

    \I__1375\ : CascadeMux
    port map (
            O => \N__6017\,
            I => \KeyPress1.N_15_cascade_\
        );

    \I__1374\ : InMux
    port map (
            O => \N__6014\,
            I => \N__6008\
        );

    \I__1373\ : InMux
    port map (
            O => \N__6013\,
            I => \N__6008\
        );

    \I__1372\ : LocalMux
    port map (
            O => \N__6008\,
            I => \KeyPress1.N_43_0\
        );

    \I__1371\ : IoInMux
    port map (
            O => \N__6005\,
            I => \N__6002\
        );

    \I__1370\ : LocalMux
    port map (
            O => \N__6002\,
            I => \N__5999\
        );

    \I__1369\ : IoSpan4Mux
    port map (
            O => \N__5999\,
            I => \N__5995\
        );

    \I__1368\ : InMux
    port map (
            O => \N__5998\,
            I => \N__5992\
        );

    \I__1367\ : Odrv4
    port map (
            O => \N__5995\,
            I => source_data_c_1
        );

    \I__1366\ : LocalMux
    port map (
            O => \N__5992\,
            I => source_data_c_1
        );

    \I__1365\ : ClkMux
    port map (
            O => \N__5987\,
            I => \N__5900\
        );

    \I__1364\ : ClkMux
    port map (
            O => \N__5986\,
            I => \N__5900\
        );

    \I__1363\ : ClkMux
    port map (
            O => \N__5985\,
            I => \N__5900\
        );

    \I__1362\ : ClkMux
    port map (
            O => \N__5984\,
            I => \N__5900\
        );

    \I__1361\ : ClkMux
    port map (
            O => \N__5983\,
            I => \N__5900\
        );

    \I__1360\ : ClkMux
    port map (
            O => \N__5982\,
            I => \N__5900\
        );

    \I__1359\ : ClkMux
    port map (
            O => \N__5981\,
            I => \N__5900\
        );

    \I__1358\ : ClkMux
    port map (
            O => \N__5980\,
            I => \N__5900\
        );

    \I__1357\ : ClkMux
    port map (
            O => \N__5979\,
            I => \N__5900\
        );

    \I__1356\ : ClkMux
    port map (
            O => \N__5978\,
            I => \N__5900\
        );

    \I__1355\ : ClkMux
    port map (
            O => \N__5977\,
            I => \N__5900\
        );

    \I__1354\ : ClkMux
    port map (
            O => \N__5976\,
            I => \N__5900\
        );

    \I__1353\ : ClkMux
    port map (
            O => \N__5975\,
            I => \N__5900\
        );

    \I__1352\ : ClkMux
    port map (
            O => \N__5974\,
            I => \N__5900\
        );

    \I__1351\ : ClkMux
    port map (
            O => \N__5973\,
            I => \N__5900\
        );

    \I__1350\ : ClkMux
    port map (
            O => \N__5972\,
            I => \N__5900\
        );

    \I__1349\ : ClkMux
    port map (
            O => \N__5971\,
            I => \N__5900\
        );

    \I__1348\ : ClkMux
    port map (
            O => \N__5970\,
            I => \N__5900\
        );

    \I__1347\ : ClkMux
    port map (
            O => \N__5969\,
            I => \N__5900\
        );

    \I__1346\ : ClkMux
    port map (
            O => \N__5968\,
            I => \N__5900\
        );

    \I__1345\ : ClkMux
    port map (
            O => \N__5967\,
            I => \N__5900\
        );

    \I__1344\ : ClkMux
    port map (
            O => \N__5966\,
            I => \N__5900\
        );

    \I__1343\ : ClkMux
    port map (
            O => \N__5965\,
            I => \N__5900\
        );

    \I__1342\ : ClkMux
    port map (
            O => \N__5964\,
            I => \N__5900\
        );

    \I__1341\ : ClkMux
    port map (
            O => \N__5963\,
            I => \N__5900\
        );

    \I__1340\ : ClkMux
    port map (
            O => \N__5962\,
            I => \N__5900\
        );

    \I__1339\ : ClkMux
    port map (
            O => \N__5961\,
            I => \N__5900\
        );

    \I__1338\ : ClkMux
    port map (
            O => \N__5960\,
            I => \N__5900\
        );

    \I__1337\ : ClkMux
    port map (
            O => \N__5959\,
            I => \N__5900\
        );

    \I__1336\ : GlobalMux
    port map (
            O => \N__5900\,
            I => \N__5897\
        );

    \I__1335\ : gio2CtrlBuf
    port map (
            O => \N__5897\,
            I => clk_system_c_g
        );

    \I__1334\ : CascadeMux
    port map (
            O => \N__5894\,
            I => \uart1.flag_reg_0_sqmuxa_0_a2_0_cascade_\
        );

    \I__1333\ : IoInMux
    port map (
            O => \N__5891\,
            I => \N__5888\
        );

    \I__1332\ : LocalMux
    port map (
            O => \N__5888\,
            I => \N__5884\
        );

    \I__1331\ : InMux
    port map (
            O => \N__5887\,
            I => \N__5881\
        );

    \I__1330\ : Odrv4
    port map (
            O => \N__5884\,
            I => data_debug_c
        );

    \I__1329\ : LocalMux
    port map (
            O => \N__5881\,
            I => data_debug_c
        );

    \I__1328\ : CascadeMux
    port map (
            O => \N__5876\,
            I => \N__5872\
        );

    \I__1327\ : InMux
    port map (
            O => \N__5875\,
            I => \N__5861\
        );

    \I__1326\ : InMux
    port map (
            O => \N__5872\,
            I => \N__5861\
        );

    \I__1325\ : InMux
    port map (
            O => \N__5871\,
            I => \N__5861\
        );

    \I__1324\ : InMux
    port map (
            O => \N__5870\,
            I => \N__5854\
        );

    \I__1323\ : InMux
    port map (
            O => \N__5869\,
            I => \N__5854\
        );

    \I__1322\ : InMux
    port map (
            O => \N__5868\,
            I => \N__5854\
        );

    \I__1321\ : LocalMux
    port map (
            O => \N__5861\,
            I => \N__5851\
        );

    \I__1320\ : LocalMux
    port map (
            O => \N__5854\,
            I => \N__5847\
        );

    \I__1319\ : Span4Mux_h
    port map (
            O => \N__5851\,
            I => \N__5844\
        );

    \I__1318\ : InMux
    port map (
            O => \N__5850\,
            I => \N__5841\
        );

    \I__1317\ : Odrv12
    port map (
            O => \N__5847\,
            I => \uart1.N_23\
        );

    \I__1316\ : Odrv4
    port map (
            O => \N__5844\,
            I => \uart1.N_23\
        );

    \I__1315\ : LocalMux
    port map (
            O => \N__5841\,
            I => \uart1.N_23\
        );

    \I__1314\ : CascadeMux
    port map (
            O => \N__5834\,
            I => \N__5831\
        );

    \I__1313\ : InMux
    port map (
            O => \N__5831\,
            I => \N__5825\
        );

    \I__1312\ : InMux
    port map (
            O => \N__5830\,
            I => \N__5825\
        );

    \I__1311\ : LocalMux
    port map (
            O => \N__5825\,
            I => \N__5821\
        );

    \I__1310\ : InMux
    port map (
            O => \N__5824\,
            I => \N__5818\
        );

    \I__1309\ : Odrv4
    port map (
            O => \N__5821\,
            I => \uart1.N_29\
        );

    \I__1308\ : LocalMux
    port map (
            O => \N__5818\,
            I => \uart1.N_29\
        );

    \I__1307\ : SRMux
    port map (
            O => \N__5813\,
            I => \N__5810\
        );

    \I__1306\ : LocalMux
    port map (
            O => \N__5810\,
            I => \N__5807\
        );

    \I__1305\ : Odrv4
    port map (
            O => \N__5807\,
            I => \uart1.un1_state_bus_0_a2_iso\
        );

    \I__1304\ : InMux
    port map (
            O => \N__5804\,
            I => \N__5797\
        );

    \I__1303\ : InMux
    port map (
            O => \N__5803\,
            I => \N__5797\
        );

    \I__1302\ : InMux
    port map (
            O => \N__5802\,
            I => \N__5794\
        );

    \I__1301\ : LocalMux
    port map (
            O => \N__5797\,
            I => data_6
        );

    \I__1300\ : LocalMux
    port map (
            O => \N__5794\,
            I => data_6
        );

    \I__1299\ : InMux
    port map (
            O => \N__5789\,
            I => \N__5784\
        );

    \I__1298\ : InMux
    port map (
            O => \N__5788\,
            I => \N__5779\
        );

    \I__1297\ : InMux
    port map (
            O => \N__5787\,
            I => \N__5779\
        );

    \I__1296\ : LocalMux
    port map (
            O => \N__5784\,
            I => \N__5776\
        );

    \I__1295\ : LocalMux
    port map (
            O => \N__5779\,
            I => data_7
        );

    \I__1294\ : Odrv4
    port map (
            O => \N__5776\,
            I => data_7
        );

    \I__1293\ : CascadeMux
    port map (
            O => \N__5771\,
            I => \N__5766\
        );

    \I__1292\ : InMux
    port map (
            O => \N__5770\,
            I => \N__5753\
        );

    \I__1291\ : InMux
    port map (
            O => \N__5769\,
            I => \N__5753\
        );

    \I__1290\ : InMux
    port map (
            O => \N__5766\,
            I => \N__5750\
        );

    \I__1289\ : InMux
    port map (
            O => \N__5765\,
            I => \N__5743\
        );

    \I__1288\ : InMux
    port map (
            O => \N__5764\,
            I => \N__5743\
        );

    \I__1287\ : InMux
    port map (
            O => \N__5763\,
            I => \N__5743\
        );

    \I__1286\ : InMux
    port map (
            O => \N__5762\,
            I => \N__5738\
        );

    \I__1285\ : InMux
    port map (
            O => \N__5761\,
            I => \N__5738\
        );

    \I__1284\ : InMux
    port map (
            O => \N__5760\,
            I => \N__5731\
        );

    \I__1283\ : InMux
    port map (
            O => \N__5759\,
            I => \N__5731\
        );

    \I__1282\ : InMux
    port map (
            O => \N__5758\,
            I => \N__5731\
        );

    \I__1281\ : LocalMux
    port map (
            O => \N__5753\,
            I => \N__5728\
        );

    \I__1280\ : LocalMux
    port map (
            O => \N__5750\,
            I => \uart1.state_busZ0Z_0\
        );

    \I__1279\ : LocalMux
    port map (
            O => \N__5743\,
            I => \uart1.state_busZ0Z_0\
        );

    \I__1278\ : LocalMux
    port map (
            O => \N__5738\,
            I => \uart1.state_busZ0Z_0\
        );

    \I__1277\ : LocalMux
    port map (
            O => \N__5731\,
            I => \uart1.state_busZ0Z_0\
        );

    \I__1276\ : Odrv4
    port map (
            O => \N__5728\,
            I => \uart1.state_busZ0Z_0\
        );

    \I__1275\ : InMux
    port map (
            O => \N__5717\,
            I => \N__5713\
        );

    \I__1274\ : InMux
    port map (
            O => \N__5716\,
            I => \N__5704\
        );

    \I__1273\ : LocalMux
    port map (
            O => \N__5713\,
            I => \N__5701\
        );

    \I__1272\ : InMux
    port map (
            O => \N__5712\,
            I => \N__5698\
        );

    \I__1271\ : InMux
    port map (
            O => \N__5711\,
            I => \N__5687\
        );

    \I__1270\ : InMux
    port map (
            O => \N__5710\,
            I => \N__5687\
        );

    \I__1269\ : InMux
    port map (
            O => \N__5709\,
            I => \N__5687\
        );

    \I__1268\ : InMux
    port map (
            O => \N__5708\,
            I => \N__5687\
        );

    \I__1267\ : InMux
    port map (
            O => \N__5707\,
            I => \N__5687\
        );

    \I__1266\ : LocalMux
    port map (
            O => \N__5704\,
            I => \uart1.state_busZ0Z_1\
        );

    \I__1265\ : Odrv4
    port map (
            O => \N__5701\,
            I => \uart1.state_busZ0Z_1\
        );

    \I__1264\ : LocalMux
    port map (
            O => \N__5698\,
            I => \uart1.state_busZ0Z_1\
        );

    \I__1263\ : LocalMux
    port map (
            O => \N__5687\,
            I => \uart1.state_busZ0Z_1\
        );

    \I__1262\ : InMux
    port map (
            O => \N__5678\,
            I => \N__5675\
        );

    \I__1261\ : LocalMux
    port map (
            O => \N__5675\,
            I => data_rdy
        );

    \I__1260\ : InMux
    port map (
            O => \N__5672\,
            I => \N__5664\
        );

    \I__1259\ : InMux
    port map (
            O => \N__5671\,
            I => \N__5664\
        );

    \I__1258\ : InMux
    port map (
            O => \N__5670\,
            I => \N__5659\
        );

    \I__1257\ : InMux
    port map (
            O => \N__5669\,
            I => \N__5659\
        );

    \I__1256\ : LocalMux
    port map (
            O => \N__5664\,
            I => data_4
        );

    \I__1255\ : LocalMux
    port map (
            O => \N__5659\,
            I => data_4
        );

    \I__1254\ : InMux
    port map (
            O => \N__5654\,
            I => \N__5645\
        );

    \I__1253\ : InMux
    port map (
            O => \N__5653\,
            I => \N__5645\
        );

    \I__1252\ : InMux
    port map (
            O => \N__5652\,
            I => \N__5638\
        );

    \I__1251\ : InMux
    port map (
            O => \N__5651\,
            I => \N__5638\
        );

    \I__1250\ : InMux
    port map (
            O => \N__5650\,
            I => \N__5638\
        );

    \I__1249\ : LocalMux
    port map (
            O => \N__5645\,
            I => data_1
        );

    \I__1248\ : LocalMux
    port map (
            O => \N__5638\,
            I => data_1
        );

    \I__1247\ : CascadeMux
    port map (
            O => \N__5633\,
            I => \N__5629\
        );

    \I__1246\ : InMux
    port map (
            O => \N__5632\,
            I => \N__5624\
        );

    \I__1245\ : InMux
    port map (
            O => \N__5629\,
            I => \N__5624\
        );

    \I__1244\ : LocalMux
    port map (
            O => \N__5624\,
            I => \uart1.positionZ1Z_1\
        );

    \I__1243\ : InMux
    port map (
            O => \N__5621\,
            I => \N__5618\
        );

    \I__1242\ : LocalMux
    port map (
            O => \N__5618\,
            I => \uart1.un1_position_c2\
        );

    \I__1241\ : InMux
    port map (
            O => \N__5615\,
            I => \N__5609\
        );

    \I__1240\ : InMux
    port map (
            O => \N__5614\,
            I => \N__5609\
        );

    \I__1239\ : LocalMux
    port map (
            O => \N__5609\,
            I => \uart1.positionZ0Z_2\
        );

    \I__1238\ : CascadeMux
    port map (
            O => \N__5606\,
            I => \uart1.un1_position_c2_cascade_\
        );

    \I__1237\ : CascadeMux
    port map (
            O => \N__5603\,
            I => \N__5600\
        );

    \I__1236\ : InMux
    port map (
            O => \N__5600\,
            I => \N__5591\
        );

    \I__1235\ : InMux
    port map (
            O => \N__5599\,
            I => \N__5591\
        );

    \I__1234\ : InMux
    port map (
            O => \N__5598\,
            I => \N__5591\
        );

    \I__1233\ : LocalMux
    port map (
            O => \N__5591\,
            I => \uart1.positionZ1Z_0\
        );

    \I__1232\ : InMux
    port map (
            O => \N__5588\,
            I => \N__5585\
        );

    \I__1231\ : LocalMux
    port map (
            O => \N__5585\,
            I => \N__5581\
        );

    \I__1230\ : InMux
    port map (
            O => \N__5584\,
            I => \N__5578\
        );

    \I__1229\ : Span4Mux_h
    port map (
            O => \N__5581\,
            I => \N__5575\
        );

    \I__1228\ : LocalMux
    port map (
            O => \N__5578\,
            I => \N__5572\
        );

    \I__1227\ : Span4Mux_h
    port map (
            O => \N__5575\,
            I => \N__5569\
        );

    \I__1226\ : Span12Mux_h
    port map (
            O => \N__5572\,
            I => \N__5566\
        );

    \I__1225\ : Odrv4
    port map (
            O => \N__5569\,
            I => sdin_c
        );

    \I__1224\ : Odrv12
    port map (
            O => \N__5566\,
            I => sdin_c
        );

    \I__1223\ : CascadeMux
    port map (
            O => \N__5561\,
            I => \uart1.N_9_i_N_2L1_cascade_\
        );

    \I__1222\ : InMux
    port map (
            O => \N__5558\,
            I => \N__5546\
        );

    \I__1221\ : InMux
    port map (
            O => \N__5557\,
            I => \N__5546\
        );

    \I__1220\ : InMux
    port map (
            O => \N__5556\,
            I => \N__5546\
        );

    \I__1219\ : InMux
    port map (
            O => \N__5555\,
            I => \N__5546\
        );

    \I__1218\ : LocalMux
    port map (
            O => \N__5546\,
            I => \uart1.data_rdy_reg13_0\
        );

    \I__1217\ : CascadeMux
    port map (
            O => \N__5543\,
            I => \uart1.data_rdy_reg13_0_cascade_\
        );

    \I__1216\ : CascadeMux
    port map (
            O => \N__5540\,
            I => \N__5536\
        );

    \I__1215\ : InMux
    port map (
            O => \N__5539\,
            I => \N__5533\
        );

    \I__1214\ : InMux
    port map (
            O => \N__5536\,
            I => \N__5530\
        );

    \I__1213\ : LocalMux
    port map (
            O => \N__5533\,
            I => \N__5525\
        );

    \I__1212\ : LocalMux
    port map (
            O => \N__5530\,
            I => \N__5525\
        );

    \I__1211\ : Odrv4
    port map (
            O => \N__5525\,
            I => \uart1.data_rdy_reg13_i_0\
        );

    \I__1210\ : InMux
    port map (
            O => \N__5522\,
            I => \N__5519\
        );

    \I__1209\ : LocalMux
    port map (
            O => \N__5519\,
            I => \N__5513\
        );

    \I__1208\ : InMux
    port map (
            O => \N__5518\,
            I => \N__5510\
        );

    \I__1207\ : InMux
    port map (
            O => \N__5517\,
            I => \N__5505\
        );

    \I__1206\ : InMux
    port map (
            O => \N__5516\,
            I => \N__5505\
        );

    \I__1205\ : Span4Mux_s3_v
    port map (
            O => \N__5513\,
            I => \N__5502\
        );

    \I__1204\ : LocalMux
    port map (
            O => \N__5510\,
            I => \uart1.positionZ0Z_3\
        );

    \I__1203\ : LocalMux
    port map (
            O => \N__5505\,
            I => \uart1.positionZ0Z_3\
        );

    \I__1202\ : Odrv4
    port map (
            O => \N__5502\,
            I => \uart1.positionZ0Z_3\
        );

    \I__1201\ : InMux
    port map (
            O => \N__5495\,
            I => \N__5492\
        );

    \I__1200\ : LocalMux
    port map (
            O => \N__5492\,
            I => \N__5488\
        );

    \I__1199\ : InMux
    port map (
            O => \N__5491\,
            I => \N__5485\
        );

    \I__1198\ : Span4Mux_h
    port map (
            O => \N__5488\,
            I => \N__5478\
        );

    \I__1197\ : LocalMux
    port map (
            O => \N__5485\,
            I => \N__5478\
        );

    \I__1196\ : InMux
    port map (
            O => \N__5484\,
            I => \N__5473\
        );

    \I__1195\ : InMux
    port map (
            O => \N__5483\,
            I => \N__5473\
        );

    \I__1194\ : Odrv4
    port map (
            O => \N__5478\,
            I => \ppm_encoder1.un1_init_pulses39_2_0\
        );

    \I__1193\ : LocalMux
    port map (
            O => \N__5473\,
            I => \ppm_encoder1.un1_init_pulses39_2_0\
        );

    \I__1192\ : InMux
    port map (
            O => \N__5468\,
            I => \N__5465\
        );

    \I__1191\ : LocalMux
    port map (
            O => \N__5465\,
            I => \N__5462\
        );

    \I__1190\ : Span4Mux_h
    port map (
            O => \N__5462\,
            I => \N__5458\
        );

    \I__1189\ : InMux
    port map (
            O => \N__5461\,
            I => \N__5455\
        );

    \I__1188\ : Odrv4
    port map (
            O => \N__5458\,
            I => \ppm_encoder1.init_pulsesZ0Z_1\
        );

    \I__1187\ : LocalMux
    port map (
            O => \N__5455\,
            I => \ppm_encoder1.init_pulsesZ0Z_1\
        );

    \I__1186\ : CascadeMux
    port map (
            O => \N__5450\,
            I => \N__5447\
        );

    \I__1185\ : InMux
    port map (
            O => \N__5447\,
            I => \N__5444\
        );

    \I__1184\ : LocalMux
    port map (
            O => \N__5444\,
            I => \ppm_encoder1.pulses2countZ0Z_1\
        );

    \I__1183\ : InMux
    port map (
            O => \N__5441\,
            I => \N__5438\
        );

    \I__1182\ : LocalMux
    port map (
            O => \N__5438\,
            I => \ppm_encoder1.counter11_0_I_1_c_RNOZ0\
        );

    \I__1181\ : InMux
    port map (
            O => \N__5435\,
            I => \N__5432\
        );

    \I__1180\ : LocalMux
    port map (
            O => \N__5432\,
            I => \N__5428\
        );

    \I__1179\ : CascadeMux
    port map (
            O => \N__5431\,
            I => \N__5425\
        );

    \I__1178\ : Span4Mux_v
    port map (
            O => \N__5428\,
            I => \N__5422\
        );

    \I__1177\ : InMux
    port map (
            O => \N__5425\,
            I => \N__5419\
        );

    \I__1176\ : Odrv4
    port map (
            O => \N__5422\,
            I => \ppm_encoder1.init_pulsesZ0Z_0\
        );

    \I__1175\ : LocalMux
    port map (
            O => \N__5419\,
            I => \ppm_encoder1.init_pulsesZ0Z_0\
        );

    \I__1174\ : InMux
    port map (
            O => \N__5414\,
            I => \N__5396\
        );

    \I__1173\ : InMux
    port map (
            O => \N__5413\,
            I => \N__5396\
        );

    \I__1172\ : InMux
    port map (
            O => \N__5412\,
            I => \N__5391\
        );

    \I__1171\ : InMux
    port map (
            O => \N__5411\,
            I => \N__5391\
        );

    \I__1170\ : InMux
    port map (
            O => \N__5410\,
            I => \N__5382\
        );

    \I__1169\ : InMux
    port map (
            O => \N__5409\,
            I => \N__5382\
        );

    \I__1168\ : InMux
    port map (
            O => \N__5408\,
            I => \N__5382\
        );

    \I__1167\ : InMux
    port map (
            O => \N__5407\,
            I => \N__5382\
        );

    \I__1166\ : InMux
    port map (
            O => \N__5406\,
            I => \N__5379\
        );

    \I__1165\ : InMux
    port map (
            O => \N__5405\,
            I => \N__5368\
        );

    \I__1164\ : InMux
    port map (
            O => \N__5404\,
            I => \N__5368\
        );

    \I__1163\ : InMux
    port map (
            O => \N__5403\,
            I => \N__5368\
        );

    \I__1162\ : InMux
    port map (
            O => \N__5402\,
            I => \N__5368\
        );

    \I__1161\ : InMux
    port map (
            O => \N__5401\,
            I => \N__5368\
        );

    \I__1160\ : LocalMux
    port map (
            O => \N__5396\,
            I => \N__5363\
        );

    \I__1159\ : LocalMux
    port map (
            O => \N__5391\,
            I => \N__5358\
        );

    \I__1158\ : LocalMux
    port map (
            O => \N__5382\,
            I => \N__5358\
        );

    \I__1157\ : LocalMux
    port map (
            O => \N__5379\,
            I => \N__5353\
        );

    \I__1156\ : LocalMux
    port map (
            O => \N__5368\,
            I => \N__5353\
        );

    \I__1155\ : InMux
    port map (
            O => \N__5367\,
            I => \N__5348\
        );

    \I__1154\ : InMux
    port map (
            O => \N__5366\,
            I => \N__5348\
        );

    \I__1153\ : Span4Mux_v
    port map (
            O => \N__5363\,
            I => \N__5344\
        );

    \I__1152\ : Span4Mux_v
    port map (
            O => \N__5358\,
            I => \N__5341\
        );

    \I__1151\ : Span4Mux_v
    port map (
            O => \N__5353\,
            I => \N__5336\
        );

    \I__1150\ : LocalMux
    port map (
            O => \N__5348\,
            I => \N__5336\
        );

    \I__1149\ : InMux
    port map (
            O => \N__5347\,
            I => \N__5333\
        );

    \I__1148\ : Odrv4
    port map (
            O => \N__5344\,
            I => \ppm_encoder1.pulses2count22_0\
        );

    \I__1147\ : Odrv4
    port map (
            O => \N__5341\,
            I => \ppm_encoder1.pulses2count22_0\
        );

    \I__1146\ : Odrv4
    port map (
            O => \N__5336\,
            I => \ppm_encoder1.pulses2count22_0\
        );

    \I__1145\ : LocalMux
    port map (
            O => \N__5333\,
            I => \ppm_encoder1.pulses2count22_0\
        );

    \I__1144\ : InMux
    port map (
            O => \N__5324\,
            I => \N__5321\
        );

    \I__1143\ : LocalMux
    port map (
            O => \N__5321\,
            I => \ppm_encoder1.pulses2countZ0Z_0\
        );

    \I__1142\ : CEMux
    port map (
            O => \N__5318\,
            I => \N__5291\
        );

    \I__1141\ : CEMux
    port map (
            O => \N__5317\,
            I => \N__5291\
        );

    \I__1140\ : CEMux
    port map (
            O => \N__5316\,
            I => \N__5291\
        );

    \I__1139\ : CEMux
    port map (
            O => \N__5315\,
            I => \N__5291\
        );

    \I__1138\ : CEMux
    port map (
            O => \N__5314\,
            I => \N__5291\
        );

    \I__1137\ : CEMux
    port map (
            O => \N__5313\,
            I => \N__5291\
        );

    \I__1136\ : CEMux
    port map (
            O => \N__5312\,
            I => \N__5291\
        );

    \I__1135\ : CEMux
    port map (
            O => \N__5311\,
            I => \N__5291\
        );

    \I__1134\ : CEMux
    port map (
            O => \N__5310\,
            I => \N__5291\
        );

    \I__1133\ : GlobalMux
    port map (
            O => \N__5291\,
            I => \N__5288\
        );

    \I__1132\ : gio2CtrlBuf
    port map (
            O => \N__5288\,
            I => \ppm_encoder1.N_31_i_g\
        );

    \I__1131\ : InMux
    port map (
            O => \N__5285\,
            I => \N__5280\
        );

    \I__1130\ : InMux
    port map (
            O => \N__5284\,
            I => \N__5277\
        );

    \I__1129\ : InMux
    port map (
            O => \N__5283\,
            I => \N__5274\
        );

    \I__1128\ : LocalMux
    port map (
            O => \N__5280\,
            I => \N__5271\
        );

    \I__1127\ : LocalMux
    port map (
            O => \N__5277\,
            I => \ppm_encoder1.counterZ0Z_15\
        );

    \I__1126\ : LocalMux
    port map (
            O => \N__5274\,
            I => \ppm_encoder1.counterZ0Z_15\
        );

    \I__1125\ : Odrv4
    port map (
            O => \N__5271\,
            I => \ppm_encoder1.counterZ0Z_15\
        );

    \I__1124\ : InMux
    port map (
            O => \N__5264\,
            I => \N__5259\
        );

    \I__1123\ : InMux
    port map (
            O => \N__5263\,
            I => \N__5256\
        );

    \I__1122\ : InMux
    port map (
            O => \N__5262\,
            I => \N__5253\
        );

    \I__1121\ : LocalMux
    port map (
            O => \N__5259\,
            I => \ppm_encoder1.counterZ0Z_1\
        );

    \I__1120\ : LocalMux
    port map (
            O => \N__5256\,
            I => \ppm_encoder1.counterZ0Z_1\
        );

    \I__1119\ : LocalMux
    port map (
            O => \N__5253\,
            I => \ppm_encoder1.counterZ0Z_1\
        );

    \I__1118\ : CascadeMux
    port map (
            O => \N__5246\,
            I => \N__5243\
        );

    \I__1117\ : InMux
    port map (
            O => \N__5243\,
            I => \N__5239\
        );

    \I__1116\ : InMux
    port map (
            O => \N__5242\,
            I => \N__5235\
        );

    \I__1115\ : LocalMux
    port map (
            O => \N__5239\,
            I => \N__5232\
        );

    \I__1114\ : InMux
    port map (
            O => \N__5238\,
            I => \N__5229\
        );

    \I__1113\ : LocalMux
    port map (
            O => \N__5235\,
            I => \ppm_encoder1.counterZ0Z_18\
        );

    \I__1112\ : Odrv4
    port map (
            O => \N__5232\,
            I => \ppm_encoder1.counterZ0Z_18\
        );

    \I__1111\ : LocalMux
    port map (
            O => \N__5229\,
            I => \ppm_encoder1.counterZ0Z_18\
        );

    \I__1110\ : InMux
    port map (
            O => \N__5222\,
            I => \N__5217\
        );

    \I__1109\ : InMux
    port map (
            O => \N__5221\,
            I => \N__5214\
        );

    \I__1108\ : InMux
    port map (
            O => \N__5220\,
            I => \N__5211\
        );

    \I__1107\ : LocalMux
    port map (
            O => \N__5217\,
            I => \N__5208\
        );

    \I__1106\ : LocalMux
    port map (
            O => \N__5214\,
            I => \ppm_encoder1.counterZ0Z_8\
        );

    \I__1105\ : LocalMux
    port map (
            O => \N__5211\,
            I => \ppm_encoder1.counterZ0Z_8\
        );

    \I__1104\ : Odrv12
    port map (
            O => \N__5208\,
            I => \ppm_encoder1.counterZ0Z_8\
        );

    \I__1103\ : CascadeMux
    port map (
            O => \N__5201\,
            I => \N__5198\
        );

    \I__1102\ : InMux
    port map (
            O => \N__5198\,
            I => \N__5195\
        );

    \I__1101\ : LocalMux
    port map (
            O => \N__5195\,
            I => \N__5192\
        );

    \I__1100\ : Odrv4
    port map (
            O => \N__5192\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_14\
        );

    \I__1099\ : InMux
    port map (
            O => \N__5189\,
            I => \N__5184\
        );

    \I__1098\ : InMux
    port map (
            O => \N__5188\,
            I => \N__5181\
        );

    \I__1097\ : InMux
    port map (
            O => \N__5187\,
            I => \N__5178\
        );

    \I__1096\ : LocalMux
    port map (
            O => \N__5184\,
            I => \N__5175\
        );

    \I__1095\ : LocalMux
    port map (
            O => \N__5181\,
            I => \ppm_encoder1.counterZ0Z_14\
        );

    \I__1094\ : LocalMux
    port map (
            O => \N__5178\,
            I => \ppm_encoder1.counterZ0Z_14\
        );

    \I__1093\ : Odrv4
    port map (
            O => \N__5175\,
            I => \ppm_encoder1.counterZ0Z_14\
        );

    \I__1092\ : InMux
    port map (
            O => \N__5168\,
            I => \N__5163\
        );

    \I__1091\ : InMux
    port map (
            O => \N__5167\,
            I => \N__5160\
        );

    \I__1090\ : InMux
    port map (
            O => \N__5166\,
            I => \N__5157\
        );

    \I__1089\ : LocalMux
    port map (
            O => \N__5163\,
            I => \ppm_encoder1.counterZ0Z_0\
        );

    \I__1088\ : LocalMux
    port map (
            O => \N__5160\,
            I => \ppm_encoder1.counterZ0Z_0\
        );

    \I__1087\ : LocalMux
    port map (
            O => \N__5157\,
            I => \ppm_encoder1.counterZ0Z_0\
        );

    \I__1086\ : CascadeMux
    port map (
            O => \N__5150\,
            I => \N__5147\
        );

    \I__1085\ : InMux
    port map (
            O => \N__5147\,
            I => \N__5144\
        );

    \I__1084\ : LocalMux
    port map (
            O => \N__5144\,
            I => \N__5141\
        );

    \I__1083\ : Odrv4
    port map (
            O => \N__5141\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_0\
        );

    \I__1082\ : InMux
    port map (
            O => \N__5138\,
            I => \N__5133\
        );

    \I__1081\ : InMux
    port map (
            O => \N__5137\,
            I => \N__5130\
        );

    \I__1080\ : InMux
    port map (
            O => \N__5136\,
            I => \N__5127\
        );

    \I__1079\ : LocalMux
    port map (
            O => \N__5133\,
            I => \N__5124\
        );

    \I__1078\ : LocalMux
    port map (
            O => \N__5130\,
            I => \ppm_encoder1.counterZ0Z_9\
        );

    \I__1077\ : LocalMux
    port map (
            O => \N__5127\,
            I => \ppm_encoder1.counterZ0Z_9\
        );

    \I__1076\ : Odrv12
    port map (
            O => \N__5124\,
            I => \ppm_encoder1.counterZ0Z_9\
        );

    \I__1075\ : InMux
    port map (
            O => \N__5117\,
            I => \N__5112\
        );

    \I__1074\ : InMux
    port map (
            O => \N__5116\,
            I => \N__5109\
        );

    \I__1073\ : InMux
    port map (
            O => \N__5115\,
            I => \N__5106\
        );

    \I__1072\ : LocalMux
    port map (
            O => \N__5112\,
            I => \ppm_encoder1.counterZ0Z_3\
        );

    \I__1071\ : LocalMux
    port map (
            O => \N__5109\,
            I => \ppm_encoder1.counterZ0Z_3\
        );

    \I__1070\ : LocalMux
    port map (
            O => \N__5106\,
            I => \ppm_encoder1.counterZ0Z_3\
        );

    \I__1069\ : CascadeMux
    port map (
            O => \N__5099\,
            I => \N__5094\
        );

    \I__1068\ : InMux
    port map (
            O => \N__5098\,
            I => \N__5091\
        );

    \I__1067\ : InMux
    port map (
            O => \N__5097\,
            I => \N__5088\
        );

    \I__1066\ : InMux
    port map (
            O => \N__5094\,
            I => \N__5085\
        );

    \I__1065\ : LocalMux
    port map (
            O => \N__5091\,
            I => \N__5082\
        );

    \I__1064\ : LocalMux
    port map (
            O => \N__5088\,
            I => \ppm_encoder1.counterZ0Z_10\
        );

    \I__1063\ : LocalMux
    port map (
            O => \N__5085\,
            I => \ppm_encoder1.counterZ0Z_10\
        );

    \I__1062\ : Odrv4
    port map (
            O => \N__5082\,
            I => \ppm_encoder1.counterZ0Z_10\
        );

    \I__1061\ : InMux
    port map (
            O => \N__5075\,
            I => \N__5070\
        );

    \I__1060\ : InMux
    port map (
            O => \N__5074\,
            I => \N__5067\
        );

    \I__1059\ : InMux
    port map (
            O => \N__5073\,
            I => \N__5064\
        );

    \I__1058\ : LocalMux
    port map (
            O => \N__5070\,
            I => \ppm_encoder1.counterZ0Z_2\
        );

    \I__1057\ : LocalMux
    port map (
            O => \N__5067\,
            I => \ppm_encoder1.counterZ0Z_2\
        );

    \I__1056\ : LocalMux
    port map (
            O => \N__5064\,
            I => \ppm_encoder1.counterZ0Z_2\
        );

    \I__1055\ : InMux
    port map (
            O => \N__5057\,
            I => \N__5054\
        );

    \I__1054\ : LocalMux
    port map (
            O => \N__5054\,
            I => \N__5051\
        );

    \I__1053\ : Odrv4
    port map (
            O => \N__5051\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_13\
        );

    \I__1052\ : CascadeMux
    port map (
            O => \N__5048\,
            I => \uart1.position_RNO_0Z0Z_1_cascade_\
        );

    \I__1051\ : InMux
    port map (
            O => \N__5045\,
            I => \N__5040\
        );

    \I__1050\ : InMux
    port map (
            O => \N__5044\,
            I => \N__5037\
        );

    \I__1049\ : CascadeMux
    port map (
            O => \N__5043\,
            I => \N__5030\
        );

    \I__1048\ : LocalMux
    port map (
            O => \N__5040\,
            I => \N__5025\
        );

    \I__1047\ : LocalMux
    port map (
            O => \N__5037\,
            I => \N__5025\
        );

    \I__1046\ : InMux
    port map (
            O => \N__5036\,
            I => \N__5020\
        );

    \I__1045\ : InMux
    port map (
            O => \N__5035\,
            I => \N__5020\
        );

    \I__1044\ : CascadeMux
    port map (
            O => \N__5034\,
            I => \N__5017\
        );

    \I__1043\ : CascadeMux
    port map (
            O => \N__5033\,
            I => \N__5014\
        );

    \I__1042\ : InMux
    port map (
            O => \N__5030\,
            I => \N__5010\
        );

    \I__1041\ : Span4Mux_v
    port map (
            O => \N__5025\,
            I => \N__5004\
        );

    \I__1040\ : LocalMux
    port map (
            O => \N__5020\,
            I => \N__5004\
        );

    \I__1039\ : InMux
    port map (
            O => \N__5017\,
            I => \N__4996\
        );

    \I__1038\ : InMux
    port map (
            O => \N__5014\,
            I => \N__4996\
        );

    \I__1037\ : InMux
    port map (
            O => \N__5013\,
            I => \N__4996\
        );

    \I__1036\ : LocalMux
    port map (
            O => \N__5010\,
            I => \N__4993\
        );

    \I__1035\ : InMux
    port map (
            O => \N__5009\,
            I => \N__4990\
        );

    \I__1034\ : Span4Mux_h
    port map (
            O => \N__5004\,
            I => \N__4987\
        );

    \I__1033\ : InMux
    port map (
            O => \N__5003\,
            I => \N__4984\
        );

    \I__1032\ : LocalMux
    port map (
            O => \N__4996\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\
        );

    \I__1031\ : Odrv12
    port map (
            O => \N__4993\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\
        );

    \I__1030\ : LocalMux
    port map (
            O => \N__4990\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\
        );

    \I__1029\ : Odrv4
    port map (
            O => \N__4987\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\
        );

    \I__1028\ : LocalMux
    port map (
            O => \N__4984\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\
        );

    \I__1027\ : InMux
    port map (
            O => \N__4973\,
            I => \N__4964\
        );

    \I__1026\ : InMux
    port map (
            O => \N__4972\,
            I => \N__4964\
        );

    \I__1025\ : InMux
    port map (
            O => \N__4971\,
            I => \N__4958\
        );

    \I__1024\ : InMux
    port map (
            O => \N__4970\,
            I => \N__4954\
        );

    \I__1023\ : CascadeMux
    port map (
            O => \N__4969\,
            I => \N__4951\
        );

    \I__1022\ : LocalMux
    port map (
            O => \N__4964\,
            I => \N__4948\
        );

    \I__1021\ : InMux
    port map (
            O => \N__4963\,
            I => \N__4945\
        );

    \I__1020\ : InMux
    port map (
            O => \N__4962\,
            I => \N__4940\
        );

    \I__1019\ : InMux
    port map (
            O => \N__4961\,
            I => \N__4940\
        );

    \I__1018\ : LocalMux
    port map (
            O => \N__4958\,
            I => \N__4937\
        );

    \I__1017\ : InMux
    port map (
            O => \N__4957\,
            I => \N__4934\
        );

    \I__1016\ : LocalMux
    port map (
            O => \N__4954\,
            I => \N__4931\
        );

    \I__1015\ : InMux
    port map (
            O => \N__4951\,
            I => \N__4928\
        );

    \I__1014\ : Span4Mux_v
    port map (
            O => \N__4948\,
            I => \N__4916\
        );

    \I__1013\ : LocalMux
    port map (
            O => \N__4945\,
            I => \N__4916\
        );

    \I__1012\ : LocalMux
    port map (
            O => \N__4940\,
            I => \N__4916\
        );

    \I__1011\ : Span4Mux_h
    port map (
            O => \N__4937\,
            I => \N__4912\
        );

    \I__1010\ : LocalMux
    port map (
            O => \N__4934\,
            I => \N__4909\
        );

    \I__1009\ : Span12Mux_s8_v
    port map (
            O => \N__4931\,
            I => \N__4904\
        );

    \I__1008\ : LocalMux
    port map (
            O => \N__4928\,
            I => \N__4904\
        );

    \I__1007\ : InMux
    port map (
            O => \N__4927\,
            I => \N__4895\
        );

    \I__1006\ : InMux
    port map (
            O => \N__4926\,
            I => \N__4895\
        );

    \I__1005\ : InMux
    port map (
            O => \N__4925\,
            I => \N__4895\
        );

    \I__1004\ : InMux
    port map (
            O => \N__4924\,
            I => \N__4895\
        );

    \I__1003\ : InMux
    port map (
            O => \N__4923\,
            I => \N__4892\
        );

    \I__1002\ : Span4Mux_h
    port map (
            O => \N__4916\,
            I => \N__4889\
        );

    \I__1001\ : InMux
    port map (
            O => \N__4915\,
            I => \N__4886\
        );

    \I__1000\ : Odrv4
    port map (
            O => \N__4912\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__999\ : Odrv12
    port map (
            O => \N__4909\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__998\ : Odrv12
    port map (
            O => \N__4904\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__997\ : LocalMux
    port map (
            O => \N__4895\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__996\ : LocalMux
    port map (
            O => \N__4892\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__995\ : Odrv4
    port map (
            O => \N__4889\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__994\ : LocalMux
    port map (
            O => \N__4886\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\
        );

    \I__993\ : InMux
    port map (
            O => \N__4871\,
            I => \N__4868\
        );

    \I__992\ : LocalMux
    port map (
            O => \N__4868\,
            I => \N__4864\
        );

    \I__991\ : InMux
    port map (
            O => \N__4867\,
            I => \N__4861\
        );

    \I__990\ : Span4Mux_v
    port map (
            O => \N__4864\,
            I => \N__4856\
        );

    \I__989\ : LocalMux
    port map (
            O => \N__4861\,
            I => \N__4856\
        );

    \I__988\ : Odrv4
    port map (
            O => \N__4856\,
            I => \ppm_encoder1.N_146_1\
        );

    \I__987\ : CascadeMux
    port map (
            O => \N__4853\,
            I => \N__4845\
        );

    \I__986\ : CascadeMux
    port map (
            O => \N__4852\,
            I => \N__4841\
        );

    \I__985\ : InMux
    port map (
            O => \N__4851\,
            I => \N__4836\
        );

    \I__984\ : InMux
    port map (
            O => \N__4850\,
            I => \N__4836\
        );

    \I__983\ : InMux
    port map (
            O => \N__4849\,
            I => \N__4832\
        );

    \I__982\ : InMux
    port map (
            O => \N__4848\,
            I => \N__4829\
        );

    \I__981\ : InMux
    port map (
            O => \N__4845\,
            I => \N__4822\
        );

    \I__980\ : InMux
    port map (
            O => \N__4844\,
            I => \N__4822\
        );

    \I__979\ : InMux
    port map (
            O => \N__4841\,
            I => \N__4822\
        );

    \I__978\ : LocalMux
    port map (
            O => \N__4836\,
            I => \N__4816\
        );

    \I__977\ : CascadeMux
    port map (
            O => \N__4835\,
            I => \N__4813\
        );

    \I__976\ : LocalMux
    port map (
            O => \N__4832\,
            I => \N__4806\
        );

    \I__975\ : LocalMux
    port map (
            O => \N__4829\,
            I => \N__4806\
        );

    \I__974\ : LocalMux
    port map (
            O => \N__4822\,
            I => \N__4806\
        );

    \I__973\ : InMux
    port map (
            O => \N__4821\,
            I => \N__4798\
        );

    \I__972\ : InMux
    port map (
            O => \N__4820\,
            I => \N__4798\
        );

    \I__971\ : InMux
    port map (
            O => \N__4819\,
            I => \N__4798\
        );

    \I__970\ : Span4Mux_h
    port map (
            O => \N__4816\,
            I => \N__4795\
        );

    \I__969\ : InMux
    port map (
            O => \N__4813\,
            I => \N__4792\
        );

    \I__968\ : Span4Mux_v
    port map (
            O => \N__4806\,
            I => \N__4789\
        );

    \I__967\ : InMux
    port map (
            O => \N__4805\,
            I => \N__4786\
        );

    \I__966\ : LocalMux
    port map (
            O => \N__4798\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\
        );

    \I__965\ : Odrv4
    port map (
            O => \N__4795\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\
        );

    \I__964\ : LocalMux
    port map (
            O => \N__4792\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\
        );

    \I__963\ : Odrv4
    port map (
            O => \N__4789\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\
        );

    \I__962\ : LocalMux
    port map (
            O => \N__4786\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\
        );

    \I__961\ : CascadeMux
    port map (
            O => \N__4775\,
            I => \N__4772\
        );

    \I__960\ : InMux
    port map (
            O => \N__4772\,
            I => \N__4768\
        );

    \I__959\ : InMux
    port map (
            O => \N__4771\,
            I => \N__4765\
        );

    \I__958\ : LocalMux
    port map (
            O => \N__4768\,
            I => \N__4757\
        );

    \I__957\ : LocalMux
    port map (
            O => \N__4765\,
            I => \N__4757\
        );

    \I__956\ : InMux
    port map (
            O => \N__4764\,
            I => \N__4752\
        );

    \I__955\ : InMux
    port map (
            O => \N__4763\,
            I => \N__4752\
        );

    \I__954\ : InMux
    port map (
            O => \N__4762\,
            I => \N__4749\
        );

    \I__953\ : Span4Mux_v
    port map (
            O => \N__4757\,
            I => \N__4738\
        );

    \I__952\ : LocalMux
    port map (
            O => \N__4752\,
            I => \N__4738\
        );

    \I__951\ : LocalMux
    port map (
            O => \N__4749\,
            I => \N__4738\
        );

    \I__950\ : InMux
    port map (
            O => \N__4748\,
            I => \N__4732\
        );

    \I__949\ : InMux
    port map (
            O => \N__4747\,
            I => \N__4732\
        );

    \I__948\ : InMux
    port map (
            O => \N__4746\,
            I => \N__4729\
        );

    \I__947\ : InMux
    port map (
            O => \N__4745\,
            I => \N__4726\
        );

    \I__946\ : Span4Mux_h
    port map (
            O => \N__4738\,
            I => \N__4723\
        );

    \I__945\ : InMux
    port map (
            O => \N__4737\,
            I => \N__4720\
        );

    \I__944\ : LocalMux
    port map (
            O => \N__4732\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\
        );

    \I__943\ : LocalMux
    port map (
            O => \N__4729\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\
        );

    \I__942\ : LocalMux
    port map (
            O => \N__4726\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\
        );

    \I__941\ : Odrv4
    port map (
            O => \N__4723\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\
        );

    \I__940\ : LocalMux
    port map (
            O => \N__4720\,
            I => \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\
        );

    \I__939\ : CascadeMux
    port map (
            O => \N__4709\,
            I => \ppm_encoder1.N_146_1_cascade_\
        );

    \I__938\ : CascadeMux
    port map (
            O => \N__4706\,
            I => \N__4703\
        );

    \I__937\ : InMux
    port map (
            O => \N__4703\,
            I => \N__4699\
        );

    \I__936\ : InMux
    port map (
            O => \N__4702\,
            I => \N__4696\
        );

    \I__935\ : LocalMux
    port map (
            O => \N__4699\,
            I => \ppm_encoder1.N_39\
        );

    \I__934\ : LocalMux
    port map (
            O => \N__4696\,
            I => \ppm_encoder1.N_39\
        );

    \I__933\ : IoInMux
    port map (
            O => \N__4691\,
            I => \N__4688\
        );

    \I__932\ : LocalMux
    port map (
            O => \N__4688\,
            I => \N__4685\
        );

    \I__931\ : Span12Mux_s0_v
    port map (
            O => \N__4685\,
            I => \N__4682\
        );

    \I__930\ : Span12Mux_v
    port map (
            O => \N__4682\,
            I => \N__4679\
        );

    \I__929\ : Odrv12
    port map (
            O => \N__4679\,
            I => \ppm_encoder1.N_31_i\
        );

    \I__928\ : InMux
    port map (
            O => \N__4676\,
            I => \N__4673\
        );

    \I__927\ : LocalMux
    port map (
            O => \N__4673\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_16\
        );

    \I__926\ : InMux
    port map (
            O => \N__4670\,
            I => \N__4667\
        );

    \I__925\ : LocalMux
    port map (
            O => \N__4667\,
            I => \N__4663\
        );

    \I__924\ : InMux
    port map (
            O => \N__4666\,
            I => \N__4660\
        );

    \I__923\ : Span4Mux_h
    port map (
            O => \N__4663\,
            I => \N__4655\
        );

    \I__922\ : LocalMux
    port map (
            O => \N__4660\,
            I => \N__4655\
        );

    \I__921\ : Span4Mux_h
    port map (
            O => \N__4655\,
            I => \N__4651\
        );

    \I__920\ : InMux
    port map (
            O => \N__4654\,
            I => \N__4648\
        );

    \I__919\ : Odrv4
    port map (
            O => \N__4651\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1\
        );

    \I__918\ : LocalMux
    port map (
            O => \N__4648\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1\
        );

    \I__917\ : InMux
    port map (
            O => \N__4643\,
            I => \N__4639\
        );

    \I__916\ : InMux
    port map (
            O => \N__4642\,
            I => \N__4636\
        );

    \I__915\ : LocalMux
    port map (
            O => \N__4639\,
            I => \N__4633\
        );

    \I__914\ : LocalMux
    port map (
            O => \N__4636\,
            I => \N__4630\
        );

    \I__913\ : Span4Mux_v
    port map (
            O => \N__4633\,
            I => \N__4627\
        );

    \I__912\ : Odrv12
    port map (
            O => \N__4630\,
            I => \ppm_encoder1.pulses2count39_0\
        );

    \I__911\ : Odrv4
    port map (
            O => \N__4627\,
            I => \ppm_encoder1.pulses2count39_0\
        );

    \I__910\ : CascadeMux
    port map (
            O => \N__4622\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_cascade_\
        );

    \I__909\ : InMux
    port map (
            O => \N__4619\,
            I => \N__4598\
        );

    \I__908\ : InMux
    port map (
            O => \N__4618\,
            I => \N__4591\
        );

    \I__907\ : InMux
    port map (
            O => \N__4617\,
            I => \N__4591\
        );

    \I__906\ : InMux
    port map (
            O => \N__4616\,
            I => \N__4591\
        );

    \I__905\ : InMux
    port map (
            O => \N__4615\,
            I => \N__4580\
        );

    \I__904\ : InMux
    port map (
            O => \N__4614\,
            I => \N__4580\
        );

    \I__903\ : InMux
    port map (
            O => \N__4613\,
            I => \N__4580\
        );

    \I__902\ : InMux
    port map (
            O => \N__4612\,
            I => \N__4580\
        );

    \I__901\ : InMux
    port map (
            O => \N__4611\,
            I => \N__4580\
        );

    \I__900\ : InMux
    port map (
            O => \N__4610\,
            I => \N__4575\
        );

    \I__899\ : InMux
    port map (
            O => \N__4609\,
            I => \N__4575\
        );

    \I__898\ : InMux
    port map (
            O => \N__4608\,
            I => \N__4566\
        );

    \I__897\ : InMux
    port map (
            O => \N__4607\,
            I => \N__4566\
        );

    \I__896\ : InMux
    port map (
            O => \N__4606\,
            I => \N__4566\
        );

    \I__895\ : InMux
    port map (
            O => \N__4605\,
            I => \N__4566\
        );

    \I__894\ : InMux
    port map (
            O => \N__4604\,
            I => \N__4555\
        );

    \I__893\ : InMux
    port map (
            O => \N__4603\,
            I => \N__4555\
        );

    \I__892\ : InMux
    port map (
            O => \N__4602\,
            I => \N__4555\
        );

    \I__891\ : InMux
    port map (
            O => \N__4601\,
            I => \N__4555\
        );

    \I__890\ : LocalMux
    port map (
            O => \N__4598\,
            I => \N__4550\
        );

    \I__889\ : LocalMux
    port map (
            O => \N__4591\,
            I => \N__4550\
        );

    \I__888\ : LocalMux
    port map (
            O => \N__4580\,
            I => \N__4547\
        );

    \I__887\ : LocalMux
    port map (
            O => \N__4575\,
            I => \N__4542\
        );

    \I__886\ : LocalMux
    port map (
            O => \N__4566\,
            I => \N__4542\
        );

    \I__885\ : InMux
    port map (
            O => \N__4565\,
            I => \N__4539\
        );

    \I__884\ : InMux
    port map (
            O => \N__4564\,
            I => \N__4536\
        );

    \I__883\ : LocalMux
    port map (
            O => \N__4555\,
            I => \N__4529\
        );

    \I__882\ : Span4Mux_v
    port map (
            O => \N__4550\,
            I => \N__4529\
        );

    \I__881\ : Span4Mux_h
    port map (
            O => \N__4547\,
            I => \N__4524\
        );

    \I__880\ : Span4Mux_v
    port map (
            O => \N__4542\,
            I => \N__4524\
        );

    \I__879\ : LocalMux
    port map (
            O => \N__4539\,
            I => \N__4519\
        );

    \I__878\ : LocalMux
    port map (
            O => \N__4536\,
            I => \N__4519\
        );

    \I__877\ : InMux
    port map (
            O => \N__4535\,
            I => \N__4516\
        );

    \I__876\ : InMux
    port map (
            O => \N__4534\,
            I => \N__4513\
        );

    \I__875\ : Odrv4
    port map (
            O => \N__4529\,
            I => \ppm_encoder1.counter11_0_N_2_THRU_CO\
        );

    \I__874\ : Odrv4
    port map (
            O => \N__4524\,
            I => \ppm_encoder1.counter11_0_N_2_THRU_CO\
        );

    \I__873\ : Odrv4
    port map (
            O => \N__4519\,
            I => \ppm_encoder1.counter11_0_N_2_THRU_CO\
        );

    \I__872\ : LocalMux
    port map (
            O => \N__4516\,
            I => \ppm_encoder1.counter11_0_N_2_THRU_CO\
        );

    \I__871\ : LocalMux
    port map (
            O => \N__4513\,
            I => \ppm_encoder1.counter11_0_N_2_THRU_CO\
        );

    \I__870\ : IoInMux
    port map (
            O => \N__4502\,
            I => \N__4499\
        );

    \I__869\ : LocalMux
    port map (
            O => \N__4499\,
            I => \N__4496\
        );

    \I__868\ : Odrv12
    port map (
            O => \N__4496\,
            I => \ppm_encoder1.un1_PPM_STATE_0_sqmuxa_0_i\
        );

    \I__867\ : InMux
    port map (
            O => \N__4493\,
            I => \N__4489\
        );

    \I__866\ : InMux
    port map (
            O => \N__4492\,
            I => \N__4485\
        );

    \I__865\ : LocalMux
    port map (
            O => \N__4489\,
            I => \N__4482\
        );

    \I__864\ : InMux
    port map (
            O => \N__4488\,
            I => \N__4479\
        );

    \I__863\ : LocalMux
    port map (
            O => \N__4485\,
            I => \ppm_encoder1.counterZ0Z_5\
        );

    \I__862\ : Odrv4
    port map (
            O => \N__4482\,
            I => \ppm_encoder1.counterZ0Z_5\
        );

    \I__861\ : LocalMux
    port map (
            O => \N__4479\,
            I => \ppm_encoder1.counterZ0Z_5\
        );

    \I__860\ : CascadeMux
    port map (
            O => \N__4472\,
            I => \N__4468\
        );

    \I__859\ : InMux
    port map (
            O => \N__4471\,
            I => \N__4463\
        );

    \I__858\ : InMux
    port map (
            O => \N__4468\,
            I => \N__4458\
        );

    \I__857\ : InMux
    port map (
            O => \N__4467\,
            I => \N__4458\
        );

    \I__856\ : InMux
    port map (
            O => \N__4466\,
            I => \N__4454\
        );

    \I__855\ : LocalMux
    port map (
            O => \N__4463\,
            I => \N__4451\
        );

    \I__854\ : LocalMux
    port map (
            O => \N__4458\,
            I => \N__4448\
        );

    \I__853\ : InMux
    port map (
            O => \N__4457\,
            I => \N__4445\
        );

    \I__852\ : LocalMux
    port map (
            O => \N__4454\,
            I => \N__4441\
        );

    \I__851\ : Span4Mux_h
    port map (
            O => \N__4451\,
            I => \N__4434\
        );

    \I__850\ : Span4Mux_h
    port map (
            O => \N__4448\,
            I => \N__4431\
        );

    \I__849\ : LocalMux
    port map (
            O => \N__4445\,
            I => \N__4428\
        );

    \I__848\ : InMux
    port map (
            O => \N__4444\,
            I => \N__4425\
        );

    \I__847\ : Span4Mux_h
    port map (
            O => \N__4441\,
            I => \N__4422\
        );

    \I__846\ : InMux
    port map (
            O => \N__4440\,
            I => \N__4417\
        );

    \I__845\ : InMux
    port map (
            O => \N__4439\,
            I => \N__4417\
        );

    \I__844\ : InMux
    port map (
            O => \N__4438\,
            I => \N__4412\
        );

    \I__843\ : InMux
    port map (
            O => \N__4437\,
            I => \N__4412\
        );

    \I__842\ : Odrv4
    port map (
            O => \N__4434\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__841\ : Odrv4
    port map (
            O => \N__4431\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__840\ : Odrv12
    port map (
            O => \N__4428\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__839\ : LocalMux
    port map (
            O => \N__4425\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__838\ : Odrv4
    port map (
            O => \N__4422\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__837\ : LocalMux
    port map (
            O => \N__4417\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__836\ : LocalMux
    port map (
            O => \N__4412\,
            I => \ppm_encoder1.PPM_STATEZ0Z_1\
        );

    \I__835\ : InMux
    port map (
            O => \N__4397\,
            I => \N__4391\
        );

    \I__834\ : InMux
    port map (
            O => \N__4396\,
            I => \N__4383\
        );

    \I__833\ : InMux
    port map (
            O => \N__4395\,
            I => \N__4383\
        );

    \I__832\ : InMux
    port map (
            O => \N__4394\,
            I => \N__4379\
        );

    \I__831\ : LocalMux
    port map (
            O => \N__4391\,
            I => \N__4376\
        );

    \I__830\ : InMux
    port map (
            O => \N__4390\,
            I => \N__4371\
        );

    \I__829\ : InMux
    port map (
            O => \N__4389\,
            I => \N__4371\
        );

    \I__828\ : InMux
    port map (
            O => \N__4388\,
            I => \N__4367\
        );

    \I__827\ : LocalMux
    port map (
            O => \N__4383\,
            I => \N__4364\
        );

    \I__826\ : InMux
    port map (
            O => \N__4382\,
            I => \N__4361\
        );

    \I__825\ : LocalMux
    port map (
            O => \N__4379\,
            I => \N__4356\
        );

    \I__824\ : Span4Mux_v
    port map (
            O => \N__4376\,
            I => \N__4356\
        );

    \I__823\ : LocalMux
    port map (
            O => \N__4371\,
            I => \N__4353\
        );

    \I__822\ : InMux
    port map (
            O => \N__4370\,
            I => \N__4350\
        );

    \I__821\ : LocalMux
    port map (
            O => \N__4367\,
            I => \ppm_encoder1.PPM_STATEZ0Z_0\
        );

    \I__820\ : Odrv4
    port map (
            O => \N__4364\,
            I => \ppm_encoder1.PPM_STATEZ0Z_0\
        );

    \I__819\ : LocalMux
    port map (
            O => \N__4361\,
            I => \ppm_encoder1.PPM_STATEZ0Z_0\
        );

    \I__818\ : Odrv4
    port map (
            O => \N__4356\,
            I => \ppm_encoder1.PPM_STATEZ0Z_0\
        );

    \I__817\ : Odrv4
    port map (
            O => \N__4353\,
            I => \ppm_encoder1.PPM_STATEZ0Z_0\
        );

    \I__816\ : LocalMux
    port map (
            O => \N__4350\,
            I => \ppm_encoder1.PPM_STATEZ0Z_0\
        );

    \I__815\ : InMux
    port map (
            O => \N__4337\,
            I => \N__4334\
        );

    \I__814\ : LocalMux
    port map (
            O => \N__4334\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_15\
        );

    \I__813\ : InMux
    port map (
            O => \N__4331\,
            I => \ppm_encoder1.un1_counter_13_cry_17\
        );

    \I__812\ : SRMux
    port map (
            O => \N__4328\,
            I => \N__4319\
        );

    \I__811\ : SRMux
    port map (
            O => \N__4327\,
            I => \N__4319\
        );

    \I__810\ : SRMux
    port map (
            O => \N__4326\,
            I => \N__4319\
        );

    \I__809\ : GlobalMux
    port map (
            O => \N__4319\,
            I => \N__4316\
        );

    \I__808\ : gio2CtrlBuf
    port map (
            O => \N__4316\,
            I => \ppm_encoder1.un1_PPM_STATE_0_sqmuxa_0_i_g\
        );

    \I__807\ : InMux
    port map (
            O => \N__4313\,
            I => \N__4289\
        );

    \I__806\ : InMux
    port map (
            O => \N__4312\,
            I => \N__4289\
        );

    \I__805\ : InMux
    port map (
            O => \N__4311\,
            I => \N__4289\
        );

    \I__804\ : InMux
    port map (
            O => \N__4310\,
            I => \N__4289\
        );

    \I__803\ : InMux
    port map (
            O => \N__4309\,
            I => \N__4289\
        );

    \I__802\ : InMux
    port map (
            O => \N__4308\,
            I => \N__4289\
        );

    \I__801\ : InMux
    port map (
            O => \N__4307\,
            I => \N__4289\
        );

    \I__800\ : InMux
    port map (
            O => \N__4306\,
            I => \N__4289\
        );

    \I__799\ : LocalMux
    port map (
            O => \N__4289\,
            I => \uart1.un1_state_bus_1_0\
        );

    \I__798\ : InMux
    port map (
            O => \N__4286\,
            I => \ppm_encoder1.un1_counter_13_cry_9\
        );

    \I__797\ : InMux
    port map (
            O => \N__4283\,
            I => \N__4278\
        );

    \I__796\ : InMux
    port map (
            O => \N__4282\,
            I => \N__4275\
        );

    \I__795\ : InMux
    port map (
            O => \N__4281\,
            I => \N__4272\
        );

    \I__794\ : LocalMux
    port map (
            O => \N__4278\,
            I => \N__4269\
        );

    \I__793\ : LocalMux
    port map (
            O => \N__4275\,
            I => \ppm_encoder1.counterZ0Z_11\
        );

    \I__792\ : LocalMux
    port map (
            O => \N__4272\,
            I => \ppm_encoder1.counterZ0Z_11\
        );

    \I__791\ : Odrv4
    port map (
            O => \N__4269\,
            I => \ppm_encoder1.counterZ0Z_11\
        );

    \I__790\ : InMux
    port map (
            O => \N__4262\,
            I => \ppm_encoder1.un1_counter_13_cry_10\
        );

    \I__789\ : InMux
    port map (
            O => \N__4259\,
            I => \N__4255\
        );

    \I__788\ : InMux
    port map (
            O => \N__4258\,
            I => \N__4251\
        );

    \I__787\ : LocalMux
    port map (
            O => \N__4255\,
            I => \N__4248\
        );

    \I__786\ : InMux
    port map (
            O => \N__4254\,
            I => \N__4245\
        );

    \I__785\ : LocalMux
    port map (
            O => \N__4251\,
            I => \ppm_encoder1.counterZ0Z_12\
        );

    \I__784\ : Odrv4
    port map (
            O => \N__4248\,
            I => \ppm_encoder1.counterZ0Z_12\
        );

    \I__783\ : LocalMux
    port map (
            O => \N__4245\,
            I => \ppm_encoder1.counterZ0Z_12\
        );

    \I__782\ : InMux
    port map (
            O => \N__4238\,
            I => \ppm_encoder1.un1_counter_13_cry_11\
        );

    \I__781\ : InMux
    port map (
            O => \N__4235\,
            I => \N__4230\
        );

    \I__780\ : InMux
    port map (
            O => \N__4234\,
            I => \N__4225\
        );

    \I__779\ : InMux
    port map (
            O => \N__4233\,
            I => \N__4225\
        );

    \I__778\ : LocalMux
    port map (
            O => \N__4230\,
            I => \ppm_encoder1.counterZ0Z_13\
        );

    \I__777\ : LocalMux
    port map (
            O => \N__4225\,
            I => \ppm_encoder1.counterZ0Z_13\
        );

    \I__776\ : InMux
    port map (
            O => \N__4220\,
            I => \ppm_encoder1.un1_counter_13_cry_12\
        );

    \I__775\ : InMux
    port map (
            O => \N__4217\,
            I => \ppm_encoder1.un1_counter_13_cry_13\
        );

    \I__774\ : InMux
    port map (
            O => \N__4214\,
            I => \ppm_encoder1.un1_counter_13_cry_14\
        );

    \I__773\ : CascadeMux
    port map (
            O => \N__4211\,
            I => \N__4208\
        );

    \I__772\ : InMux
    port map (
            O => \N__4208\,
            I => \N__4203\
        );

    \I__771\ : InMux
    port map (
            O => \N__4207\,
            I => \N__4200\
        );

    \I__770\ : InMux
    port map (
            O => \N__4206\,
            I => \N__4197\
        );

    \I__769\ : LocalMux
    port map (
            O => \N__4203\,
            I => \N__4192\
        );

    \I__768\ : LocalMux
    port map (
            O => \N__4200\,
            I => \N__4192\
        );

    \I__767\ : LocalMux
    port map (
            O => \N__4197\,
            I => \ppm_encoder1.counterZ0Z_16\
        );

    \I__766\ : Odrv4
    port map (
            O => \N__4192\,
            I => \ppm_encoder1.counterZ0Z_16\
        );

    \I__765\ : InMux
    port map (
            O => \N__4187\,
            I => \bfn_11_28_0_\
        );

    \I__764\ : InMux
    port map (
            O => \N__4184\,
            I => \N__4181\
        );

    \I__763\ : LocalMux
    port map (
            O => \N__4181\,
            I => \N__4176\
        );

    \I__762\ : InMux
    port map (
            O => \N__4180\,
            I => \N__4173\
        );

    \I__761\ : InMux
    port map (
            O => \N__4179\,
            I => \N__4170\
        );

    \I__760\ : Span4Mux_h
    port map (
            O => \N__4176\,
            I => \N__4167\
        );

    \I__759\ : LocalMux
    port map (
            O => \N__4173\,
            I => \N__4164\
        );

    \I__758\ : LocalMux
    port map (
            O => \N__4170\,
            I => \ppm_encoder1.counterZ0Z_17\
        );

    \I__757\ : Odrv4
    port map (
            O => \N__4167\,
            I => \ppm_encoder1.counterZ0Z_17\
        );

    \I__756\ : Odrv4
    port map (
            O => \N__4164\,
            I => \ppm_encoder1.counterZ0Z_17\
        );

    \I__755\ : InMux
    port map (
            O => \N__4157\,
            I => \ppm_encoder1.un1_counter_13_cry_16\
        );

    \I__754\ : InMux
    port map (
            O => \N__4154\,
            I => \ppm_encoder1.un1_counter_13_cry_0\
        );

    \I__753\ : InMux
    port map (
            O => \N__4151\,
            I => \ppm_encoder1.un1_counter_13_cry_1\
        );

    \I__752\ : InMux
    port map (
            O => \N__4148\,
            I => \ppm_encoder1.un1_counter_13_cry_2\
        );

    \I__751\ : InMux
    port map (
            O => \N__4145\,
            I => \N__4140\
        );

    \I__750\ : InMux
    port map (
            O => \N__4144\,
            I => \N__4137\
        );

    \I__749\ : InMux
    port map (
            O => \N__4143\,
            I => \N__4134\
        );

    \I__748\ : LocalMux
    port map (
            O => \N__4140\,
            I => \ppm_encoder1.counterZ0Z_4\
        );

    \I__747\ : LocalMux
    port map (
            O => \N__4137\,
            I => \ppm_encoder1.counterZ0Z_4\
        );

    \I__746\ : LocalMux
    port map (
            O => \N__4134\,
            I => \ppm_encoder1.counterZ0Z_4\
        );

    \I__745\ : InMux
    port map (
            O => \N__4127\,
            I => \ppm_encoder1.un1_counter_13_cry_3\
        );

    \I__744\ : InMux
    port map (
            O => \N__4124\,
            I => \ppm_encoder1.un1_counter_13_cry_4\
        );

    \I__743\ : InMux
    port map (
            O => \N__4121\,
            I => \N__4116\
        );

    \I__742\ : InMux
    port map (
            O => \N__4120\,
            I => \N__4111\
        );

    \I__741\ : InMux
    port map (
            O => \N__4119\,
            I => \N__4111\
        );

    \I__740\ : LocalMux
    port map (
            O => \N__4116\,
            I => \ppm_encoder1.counterZ0Z_6\
        );

    \I__739\ : LocalMux
    port map (
            O => \N__4111\,
            I => \ppm_encoder1.counterZ0Z_6\
        );

    \I__738\ : InMux
    port map (
            O => \N__4106\,
            I => \ppm_encoder1.un1_counter_13_cry_5\
        );

    \I__737\ : CascadeMux
    port map (
            O => \N__4103\,
            I => \N__4099\
        );

    \I__736\ : InMux
    port map (
            O => \N__4102\,
            I => \N__4095\
        );

    \I__735\ : InMux
    port map (
            O => \N__4099\,
            I => \N__4092\
        );

    \I__734\ : InMux
    port map (
            O => \N__4098\,
            I => \N__4089\
        );

    \I__733\ : LocalMux
    port map (
            O => \N__4095\,
            I => \ppm_encoder1.counterZ0Z_7\
        );

    \I__732\ : LocalMux
    port map (
            O => \N__4092\,
            I => \ppm_encoder1.counterZ0Z_7\
        );

    \I__731\ : LocalMux
    port map (
            O => \N__4089\,
            I => \ppm_encoder1.counterZ0Z_7\
        );

    \I__730\ : InMux
    port map (
            O => \N__4082\,
            I => \ppm_encoder1.un1_counter_13_cry_6\
        );

    \I__729\ : InMux
    port map (
            O => \N__4079\,
            I => \bfn_11_27_0_\
        );

    \I__728\ : InMux
    port map (
            O => \N__4076\,
            I => \ppm_encoder1.un1_counter_13_cry_8\
        );

    \I__727\ : InMux
    port map (
            O => \N__4073\,
            I => \N__4070\
        );

    \I__726\ : LocalMux
    port map (
            O => \N__4070\,
            I => \N__4067\
        );

    \I__725\ : Odrv4
    port map (
            O => \N__4067\,
            I => \ppm_encoder1.counter11_0_I_57_c_RNOZ0\
        );

    \I__724\ : CascadeMux
    port map (
            O => \N__4064\,
            I => \N__4060\
        );

    \I__723\ : CascadeMux
    port map (
            O => \N__4063\,
            I => \N__4057\
        );

    \I__722\ : InMux
    port map (
            O => \N__4060\,
            I => \N__4046\
        );

    \I__721\ : InMux
    port map (
            O => \N__4057\,
            I => \N__4043\
        );

    \I__720\ : InMux
    port map (
            O => \N__4056\,
            I => \N__4040\
        );

    \I__719\ : CascadeMux
    port map (
            O => \N__4055\,
            I => \N__4037\
        );

    \I__718\ : CascadeMux
    port map (
            O => \N__4054\,
            I => \N__4034\
        );

    \I__717\ : CascadeMux
    port map (
            O => \N__4053\,
            I => \N__4031\
        );

    \I__716\ : CascadeMux
    port map (
            O => \N__4052\,
            I => \N__4028\
        );

    \I__715\ : CascadeMux
    port map (
            O => \N__4051\,
            I => \N__4025\
        );

    \I__714\ : CascadeMux
    port map (
            O => \N__4050\,
            I => \N__4022\
        );

    \I__713\ : CascadeMux
    port map (
            O => \N__4049\,
            I => \N__4019\
        );

    \I__712\ : LocalMux
    port map (
            O => \N__4046\,
            I => \N__4016\
        );

    \I__711\ : LocalMux
    port map (
            O => \N__4043\,
            I => \N__4013\
        );

    \I__710\ : LocalMux
    port map (
            O => \N__4040\,
            I => \N__4010\
        );

    \I__709\ : InMux
    port map (
            O => \N__4037\,
            I => \N__4001\
        );

    \I__708\ : InMux
    port map (
            O => \N__4034\,
            I => \N__4001\
        );

    \I__707\ : InMux
    port map (
            O => \N__4031\,
            I => \N__4001\
        );

    \I__706\ : InMux
    port map (
            O => \N__4028\,
            I => \N__4001\
        );

    \I__705\ : InMux
    port map (
            O => \N__4025\,
            I => \N__3994\
        );

    \I__704\ : InMux
    port map (
            O => \N__4022\,
            I => \N__3994\
        );

    \I__703\ : InMux
    port map (
            O => \N__4019\,
            I => \N__3994\
        );

    \I__702\ : Span4Mux_h
    port map (
            O => \N__4016\,
            I => \N__3991\
        );

    \I__701\ : Span4Mux_v
    port map (
            O => \N__4013\,
            I => \N__3982\
        );

    \I__700\ : Span4Mux_v
    port map (
            O => \N__4010\,
            I => \N__3982\
        );

    \I__699\ : LocalMux
    port map (
            O => \N__4001\,
            I => \N__3982\
        );

    \I__698\ : LocalMux
    port map (
            O => \N__3994\,
            I => \N__3982\
        );

    \I__697\ : Odrv4
    port map (
            O => \N__3991\,
            I => \CONSTANT_ONE_NET\
        );

    \I__696\ : Odrv4
    port map (
            O => \N__3982\,
            I => \CONSTANT_ONE_NET\
        );

    \I__695\ : InMux
    port map (
            O => \N__3977\,
            I => \ppm_encoder1.counter11_0_N_2\
        );

    \I__694\ : InMux
    port map (
            O => \N__3974\,
            I => \N__3971\
        );

    \I__693\ : LocalMux
    port map (
            O => \N__3971\,
            I => \ppm_encoder1.pulses2countZ0Z_10\
        );

    \I__692\ : CascadeMux
    port map (
            O => \N__3968\,
            I => \N__3965\
        );

    \I__691\ : InMux
    port map (
            O => \N__3965\,
            I => \N__3962\
        );

    \I__690\ : LocalMux
    port map (
            O => \N__3962\,
            I => \ppm_encoder1.pulses2countZ0Z_11\
        );

    \I__689\ : InMux
    port map (
            O => \N__3959\,
            I => \N__3956\
        );

    \I__688\ : LocalMux
    port map (
            O => \N__3956\,
            I => \ppm_encoder1.counter11_0_I_33_c_RNOZ0\
        );

    \I__687\ : InMux
    port map (
            O => \N__3953\,
            I => \N__3950\
        );

    \I__686\ : LocalMux
    port map (
            O => \N__3950\,
            I => \ppm_encoder1.pulses2countZ0Z_6\
        );

    \I__685\ : CascadeMux
    port map (
            O => \N__3947\,
            I => \N__3944\
        );

    \I__684\ : InMux
    port map (
            O => \N__3944\,
            I => \N__3941\
        );

    \I__683\ : LocalMux
    port map (
            O => \N__3941\,
            I => \ppm_encoder1.pulses2countZ0Z_7\
        );

    \I__682\ : InMux
    port map (
            O => \N__3938\,
            I => \N__3935\
        );

    \I__681\ : LocalMux
    port map (
            O => \N__3935\,
            I => \ppm_encoder1.counter11_0_I_21_c_RNOZ0\
        );

    \I__680\ : InMux
    port map (
            O => \N__3932\,
            I => \N__3929\
        );

    \I__679\ : LocalMux
    port map (
            O => \N__3929\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_12\
        );

    \I__678\ : CascadeMux
    port map (
            O => \N__3926\,
            I => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_2_cascade_\
        );

    \I__677\ : InMux
    port map (
            O => \N__3923\,
            I => \N__3920\
        );

    \I__676\ : LocalMux
    port map (
            O => \N__3920\,
            I => \ppm_encoder1.pulses2countZ0Z_2\
        );

    \I__675\ : CascadeMux
    port map (
            O => \N__3917\,
            I => \N__3914\
        );

    \I__674\ : InMux
    port map (
            O => \N__3914\,
            I => \N__3911\
        );

    \I__673\ : LocalMux
    port map (
            O => \N__3911\,
            I => \ppm_encoder1.pulses2countZ0Z_3\
        );

    \I__672\ : InMux
    port map (
            O => \N__3908\,
            I => \N__3905\
        );

    \I__671\ : LocalMux
    port map (
            O => \N__3905\,
            I => \ppm_encoder1.counter11_0_I_9_c_RNOZ0\
        );

    \I__670\ : CascadeMux
    port map (
            O => \N__3902\,
            I => \N__3898\
        );

    \I__669\ : InMux
    port map (
            O => \N__3901\,
            I => \N__3895\
        );

    \I__668\ : InMux
    port map (
            O => \N__3898\,
            I => \N__3892\
        );

    \I__667\ : LocalMux
    port map (
            O => \N__3895\,
            I => \ppm_encoder1.N_35_i_i\
        );

    \I__666\ : LocalMux
    port map (
            O => \N__3892\,
            I => \ppm_encoder1.N_35_i_i\
        );

    \I__665\ : InMux
    port map (
            O => \N__3887\,
            I => \N__3884\
        );

    \I__664\ : LocalMux
    port map (
            O => \N__3884\,
            I => \ppm_encoder1.counter11_0_I_15_c_RNOZ0\
        );

    \I__663\ : InMux
    port map (
            O => \N__3881\,
            I => \N__3878\
        );

    \I__662\ : LocalMux
    port map (
            O => \N__3878\,
            I => \ppm_encoder1.counter11_0_I_27_c_RNOZ0\
        );

    \I__661\ : InMux
    port map (
            O => \N__3875\,
            I => \N__3872\
        );

    \I__660\ : LocalMux
    port map (
            O => \N__3872\,
            I => \N__3869\
        );

    \I__659\ : Odrv4
    port map (
            O => \N__3869\,
            I => \ppm_encoder1.counter11_0_I_39_c_RNOZ0\
        );

    \I__658\ : InMux
    port map (
            O => \N__3866\,
            I => \N__3863\
        );

    \I__657\ : LocalMux
    port map (
            O => \N__3863\,
            I => \ppm_encoder1.counter11_0_I_45_c_RNOZ0\
        );

    \I__656\ : InMux
    port map (
            O => \N__3860\,
            I => \N__3857\
        );

    \I__655\ : LocalMux
    port map (
            O => \N__3857\,
            I => \ppm_encoder1.counter11_0_I_51_c_RNOZ0\
        );

    \I__654\ : InMux
    port map (
            O => \N__3854\,
            I => \N__3849\
        );

    \I__653\ : InMux
    port map (
            O => \N__3853\,
            I => \N__3846\
        );

    \I__652\ : InMux
    port map (
            O => \N__3852\,
            I => \N__3843\
        );

    \I__651\ : LocalMux
    port map (
            O => \N__3849\,
            I => \uart1.count_pulses_neededZ0Z_5\
        );

    \I__650\ : LocalMux
    port map (
            O => \N__3846\,
            I => \uart1.count_pulses_neededZ0Z_5\
        );

    \I__649\ : LocalMux
    port map (
            O => \N__3843\,
            I => \uart1.count_pulses_neededZ0Z_5\
        );

    \I__648\ : InMux
    port map (
            O => \N__3836\,
            I => \N__3831\
        );

    \I__647\ : InMux
    port map (
            O => \N__3835\,
            I => \N__3826\
        );

    \I__646\ : InMux
    port map (
            O => \N__3834\,
            I => \N__3826\
        );

    \I__645\ : LocalMux
    port map (
            O => \N__3831\,
            I => \uart1.count_pulses_neededZ0Z_1\
        );

    \I__644\ : LocalMux
    port map (
            O => \N__3826\,
            I => \uart1.count_pulses_neededZ0Z_1\
        );

    \I__643\ : CascadeMux
    port map (
            O => \N__3821\,
            I => \uart1.m9_i_o2_1_cascade_\
        );

    \I__642\ : InMux
    port map (
            O => \N__3818\,
            I => \N__3815\
        );

    \I__641\ : LocalMux
    port map (
            O => \N__3815\,
            I => \uart1.m9_i_o2_0\
        );

    \I__640\ : InMux
    port map (
            O => \N__3812\,
            I => \N__3808\
        );

    \I__639\ : InMux
    port map (
            O => \N__3811\,
            I => \N__3805\
        );

    \I__638\ : LocalMux
    port map (
            O => \N__3808\,
            I => \uart1.count_pulses_neededZ0Z_6\
        );

    \I__637\ : LocalMux
    port map (
            O => \N__3805\,
            I => \uart1.count_pulses_neededZ0Z_6\
        );

    \I__636\ : InMux
    port map (
            O => \N__3800\,
            I => \N__3796\
        );

    \I__635\ : InMux
    port map (
            O => \N__3799\,
            I => \N__3793\
        );

    \I__634\ : LocalMux
    port map (
            O => \N__3796\,
            I => \uart1.count_pulses_neededZ0Z_0\
        );

    \I__633\ : LocalMux
    port map (
            O => \N__3793\,
            I => \uart1.count_pulses_neededZ0Z_0\
        );

    \I__632\ : InMux
    port map (
            O => \N__3788\,
            I => \N__3784\
        );

    \I__631\ : InMux
    port map (
            O => \N__3787\,
            I => \N__3781\
        );

    \I__630\ : LocalMux
    port map (
            O => \N__3784\,
            I => \uart1.count_pulses_neededZ0Z_8\
        );

    \I__629\ : LocalMux
    port map (
            O => \N__3781\,
            I => \uart1.count_pulses_neededZ0Z_8\
        );

    \I__628\ : InMux
    port map (
            O => \N__3776\,
            I => \N__3773\
        );

    \I__627\ : LocalMux
    port map (
            O => \N__3773\,
            I => \uart1.m9_i_o2_0_2\
        );

    \I__626\ : InMux
    port map (
            O => \N__3770\,
            I => \N__3765\
        );

    \I__625\ : InMux
    port map (
            O => \N__3769\,
            I => \N__3760\
        );

    \I__624\ : InMux
    port map (
            O => \N__3768\,
            I => \N__3760\
        );

    \I__623\ : LocalMux
    port map (
            O => \N__3765\,
            I => \uart1.count_pulses_neededZ0Z_3\
        );

    \I__622\ : LocalMux
    port map (
            O => \N__3760\,
            I => \uart1.count_pulses_neededZ0Z_3\
        );

    \I__621\ : CascadeMux
    port map (
            O => \N__3755\,
            I => \N__3750\
        );

    \I__620\ : InMux
    port map (
            O => \N__3754\,
            I => \N__3747\
        );

    \I__619\ : InMux
    port map (
            O => \N__3753\,
            I => \N__3742\
        );

    \I__618\ : InMux
    port map (
            O => \N__3750\,
            I => \N__3742\
        );

    \I__617\ : LocalMux
    port map (
            O => \N__3747\,
            I => \uart1.count_pulses_neededZ0Z_2\
        );

    \I__616\ : LocalMux
    port map (
            O => \N__3742\,
            I => \uart1.count_pulses_neededZ0Z_2\
        );

    \I__615\ : CascadeMux
    port map (
            O => \N__3737\,
            I => \uart1.m9_i_o2_0_2_cascade_\
        );

    \I__614\ : InMux
    port map (
            O => \N__3734\,
            I => \N__3731\
        );

    \I__613\ : LocalMux
    port map (
            O => \N__3731\,
            I => \uart1.m9_i_o2_1_2\
        );

    \I__612\ : CascadeMux
    port map (
            O => \N__3728\,
            I => \uart1.N_23_cascade_\
        );

    \I__611\ : SRMux
    port map (
            O => \N__3725\,
            I => \N__3722\
        );

    \I__610\ : LocalMux
    port map (
            O => \N__3722\,
            I => \N__3719\
        );

    \I__609\ : Span4Mux_h
    port map (
            O => \N__3719\,
            I => \N__3716\
        );

    \I__608\ : Span4Mux_s2_v
    port map (
            O => \N__3716\,
            I => \N__3713\
        );

    \I__607\ : Odrv4
    port map (
            O => \N__3713\,
            I => \uart1.N_5\
        );

    \I__606\ : InMux
    port map (
            O => \N__3710\,
            I => \N__3707\
        );

    \I__605\ : LocalMux
    port map (
            O => \N__3707\,
            I => \ppm_encoder1.pulses2countZ0Z_8\
        );

    \I__604\ : CascadeMux
    port map (
            O => \N__3704\,
            I => \N__3701\
        );

    \I__603\ : InMux
    port map (
            O => \N__3701\,
            I => \N__3698\
        );

    \I__602\ : LocalMux
    port map (
            O => \N__3698\,
            I => \ppm_encoder1.pulses2countZ0Z_9\
        );

    \I__601\ : IoInMux
    port map (
            O => \N__3695\,
            I => \N__3692\
        );

    \I__600\ : LocalMux
    port map (
            O => \N__3692\,
            I => \N__3688\
        );

    \I__599\ : CascadeMux
    port map (
            O => \N__3691\,
            I => \N__3685\
        );

    \I__598\ : Span12Mux_s7_v
    port map (
            O => \N__3688\,
            I => \N__3682\
        );

    \I__597\ : InMux
    port map (
            O => \N__3685\,
            I => \N__3679\
        );

    \I__596\ : Odrv12
    port map (
            O => \N__3682\,
            I => ppm_output_c
        );

    \I__595\ : LocalMux
    port map (
            O => \N__3679\,
            I => ppm_output_c
        );

    \I__594\ : InMux
    port map (
            O => \N__3674\,
            I => \N__3671\
        );

    \I__593\ : LocalMux
    port map (
            O => \N__3671\,
            I => \ppm_encoder1.pulses2countZ0Z_17\
        );

    \I__592\ : InMux
    port map (
            O => \N__3668\,
            I => \N__3665\
        );

    \I__591\ : LocalMux
    port map (
            O => \N__3665\,
            I => \N__3662\
        );

    \I__590\ : Odrv4
    port map (
            O => \N__3662\,
            I => \ppm_encoder1.pulses2countZ0Z_16\
        );

    \I__589\ : CascadeMux
    port map (
            O => \N__3659\,
            I => \N__3656\
        );

    \I__588\ : InMux
    port map (
            O => \N__3656\,
            I => \N__3653\
        );

    \I__587\ : LocalMux
    port map (
            O => \N__3653\,
            I => \ppm_encoder1.pulses2countZ0Z_13\
        );

    \I__586\ : InMux
    port map (
            O => \N__3650\,
            I => \N__3647\
        );

    \I__585\ : LocalMux
    port map (
            O => \N__3647\,
            I => \N__3644\
        );

    \I__584\ : Span4Mux_h
    port map (
            O => \N__3644\,
            I => \N__3640\
        );

    \I__583\ : InMux
    port map (
            O => \N__3643\,
            I => \N__3637\
        );

    \I__582\ : Odrv4
    port map (
            O => \N__3640\,
            I => \ppm_encoder1.init_pulsesZ0Z_12\
        );

    \I__581\ : LocalMux
    port map (
            O => \N__3637\,
            I => \ppm_encoder1.init_pulsesZ0Z_12\
        );

    \I__580\ : InMux
    port map (
            O => \N__3632\,
            I => \N__3629\
        );

    \I__579\ : LocalMux
    port map (
            O => \N__3629\,
            I => \ppm_encoder1.pulses2countZ0Z_12\
        );

    \I__578\ : InMux
    port map (
            O => \N__3626\,
            I => \N__3623\
        );

    \I__577\ : LocalMux
    port map (
            O => \N__3623\,
            I => \ppm_encoder1.pulses2countZ0Z_18\
        );

    \I__576\ : CascadeMux
    port map (
            O => \N__3620\,
            I => \N__3616\
        );

    \I__575\ : InMux
    port map (
            O => \N__3619\,
            I => \N__3612\
        );

    \I__574\ : InMux
    port map (
            O => \N__3616\,
            I => \N__3607\
        );

    \I__573\ : InMux
    port map (
            O => \N__3615\,
            I => \N__3607\
        );

    \I__572\ : LocalMux
    port map (
            O => \N__3612\,
            I => \uart1.count_pulses_neededZ0Z_7\
        );

    \I__571\ : LocalMux
    port map (
            O => \N__3607\,
            I => \uart1.count_pulses_neededZ0Z_7\
        );

    \I__570\ : InMux
    port map (
            O => \N__3602\,
            I => \N__3597\
        );

    \I__569\ : InMux
    port map (
            O => \N__3601\,
            I => \N__3592\
        );

    \I__568\ : InMux
    port map (
            O => \N__3600\,
            I => \N__3592\
        );

    \I__567\ : LocalMux
    port map (
            O => \N__3597\,
            I => \uart1.count_pulses_neededZ0Z_4\
        );

    \I__566\ : LocalMux
    port map (
            O => \N__3592\,
            I => \uart1.count_pulses_neededZ0Z_4\
        );

    \I__565\ : CascadeMux
    port map (
            O => \N__3587\,
            I => \N__3584\
        );

    \I__564\ : InMux
    port map (
            O => \N__3584\,
            I => \N__3580\
        );

    \I__563\ : InMux
    port map (
            O => \N__3583\,
            I => \N__3577\
        );

    \I__562\ : LocalMux
    port map (
            O => \N__3580\,
            I => \N__3574\
        );

    \I__561\ : LocalMux
    port map (
            O => \N__3577\,
            I => \ppm_encoder1.init_pulsesZ0Z_6\
        );

    \I__560\ : Odrv4
    port map (
            O => \N__3574\,
            I => \ppm_encoder1.init_pulsesZ0Z_6\
        );

    \I__559\ : InMux
    port map (
            O => \N__3569\,
            I => \N__3566\
        );

    \I__558\ : LocalMux
    port map (
            O => \N__3566\,
            I => \N__3563\
        );

    \I__557\ : Span4Mux_h
    port map (
            O => \N__3563\,
            I => \N__3559\
        );

    \I__556\ : InMux
    port map (
            O => \N__3562\,
            I => \N__3556\
        );

    \I__555\ : Odrv4
    port map (
            O => \N__3559\,
            I => \ppm_encoder1.init_pulsesZ0Z_7\
        );

    \I__554\ : LocalMux
    port map (
            O => \N__3556\,
            I => \ppm_encoder1.init_pulsesZ0Z_7\
        );

    \I__553\ : InMux
    port map (
            O => \N__3551\,
            I => \N__3548\
        );

    \I__552\ : LocalMux
    port map (
            O => \N__3548\,
            I => \N__3545\
        );

    \I__551\ : Span4Mux_h
    port map (
            O => \N__3545\,
            I => \N__3541\
        );

    \I__550\ : InMux
    port map (
            O => \N__3544\,
            I => \N__3538\
        );

    \I__549\ : Odrv4
    port map (
            O => \N__3541\,
            I => \ppm_encoder1.init_pulsesZ0Z_14\
        );

    \I__548\ : LocalMux
    port map (
            O => \N__3538\,
            I => \ppm_encoder1.init_pulsesZ0Z_14\
        );

    \I__547\ : InMux
    port map (
            O => \N__3533\,
            I => \N__3530\
        );

    \I__546\ : LocalMux
    port map (
            O => \N__3530\,
            I => \N__3526\
        );

    \I__545\ : InMux
    port map (
            O => \N__3529\,
            I => \N__3523\
        );

    \I__544\ : Span4Mux_h
    port map (
            O => \N__3526\,
            I => \N__3519\
        );

    \I__543\ : LocalMux
    port map (
            O => \N__3523\,
            I => \N__3516\
        );

    \I__542\ : InMux
    port map (
            O => \N__3522\,
            I => \N__3513\
        );

    \I__541\ : Odrv4
    port map (
            O => \N__3519\,
            I => \ppm_encoder1.init_pulses39_2_0\
        );

    \I__540\ : Odrv4
    port map (
            O => \N__3516\,
            I => \ppm_encoder1.init_pulses39_2_0\
        );

    \I__539\ : LocalMux
    port map (
            O => \N__3513\,
            I => \ppm_encoder1.init_pulses39_2_0\
        );

    \I__538\ : CascadeMux
    port map (
            O => \N__3506\,
            I => \N__3503\
        );

    \I__537\ : InMux
    port map (
            O => \N__3503\,
            I => \N__3499\
        );

    \I__536\ : CascadeMux
    port map (
            O => \N__3502\,
            I => \N__3496\
        );

    \I__535\ : LocalMux
    port map (
            O => \N__3499\,
            I => \N__3493\
        );

    \I__534\ : InMux
    port map (
            O => \N__3496\,
            I => \N__3490\
        );

    \I__533\ : Odrv4
    port map (
            O => \N__3493\,
            I => \ppm_encoder1.N_47\
        );

    \I__532\ : LocalMux
    port map (
            O => \N__3490\,
            I => \ppm_encoder1.N_47\
        );

    \I__531\ : InMux
    port map (
            O => \N__3485\,
            I => \N__3482\
        );

    \I__530\ : LocalMux
    port map (
            O => \N__3482\,
            I => \N__3478\
        );

    \I__529\ : InMux
    port map (
            O => \N__3481\,
            I => \N__3475\
        );

    \I__528\ : Span4Mux_h
    port map (
            O => \N__3478\,
            I => \N__3472\
        );

    \I__527\ : LocalMux
    port map (
            O => \N__3475\,
            I => \N__3469\
        );

    \I__526\ : Odrv4
    port map (
            O => \N__3472\,
            I => \ppm_encoder1.init_pulsesZ0Z_3\
        );

    \I__525\ : Odrv4
    port map (
            O => \N__3469\,
            I => \ppm_encoder1.init_pulsesZ0Z_3\
        );

    \I__524\ : InMux
    port map (
            O => \N__3464\,
            I => \N__3461\
        );

    \I__523\ : LocalMux
    port map (
            O => \N__3461\,
            I => \N__3457\
        );

    \I__522\ : InMux
    port map (
            O => \N__3460\,
            I => \N__3454\
        );

    \I__521\ : Odrv4
    port map (
            O => \N__3457\,
            I => \ppm_encoder1.init_pulsesZ0Z_2\
        );

    \I__520\ : LocalMux
    port map (
            O => \N__3454\,
            I => \ppm_encoder1.init_pulsesZ0Z_2\
        );

    \I__519\ : CascadeMux
    port map (
            O => \N__3449\,
            I => \N__3446\
        );

    \I__518\ : InMux
    port map (
            O => \N__3446\,
            I => \N__3443\
        );

    \I__517\ : LocalMux
    port map (
            O => \N__3443\,
            I => \ppm_encoder1.pulses2count_8_0_iv_0_1_10_0\
        );

    \I__516\ : InMux
    port map (
            O => \N__3440\,
            I => \N__3437\
        );

    \I__515\ : LocalMux
    port map (
            O => \N__3437\,
            I => \N__3434\
        );

    \I__514\ : Span4Mux_h
    port map (
            O => \N__3434\,
            I => \N__3430\
        );

    \I__513\ : InMux
    port map (
            O => \N__3433\,
            I => \N__3427\
        );

    \I__512\ : Odrv4
    port map (
            O => \N__3430\,
            I => \ppm_encoder1.init_pulsesZ0Z_11\
        );

    \I__511\ : LocalMux
    port map (
            O => \N__3427\,
            I => \ppm_encoder1.init_pulsesZ0Z_11\
        );

    \I__510\ : InMux
    port map (
            O => \N__3422\,
            I => \N__3419\
        );

    \I__509\ : LocalMux
    port map (
            O => \N__3419\,
            I => \ppm_encoder1.pulses2countZ0Z_4\
        );

    \I__508\ : CascadeMux
    port map (
            O => \N__3416\,
            I => \N__3413\
        );

    \I__507\ : InMux
    port map (
            O => \N__3413\,
            I => \N__3410\
        );

    \I__506\ : LocalMux
    port map (
            O => \N__3410\,
            I => \ppm_encoder1.pulses2countZ0Z_5\
        );

    \I__505\ : InMux
    port map (
            O => \N__3407\,
            I => \N__3404\
        );

    \I__504\ : LocalMux
    port map (
            O => \N__3404\,
            I => \N__3401\
        );

    \I__503\ : Span4Mux_h
    port map (
            O => \N__3401\,
            I => \N__3398\
        );

    \I__502\ : Odrv4
    port map (
            O => \N__3398\,
            I => \ppm_encoder1.PPM_STATE_r_1_1\
        );

    \I__501\ : InMux
    port map (
            O => \N__3395\,
            I => \N__3392\
        );

    \I__500\ : LocalMux
    port map (
            O => \N__3392\,
            I => \ppm_encoder1.pulses2countZ0Z_14\
        );

    \I__499\ : CascadeMux
    port map (
            O => \N__3389\,
            I => \N__3386\
        );

    \I__498\ : InMux
    port map (
            O => \N__3386\,
            I => \N__3383\
        );

    \I__497\ : LocalMux
    port map (
            O => \N__3383\,
            I => \ppm_encoder1.pulses2countZ0Z_15\
        );

    \I__496\ : InMux
    port map (
            O => \N__3380\,
            I => \uart1.un1_count_pulses_needed_6_cry_6\
        );

    \I__495\ : InMux
    port map (
            O => \N__3377\,
            I => \bfn_9_29_0_\
        );

    \I__494\ : InMux
    port map (
            O => \N__3374\,
            I => \N__3371\
        );

    \I__493\ : LocalMux
    port map (
            O => \N__3371\,
            I => \N__3368\
        );

    \I__492\ : Span4Mux_h
    port map (
            O => \N__3368\,
            I => \N__3364\
        );

    \I__491\ : InMux
    port map (
            O => \N__3367\,
            I => \N__3361\
        );

    \I__490\ : Odrv4
    port map (
            O => \N__3364\,
            I => \ppm_encoder1.init_pulsesZ0Z_9\
        );

    \I__489\ : LocalMux
    port map (
            O => \N__3361\,
            I => \ppm_encoder1.init_pulsesZ0Z_9\
        );

    \I__488\ : InMux
    port map (
            O => \N__3356\,
            I => \N__3352\
        );

    \I__487\ : InMux
    port map (
            O => \N__3355\,
            I => \N__3349\
        );

    \I__486\ : LocalMux
    port map (
            O => \N__3352\,
            I => \N__3346\
        );

    \I__485\ : LocalMux
    port map (
            O => \N__3349\,
            I => \N__3343\
        );

    \I__484\ : Odrv4
    port map (
            O => \N__3346\,
            I => \ppm_encoder1.init_pulsesZ0Z_8\
        );

    \I__483\ : Odrv4
    port map (
            O => \N__3343\,
            I => \ppm_encoder1.init_pulsesZ0Z_8\
        );

    \I__482\ : InMux
    port map (
            O => \N__3338\,
            I => \N__3335\
        );

    \I__481\ : LocalMux
    port map (
            O => \N__3335\,
            I => \ppm_encoder1.PPM_STATE_e_1_0\
        );

    \I__480\ : CascadeMux
    port map (
            O => \N__3332\,
            I => \N__3321\
        );

    \I__479\ : CascadeMux
    port map (
            O => \N__3331\,
            I => \N__3318\
        );

    \I__478\ : CascadeMux
    port map (
            O => \N__3330\,
            I => \N__3315\
        );

    \I__477\ : CascadeMux
    port map (
            O => \N__3329\,
            I => \N__3312\
        );

    \I__476\ : CascadeMux
    port map (
            O => \N__3328\,
            I => \N__3307\
        );

    \I__475\ : CascadeMux
    port map (
            O => \N__3327\,
            I => \N__3304\
        );

    \I__474\ : CascadeMux
    port map (
            O => \N__3326\,
            I => \N__3301\
        );

    \I__473\ : CascadeMux
    port map (
            O => \N__3325\,
            I => \N__3298\
        );

    \I__472\ : CascadeMux
    port map (
            O => \N__3324\,
            I => \N__3295\
        );

    \I__471\ : InMux
    port map (
            O => \N__3321\,
            I => \N__3283\
        );

    \I__470\ : InMux
    port map (
            O => \N__3318\,
            I => \N__3283\
        );

    \I__469\ : InMux
    port map (
            O => \N__3315\,
            I => \N__3283\
        );

    \I__468\ : InMux
    port map (
            O => \N__3312\,
            I => \N__3280\
        );

    \I__467\ : CascadeMux
    port map (
            O => \N__3311\,
            I => \N__3276\
        );

    \I__466\ : CascadeMux
    port map (
            O => \N__3310\,
            I => \N__3273\
        );

    \I__465\ : InMux
    port map (
            O => \N__3307\,
            I => \N__3268\
        );

    \I__464\ : InMux
    port map (
            O => \N__3304\,
            I => \N__3268\
        );

    \I__463\ : InMux
    port map (
            O => \N__3301\,
            I => \N__3263\
        );

    \I__462\ : InMux
    port map (
            O => \N__3298\,
            I => \N__3263\
        );

    \I__461\ : InMux
    port map (
            O => \N__3295\,
            I => \N__3258\
        );

    \I__460\ : InMux
    port map (
            O => \N__3294\,
            I => \N__3258\
        );

    \I__459\ : CascadeMux
    port map (
            O => \N__3293\,
            I => \N__3255\
        );

    \I__458\ : CascadeMux
    port map (
            O => \N__3292\,
            I => \N__3252\
        );

    \I__457\ : CascadeMux
    port map (
            O => \N__3291\,
            I => \N__3249\
        );

    \I__456\ : CascadeMux
    port map (
            O => \N__3290\,
            I => \N__3246\
        );

    \I__455\ : LocalMux
    port map (
            O => \N__3283\,
            I => \N__3239\
        );

    \I__454\ : LocalMux
    port map (
            O => \N__3280\,
            I => \N__3239\
        );

    \I__453\ : InMux
    port map (
            O => \N__3279\,
            I => \N__3232\
        );

    \I__452\ : InMux
    port map (
            O => \N__3276\,
            I => \N__3232\
        );

    \I__451\ : InMux
    port map (
            O => \N__3273\,
            I => \N__3232\
        );

    \I__450\ : LocalMux
    port map (
            O => \N__3268\,
            I => \N__3229\
        );

    \I__449\ : LocalMux
    port map (
            O => \N__3263\,
            I => \N__3224\
        );

    \I__448\ : LocalMux
    port map (
            O => \N__3258\,
            I => \N__3224\
        );

    \I__447\ : InMux
    port map (
            O => \N__3255\,
            I => \N__3219\
        );

    \I__446\ : InMux
    port map (
            O => \N__3252\,
            I => \N__3219\
        );

    \I__445\ : InMux
    port map (
            O => \N__3249\,
            I => \N__3210\
        );

    \I__444\ : InMux
    port map (
            O => \N__3246\,
            I => \N__3210\
        );

    \I__443\ : InMux
    port map (
            O => \N__3245\,
            I => \N__3210\
        );

    \I__442\ : InMux
    port map (
            O => \N__3244\,
            I => \N__3210\
        );

    \I__441\ : Span4Mux_v
    port map (
            O => \N__3239\,
            I => \N__3205\
        );

    \I__440\ : LocalMux
    port map (
            O => \N__3232\,
            I => \N__3205\
        );

    \I__439\ : Span4Mux_h
    port map (
            O => \N__3229\,
            I => \N__3200\
        );

    \I__438\ : Span4Mux_h
    port map (
            O => \N__3224\,
            I => \N__3200\
        );

    \I__437\ : LocalMux
    port map (
            O => \N__3219\,
            I => \ppm_encoder1.init_pulses_6_sqmuxa\
        );

    \I__436\ : LocalMux
    port map (
            O => \N__3210\,
            I => \ppm_encoder1.init_pulses_6_sqmuxa\
        );

    \I__435\ : Odrv4
    port map (
            O => \N__3205\,
            I => \ppm_encoder1.init_pulses_6_sqmuxa\
        );

    \I__434\ : Odrv4
    port map (
            O => \N__3200\,
            I => \ppm_encoder1.init_pulses_6_sqmuxa\
        );

    \I__433\ : InMux
    port map (
            O => \N__3191\,
            I => \N__3188\
        );

    \I__432\ : LocalMux
    port map (
            O => \N__3188\,
            I => \N__3185\
        );

    \I__431\ : Span4Mux_h
    port map (
            O => \N__3185\,
            I => \N__3181\
        );

    \I__430\ : InMux
    port map (
            O => \N__3184\,
            I => \N__3178\
        );

    \I__429\ : Odrv4
    port map (
            O => \N__3181\,
            I => \ppm_encoder1.init_pulsesZ0Z_10\
        );

    \I__428\ : LocalMux
    port map (
            O => \N__3178\,
            I => \ppm_encoder1.init_pulsesZ0Z_10\
        );

    \I__427\ : InMux
    port map (
            O => \N__3173\,
            I => \N__3169\
        );

    \I__426\ : InMux
    port map (
            O => \N__3172\,
            I => \N__3166\
        );

    \I__425\ : LocalMux
    port map (
            O => \N__3169\,
            I => \ppm_encoder1.init_pulsesZ0Z_18\
        );

    \I__424\ : LocalMux
    port map (
            O => \N__3166\,
            I => \ppm_encoder1.init_pulsesZ0Z_18\
        );

    \I__423\ : InMux
    port map (
            O => \N__3161\,
            I => \N__3157\
        );

    \I__422\ : InMux
    port map (
            O => \N__3160\,
            I => \N__3154\
        );

    \I__421\ : LocalMux
    port map (
            O => \N__3157\,
            I => \ppm_encoder1.init_pulsesZ0Z_16\
        );

    \I__420\ : LocalMux
    port map (
            O => \N__3154\,
            I => \ppm_encoder1.init_pulsesZ0Z_16\
        );

    \I__419\ : InMux
    port map (
            O => \N__3149\,
            I => \uart1.un1_count_pulses_needed_6_cry_0\
        );

    \I__418\ : InMux
    port map (
            O => \N__3146\,
            I => \uart1.un1_count_pulses_needed_6_cry_1\
        );

    \I__417\ : InMux
    port map (
            O => \N__3143\,
            I => \uart1.un1_count_pulses_needed_6_cry_2\
        );

    \I__416\ : InMux
    port map (
            O => \N__3140\,
            I => \uart1.un1_count_pulses_needed_6_cry_3\
        );

    \I__415\ : InMux
    port map (
            O => \N__3137\,
            I => \uart1.un1_count_pulses_needed_6_cry_4\
        );

    \I__414\ : InMux
    port map (
            O => \N__3134\,
            I => \uart1.un1_count_pulses_needed_6_cry_5\
        );

    \I__413\ : CascadeMux
    port map (
            O => \N__3131\,
            I => \ppm_encoder1.init_pulses_0_sqmuxa_0_cascade_\
        );

    \I__412\ : InMux
    port map (
            O => \N__3128\,
            I => \N__3125\
        );

    \I__411\ : LocalMux
    port map (
            O => \N__3125\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_2\
        );

    \I__410\ : InMux
    port map (
            O => \N__3122\,
            I => \N__3119\
        );

    \I__409\ : LocalMux
    port map (
            O => \N__3119\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_5\
        );

    \I__408\ : InMux
    port map (
            O => \N__3116\,
            I => \N__3096\
        );

    \I__407\ : InMux
    port map (
            O => \N__3115\,
            I => \N__3096\
        );

    \I__406\ : InMux
    port map (
            O => \N__3114\,
            I => \N__3096\
        );

    \I__405\ : InMux
    port map (
            O => \N__3113\,
            I => \N__3085\
        );

    \I__404\ : InMux
    port map (
            O => \N__3112\,
            I => \N__3085\
        );

    \I__403\ : InMux
    port map (
            O => \N__3111\,
            I => \N__3085\
        );

    \I__402\ : InMux
    port map (
            O => \N__3110\,
            I => \N__3085\
        );

    \I__401\ : InMux
    port map (
            O => \N__3109\,
            I => \N__3085\
        );

    \I__400\ : InMux
    port map (
            O => \N__3108\,
            I => \N__3082\
        );

    \I__399\ : CascadeMux
    port map (
            O => \N__3107\,
            I => \N__3079\
        );

    \I__398\ : InMux
    port map (
            O => \N__3106\,
            I => \N__3066\
        );

    \I__397\ : InMux
    port map (
            O => \N__3105\,
            I => \N__3066\
        );

    \I__396\ : InMux
    port map (
            O => \N__3104\,
            I => \N__3066\
        );

    \I__395\ : InMux
    port map (
            O => \N__3103\,
            I => \N__3066\
        );

    \I__394\ : LocalMux
    port map (
            O => \N__3096\,
            I => \N__3063\
        );

    \I__393\ : LocalMux
    port map (
            O => \N__3085\,
            I => \N__3058\
        );

    \I__392\ : LocalMux
    port map (
            O => \N__3082\,
            I => \N__3058\
        );

    \I__391\ : InMux
    port map (
            O => \N__3079\,
            I => \N__3055\
        );

    \I__390\ : InMux
    port map (
            O => \N__3078\,
            I => \N__3050\
        );

    \I__389\ : InMux
    port map (
            O => \N__3077\,
            I => \N__3050\
        );

    \I__388\ : InMux
    port map (
            O => \N__3076\,
            I => \N__3045\
        );

    \I__387\ : InMux
    port map (
            O => \N__3075\,
            I => \N__3045\
        );

    \I__386\ : LocalMux
    port map (
            O => \N__3066\,
            I => \N__3042\
        );

    \I__385\ : Span4Mux_v
    port map (
            O => \N__3063\,
            I => \N__3037\
        );

    \I__384\ : Span4Mux_v
    port map (
            O => \N__3058\,
            I => \N__3037\
        );

    \I__383\ : LocalMux
    port map (
            O => \N__3055\,
            I => \ppm_encoder1.init_pulses_0_sqmuxa_0\
        );

    \I__382\ : LocalMux
    port map (
            O => \N__3050\,
            I => \ppm_encoder1.init_pulses_0_sqmuxa_0\
        );

    \I__381\ : LocalMux
    port map (
            O => \N__3045\,
            I => \ppm_encoder1.init_pulses_0_sqmuxa_0\
        );

    \I__380\ : Odrv4
    port map (
            O => \N__3042\,
            I => \ppm_encoder1.init_pulses_0_sqmuxa_0\
        );

    \I__379\ : Odrv4
    port map (
            O => \N__3037\,
            I => \ppm_encoder1.init_pulses_0_sqmuxa_0\
        );

    \I__378\ : InMux
    port map (
            O => \N__3026\,
            I => \N__3023\
        );

    \I__377\ : LocalMux
    port map (
            O => \N__3023\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_8\
        );

    \I__376\ : InMux
    port map (
            O => \N__3020\,
            I => \N__3017\
        );

    \I__375\ : LocalMux
    port map (
            O => \N__3017\,
            I => \N__3013\
        );

    \I__374\ : InMux
    port map (
            O => \N__3016\,
            I => \N__3010\
        );

    \I__373\ : Odrv4
    port map (
            O => \N__3013\,
            I => \ppm_encoder1.init_pulsesZ0Z_13\
        );

    \I__372\ : LocalMux
    port map (
            O => \N__3010\,
            I => \ppm_encoder1.init_pulsesZ0Z_13\
        );

    \I__371\ : InMux
    port map (
            O => \N__3005\,
            I => \N__3002\
        );

    \I__370\ : LocalMux
    port map (
            O => \N__3002\,
            I => \N__2998\
        );

    \I__369\ : InMux
    port map (
            O => \N__3001\,
            I => \N__2995\
        );

    \I__368\ : Odrv4
    port map (
            O => \N__2998\,
            I => \ppm_encoder1.init_pulsesZ0Z_15\
        );

    \I__367\ : LocalMux
    port map (
            O => \N__2995\,
            I => \ppm_encoder1.init_pulsesZ0Z_15\
        );

    \I__366\ : InMux
    port map (
            O => \N__2990\,
            I => \N__2986\
        );

    \I__365\ : InMux
    port map (
            O => \N__2989\,
            I => \N__2983\
        );

    \I__364\ : LocalMux
    port map (
            O => \N__2986\,
            I => \ppm_encoder1.init_pulsesZ0Z_5\
        );

    \I__363\ : LocalMux
    port map (
            O => \N__2983\,
            I => \ppm_encoder1.init_pulsesZ0Z_5\
        );

    \I__362\ : InMux
    port map (
            O => \N__2978\,
            I => \N__2975\
        );

    \I__361\ : LocalMux
    port map (
            O => \N__2975\,
            I => \N__2972\
        );

    \I__360\ : Span4Mux_v
    port map (
            O => \N__2972\,
            I => \N__2968\
        );

    \I__359\ : InMux
    port map (
            O => \N__2971\,
            I => \N__2965\
        );

    \I__358\ : Odrv4
    port map (
            O => \N__2968\,
            I => \ppm_encoder1.init_pulsesZ0Z_4\
        );

    \I__357\ : LocalMux
    port map (
            O => \N__2965\,
            I => \ppm_encoder1.init_pulsesZ0Z_4\
        );

    \I__356\ : InMux
    port map (
            O => \N__2960\,
            I => \N__2956\
        );

    \I__355\ : InMux
    port map (
            O => \N__2959\,
            I => \N__2953\
        );

    \I__354\ : LocalMux
    port map (
            O => \N__2956\,
            I => \ppm_encoder1.init_pulsesZ0Z_17\
        );

    \I__353\ : LocalMux
    port map (
            O => \N__2953\,
            I => \ppm_encoder1.init_pulsesZ0Z_17\
        );

    \I__352\ : InMux
    port map (
            O => \N__2948\,
            I => \N__2945\
        );

    \I__351\ : LocalMux
    port map (
            O => \N__2945\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_16\
        );

    \I__350\ : InMux
    port map (
            O => \N__2942\,
            I => \N__2939\
        );

    \I__349\ : LocalMux
    port map (
            O => \N__2939\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_17\
        );

    \I__348\ : InMux
    port map (
            O => \N__2936\,
            I => \N__2933\
        );

    \I__347\ : LocalMux
    port map (
            O => \N__2933\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_12\
        );

    \I__346\ : SRMux
    port map (
            O => \N__2930\,
            I => \N__2927\
        );

    \I__345\ : LocalMux
    port map (
            O => \N__2927\,
            I => \N__2924\
        );

    \I__344\ : Span4Mux_h
    port map (
            O => \N__2924\,
            I => \N__2921\
        );

    \I__343\ : Span4Mux_h
    port map (
            O => \N__2921\,
            I => \N__2918\
        );

    \I__342\ : Odrv4
    port map (
            O => \N__2918\,
            I => \ppm_encoder1.N_39_i\
        );

    \I__341\ : InMux
    port map (
            O => \N__2915\,
            I => \N__2912\
        );

    \I__340\ : LocalMux
    port map (
            O => \N__2912\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_6\
        );

    \I__339\ : InMux
    port map (
            O => \N__2909\,
            I => \N__2906\
        );

    \I__338\ : LocalMux
    port map (
            O => \N__2906\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_1\
        );

    \I__337\ : InMux
    port map (
            O => \N__2903\,
            I => \N__2900\
        );

    \I__336\ : LocalMux
    port map (
            O => \N__2900\,
            I => \ppm_encoder1.un1_init_pulses_axb_0\
        );

    \I__335\ : CascadeMux
    port map (
            O => \N__2897\,
            I => \ppm_encoder1.pulses2count39_0_cascade_\
        );

    \I__334\ : InMux
    port map (
            O => \N__2894\,
            I => \N__2891\
        );

    \I__333\ : LocalMux
    port map (
            O => \N__2891\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_11\
        );

    \I__332\ : InMux
    port map (
            O => \N__2888\,
            I => \ppm_encoder1.un1_init_pulses_cry_10\
        );

    \I__331\ : InMux
    port map (
            O => \N__2885\,
            I => \ppm_encoder1.un1_init_pulses_cry_11\
        );

    \I__330\ : CascadeMux
    port map (
            O => \N__2882\,
            I => \N__2879\
        );

    \I__329\ : InMux
    port map (
            O => \N__2879\,
            I => \N__2876\
        );

    \I__328\ : LocalMux
    port map (
            O => \N__2876\,
            I => \ppm_encoder1.PPM_STATE_RNIH6OE8Z0Z_0\
        );

    \I__327\ : InMux
    port map (
            O => \N__2873\,
            I => \N__2870\
        );

    \I__326\ : LocalMux
    port map (
            O => \N__2870\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_13\
        );

    \I__325\ : InMux
    port map (
            O => \N__2867\,
            I => \ppm_encoder1.un1_init_pulses_cry_12\
        );

    \I__324\ : CascadeMux
    port map (
            O => \N__2864\,
            I => \N__2860\
        );

    \I__323\ : CascadeMux
    port map (
            O => \N__2863\,
            I => \N__2857\
        );

    \I__322\ : InMux
    port map (
            O => \N__2860\,
            I => \N__2850\
        );

    \I__321\ : InMux
    port map (
            O => \N__2857\,
            I => \N__2850\
        );

    \I__320\ : CascadeMux
    port map (
            O => \N__2856\,
            I => \N__2847\
        );

    \I__319\ : CascadeMux
    port map (
            O => \N__2855\,
            I => \N__2844\
        );

    \I__318\ : LocalMux
    port map (
            O => \N__2850\,
            I => \N__2841\
        );

    \I__317\ : InMux
    port map (
            O => \N__2847\,
            I => \N__2836\
        );

    \I__316\ : InMux
    port map (
            O => \N__2844\,
            I => \N__2836\
        );

    \I__315\ : Odrv4
    port map (
            O => \N__2841\,
            I => \ppm_encoder1.N_355_i\
        );

    \I__314\ : LocalMux
    port map (
            O => \N__2836\,
            I => \ppm_encoder1.N_355_i\
        );

    \I__313\ : InMux
    port map (
            O => \N__2831\,
            I => \N__2828\
        );

    \I__312\ : LocalMux
    port map (
            O => \N__2828\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_14\
        );

    \I__311\ : InMux
    port map (
            O => \N__2825\,
            I => \ppm_encoder1.un1_init_pulses_cry_13\
        );

    \I__310\ : InMux
    port map (
            O => \N__2822\,
            I => \N__2819\
        );

    \I__309\ : LocalMux
    port map (
            O => \N__2819\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_15\
        );

    \I__308\ : InMux
    port map (
            O => \N__2816\,
            I => \ppm_encoder1.un1_init_pulses_cry_14\
        );

    \I__307\ : InMux
    port map (
            O => \N__2813\,
            I => \bfn_8_25_0_\
        );

    \I__306\ : InMux
    port map (
            O => \N__2810\,
            I => \ppm_encoder1.un1_init_pulses_cry_16\
        );

    \I__305\ : InMux
    port map (
            O => \N__2807\,
            I => \ppm_encoder1.un1_init_pulses_cry_17\
        );

    \I__304\ : CascadeMux
    port map (
            O => \N__2804\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_18_cascade_\
        );

    \I__303\ : CascadeMux
    port map (
            O => \N__2801\,
            I => \N__2798\
        );

    \I__302\ : InMux
    port map (
            O => \N__2798\,
            I => \N__2795\
        );

    \I__301\ : LocalMux
    port map (
            O => \N__2795\,
            I => \ppm_encoder1.PPM_STATE_RNIH6OE8_0Z0Z_0\
        );

    \I__300\ : InMux
    port map (
            O => \N__2792\,
            I => \ppm_encoder1.un1_init_pulses_cry_1\
        );

    \I__299\ : CascadeMux
    port map (
            O => \N__2789\,
            I => \N__2786\
        );

    \I__298\ : InMux
    port map (
            O => \N__2786\,
            I => \N__2783\
        );

    \I__297\ : LocalMux
    port map (
            O => \N__2783\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_3\
        );

    \I__296\ : InMux
    port map (
            O => \N__2780\,
            I => \ppm_encoder1.un1_init_pulses_cry_2\
        );

    \I__295\ : InMux
    port map (
            O => \N__2777\,
            I => \N__2774\
        );

    \I__294\ : LocalMux
    port map (
            O => \N__2774\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_4\
        );

    \I__293\ : InMux
    port map (
            O => \N__2771\,
            I => \ppm_encoder1.un1_init_pulses_cry_3\
        );

    \I__292\ : InMux
    port map (
            O => \N__2768\,
            I => \ppm_encoder1.un1_init_pulses_cry_4\
        );

    \I__291\ : InMux
    port map (
            O => \N__2765\,
            I => \N__2757\
        );

    \I__290\ : InMux
    port map (
            O => \N__2764\,
            I => \N__2757\
        );

    \I__289\ : InMux
    port map (
            O => \N__2763\,
            I => \N__2754\
        );

    \I__288\ : InMux
    port map (
            O => \N__2762\,
            I => \N__2751\
        );

    \I__287\ : LocalMux
    port map (
            O => \N__2757\,
            I => \ppm_encoder1.un14_0_i_0_0\
        );

    \I__286\ : LocalMux
    port map (
            O => \N__2754\,
            I => \ppm_encoder1.un14_0_i_0_0\
        );

    \I__285\ : LocalMux
    port map (
            O => \N__2751\,
            I => \ppm_encoder1.un14_0_i_0_0\
        );

    \I__284\ : InMux
    port map (
            O => \N__2744\,
            I => \ppm_encoder1.un1_init_pulses_cry_5\
        );

    \I__283\ : InMux
    port map (
            O => \N__2741\,
            I => \N__2738\
        );

    \I__282\ : LocalMux
    port map (
            O => \N__2738\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_7\
        );

    \I__281\ : InMux
    port map (
            O => \N__2735\,
            I => \ppm_encoder1.un1_init_pulses_cry_6\
        );

    \I__280\ : InMux
    port map (
            O => \N__2732\,
            I => \bfn_8_24_0_\
        );

    \I__279\ : InMux
    port map (
            O => \N__2729\,
            I => \N__2726\
        );

    \I__278\ : LocalMux
    port map (
            O => \N__2726\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_9\
        );

    \I__277\ : InMux
    port map (
            O => \N__2723\,
            I => \ppm_encoder1.un1_init_pulses_cry_8\
        );

    \I__276\ : InMux
    port map (
            O => \N__2720\,
            I => \N__2717\
        );

    \I__275\ : LocalMux
    port map (
            O => \N__2717\,
            I => \ppm_encoder1.init_pulses_RNO_0Z0Z_10\
        );

    \I__274\ : InMux
    port map (
            O => \N__2714\,
            I => \ppm_encoder1.un1_init_pulses_cry_9\
        );

    \I__273\ : CascadeMux
    port map (
            O => \N__2711\,
            I => \N__2706\
        );

    \I__272\ : InMux
    port map (
            O => \N__2710\,
            I => \N__2702\
        );

    \I__271\ : InMux
    port map (
            O => \N__2709\,
            I => \N__2699\
        );

    \I__270\ : InMux
    port map (
            O => \N__2706\,
            I => \N__2694\
        );

    \I__269\ : InMux
    port map (
            O => \N__2705\,
            I => \N__2694\
        );

    \I__268\ : LocalMux
    port map (
            O => \N__2702\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_0\
        );

    \I__267\ : LocalMux
    port map (
            O => \N__2699\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_0\
        );

    \I__266\ : LocalMux
    port map (
            O => \N__2694\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_0\
        );

    \I__265\ : CascadeMux
    port map (
            O => \N__2687\,
            I => \ppm_encoder1.un14_0_iv_1_12_cascade_\
        );

    \I__264\ : CascadeMux
    port map (
            O => \N__2684\,
            I => \ppm_encoder1.un14_0_12_cascade_\
        );

    \I__263\ : CascadeMux
    port map (
            O => \N__2681\,
            I => \N__2676\
        );

    \I__262\ : CascadeMux
    port map (
            O => \N__2680\,
            I => \N__2673\
        );

    \I__261\ : CascadeMux
    port map (
            O => \N__2679\,
            I => \N__2668\
        );

    \I__260\ : InMux
    port map (
            O => \N__2676\,
            I => \N__2665\
        );

    \I__259\ : InMux
    port map (
            O => \N__2673\,
            I => \N__2662\
        );

    \I__258\ : InMux
    port map (
            O => \N__2672\,
            I => \N__2655\
        );

    \I__257\ : InMux
    port map (
            O => \N__2671\,
            I => \N__2655\
        );

    \I__256\ : InMux
    port map (
            O => \N__2668\,
            I => \N__2655\
        );

    \I__255\ : LocalMux
    port map (
            O => \N__2665\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__254\ : LocalMux
    port map (
            O => \N__2662\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__253\ : LocalMux
    port map (
            O => \N__2655\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__252\ : InMux
    port map (
            O => \N__2648\,
            I => \N__2641\
        );

    \I__251\ : InMux
    port map (
            O => \N__2647\,
            I => \N__2638\
        );

    \I__250\ : InMux
    port map (
            O => \N__2646\,
            I => \N__2631\
        );

    \I__249\ : InMux
    port map (
            O => \N__2645\,
            I => \N__2631\
        );

    \I__248\ : InMux
    port map (
            O => \N__2644\,
            I => \N__2631\
        );

    \I__247\ : LocalMux
    port map (
            O => \N__2641\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__246\ : LocalMux
    port map (
            O => \N__2638\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__245\ : LocalMux
    port map (
            O => \N__2631\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__244\ : CascadeMux
    port map (
            O => \N__2624\,
            I => \ppm_encoder1.init_pulses39_2_0_cascade_\
        );

    \I__243\ : CascadeMux
    port map (
            O => \N__2621\,
            I => \N__2615\
        );

    \I__242\ : InMux
    port map (
            O => \N__2620\,
            I => \N__2609\
        );

    \I__241\ : InMux
    port map (
            O => \N__2619\,
            I => \N__2609\
        );

    \I__240\ : InMux
    port map (
            O => \N__2618\,
            I => \N__2602\
        );

    \I__239\ : InMux
    port map (
            O => \N__2615\,
            I => \N__2602\
        );

    \I__238\ : InMux
    port map (
            O => \N__2614\,
            I => \N__2602\
        );

    \I__237\ : LocalMux
    port map (
            O => \N__2609\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_2\
        );

    \I__236\ : LocalMux
    port map (
            O => \N__2602\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_2\
        );

    \I__235\ : InMux
    port map (
            O => \N__2597\,
            I => \N__2594\
        );

    \I__234\ : LocalMux
    port map (
            O => \N__2594\,
            I => \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIINM32Z0Z_2\
        );

    \I__233\ : InMux
    port map (
            O => \N__2591\,
            I => \N__2587\
        );

    \I__232\ : InMux
    port map (
            O => \N__2590\,
            I => \N__2584\
        );

    \I__231\ : LocalMux
    port map (
            O => \N__2587\,
            I => \ppm_encoder1.un14_0_12\
        );

    \I__230\ : LocalMux
    port map (
            O => \N__2584\,
            I => \ppm_encoder1.un14_0_12\
        );

    \I__229\ : InMux
    port map (
            O => \N__2579\,
            I => \ppm_encoder1.un1_init_pulses_cry_0\
        );

    \I__228\ : IoInMux
    port map (
            O => \N__2576\,
            I => \N__2573\
        );

    \I__227\ : LocalMux
    port map (
            O => \N__2573\,
            I => \N__2570\
        );

    \I__226\ : Span4Mux_s2_v
    port map (
            O => \N__2570\,
            I => \N__2567\
        );

    \I__225\ : Sp12to4
    port map (
            O => \N__2567\,
            I => \N__2564\
        );

    \I__224\ : Span12Mux_s6_h
    port map (
            O => \N__2564\,
            I => \N__2561\
        );

    \I__223\ : Span12Mux_v
    port map (
            O => \N__2561\,
            I => \N__2558\
        );

    \I__222\ : Span12Mux_v
    port map (
            O => \N__2558\,
            I => \N__2555\
        );

    \I__221\ : Odrv12
    port map (
            O => \N__2555\,
            I => led_c
        );

    \I__220\ : CascadeMux
    port map (
            O => \N__2552\,
            I => \ppm_encoder1.N_46_cascade_\
        );

    \IN_MUX_bfv_11_24_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "01"
        )
    port map (
            carryinitin => '0',
            carryinitout => \bfn_11_24_0_\
        );

    \IN_MUX_bfv_11_25_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => \ppm_encoder1.counter11_0_data_tmp_7\,
            carryinitout => \bfn_11_25_0_\
        );

    \IN_MUX_bfv_9_28_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "00"
        )
    port map (
            carryinitin => '0',
            carryinitout => \bfn_9_28_0_\
        );

    \IN_MUX_bfv_9_29_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => \uart1.un1_count_pulses_needed_6_cry_7\,
            carryinitout => \bfn_9_29_0_\
        );

    \IN_MUX_bfv_8_23_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "00"
        )
    port map (
            carryinitin => '0',
            carryinitout => \bfn_8_23_0_\
        );

    \IN_MUX_bfv_8_24_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => \ppm_encoder1.un1_init_pulses_cry_7\,
            carryinitout => \bfn_8_24_0_\
        );

    \IN_MUX_bfv_8_25_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => \ppm_encoder1.un1_init_pulses_cry_15\,
            carryinitout => \bfn_8_25_0_\
        );

    \IN_MUX_bfv_11_26_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "00"
        )
    port map (
            carryinitin => '0',
            carryinitout => \bfn_11_26_0_\
        );

    \IN_MUX_bfv_11_27_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => \ppm_encoder1.un1_counter_13_cry_7\,
            carryinitout => \bfn_11_27_0_\
        );

    \IN_MUX_bfv_11_28_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => \ppm_encoder1.un1_counter_13_cry_15\,
            carryinitout => \bfn_11_28_0_\
        );

    \ppm_encoder1.counter11_0_I_57_c_RNI6HID2_0\ : ICE_GB
    port map (
            USERSIGNALTOGLOBALBUFFER => \N__4502\,
            GLOBALBUFFEROUTPUT => \ppm_encoder1.un1_PPM_STATE_0_sqmuxa_0_i_g\
        );

    \VCC\ : VCC
    port map (
            Y => \VCCG0\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIN2AA1_1_3\ : ICE_GB
    port map (
            USERSIGNALTOGLOBALBUFFER => \N__4691\,
            GLOBALBUFFEROUTPUT => \ppm_encoder1.N_31_i_g\
        );

    \GND\ : GND
    port map (
            Y => \GNDG0\
        );

    \GND_Inst\ : GND
    port map (
            Y => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIAP4S1_0_LC_7_22_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1010000010000000"
        )
    port map (
            in0 => \N__2619\,
            in1 => \N__2709\,
            in2 => \N__2680\,
            in3 => \N__2647\,
            lcout => OPEN,
            ltout => \ppm_encoder1.N_46_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNILLSE4_0_LC_7_22_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000001"
        )
    port map (
            in0 => \N__5347\,
            in1 => \N__4439\,
            in2 => \N__2552\,
            in3 => \N__4389\,
            lcout => \ppm_encoder1.un14_0_i_0_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_2_LC_7_22_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000011110001000"
        )
    port map (
            in0 => \N__4957\,
            in1 => \N__5044\,
            in2 => \N__4775\,
            in3 => \N__2620\,
            lcout => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5986\,
            ce => \N__5315\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNO_0_0_LC_7_22_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4440\,
            in2 => \_gnd_net_\,
            in3 => \N__4390\,
            lcout => \ppm_encoder1.N_39_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_7_LC_7_23_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011101110110000"
        )
    port map (
            in0 => \N__4616\,
            in1 => \N__3115\,
            in2 => \N__3310\,
            in3 => \N__2741\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_7\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5984\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_9_LC_7_23_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000101100000000"
        )
    port map (
            in0 => \N__4617\,
            in1 => \N__3116\,
            in2 => \N__3311\,
            in3 => \N__2729\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_9\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5984\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNIH6OE8_0_LC_7_23_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2763\,
            in2 => \_gnd_net_\,
            in3 => \N__2591\,
            lcout => \ppm_encoder1.PPM_STATE_RNIH6OE8Z0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_3_LC_7_23_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1111110001010100"
        )
    port map (
            in0 => \N__3114\,
            in1 => \N__3279\,
            in2 => \N__2789\,
            in3 => \N__4618\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5984\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_4_LC_7_24_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000110100000000"
        )
    port map (
            in0 => \N__3108\,
            in1 => \N__4619\,
            in2 => \N__3329\,
            in3 => \N__2777\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_4\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5982\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_10_LC_7_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000110100000000"
        )
    port map (
            in0 => \N__3109\,
            in1 => \N__4613\,
            in2 => \N__3330\,
            in3 => \N__2720\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_10\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5980\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_11_LC_7_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000101100000000"
        )
    port map (
            in0 => \N__4611\,
            in1 => \N__3112\,
            in2 => \N__3325\,
            in3 => \N__2894\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_11\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5980\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_13_LC_7_25_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110111010000"
        )
    port map (
            in0 => \N__3110\,
            in1 => \N__4614\,
            in2 => \N__3331\,
            in3 => \N__2873\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5980\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_14_LC_7_25_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110111010000"
        )
    port map (
            in0 => \N__3111\,
            in1 => \N__4615\,
            in2 => \N__3332\,
            in3 => \N__2831\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_14\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5980\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_15_LC_7_25_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011101110110000"
        )
    port map (
            in0 => \N__4612\,
            in1 => \N__3113\,
            in2 => \N__3326\,
            in3 => \N__2822\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_15\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5980\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_3_LC_8_21_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100011110000"
        )
    port map (
            in0 => \N__5045\,
            in1 => \N__4973\,
            in2 => \N__2681\,
            in3 => \N__4851\,
            lcout => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5987\,
            ce => \N__5313\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_0_LC_8_21_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000001110111"
        )
    port map (
            in0 => \N__4850\,
            in1 => \N__4771\,
            in2 => \_gnd_net_\,
            in3 => \N__2710\,
            lcout => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5987\,
            ce => \N__5313\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_1_LC_8_21_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4972\,
            in2 => \_gnd_net_\,
            in3 => \N__2648\,
            lcout => \ppm_encoder1.CHOOSE_CHANNEL_fastZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5987\,
            ce => \N__5313\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIAP4S1_1_0_LC_8_22_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000001"
        )
    port map (
            in0 => \N__2671\,
            in1 => \N__2705\,
            in2 => \N__2621\,
            in3 => \N__2645\,
            lcout => \ppm_encoder1.pulses2count22_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIAP4S1_0_0_LC_8_22_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000110000001110"
        )
    port map (
            in0 => \N__2646\,
            in1 => \N__2618\,
            in2 => \N__2711\,
            in3 => \N__2672\,
            lcout => OPEN,
            ltout => \ppm_encoder1.un14_0_iv_1_12_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNISGRV3_0_LC_8_22_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111101000001010"
        )
    port map (
            in0 => \N__4056\,
            in1 => \_gnd_net_\,
            in2 => \N__2687\,
            in3 => \N__2597\,
            lcout => \ppm_encoder1.un14_0_12\,
            ltout => \ppm_encoder1.un14_0_12_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNISGRV3_0_0_LC_8_22_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000111100001111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__2684\,
            in3 => \_gnd_net_\,
            lcout => \ppm_encoder1.N_355_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIMD2U_1_LC_8_22_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000001111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__2679\,
            in3 => \N__2644\,
            lcout => \ppm_encoder1.init_pulses39_2_0\,
            ltout => \ppm_encoder1.init_pulses39_2_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIINM32_2_LC_8_22_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1110111111101110"
        )
    port map (
            in0 => \N__4370\,
            in1 => \N__4437\,
            in2 => \N__2624\,
            in3 => \N__2614\,
            lcout => \ppm_encoder1.CHOOSE_CHANNEL_fast_RNIINM32Z0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_1_LC_8_22_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1111001110101010"
        )
    port map (
            in0 => \N__4438\,
            in1 => \N__4670\,
            in2 => \N__5043\,
            in3 => \N__3407\,
            lcout => \ppm_encoder1.PPM_STATEZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5985\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNIH6OE8_0_0_LC_8_22_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1010101000000000"
        )
    port map (
            in0 => \N__2762\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__2590\,
            lcout => \ppm_encoder1.PPM_STATE_RNIH6OE8_0Z0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_0_LC_8_23_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0011110000111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2764\,
            in2 => \N__5431\,
            in3 => \_gnd_net_\,
            lcout => \ppm_encoder1.un1_init_pulses_axb_0\,
            ltout => OPEN,
            carryin => \bfn_8_23_0_\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_0\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_1_LC_8_23_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5461\,
            in2 => \N__2855\,
            in3 => \N__2579\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_1\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_0\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_1\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_2_LC_8_23_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3460\,
            in2 => \N__2801\,
            in3 => \N__2792\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_2\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_1\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_2\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_3_LC_8_23_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3481\,
            in2 => \N__2856\,
            in3 => \N__2780\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_3\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_2\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_3\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_4_LC_8_23_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2971\,
            in2 => \_gnd_net_\,
            in3 => \N__2771\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_4\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_3\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_4\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_5_LC_8_23_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2989\,
            in2 => \_gnd_net_\,
            in3 => \N__2768\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_5\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_4\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_5\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_6_LC_8_23_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2765\,
            in2 => \N__3587\,
            in3 => \N__2744\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_6\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_5\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_6\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_7_LC_8_23_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3562\,
            in2 => \_gnd_net_\,
            in3 => \N__2735\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_7\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_6\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_7\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_8_LC_8_24_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3355\,
            in2 => \_gnd_net_\,
            in3 => \N__2732\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_8\,
            ltout => OPEN,
            carryin => \bfn_8_24_0_\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_8\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_9_LC_8_24_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3367\,
            in2 => \_gnd_net_\,
            in3 => \N__2723\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_9\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_8\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_9\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_10_LC_8_24_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3184\,
            in2 => \_gnd_net_\,
            in3 => \N__2714\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_10\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_9\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_10\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_11_LC_8_24_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3433\,
            in2 => \_gnd_net_\,
            in3 => \N__2888\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_11\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_10\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_11\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_12_LC_8_24_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3643\,
            in2 => \N__2863\,
            in3 => \N__2885\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_12\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_11\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_12\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_13_LC_8_24_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3016\,
            in2 => \N__2882\,
            in3 => \N__2867\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_13\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_12\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_13\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_14_LC_8_24_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3544\,
            in2 => \N__2864\,
            in3 => \N__2825\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_14\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_13\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_14\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_15_LC_8_24_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3001\,
            in2 => \_gnd_net_\,
            in3 => \N__2816\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_15\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_14\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_15\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_16_LC_8_25_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3160\,
            in2 => \_gnd_net_\,
            in3 => \N__2813\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_16\,
            ltout => OPEN,
            carryin => \bfn_8_25_0_\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_16\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_17_LC_8_25_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2959\,
            in2 => \_gnd_net_\,
            in3 => \N__2810\,
            lcout => \ppm_encoder1.init_pulses_RNO_0Z0Z_17\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_init_pulses_cry_16\,
            carryout => \ppm_encoder1.un1_init_pulses_cry_17\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_RNO_0_18_LC_8_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3172\,
            in2 => \_gnd_net_\,
            in3 => \N__2807\,
            lcout => OPEN,
            ltout => \ppm_encoder1.init_pulses_RNO_0Z0Z_18_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_18_LC_8_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011000000010000"
        )
    port map (
            in0 => \N__3105\,
            in1 => \N__3294\,
            in2 => \N__2804\,
            in3 => \N__4604\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_18\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5977\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_16_LC_8_25_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011101110110000"
        )
    port map (
            in0 => \N__4601\,
            in1 => \N__3106\,
            in2 => \N__3324\,
            in3 => \N__2948\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_16\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5977\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_17_LC_8_25_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110111010000"
        )
    port map (
            in0 => \N__3104\,
            in1 => \N__4603\,
            in2 => \N__3328\,
            in3 => \N__2942\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_17\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5977\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_12_LC_8_25_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110111010000"
        )
    port map (
            in0 => \N__3103\,
            in1 => \N__4602\,
            in2 => \N__3327\,
            in3 => \N__2936\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_12\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5977\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_0_LC_9_22_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1001",
            LUT_INIT => "1011001110100000"
        )
    port map (
            in0 => \N__4666\,
            in1 => \N__3338\,
            in2 => \N__4969\,
            in3 => \N__4388\,
            lcout => \ppm_encoder1.PPM_STATEZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5983\,
            ce => 'H',
            sr => \N__2930\
        );

    \ppm_encoder1.init_pulses_6_LC_9_23_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000110100000000"
        )
    port map (
            in0 => \N__3076\,
            in1 => \N__4607\,
            in2 => \N__3291\,
            in3 => \N__2915\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_6\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5981\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_1_LC_9_23_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0010001100000000"
        )
    port map (
            in0 => \N__4605\,
            in1 => \N__3245\,
            in2 => \N__3107\,
            in3 => \N__2909\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5981\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_0_LC_9_23_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000110000000100"
        )
    port map (
            in0 => \N__3075\,
            in1 => \N__2903\,
            in2 => \N__3290\,
            in3 => \N__4608\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5981\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNI13JM_1_0_LC_9_23_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000010101010"
        )
    port map (
            in0 => \N__4382\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__4444\,
            lcout => \ppm_encoder1.pulses2count39_0\,
            ltout => \ppm_encoder1.pulses2count39_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIHVGU1_2_LC_9_23_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0100000000000000"
        )
    port map (
            in0 => \N__4848\,
            in1 => \N__3522\,
            in2 => \N__2897\,
            in3 => \N__4963\,
            lcout => \ppm_encoder1.init_pulses_0_sqmuxa_0\,
            ltout => \ppm_encoder1.init_pulses_0_sqmuxa_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_2_LC_9_23_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0100010100000000"
        )
    port map (
            in0 => \N__3244\,
            in1 => \N__4606\,
            in2 => \N__3131\,
            in3 => \N__3128\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5981\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_5_LC_9_24_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000110100000000"
        )
    port map (
            in0 => \N__3077\,
            in1 => \N__4609\,
            in2 => \N__3292\,
            in3 => \N__3122\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_5\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5978\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.init_pulses_8_LC_9_24_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000110100000000"
        )
    port map (
            in0 => \N__3078\,
            in1 => \N__4610\,
            in2 => \N__3293\,
            in3 => \N__3026\,
            lcout => \ppm_encoder1.init_pulsesZ0Z_8\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5978\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CONSTANT_ONE_LUT4_LC_9_24_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111111111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \CONSTANT_ONE_NET\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_13_LC_9_25_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111100001011"
        )
    port map (
            in0 => \N__3020\,
            in1 => \N__3529\,
            in2 => \N__3506\,
            in3 => \N__4970\,
            lcout => \ppm_encoder1.pulses2countZ0Z_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5976\,
            ce => \N__5317\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_15_LC_9_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3005\,
            in2 => \_gnd_net_\,
            in3 => \N__5407\,
            lcout => \ppm_encoder1.pulses2countZ0Z_15\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5976\,
            ce => \N__5317\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_5_LC_9_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100010001000"
        )
    port map (
            in0 => \N__5410\,
            in1 => \N__2990\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \ppm_encoder1.pulses2countZ0Z_5\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5976\,
            ce => \N__5317\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_4_LC_9_25_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2978\,
            in2 => \_gnd_net_\,
            in3 => \N__5409\,
            lcout => \ppm_encoder1.pulses2countZ0Z_4\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5976\,
            ce => \N__5317\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_17_LC_9_25_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010101000000000"
        )
    port map (
            in0 => \N__5408\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__2960\,
            lcout => \ppm_encoder1.pulses2countZ0Z_17\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5976\,
            ce => \N__5317\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_18_LC_9_26_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3173\,
            in2 => \_gnd_net_\,
            in3 => \N__5412\,
            lcout => \ppm_encoder1.pulses2countZ0Z_18\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5972\,
            ce => \N__5318\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_16_LC_9_26_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3161\,
            in2 => \_gnd_net_\,
            in3 => \N__5411\,
            lcout => \ppm_encoder1.pulses2countZ0Z_16\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5972\,
            ce => \N__5318\,
            sr => \_gnd_net_\
        );

    \uart1.count_pulses_needed_0_LC_9_28_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3800\,
            in2 => \N__5540\,
            in3 => \N__5539\,
            lcout => \uart1.count_pulses_neededZ0Z_0\,
            ltout => OPEN,
            carryin => \bfn_9_28_0_\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_0\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_1_LC_9_28_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3836\,
            in2 => \_gnd_net_\,
            in3 => \N__3149\,
            lcout => \uart1.count_pulses_neededZ0Z_1\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_0\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_1\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_2_LC_9_28_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3754\,
            in2 => \_gnd_net_\,
            in3 => \N__3146\,
            lcout => \uart1.count_pulses_neededZ0Z_2\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_1\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_2\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_3_LC_9_28_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3770\,
            in2 => \_gnd_net_\,
            in3 => \N__3143\,
            lcout => \uart1.count_pulses_neededZ0Z_3\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_2\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_3\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_4_LC_9_28_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3602\,
            in2 => \_gnd_net_\,
            in3 => \N__3140\,
            lcout => \uart1.count_pulses_neededZ0Z_4\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_3\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_4\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_5_LC_9_28_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3854\,
            in2 => \_gnd_net_\,
            in3 => \N__3137\,
            lcout => \uart1.count_pulses_neededZ0Z_5\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_4\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_5\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_6_LC_9_28_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3812\,
            in2 => \_gnd_net_\,
            in3 => \N__3134\,
            lcout => \uart1.count_pulses_neededZ0Z_6\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_5\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_6\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_7_LC_9_28_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3619\,
            in2 => \_gnd_net_\,
            in3 => \N__3380\,
            lcout => \uart1.count_pulses_neededZ0Z_7\,
            ltout => OPEN,
            carryin => \uart1.un1_count_pulses_needed_6_cry_6\,
            carryout => \uart1.un1_count_pulses_needed_6_cry_7\,
            clk => \N__5969\,
            ce => 'H',
            sr => \N__3725\
        );

    \uart1.count_pulses_needed_8_LC_9_29_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3788\,
            in2 => \_gnd_net_\,
            in3 => \N__3377\,
            lcout => \uart1.count_pulses_neededZ0Z_8\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5966\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_9_LC_10_22_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010101000000000"
        )
    port map (
            in0 => \N__5367\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__3374\,
            lcout => \ppm_encoder1.pulses2countZ0Z_9\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5979\,
            ce => \N__5311\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_8_LC_10_22_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3356\,
            in2 => \_gnd_net_\,
            in3 => \N__5366\,
            lcout => \ppm_encoder1.pulses2countZ0Z_8\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5979\,
            ce => \N__5311\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIMVMJ_0_1_LC_10_23_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000010100"
        )
    port map (
            in0 => \N__4763\,
            in1 => \N__5035\,
            in2 => \N__4852\,
            in3 => \N__4961\,
            lcout => \ppm_encoder1.N_47\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNO_1_0_LC_10_23_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4564\,
            in2 => \_gnd_net_\,
            in3 => \N__4471\,
            lcout => \ppm_encoder1.PPM_STATE_e_1_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIN2AA1_0_3_LC_10_23_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000100000000000"
        )
    port map (
            in0 => \N__4762\,
            in1 => \N__4867\,
            in2 => \N__4706\,
            in3 => \N__4844\,
            lcout => \ppm_encoder1.init_pulses_6_sqmuxa\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_RNO_0_11_LC_10_23_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0001010101010101"
        )
    port map (
            in0 => \N__4764\,
            in1 => \N__5036\,
            in2 => \N__4853\,
            in3 => \N__4962\,
            lcout => \ppm_encoder1.pulses2count_8_0_iv_0_1_10_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_10_LC_10_24_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3191\,
            in2 => \_gnd_net_\,
            in3 => \N__5401\,
            lcout => \ppm_encoder1.pulses2countZ0Z_10\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_6_LC_10_24_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1111111101010101"
        )
    port map (
            in0 => \N__5404\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__3583\,
            lcout => \ppm_encoder1.pulses2countZ0Z_6\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_7_LC_10_24_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3569\,
            in2 => \_gnd_net_\,
            in3 => \N__5405\,
            lcout => \ppm_encoder1.pulses2countZ0Z_7\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_14_LC_10_24_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1111000011111000"
        )
    port map (
            in0 => \N__3551\,
            in1 => \N__3533\,
            in2 => \N__3502\,
            in3 => \N__4971\,
            lcout => \ppm_encoder1.pulses2countZ0Z_14\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_3_LC_10_24_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100011001100"
        )
    port map (
            in0 => \N__3485\,
            in1 => \N__5484\,
            in2 => \_gnd_net_\,
            in3 => \N__5403\,
            lcout => \ppm_encoder1.pulses2countZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_2_LC_10_24_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011101100110011"
        )
    port map (
            in0 => \N__3464\,
            in1 => \N__5483\,
            in2 => \_gnd_net_\,
            in3 => \N__5402\,
            lcout => \ppm_encoder1.pulses2countZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_11_LC_10_24_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0100111100001111"
        )
    port map (
            in0 => \N__4849\,
            in1 => \N__4871\,
            in2 => \N__3449\,
            in3 => \N__3440\,
            lcout => \ppm_encoder1.pulses2countZ0Z_11\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5974\,
            ce => \N__5314\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_15_c_RNO_LC_10_25_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111101111011110"
        )
    port map (
            in0 => \N__4488\,
            in1 => \N__3422\,
            in2 => \N__3416\,
            in3 => \N__4143\,
            lcout => \ppm_encoder1.counter11_0_I_15_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNO_0_1_LC_10_25_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0101000001011010"
        )
    port map (
            in0 => \N__4396\,
            in1 => \_gnd_net_\,
            in2 => \N__4472\,
            in3 => \N__4535\,
            lcout => \ppm_encoder1.PPM_STATE_r_1_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_45_c_RNO_LC_10_25_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__3395\,
            in1 => \N__5285\,
            in2 => \N__3389\,
            in3 => \N__5189\,
            lcout => \ppm_encoder1.counter11_0_I_45_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNI13JM_0_0_LC_10_25_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4467\,
            in2 => \_gnd_net_\,
            in3 => \N__4395\,
            lcout => \ppm_encoder1.N_35_i_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_51_c_RNO_LC_10_25_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0110111111110110"
        )
    port map (
            in0 => \N__4180\,
            in1 => \N__3674\,
            in2 => \N__4211\,
            in3 => \N__3668\,
            lcout => \ppm_encoder1.counter11_0_I_51_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_39_c_RNO_LC_10_26_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__3632\,
            in1 => \N__4233\,
            in2 => \N__3659\,
            in3 => \N__4254\,
            lcout => \ppm_encoder1.counter11_0_I_39_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_12_LC_10_26_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100010101010"
        )
    port map (
            in0 => \N__5495\,
            in1 => \N__3650\,
            in2 => \_gnd_net_\,
            in3 => \N__5406\,
            lcout => \ppm_encoder1.pulses2countZ0Z_12\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5971\,
            ce => \N__5316\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNIG8G3_11_LC_10_26_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000100"
        )
    port map (
            in0 => \N__4207\,
            in1 => \N__4281\,
            in2 => \N__4103\,
            in3 => \N__4234\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_12\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_57_c_RNO_LC_10_27_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3626\,
            in2 => \_gnd_net_\,
            in3 => \N__5238\,
            lcout => \ppm_encoder1.counter11_0_I_57_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_RNIFHNB3_3_LC_10_28_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000010001"
        )
    port map (
            in0 => \N__5770\,
            in1 => \N__5522\,
            in2 => \_gnd_net_\,
            in3 => \N__5850\,
            lcout => \uart1.un1_state_bus_1_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__m9_i_o2_1_2_LC_10_28_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111011111"
        )
    port map (
            in0 => \N__3600\,
            in1 => \N__3852\,
            in2 => \N__3620\,
            in3 => \N__3834\,
            lcout => \uart1.m9_i_o2_1_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__m9_i_o2_0_3_LC_10_28_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3615\,
            in2 => \_gnd_net_\,
            in3 => \N__3601\,
            lcout => \uart1.m9_i_o2_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__m9_i_o2_1_0_LC_10_28_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111111111111111"
        )
    port map (
            in0 => \N__3853\,
            in1 => \N__3835\,
            in2 => \N__3755\,
            in3 => \N__5769\,
            lcout => OPEN,
            ltout => \uart1.m9_i_o2_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__m9_i_o2_LC_10_28_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111111101"
        )
    port map (
            in0 => \N__3769\,
            in1 => \N__3776\,
            in2 => \N__3821\,
            in3 => \N__3818\,
            lcout => \uart1.N_29\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__m9_i_o2_0_2_LC_10_28_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111011101"
        )
    port map (
            in0 => \N__3811\,
            in1 => \N__3799\,
            in2 => \_gnd_net_\,
            in3 => \N__3787\,
            lcout => \uart1.m9_i_o2_0_2\,
            ltout => \uart1.m9_i_o2_0_2_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__m9_i_o2_1_LC_10_28_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111110111"
        )
    port map (
            in0 => \N__3768\,
            in1 => \N__3753\,
            in2 => \N__3737\,
            in3 => \N__3734\,
            lcout => \uart1.N_23\,
            ltout => \uart1.N_23_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_RNI9EKQ5_1_LC_10_28_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000111100110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5824\,
            in2 => \N__3728\,
            in3 => \N__5717\,
            lcout => \uart1.N_5\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.PPM_STATE_RNI13JM_0_LC_11_22_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4457\,
            in2 => \_gnd_net_\,
            in3 => \N__4394\,
            lcout => \ppm_encoder1.N_39\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_27_c_RNO_LC_11_23_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__3710\,
            in1 => \N__5138\,
            in2 => \N__3704\,
            in3 => \N__5222\,
            lcout => \ppm_encoder1.counter11_0_I_27_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIMVMJ_1_LC_11_23_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1100101000111111"
        )
    port map (
            in0 => \N__4745\,
            in1 => \N__5009\,
            in2 => \N__4835\,
            in3 => \N__4923\,
            lcout => \ppm_encoder1.un1_init_pulses39_2_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.ppm_output_reg_LC_11_23_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0101101000011110"
        )
    port map (
            in0 => \N__4654\,
            in1 => \N__4642\,
            in2 => \N__3691\,
            in3 => \N__4565\,
            lcout => ppm_output_c,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5975\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_1_c_LC_11_24_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5441\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \bfn_11_24_0_\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_0\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_9_c_LC_11_24_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3908\,
            in2 => \N__4055\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_0\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_1\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_15_c_LC_11_24_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3887\,
            in2 => \N__4049\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_1\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_2\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_21_c_LC_11_24_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3938\,
            in2 => \N__4052\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_2\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_3\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_27_c_LC_11_24_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3881\,
            in2 => \N__4050\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_3\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_4\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_33_c_LC_11_24_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3959\,
            in2 => \N__4053\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_4\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_5\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_39_c_LC_11_24_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3875\,
            in2 => \N__4051\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_5\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_6\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_45_c_LC_11_24_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3866\,
            in2 => \N__4054\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_6\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_7\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_51_c_LC_11_25_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3860\,
            in2 => \N__4063\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \bfn_11_25_0_\,
            carryout => \ppm_encoder1.counter11_0_data_tmp_8\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_57_c_LC_11_25_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4073\,
            in2 => \N__4064\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \ppm_encoder1.counter11_0_data_tmp_8\,
            carryout => \ppm_encoder1.counter11_0_N_2\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_N_2_THRU_LUT4_0_LC_11_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111100000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__3977\,
            lcout => \ppm_encoder1.counter11_0_N_2_THRU_CO\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_33_c_RNO_LC_11_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__3974\,
            in1 => \N__4283\,
            in2 => \N__3968\,
            in3 => \N__5098\,
            lcout => \ppm_encoder1.counter11_0_I_33_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_21_c_RNO_LC_11_25_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111101111011110"
        )
    port map (
            in0 => \N__4098\,
            in1 => \N__3953\,
            in2 => \N__3947\,
            in3 => \N__4119\,
            lcout => \ppm_encoder1.counter11_0_I_21_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNI4452_17_LC_11_25_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000001010101"
        )
    port map (
            in0 => \N__4120\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__4184\,
            lcout => OPEN,
            ltout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_2_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNIH9Q7_12_LC_11_25_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000001000000"
        )
    port map (
            in0 => \N__4259\,
            in1 => \N__3932\,
            in2 => \N__3926\,
            in3 => \N__4144\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_16\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_9_c_RNO_LC_11_25_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111101111011110"
        )
    port map (
            in0 => \N__5115\,
            in1 => \N__3923\,
            in2 => \N__3917\,
            in3 => \N__5073\,
            lcout => \ppm_encoder1.counter11_0_I_9_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_0_LC_11_26_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5168\,
            in2 => \N__3902\,
            in3 => \N__3901\,
            lcout => \ppm_encoder1.counterZ0Z_0\,
            ltout => OPEN,
            carryin => \bfn_11_26_0_\,
            carryout => \ppm_encoder1.un1_counter_13_cry_0\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_1_LC_11_26_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5264\,
            in2 => \_gnd_net_\,
            in3 => \N__4154\,
            lcout => \ppm_encoder1.counterZ0Z_1\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_0\,
            carryout => \ppm_encoder1.un1_counter_13_cry_1\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_2_LC_11_26_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5075\,
            in2 => \_gnd_net_\,
            in3 => \N__4151\,
            lcout => \ppm_encoder1.counterZ0Z_2\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_1\,
            carryout => \ppm_encoder1.un1_counter_13_cry_2\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_3_LC_11_26_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5117\,
            in2 => \_gnd_net_\,
            in3 => \N__4148\,
            lcout => \ppm_encoder1.counterZ0Z_3\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_2\,
            carryout => \ppm_encoder1.un1_counter_13_cry_3\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_4_LC_11_26_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4145\,
            in2 => \_gnd_net_\,
            in3 => \N__4127\,
            lcout => \ppm_encoder1.counterZ0Z_4\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_3\,
            carryout => \ppm_encoder1.un1_counter_13_cry_4\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_5_LC_11_26_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4492\,
            in2 => \_gnd_net_\,
            in3 => \N__4124\,
            lcout => \ppm_encoder1.counterZ0Z_5\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_4\,
            carryout => \ppm_encoder1.un1_counter_13_cry_5\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_6_LC_11_26_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4121\,
            in2 => \_gnd_net_\,
            in3 => \N__4106\,
            lcout => \ppm_encoder1.counterZ0Z_6\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_5\,
            carryout => \ppm_encoder1.un1_counter_13_cry_6\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_7_LC_11_26_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4102\,
            in2 => \_gnd_net_\,
            in3 => \N__4082\,
            lcout => \ppm_encoder1.counterZ0Z_7\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_6\,
            carryout => \ppm_encoder1.un1_counter_13_cry_7\,
            clk => \N__5968\,
            ce => 'H',
            sr => \N__4328\
        );

    \ppm_encoder1.counter_8_LC_11_27_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5221\,
            in2 => \_gnd_net_\,
            in3 => \N__4079\,
            lcout => \ppm_encoder1.counterZ0Z_8\,
            ltout => OPEN,
            carryin => \bfn_11_27_0_\,
            carryout => \ppm_encoder1.un1_counter_13_cry_8\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_9_LC_11_27_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5137\,
            in2 => \_gnd_net_\,
            in3 => \N__4076\,
            lcout => \ppm_encoder1.counterZ0Z_9\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_8\,
            carryout => \ppm_encoder1.un1_counter_13_cry_9\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_10_LC_11_27_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5097\,
            in2 => \_gnd_net_\,
            in3 => \N__4286\,
            lcout => \ppm_encoder1.counterZ0Z_10\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_9\,
            carryout => \ppm_encoder1.un1_counter_13_cry_10\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_11_LC_11_27_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4282\,
            in2 => \_gnd_net_\,
            in3 => \N__4262\,
            lcout => \ppm_encoder1.counterZ0Z_11\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_10\,
            carryout => \ppm_encoder1.un1_counter_13_cry_11\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_12_LC_11_27_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4258\,
            in2 => \_gnd_net_\,
            in3 => \N__4238\,
            lcout => \ppm_encoder1.counterZ0Z_12\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_11\,
            carryout => \ppm_encoder1.un1_counter_13_cry_12\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_13_LC_11_27_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4235\,
            in2 => \_gnd_net_\,
            in3 => \N__4220\,
            lcout => \ppm_encoder1.counterZ0Z_13\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_12\,
            carryout => \ppm_encoder1.un1_counter_13_cry_13\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_14_LC_11_27_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5188\,
            in2 => \_gnd_net_\,
            in3 => \N__4217\,
            lcout => \ppm_encoder1.counterZ0Z_14\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_13\,
            carryout => \ppm_encoder1.un1_counter_13_cry_14\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_15_LC_11_27_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5284\,
            in2 => \_gnd_net_\,
            in3 => \N__4214\,
            lcout => \ppm_encoder1.counterZ0Z_15\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_14\,
            carryout => \ppm_encoder1.un1_counter_13_cry_15\,
            clk => \N__5965\,
            ce => 'H',
            sr => \N__4327\
        );

    \ppm_encoder1.counter_16_LC_11_28_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4206\,
            in2 => \_gnd_net_\,
            in3 => \N__4187\,
            lcout => \ppm_encoder1.counterZ0Z_16\,
            ltout => OPEN,
            carryin => \bfn_11_28_0_\,
            carryout => \ppm_encoder1.un1_counter_13_cry_16\,
            clk => \N__5964\,
            ce => 'H',
            sr => \N__4326\
        );

    \ppm_encoder1.counter_17_LC_11_28_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4179\,
            in2 => \_gnd_net_\,
            in3 => \N__4157\,
            lcout => \ppm_encoder1.counterZ0Z_17\,
            ltout => OPEN,
            carryin => \ppm_encoder1.un1_counter_13_cry_16\,
            carryout => \ppm_encoder1.un1_counter_13_cry_17\,
            clk => \N__5964\,
            ce => 'H',
            sr => \N__4326\
        );

    \ppm_encoder1.counter_18_LC_11_28_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5242\,
            in2 => \_gnd_net_\,
            in3 => \N__4331\,
            lcout => \ppm_encoder1.counterZ0Z_18\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5964\,
            ce => 'H',
            sr => \N__4326\
        );

    \uart1.data_reg_0_LC_11_29_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010101011001100"
        )
    port map (
            in0 => \N__5654\,
            in1 => \N__6241\,
            in2 => \_gnd_net_\,
            in3 => \N__4306\,
            lcout => data_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_6_LC_11_29_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110110001000"
        )
    port map (
            in0 => \N__4312\,
            in1 => \N__5788\,
            in2 => \_gnd_net_\,
            in3 => \N__5803\,
            lcout => data_6,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_4_LC_11_29_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010101011001100"
        )
    port map (
            in0 => \N__6260\,
            in1 => \N__5671\,
            in2 => \_gnd_net_\,
            in3 => \N__4310\,
            lcout => data_4,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_1_LC_11_29_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1111010110100000"
        )
    port map (
            in0 => \N__4307\,
            in1 => \_gnd_net_\,
            in2 => \N__6188\,
            in3 => \N__5653\,
            lcout => data_1,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_3_LC_11_29_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110010101010"
        )
    port map (
            in0 => \N__6082\,
            in1 => \N__5672\,
            in2 => \_gnd_net_\,
            in3 => \N__4309\,
            lcout => data_3,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_5_LC_11_29_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1110111001000100"
        )
    port map (
            in0 => \N__4311\,
            in1 => \N__6259\,
            in2 => \_gnd_net_\,
            in3 => \N__5804\,
            lcout => data_5,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_2_LC_11_29_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010101011001100"
        )
    port map (
            in0 => \N__6083\,
            in1 => \N__6182\,
            in2 => \_gnd_net_\,
            in3 => \N__4308\,
            lcout => data_2,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \uart1.data_reg_7_LC_11_29_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110110001000"
        )
    port map (
            in0 => \N__4313\,
            in1 => \N__5584\,
            in2 => \_gnd_net_\,
            in3 => \N__5787\,
            lcout => data_7,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5962\,
            ce => 'H',
            sr => \N__5813\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_3_LC_12_22_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011001110000000"
        )
    port map (
            in0 => \N__4927\,
            in1 => \N__4821\,
            in2 => \N__5034\,
            in3 => \N__4748\,
            lcout => \ppm_encoder1.CHOOSE_CHANNELZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5973\,
            ce => \N__5310\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_1_LC_12_22_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5013\,
            in2 => \_gnd_net_\,
            in3 => \N__4925\,
            lcout => \ppm_encoder1.CHOOSE_CHANNELZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5973\,
            ce => \N__5310\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_2_LC_12_22_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0010000001101100"
        )
    port map (
            in0 => \N__4926\,
            in1 => \N__4820\,
            in2 => \N__5033\,
            in3 => \N__4747\,
            lcout => \ppm_encoder1.CHOOSE_CHANNELZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5973\,
            ce => \N__5310\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_0_LC_12_22_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000001110111"
        )
    port map (
            in0 => \N__4819\,
            in1 => \N__4746\,
            in2 => \_gnd_net_\,
            in3 => \N__4924\,
            lcout => \ppm_encoder1.CHOOSE_CHANNELZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5973\,
            ce => \N__5310\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIPDR9_1_LC_12_23_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5003\,
            in2 => \_gnd_net_\,
            in3 => \N__4915\,
            lcout => \ppm_encoder1.N_146_1\,
            ltout => \ppm_encoder1.N_146_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.CHOOSE_CHANNEL_RNIN2AA1_3_LC_12_23_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000011110111"
        )
    port map (
            in0 => \N__4805\,
            in1 => \N__4737\,
            in2 => \N__4709\,
            in3 => \N__4702\,
            lcout => \ppm_encoder1.N_31_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNIK9FB1_10_LC_12_24_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000000000000000"
        )
    port map (
            in0 => \N__4676\,
            in1 => \N__5057\,
            in2 => \N__5201\,
            in3 => \N__4337\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1\,
            ltout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_57_c_RNI6HID2_LC_12_24_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111000011111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4643\,
            in2 => \N__4622\,
            in3 => \N__4534\,
            lcout => \ppm_encoder1.un1_PPM_STATE_0_sqmuxa_0_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNIK97Q_5_LC_12_24_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000001000000"
        )
    port map (
            in0 => \N__4493\,
            in1 => \N__4466\,
            in2 => \N__5150\,
            in3 => \N__4397\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_15\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_1_LC_12_25_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100010101010"
        )
    port map (
            in0 => \N__5491\,
            in1 => \N__5468\,
            in2 => \_gnd_net_\,
            in3 => \N__5414\,
            lcout => \ppm_encoder1.pulses2countZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5967\,
            ce => \N__5312\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter11_0_I_1_c_RNO_LC_12_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__5324\,
            in1 => \N__5262\,
            in2 => \N__5450\,
            in3 => \N__5166\,
            lcout => \ppm_encoder1.counter11_0_I_1_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.pulses2count_0_LC_12_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110011111111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5435\,
            in2 => \_gnd_net_\,
            in3 => \N__5413\,
            lcout => \ppm_encoder1.pulses2countZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5967\,
            ce => \N__5312\,
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNI44A4_18_LC_12_26_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000100"
        )
    port map (
            in0 => \N__5283\,
            in1 => \N__5263\,
            in2 => \N__5246\,
            in3 => \N__5220\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_14\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNIRQ42_14_LC_12_26_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5187\,
            in2 => \_gnd_net_\,
            in3 => \N__5167\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_encoder1.counter_RNIBI35_10_LC_12_26_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000000000000000"
        )
    port map (
            in0 => \N__5136\,
            in1 => \N__5116\,
            in2 => \N__5099\,
            in3 => \N__5074\,
            lcout => \ppm_encoder1.PPM_STATE_0_sqmuxa_1_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_RNO_0_1_LC_12_27_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1100100111001100"
        )
    port map (
            in0 => \N__5764\,
            in1 => \N__5632\,
            in2 => \N__5876\,
            in3 => \N__5599\,
            lcout => OPEN,
            ltout => \uart1.position_RNO_0Z0Z_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_1_LC_12_27_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0101000001010000"
        )
    port map (
            in0 => \N__5558\,
            in1 => \_gnd_net_\,
            in2 => \N__5048\,
            in3 => \_gnd_net_\,
            lcout => \uart1.positionZ1Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5963\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_2_LC_12_27_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001000100100010"
        )
    port map (
            in0 => \N__5614\,
            in1 => \N__5555\,
            in2 => \_gnd_net_\,
            in3 => \N__5621\,
            lcout => \uart1.positionZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5963\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_RNI5N4Q3_1_LC_12_27_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000100000"
        )
    port map (
            in0 => \N__5598\,
            in1 => \N__5871\,
            in2 => \N__5633\,
            in3 => \N__5763\,
            lcout => \uart1.un1_position_c2\,
            ltout => \uart1.un1_position_c2_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_3_LC_12_27_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000001101100"
        )
    port map (
            in0 => \N__5615\,
            in1 => \N__5518\,
            in2 => \N__5606\,
            in3 => \N__5556\,
            lcout => \uart1.positionZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5963\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.position_0_LC_12_27_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0101000001000001"
        )
    port map (
            in0 => \N__5557\,
            in1 => \N__5875\,
            in2 => \N__5603\,
            in3 => \N__5765\,
            lcout => \uart1.positionZ1Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5963\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_14_1_0__N_9_i_N_2L1_LC_12_28_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0100101101001111"
        )
    port map (
            in0 => \N__5868\,
            in1 => \N__5708\,
            in2 => \N__5771\,
            in3 => \N__5517\,
            lcout => OPEN,
            ltout => \uart1.N_9_i_N_2L1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_0_LC_12_28_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001111100001010"
        )
    port map (
            in0 => \N__5709\,
            in1 => \N__5588\,
            in2 => \N__5561\,
            in3 => \N__5830\,
            lcout => \uart1.state_busZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5961\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_RNIR5T6_0_1_LC_12_28_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5707\,
            in2 => \_gnd_net_\,
            in3 => \N__5758\,
            lcout => \uart1.data_rdy_reg13_0\,
            ltout => \uart1.data_rdy_reg13_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_RNIR5T6_1_1_LC_12_28_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000111100001111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__5543\,
            in3 => \_gnd_net_\,
            lcout => \uart1.data_rdy_reg13_i_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.flag_reg_RNO_0_LC_12_28_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5516\,
            in2 => \_gnd_net_\,
            in3 => \N__5759\,
            lcout => OPEN,
            ltout => \uart1.flag_reg_0_sqmuxa_0_a2_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.flag_reg_LC_12_28_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110001101100"
        )
    port map (
            in0 => \N__5710\,
            in1 => \N__5887\,
            in2 => \N__5894\,
            in3 => \N__5869\,
            lcout => data_debug_c,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5961\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_1_LC_12_28_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000101011001111"
        )
    port map (
            in0 => \N__5870\,
            in1 => \N__5711\,
            in2 => \N__5834\,
            in3 => \N__5760\,
            lcout => \uart1.state_busZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5961\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.state_bus_RNIR5T6_1_LC_12_29_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5712\,
            in2 => \_gnd_net_\,
            in3 => \N__5761\,
            lcout => \uart1.un1_state_bus_0_a2_iso\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_reg_cnst_0_0_45_i_i_x2_LC_12_29_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0101101001011010"
        )
    port map (
            in0 => \N__5651\,
            in1 => \_gnd_net_\,
            in2 => \N__6187\,
            in3 => \_gnd_net_\,
            lcout => \KeyPress1.N_11_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_ready_reg_4_i_0_o3_0_LC_12_29_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000110000000"
        )
    port map (
            in0 => \N__5670\,
            in1 => \N__6078\,
            in2 => \N__6242\,
            in3 => \N__6257\,
            lcout => \KeyPress1.N_44\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_reg_RNO_0_2_LC_12_29_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000011011101"
        )
    port map (
            in0 => \N__5652\,
            in1 => \N__6240\,
            in2 => \_gnd_net_\,
            in3 => \N__6080\,
            lcout => \KeyPress1.N_54\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_ready_reg_4_i_0_a3_2_1_LC_12_29_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000010000000"
        )
    port map (
            in0 => \N__5678\,
            in1 => \N__5802\,
            in2 => \N__6053\,
            in3 => \N__5789\,
            lcout => \KeyPress1.source_data_ready_reg_4_i_0_a3_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \uart1.data_rdy_reg_LC_12_29_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010101000000000"
        )
    port map (
            in0 => \N__5762\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__5716\,
            lcout => data_rdy,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5960\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_ready_reg_4_i_0_o3_LC_12_29_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1010101000010001"
        )
    port map (
            in0 => \N__5669\,
            in1 => \N__6178\,
            in2 => \_gnd_net_\,
            in3 => \N__5650\,
            lcout => OPEN,
            ltout => \KeyPress1.N_42_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_ready_reg_4_i_0_a3_0_LC_12_29_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000010000000"
        )
    port map (
            in0 => \N__6258\,
            in1 => \N__6236\,
            in2 => \N__6221\,
            in3 => \N__6079\,
            lcout => \KeyPress1.N_62\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_reg_2_LC_12_30_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0100000011001000"
        )
    port map (
            in0 => \N__6014\,
            in1 => \N__6048\,
            in2 => \N__6208\,
            in3 => \N__6218\,
            lcout => source_data_c_2,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5959\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_ready_reg_4_i_0_a3_LC_12_30_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111000010000000"
        )
    port map (
            in0 => \N__6093\,
            in1 => \N__6139\,
            in2 => \N__6130\,
            in3 => \N__6115\,
            lcout => \KeyPress1.N_43_0\,
            ltout => \KeyPress1.N_43_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_reg_0_LC_12_30_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010100000001000"
        )
    port map (
            in0 => \N__6046\,
            in1 => \N__6151\,
            in2 => \N__6191\,
            in3 => \N__6186\,
            lcout => source_data_c_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5959\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_ready_reg_LC_12_30_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1111000010000000"
        )
    port map (
            in0 => \N__6095\,
            in1 => \N__6140\,
            in2 => \N__6131\,
            in3 => \N__6116\,
            lcout => source_data_rdy_c,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5959\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_reg_RNO_0_1_LC_12_30_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111101110111"
        )
    port map (
            in0 => \N__6094\,
            in1 => \N__6049\,
            in2 => \_gnd_net_\,
            in3 => \N__6081\,
            lcout => OPEN,
            ltout => \KeyPress1.N_15_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \KeyPress1.source_data_reg_1_LC_12_30_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111110001101"
        )
    port map (
            in0 => \N__6047\,
            in1 => \N__5998\,
            in2 => \N__6017\,
            in3 => \N__6013\,
            lcout => source_data_c_1,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__5959\,
            ce => 'H',
            sr => \_gnd_net_\
        );
end \INTERFACE\;
