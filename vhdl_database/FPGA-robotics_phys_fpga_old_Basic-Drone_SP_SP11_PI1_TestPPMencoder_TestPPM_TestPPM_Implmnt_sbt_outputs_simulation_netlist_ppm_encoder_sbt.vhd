-- ******************************************************************************

-- iCEcube Netlister

-- Version:            2017.08.27940

-- Build Date:         Sep 11 2017 17:29:57

-- File Generated:     Mar 10 2019 17:06:25

-- Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

-- Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

-- ******************************************************************************

-- VHDL file for cell "ppm_encoder" view "INTERFACE"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library ice;
use ice.vcomponent_vital.all;

-- Entity of ppm_encoder
entity ppm_encoder is
port (
    test_led : out std_logic;
    ppm_output : out std_logic;
    clk : in std_logic);
end ppm_encoder;

-- Architecture of ppm_encoder
-- View name is \INTERFACE\
architecture \INTERFACE\ of ppm_encoder is

signal \N__5127\ : std_logic;
signal \N__5126\ : std_logic;
signal \N__5125\ : std_logic;
signal \N__5116\ : std_logic;
signal \N__5115\ : std_logic;
signal \N__5114\ : std_logic;
signal \N__5107\ : std_logic;
signal \N__5106\ : std_logic;
signal \N__5105\ : std_logic;
signal \N__5088\ : std_logic;
signal \N__5087\ : std_logic;
signal \N__5086\ : std_logic;
signal \N__5083\ : std_logic;
signal \N__5080\ : std_logic;
signal \N__5077\ : std_logic;
signal \N__5074\ : std_logic;
signal \N__5067\ : std_logic;
signal \N__5064\ : std_logic;
signal \N__5063\ : std_logic;
signal \N__5062\ : std_logic;
signal \N__5059\ : std_logic;
signal \N__5056\ : std_logic;
signal \N__5053\ : std_logic;
signal \N__5050\ : std_logic;
signal \N__5043\ : std_logic;
signal \N__5040\ : std_logic;
signal \N__5037\ : std_logic;
signal \N__5036\ : std_logic;
signal \N__5033\ : std_logic;
signal \N__5032\ : std_logic;
signal \N__5029\ : std_logic;
signal \N__5026\ : std_logic;
signal \N__5023\ : std_logic;
signal \N__5016\ : std_logic;
signal \N__5015\ : std_logic;
signal \N__5014\ : std_logic;
signal \N__5011\ : std_logic;
signal \N__5008\ : std_logic;
signal \N__5005\ : std_logic;
signal \N__5002\ : std_logic;
signal \N__4999\ : std_logic;
signal \N__4992\ : std_logic;
signal \N__4989\ : std_logic;
signal \N__4986\ : std_logic;
signal \N__4983\ : std_logic;
signal \N__4980\ : std_logic;
signal \N__4977\ : std_logic;
signal \N__4974\ : std_logic;
signal \N__4973\ : std_logic;
signal \N__4970\ : std_logic;
signal \N__4967\ : std_logic;
signal \N__4962\ : std_logic;
signal \N__4959\ : std_logic;
signal \N__4956\ : std_logic;
signal \N__4953\ : std_logic;
signal \N__4950\ : std_logic;
signal \N__4949\ : std_logic;
signal \N__4946\ : std_logic;
signal \N__4943\ : std_logic;
signal \N__4938\ : std_logic;
signal \N__4935\ : std_logic;
signal \N__4932\ : std_logic;
signal \N__4929\ : std_logic;
signal \N__4926\ : std_logic;
signal \N__4925\ : std_logic;
signal \N__4922\ : std_logic;
signal \N__4919\ : std_logic;
signal \N__4914\ : std_logic;
signal \N__4911\ : std_logic;
signal \N__4910\ : std_logic;
signal \N__4907\ : std_logic;
signal \N__4906\ : std_logic;
signal \N__4903\ : std_logic;
signal \N__4900\ : std_logic;
signal \N__4897\ : std_logic;
signal \N__4890\ : std_logic;
signal \N__4887\ : std_logic;
signal \N__4884\ : std_logic;
signal \N__4881\ : std_logic;
signal \N__4878\ : std_logic;
signal \N__4875\ : std_logic;
signal \N__4872\ : std_logic;
signal \N__4869\ : std_logic;
signal \N__4868\ : std_logic;
signal \N__4865\ : std_logic;
signal \N__4862\ : std_logic;
signal \N__4857\ : std_logic;
signal \N__4856\ : std_logic;
signal \N__4855\ : std_logic;
signal \N__4854\ : std_logic;
signal \N__4853\ : std_logic;
signal \N__4852\ : std_logic;
signal \N__4851\ : std_logic;
signal \N__4850\ : std_logic;
signal \N__4849\ : std_logic;
signal \N__4848\ : std_logic;
signal \N__4845\ : std_logic;
signal \N__4844\ : std_logic;
signal \N__4843\ : std_logic;
signal \N__4842\ : std_logic;
signal \N__4841\ : std_logic;
signal \N__4840\ : std_logic;
signal \N__4839\ : std_logic;
signal \N__4836\ : std_logic;
signal \N__4825\ : std_logic;
signal \N__4818\ : std_logic;
signal \N__4815\ : std_logic;
signal \N__4812\ : std_logic;
signal \N__4801\ : std_logic;
signal \N__4798\ : std_logic;
signal \N__4795\ : std_logic;
signal \N__4792\ : std_logic;
signal \N__4791\ : std_logic;
signal \N__4788\ : std_logic;
signal \N__4777\ : std_logic;
signal \N__4774\ : std_logic;
signal \N__4767\ : std_logic;
signal \N__4764\ : std_logic;
signal \N__4761\ : std_logic;
signal \N__4760\ : std_logic;
signal \N__4759\ : std_logic;
signal \N__4758\ : std_logic;
signal \N__4757\ : std_logic;
signal \N__4756\ : std_logic;
signal \N__4755\ : std_logic;
signal \N__4754\ : std_logic;
signal \N__4753\ : std_logic;
signal \N__4752\ : std_logic;
signal \N__4751\ : std_logic;
signal \N__4750\ : std_logic;
signal \N__4749\ : std_logic;
signal \N__4748\ : std_logic;
signal \N__4747\ : std_logic;
signal \N__4746\ : std_logic;
signal \N__4745\ : std_logic;
signal \N__4744\ : std_logic;
signal \N__4743\ : std_logic;
signal \N__4742\ : std_logic;
signal \N__4741\ : std_logic;
signal \N__4740\ : std_logic;
signal \N__4739\ : std_logic;
signal \N__4738\ : std_logic;
signal \N__4689\ : std_logic;
signal \N__4686\ : std_logic;
signal \N__4683\ : std_logic;
signal \N__4682\ : std_logic;
signal \N__4681\ : std_logic;
signal \N__4680\ : std_logic;
signal \N__4679\ : std_logic;
signal \N__4678\ : std_logic;
signal \N__4677\ : std_logic;
signal \N__4676\ : std_logic;
signal \N__4675\ : std_logic;
signal \N__4674\ : std_logic;
signal \N__4653\ : std_logic;
signal \N__4650\ : std_logic;
signal \N__4647\ : std_logic;
signal \N__4646\ : std_logic;
signal \N__4645\ : std_logic;
signal \N__4642\ : std_logic;
signal \N__4637\ : std_logic;
signal \N__4632\ : std_logic;
signal \N__4629\ : std_logic;
signal \N__4628\ : std_logic;
signal \N__4627\ : std_logic;
signal \N__4624\ : std_logic;
signal \N__4621\ : std_logic;
signal \N__4618\ : std_logic;
signal \N__4615\ : std_logic;
signal \N__4612\ : std_logic;
signal \N__4605\ : std_logic;
signal \N__4604\ : std_logic;
signal \N__4603\ : std_logic;
signal \N__4600\ : std_logic;
signal \N__4597\ : std_logic;
signal \N__4594\ : std_logic;
signal \N__4587\ : std_logic;
signal \N__4586\ : std_logic;
signal \N__4585\ : std_logic;
signal \N__4582\ : std_logic;
signal \N__4579\ : std_logic;
signal \N__4576\ : std_logic;
signal \N__4573\ : std_logic;
signal \N__4570\ : std_logic;
signal \N__4563\ : std_logic;
signal \N__4562\ : std_logic;
signal \N__4561\ : std_logic;
signal \N__4560\ : std_logic;
signal \N__4559\ : std_logic;
signal \N__4556\ : std_logic;
signal \N__4555\ : std_logic;
signal \N__4554\ : std_logic;
signal \N__4553\ : std_logic;
signal \N__4550\ : std_logic;
signal \N__4549\ : std_logic;
signal \N__4546\ : std_logic;
signal \N__4543\ : std_logic;
signal \N__4542\ : std_logic;
signal \N__4541\ : std_logic;
signal \N__4538\ : std_logic;
signal \N__4537\ : std_logic;
signal \N__4532\ : std_logic;
signal \N__4527\ : std_logic;
signal \N__4524\ : std_logic;
signal \N__4515\ : std_logic;
signal \N__4512\ : std_logic;
signal \N__4507\ : std_logic;
signal \N__4494\ : std_logic;
signal \N__4491\ : std_logic;
signal \N__4488\ : std_logic;
signal \N__4487\ : std_logic;
signal \N__4486\ : std_logic;
signal \N__4485\ : std_logic;
signal \N__4484\ : std_logic;
signal \N__4481\ : std_logic;
signal \N__4480\ : std_logic;
signal \N__4479\ : std_logic;
signal \N__4478\ : std_logic;
signal \N__4477\ : std_logic;
signal \N__4476\ : std_logic;
signal \N__4475\ : std_logic;
signal \N__4472\ : std_logic;
signal \N__4467\ : std_logic;
signal \N__4464\ : std_logic;
signal \N__4461\ : std_logic;
signal \N__4454\ : std_logic;
signal \N__4447\ : std_logic;
signal \N__4434\ : std_logic;
signal \N__4431\ : std_logic;
signal \N__4428\ : std_logic;
signal \N__4425\ : std_logic;
signal \N__4422\ : std_logic;
signal \N__4419\ : std_logic;
signal \N__4416\ : std_logic;
signal \N__4413\ : std_logic;
signal \N__4410\ : std_logic;
signal \N__4407\ : std_logic;
signal \N__4406\ : std_logic;
signal \N__4405\ : std_logic;
signal \N__4402\ : std_logic;
signal \N__4399\ : std_logic;
signal \N__4396\ : std_logic;
signal \N__4393\ : std_logic;
signal \N__4390\ : std_logic;
signal \N__4387\ : std_logic;
signal \N__4380\ : std_logic;
signal \N__4379\ : std_logic;
signal \N__4376\ : std_logic;
signal \N__4373\ : std_logic;
signal \N__4372\ : std_logic;
signal \N__4369\ : std_logic;
signal \N__4366\ : std_logic;
signal \N__4363\ : std_logic;
signal \N__4356\ : std_logic;
signal \N__4353\ : std_logic;
signal \N__4350\ : std_logic;
signal \N__4349\ : std_logic;
signal \N__4348\ : std_logic;
signal \N__4345\ : std_logic;
signal \N__4344\ : std_logic;
signal \N__4341\ : std_logic;
signal \N__4338\ : std_logic;
signal \N__4335\ : std_logic;
signal \N__4334\ : std_logic;
signal \N__4331\ : std_logic;
signal \N__4328\ : std_logic;
signal \N__4325\ : std_logic;
signal \N__4322\ : std_logic;
signal \N__4319\ : std_logic;
signal \N__4308\ : std_logic;
signal \N__4305\ : std_logic;
signal \N__4302\ : std_logic;
signal \N__4299\ : std_logic;
signal \N__4298\ : std_logic;
signal \N__4297\ : std_logic;
signal \N__4294\ : std_logic;
signal \N__4291\ : std_logic;
signal \N__4288\ : std_logic;
signal \N__4285\ : std_logic;
signal \N__4278\ : std_logic;
signal \N__4277\ : std_logic;
signal \N__4276\ : std_logic;
signal \N__4273\ : std_logic;
signal \N__4270\ : std_logic;
signal \N__4267\ : std_logic;
signal \N__4260\ : std_logic;
signal \N__4259\ : std_logic;
signal \N__4258\ : std_logic;
signal \N__4255\ : std_logic;
signal \N__4252\ : std_logic;
signal \N__4249\ : std_logic;
signal \N__4246\ : std_logic;
signal \N__4239\ : std_logic;
signal \N__4238\ : std_logic;
signal \N__4237\ : std_logic;
signal \N__4234\ : std_logic;
signal \N__4231\ : std_logic;
signal \N__4228\ : std_logic;
signal \N__4225\ : std_logic;
signal \N__4218\ : std_logic;
signal \N__4217\ : std_logic;
signal \N__4216\ : std_logic;
signal \N__4213\ : std_logic;
signal \N__4210\ : std_logic;
signal \N__4207\ : std_logic;
signal \N__4204\ : std_logic;
signal \N__4197\ : std_logic;
signal \N__4194\ : std_logic;
signal \N__4191\ : std_logic;
signal \N__4188\ : std_logic;
signal \N__4185\ : std_logic;
signal \N__4182\ : std_logic;
signal \N__4179\ : std_logic;
signal \N__4176\ : std_logic;
signal \N__4175\ : std_logic;
signal \N__4174\ : std_logic;
signal \N__4171\ : std_logic;
signal \N__4166\ : std_logic;
signal \N__4161\ : std_logic;
signal \N__4158\ : std_logic;
signal \N__4155\ : std_logic;
signal \N__4152\ : std_logic;
signal \N__4151\ : std_logic;
signal \N__4148\ : std_logic;
signal \N__4147\ : std_logic;
signal \N__4144\ : std_logic;
signal \N__4139\ : std_logic;
signal \N__4134\ : std_logic;
signal \N__4131\ : std_logic;
signal \N__4128\ : std_logic;
signal \N__4125\ : std_logic;
signal \N__4122\ : std_logic;
signal \N__4119\ : std_logic;
signal \N__4118\ : std_logic;
signal \N__4117\ : std_logic;
signal \N__4116\ : std_logic;
signal \N__4111\ : std_logic;
signal \N__4110\ : std_logic;
signal \N__4109\ : std_logic;
signal \N__4106\ : std_logic;
signal \N__4105\ : std_logic;
signal \N__4102\ : std_logic;
signal \N__4101\ : std_logic;
signal \N__4100\ : std_logic;
signal \N__4097\ : std_logic;
signal \N__4088\ : std_logic;
signal \N__4081\ : std_logic;
signal \N__4074\ : std_logic;
signal \N__4071\ : std_logic;
signal \N__4068\ : std_logic;
signal \N__4067\ : std_logic;
signal \N__4064\ : std_logic;
signal \N__4061\ : std_logic;
signal \N__4056\ : std_logic;
signal \N__4053\ : std_logic;
signal \N__4050\ : std_logic;
signal \N__4047\ : std_logic;
signal \N__4046\ : std_logic;
signal \N__4043\ : std_logic;
signal \N__4040\ : std_logic;
signal \N__4035\ : std_logic;
signal \N__4032\ : std_logic;
signal \N__4029\ : std_logic;
signal \N__4026\ : std_logic;
signal \N__4023\ : std_logic;
signal \N__4022\ : std_logic;
signal \N__4019\ : std_logic;
signal \N__4016\ : std_logic;
signal \N__4011\ : std_logic;
signal \N__4008\ : std_logic;
signal \N__4005\ : std_logic;
signal \N__4002\ : std_logic;
signal \N__3999\ : std_logic;
signal \N__3996\ : std_logic;
signal \N__3995\ : std_logic;
signal \N__3992\ : std_logic;
signal \N__3989\ : std_logic;
signal \N__3984\ : std_logic;
signal \N__3981\ : std_logic;
signal \N__3978\ : std_logic;
signal \N__3975\ : std_logic;
signal \N__3974\ : std_logic;
signal \N__3973\ : std_logic;
signal \N__3972\ : std_logic;
signal \N__3963\ : std_logic;
signal \N__3960\ : std_logic;
signal \N__3957\ : std_logic;
signal \N__3954\ : std_logic;
signal \N__3953\ : std_logic;
signal \N__3952\ : std_logic;
signal \N__3949\ : std_logic;
signal \N__3946\ : std_logic;
signal \N__3945\ : std_logic;
signal \N__3942\ : std_logic;
signal \N__3933\ : std_logic;
signal \N__3930\ : std_logic;
signal \N__3927\ : std_logic;
signal \N__3924\ : std_logic;
signal \N__3923\ : std_logic;
signal \N__3920\ : std_logic;
signal \N__3917\ : std_logic;
signal \N__3912\ : std_logic;
signal \N__3909\ : std_logic;
signal \N__3906\ : std_logic;
signal \N__3903\ : std_logic;
signal \N__3900\ : std_logic;
signal \N__3897\ : std_logic;
signal \N__3894\ : std_logic;
signal \N__3891\ : std_logic;
signal \N__3888\ : std_logic;
signal \N__3885\ : std_logic;
signal \N__3882\ : std_logic;
signal \N__3881\ : std_logic;
signal \N__3878\ : std_logic;
signal \N__3875\ : std_logic;
signal \N__3870\ : std_logic;
signal \N__3867\ : std_logic;
signal \N__3864\ : std_logic;
signal \N__3861\ : std_logic;
signal \N__3858\ : std_logic;
signal \N__3855\ : std_logic;
signal \N__3852\ : std_logic;
signal \N__3851\ : std_logic;
signal \N__3850\ : std_logic;
signal \N__3849\ : std_logic;
signal \N__3848\ : std_logic;
signal \N__3845\ : std_logic;
signal \N__3842\ : std_logic;
signal \N__3839\ : std_logic;
signal \N__3836\ : std_logic;
signal \N__3831\ : std_logic;
signal \N__3822\ : std_logic;
signal \N__3821\ : std_logic;
signal \N__3820\ : std_logic;
signal \N__3819\ : std_logic;
signal \N__3818\ : std_logic;
signal \N__3815\ : std_logic;
signal \N__3812\ : std_logic;
signal \N__3805\ : std_logic;
signal \N__3798\ : std_logic;
signal \N__3797\ : std_logic;
signal \N__3796\ : std_logic;
signal \N__3795\ : std_logic;
signal \N__3792\ : std_logic;
signal \N__3789\ : std_logic;
signal \N__3788\ : std_logic;
signal \N__3785\ : std_logic;
signal \N__3782\ : std_logic;
signal \N__3779\ : std_logic;
signal \N__3774\ : std_logic;
signal \N__3765\ : std_logic;
signal \N__3764\ : std_logic;
signal \N__3763\ : std_logic;
signal \N__3760\ : std_logic;
signal \N__3759\ : std_logic;
signal \N__3758\ : std_logic;
signal \N__3755\ : std_logic;
signal \N__3752\ : std_logic;
signal \N__3745\ : std_logic;
signal \N__3738\ : std_logic;
signal \N__3735\ : std_logic;
signal \N__3732\ : std_logic;
signal \N__3729\ : std_logic;
signal \N__3726\ : std_logic;
signal \N__3723\ : std_logic;
signal \N__3720\ : std_logic;
signal \N__3717\ : std_logic;
signal \N__3716\ : std_logic;
signal \N__3715\ : std_logic;
signal \N__3714\ : std_logic;
signal \N__3713\ : std_logic;
signal \N__3712\ : std_logic;
signal \N__3709\ : std_logic;
signal \N__3708\ : std_logic;
signal \N__3705\ : std_logic;
signal \N__3704\ : std_logic;
signal \N__3703\ : std_logic;
signal \N__3700\ : std_logic;
signal \N__3697\ : std_logic;
signal \N__3696\ : std_logic;
signal \N__3695\ : std_logic;
signal \N__3690\ : std_logic;
signal \N__3685\ : std_logic;
signal \N__3682\ : std_logic;
signal \N__3679\ : std_logic;
signal \N__3676\ : std_logic;
signal \N__3671\ : std_logic;
signal \N__3668\ : std_logic;
signal \N__3665\ : std_logic;
signal \N__3658\ : std_logic;
signal \N__3655\ : std_logic;
signal \N__3652\ : std_logic;
signal \N__3647\ : std_logic;
signal \N__3636\ : std_logic;
signal \N__3635\ : std_logic;
signal \N__3634\ : std_logic;
signal \N__3633\ : std_logic;
signal \N__3632\ : std_logic;
signal \N__3631\ : std_logic;
signal \N__3626\ : std_logic;
signal \N__3623\ : std_logic;
signal \N__3622\ : std_logic;
signal \N__3621\ : std_logic;
signal \N__3618\ : std_logic;
signal \N__3615\ : std_logic;
signal \N__3612\ : std_logic;
signal \N__3611\ : std_logic;
signal \N__3610\ : std_logic;
signal \N__3607\ : std_logic;
signal \N__3602\ : std_logic;
signal \N__3599\ : std_logic;
signal \N__3594\ : std_logic;
signal \N__3591\ : std_logic;
signal \N__3588\ : std_logic;
signal \N__3587\ : std_logic;
signal \N__3584\ : std_logic;
signal \N__3575\ : std_logic;
signal \N__3572\ : std_logic;
signal \N__3569\ : std_logic;
signal \N__3566\ : std_logic;
signal \N__3563\ : std_logic;
signal \N__3552\ : std_logic;
signal \N__3551\ : std_logic;
signal \N__3550\ : std_logic;
signal \N__3547\ : std_logic;
signal \N__3546\ : std_logic;
signal \N__3545\ : std_logic;
signal \N__3542\ : std_logic;
signal \N__3541\ : std_logic;
signal \N__3538\ : std_logic;
signal \N__3537\ : std_logic;
signal \N__3534\ : std_logic;
signal \N__3531\ : std_logic;
signal \N__3528\ : std_logic;
signal \N__3527\ : std_logic;
signal \N__3524\ : std_logic;
signal \N__3523\ : std_logic;
signal \N__3520\ : std_logic;
signal \N__3519\ : std_logic;
signal \N__3514\ : std_logic;
signal \N__3511\ : std_logic;
signal \N__3508\ : std_logic;
signal \N__3505\ : std_logic;
signal \N__3502\ : std_logic;
signal \N__3499\ : std_logic;
signal \N__3494\ : std_logic;
signal \N__3491\ : std_logic;
signal \N__3488\ : std_logic;
signal \N__3481\ : std_logic;
signal \N__3478\ : std_logic;
signal \N__3475\ : std_logic;
signal \N__3462\ : std_logic;
signal \N__3461\ : std_logic;
signal \N__3458\ : std_logic;
signal \N__3457\ : std_logic;
signal \N__3456\ : std_logic;
signal \N__3455\ : std_logic;
signal \N__3452\ : std_logic;
signal \N__3451\ : std_logic;
signal \N__3450\ : std_logic;
signal \N__3449\ : std_logic;
signal \N__3446\ : std_logic;
signal \N__3441\ : std_logic;
signal \N__3438\ : std_logic;
signal \N__3437\ : std_logic;
signal \N__3436\ : std_logic;
signal \N__3435\ : std_logic;
signal \N__3434\ : std_logic;
signal \N__3433\ : std_logic;
signal \N__3430\ : std_logic;
signal \N__3427\ : std_logic;
signal \N__3424\ : std_logic;
signal \N__3421\ : std_logic;
signal \N__3414\ : std_logic;
signal \N__3409\ : std_logic;
signal \N__3404\ : std_logic;
signal \N__3401\ : std_logic;
signal \N__3392\ : std_logic;
signal \N__3381\ : std_logic;
signal \N__3378\ : std_logic;
signal \N__3375\ : std_logic;
signal \N__3372\ : std_logic;
signal \N__3369\ : std_logic;
signal \N__3366\ : std_logic;
signal \N__3363\ : std_logic;
signal \N__3360\ : std_logic;
signal \N__3359\ : std_logic;
signal \N__3358\ : std_logic;
signal \N__3351\ : std_logic;
signal \N__3348\ : std_logic;
signal \N__3345\ : std_logic;
signal \N__3344\ : std_logic;
signal \N__3343\ : std_logic;
signal \N__3340\ : std_logic;
signal \N__3337\ : std_logic;
signal \N__3334\ : std_logic;
signal \N__3331\ : std_logic;
signal \N__3328\ : std_logic;
signal \N__3321\ : std_logic;
signal \N__3320\ : std_logic;
signal \N__3319\ : std_logic;
signal \N__3316\ : std_logic;
signal \N__3313\ : std_logic;
signal \N__3310\ : std_logic;
signal \N__3307\ : std_logic;
signal \N__3304\ : std_logic;
signal \N__3297\ : std_logic;
signal \N__3296\ : std_logic;
signal \N__3293\ : std_logic;
signal \N__3292\ : std_logic;
signal \N__3289\ : std_logic;
signal \N__3286\ : std_logic;
signal \N__3283\ : std_logic;
signal \N__3276\ : std_logic;
signal \N__3273\ : std_logic;
signal \N__3270\ : std_logic;
signal \N__3267\ : std_logic;
signal \N__3264\ : std_logic;
signal \N__3261\ : std_logic;
signal \N__3258\ : std_logic;
signal \N__3255\ : std_logic;
signal \N__3252\ : std_logic;
signal \N__3249\ : std_logic;
signal \N__3246\ : std_logic;
signal \N__3243\ : std_logic;
signal \N__3240\ : std_logic;
signal \N__3237\ : std_logic;
signal \N__3234\ : std_logic;
signal \N__3231\ : std_logic;
signal \N__3228\ : std_logic;
signal \N__3225\ : std_logic;
signal \N__3222\ : std_logic;
signal \N__3219\ : std_logic;
signal \N__3216\ : std_logic;
signal \N__3213\ : std_logic;
signal \N__3210\ : std_logic;
signal \N__3207\ : std_logic;
signal \N__3204\ : std_logic;
signal \N__3201\ : std_logic;
signal \N__3198\ : std_logic;
signal \N__3195\ : std_logic;
signal \N__3192\ : std_logic;
signal \N__3189\ : std_logic;
signal \N__3186\ : std_logic;
signal \N__3183\ : std_logic;
signal \N__3180\ : std_logic;
signal \N__3177\ : std_logic;
signal \N__3174\ : std_logic;
signal \N__3171\ : std_logic;
signal \N__3170\ : std_logic;
signal \N__3167\ : std_logic;
signal \N__3164\ : std_logic;
signal \N__3161\ : std_logic;
signal \N__3158\ : std_logic;
signal \N__3155\ : std_logic;
signal \N__3152\ : std_logic;
signal \N__3147\ : std_logic;
signal \N__3144\ : std_logic;
signal \N__3141\ : std_logic;
signal \N__3138\ : std_logic;
signal \N__3135\ : std_logic;
signal \N__3132\ : std_logic;
signal \N__3129\ : std_logic;
signal \N__3126\ : std_logic;
signal \N__3123\ : std_logic;
signal \N__3120\ : std_logic;
signal \N__3117\ : std_logic;
signal \N__3114\ : std_logic;
signal \N__3113\ : std_logic;
signal \N__3110\ : std_logic;
signal \N__3107\ : std_logic;
signal \N__3102\ : std_logic;
signal \N__3101\ : std_logic;
signal \N__3100\ : std_logic;
signal \N__3095\ : std_logic;
signal \N__3092\ : std_logic;
signal \N__3087\ : std_logic;
signal \N__3084\ : std_logic;
signal \N__3081\ : std_logic;
signal \N__3078\ : std_logic;
signal \N__3075\ : std_logic;
signal \N__3074\ : std_logic;
signal \N__3073\ : std_logic;
signal \N__3072\ : std_logic;
signal \N__3071\ : std_logic;
signal \N__3070\ : std_logic;
signal \N__3069\ : std_logic;
signal \N__3066\ : std_logic;
signal \N__3063\ : std_logic;
signal \N__3062\ : std_logic;
signal \N__3061\ : std_logic;
signal \N__3058\ : std_logic;
signal \N__3055\ : std_logic;
signal \N__3052\ : std_logic;
signal \N__3051\ : std_logic;
signal \N__3050\ : std_logic;
signal \N__3049\ : std_logic;
signal \N__3048\ : std_logic;
signal \N__3047\ : std_logic;
signal \N__3046\ : std_logic;
signal \N__3045\ : std_logic;
signal \N__3042\ : std_logic;
signal \N__3039\ : std_logic;
signal \N__3038\ : std_logic;
signal \N__3033\ : std_logic;
signal \N__3030\ : std_logic;
signal \N__3027\ : std_logic;
signal \N__3026\ : std_logic;
signal \N__3025\ : std_logic;
signal \N__3010\ : std_logic;
signal \N__3003\ : std_logic;
signal \N__2996\ : std_logic;
signal \N__2993\ : std_logic;
signal \N__2986\ : std_logic;
signal \N__2983\ : std_logic;
signal \N__2980\ : std_logic;
signal \N__2975\ : std_logic;
signal \N__2972\ : std_logic;
signal \N__2965\ : std_logic;
signal \N__2962\ : std_logic;
signal \N__2955\ : std_logic;
signal \N__2952\ : std_logic;
signal \N__2949\ : std_logic;
signal \N__2946\ : std_logic;
signal \N__2943\ : std_logic;
signal \N__2942\ : std_logic;
signal \N__2939\ : std_logic;
signal \N__2936\ : std_logic;
signal \N__2931\ : std_logic;
signal \N__2928\ : std_logic;
signal \N__2925\ : std_logic;
signal \N__2922\ : std_logic;
signal \N__2919\ : std_logic;
signal \N__2916\ : std_logic;
signal \N__2913\ : std_logic;
signal \N__2910\ : std_logic;
signal \N__2907\ : std_logic;
signal \N__2904\ : std_logic;
signal \N__2901\ : std_logic;
signal \N__2900\ : std_logic;
signal \N__2897\ : std_logic;
signal \N__2894\ : std_logic;
signal \N__2891\ : std_logic;
signal \N__2888\ : std_logic;
signal \N__2883\ : std_logic;
signal \N__2880\ : std_logic;
signal \N__2877\ : std_logic;
signal \N__2874\ : std_logic;
signal \N__2873\ : std_logic;
signal \N__2868\ : std_logic;
signal \N__2865\ : std_logic;
signal \N__2864\ : std_logic;
signal \N__2861\ : std_logic;
signal \N__2858\ : std_logic;
signal \N__2853\ : std_logic;
signal \N__2850\ : std_logic;
signal \N__2849\ : std_logic;
signal \N__2848\ : std_logic;
signal \N__2847\ : std_logic;
signal \N__2844\ : std_logic;
signal \N__2841\ : std_logic;
signal \N__2838\ : std_logic;
signal \N__2835\ : std_logic;
signal \N__2830\ : std_logic;
signal \N__2825\ : std_logic;
signal \N__2820\ : std_logic;
signal \N__2819\ : std_logic;
signal \N__2816\ : std_logic;
signal \N__2813\ : std_logic;
signal \N__2808\ : std_logic;
signal \N__2807\ : std_logic;
signal \N__2804\ : std_logic;
signal \N__2801\ : std_logic;
signal \N__2798\ : std_logic;
signal \N__2793\ : std_logic;
signal \N__2792\ : std_logic;
signal \N__2789\ : std_logic;
signal \N__2786\ : std_logic;
signal \N__2783\ : std_logic;
signal \N__2778\ : std_logic;
signal \N__2775\ : std_logic;
signal \N__2774\ : std_logic;
signal \N__2771\ : std_logic;
signal \N__2768\ : std_logic;
signal \N__2763\ : std_logic;
signal \N__2760\ : std_logic;
signal \N__2759\ : std_logic;
signal \N__2756\ : std_logic;
signal \N__2753\ : std_logic;
signal \N__2748\ : std_logic;
signal \N__2747\ : std_logic;
signal \N__2744\ : std_logic;
signal \N__2741\ : std_logic;
signal \N__2738\ : std_logic;
signal \N__2735\ : std_logic;
signal \N__2730\ : std_logic;
signal \N__2727\ : std_logic;
signal \N__2726\ : std_logic;
signal \N__2723\ : std_logic;
signal \N__2720\ : std_logic;
signal \N__2715\ : std_logic;
signal \N__2714\ : std_logic;
signal \N__2713\ : std_logic;
signal \N__2712\ : std_logic;
signal \N__2711\ : std_logic;
signal \N__2710\ : std_logic;
signal \N__2709\ : std_logic;
signal \N__2708\ : std_logic;
signal \N__2707\ : std_logic;
signal \N__2706\ : std_logic;
signal \N__2705\ : std_logic;
signal \N__2704\ : std_logic;
signal \N__2703\ : std_logic;
signal \N__2702\ : std_logic;
signal \N__2701\ : std_logic;
signal \N__2700\ : std_logic;
signal \N__2699\ : std_logic;
signal \N__2698\ : std_logic;
signal \N__2697\ : std_logic;
signal \N__2694\ : std_logic;
signal \N__2685\ : std_logic;
signal \N__2680\ : std_logic;
signal \N__2677\ : std_logic;
signal \N__2670\ : std_logic;
signal \N__2659\ : std_logic;
signal \N__2652\ : std_logic;
signal \N__2645\ : std_logic;
signal \N__2634\ : std_logic;
signal \N__2631\ : std_logic;
signal \N__2628\ : std_logic;
signal \N__2625\ : std_logic;
signal \N__2622\ : std_logic;
signal \N__2621\ : std_logic;
signal \N__2616\ : std_logic;
signal \N__2613\ : std_logic;
signal \N__2610\ : std_logic;
signal \N__2607\ : std_logic;
signal \N__2606\ : std_logic;
signal \N__2603\ : std_logic;
signal \N__2600\ : std_logic;
signal \N__2595\ : std_logic;
signal \N__2592\ : std_logic;
signal \N__2589\ : std_logic;
signal \N__2586\ : std_logic;
signal \N__2583\ : std_logic;
signal \N__2580\ : std_logic;
signal \N__2577\ : std_logic;
signal \N__2574\ : std_logic;
signal \N__2571\ : std_logic;
signal \N__2568\ : std_logic;
signal \N__2565\ : std_logic;
signal \N__2562\ : std_logic;
signal \N__2559\ : std_logic;
signal \N__2556\ : std_logic;
signal \N__2553\ : std_logic;
signal \N__2552\ : std_logic;
signal \N__2551\ : std_logic;
signal \N__2550\ : std_logic;
signal \N__2549\ : std_logic;
signal \N__2548\ : std_logic;
signal \N__2547\ : std_logic;
signal \N__2546\ : std_logic;
signal \N__2545\ : std_logic;
signal \N__2542\ : std_logic;
signal \N__2541\ : std_logic;
signal \N__2540\ : std_logic;
signal \N__2537\ : std_logic;
signal \N__2536\ : std_logic;
signal \N__2533\ : std_logic;
signal \N__2530\ : std_logic;
signal \N__2529\ : std_logic;
signal \N__2528\ : std_logic;
signal \N__2527\ : std_logic;
signal \N__2526\ : std_logic;
signal \N__2523\ : std_logic;
signal \N__2520\ : std_logic;
signal \N__2519\ : std_logic;
signal \N__2516\ : std_logic;
signal \N__2515\ : std_logic;
signal \N__2506\ : std_logic;
signal \N__2491\ : std_logic;
signal \N__2486\ : std_logic;
signal \N__2475\ : std_logic;
signal \N__2466\ : std_logic;
signal \N__2463\ : std_logic;
signal \N__2460\ : std_logic;
signal \N__2457\ : std_logic;
signal \N__2454\ : std_logic;
signal \N__2451\ : std_logic;
signal \N__2448\ : std_logic;
signal \N__2445\ : std_logic;
signal \N__2442\ : std_logic;
signal \N__2439\ : std_logic;
signal \N__2436\ : std_logic;
signal \N__2433\ : std_logic;
signal \N__2430\ : std_logic;
signal \N__2427\ : std_logic;
signal \N__2424\ : std_logic;
signal \N__2421\ : std_logic;
signal \N__2418\ : std_logic;
signal \N__2415\ : std_logic;
signal \N__2412\ : std_logic;
signal \N__2409\ : std_logic;
signal \N__2406\ : std_logic;
signal \N__2403\ : std_logic;
signal \N__2400\ : std_logic;
signal \N__2397\ : std_logic;
signal \N__2394\ : std_logic;
signal \N__2391\ : std_logic;
signal \N__2388\ : std_logic;
signal \N__2385\ : std_logic;
signal \N__2382\ : std_logic;
signal \N__2381\ : std_logic;
signal \N__2380\ : std_logic;
signal \N__2377\ : std_logic;
signal \N__2372\ : std_logic;
signal \N__2367\ : std_logic;
signal \N__2366\ : std_logic;
signal \N__2365\ : std_logic;
signal \N__2362\ : std_logic;
signal \N__2359\ : std_logic;
signal \N__2356\ : std_logic;
signal \N__2349\ : std_logic;
signal \N__2346\ : std_logic;
signal \N__2343\ : std_logic;
signal \N__2340\ : std_logic;
signal \N__2337\ : std_logic;
signal \N__2334\ : std_logic;
signal \N__2331\ : std_logic;
signal \N__2328\ : std_logic;
signal \N__2325\ : std_logic;
signal \N__2322\ : std_logic;
signal \N__2319\ : std_logic;
signal \N__2316\ : std_logic;
signal \N__2313\ : std_logic;
signal \N__2310\ : std_logic;
signal \N__2307\ : std_logic;
signal \N__2304\ : std_logic;
signal \N__2301\ : std_logic;
signal \N__2298\ : std_logic;
signal \N__2297\ : std_logic;
signal \N__2294\ : std_logic;
signal \N__2291\ : std_logic;
signal \N__2286\ : std_logic;
signal \N__2283\ : std_logic;
signal \N__2282\ : std_logic;
signal \N__2279\ : std_logic;
signal \N__2276\ : std_logic;
signal \N__2271\ : std_logic;
signal \N__2268\ : std_logic;
signal \N__2267\ : std_logic;
signal \N__2264\ : std_logic;
signal \N__2261\ : std_logic;
signal \N__2256\ : std_logic;
signal \N__2253\ : std_logic;
signal \N__2252\ : std_logic;
signal \N__2249\ : std_logic;
signal \N__2246\ : std_logic;
signal \N__2243\ : std_logic;
signal \N__2238\ : std_logic;
signal \N__2235\ : std_logic;
signal \N__2234\ : std_logic;
signal \N__2231\ : std_logic;
signal \N__2228\ : std_logic;
signal \N__2223\ : std_logic;
signal \N__2220\ : std_logic;
signal \N__2219\ : std_logic;
signal \N__2216\ : std_logic;
signal \N__2213\ : std_logic;
signal \N__2208\ : std_logic;
signal \N__2205\ : std_logic;
signal \N__2204\ : std_logic;
signal \N__2201\ : std_logic;
signal \N__2198\ : std_logic;
signal \N__2193\ : std_logic;
signal \N__2190\ : std_logic;
signal \N__2189\ : std_logic;
signal \N__2188\ : std_logic;
signal \N__2185\ : std_logic;
signal \N__2180\ : std_logic;
signal \N__2175\ : std_logic;
signal \N__2172\ : std_logic;
signal \N__2169\ : std_logic;
signal \N__2166\ : std_logic;
signal \N__2165\ : std_logic;
signal \N__2162\ : std_logic;
signal \N__2159\ : std_logic;
signal \N__2154\ : std_logic;
signal \N__2153\ : std_logic;
signal \N__2152\ : std_logic;
signal \N__2149\ : std_logic;
signal \N__2144\ : std_logic;
signal \N__2141\ : std_logic;
signal \N__2136\ : std_logic;
signal \N__2133\ : std_logic;
signal \N__2130\ : std_logic;
signal \N__2127\ : std_logic;
signal \N__2124\ : std_logic;
signal \N__2121\ : std_logic;
signal \N__2118\ : std_logic;
signal \N__2115\ : std_logic;
signal \N__2112\ : std_logic;
signal \N__2109\ : std_logic;
signal \N__2106\ : std_logic;
signal \N__2103\ : std_logic;
signal \N__2100\ : std_logic;
signal \N__2097\ : std_logic;
signal \N__2094\ : std_logic;
signal \N__2091\ : std_logic;
signal \N__2088\ : std_logic;
signal \N__2085\ : std_logic;
signal \N__2082\ : std_logic;
signal \N__2079\ : std_logic;
signal \N__2076\ : std_logic;
signal \N__2075\ : std_logic;
signal \N__2072\ : std_logic;
signal \N__2069\ : std_logic;
signal \VCCG0\ : std_logic;
signal \GNDG0\ : std_logic;
signal \count6lto11_1_cascade_\ : std_logic;
signal count6lt11 : std_logic;
signal \count6lt11_cascade_\ : std_logic;
signal count6lto11_1 : std_logic;
signal \count6_0_cascade_\ : std_logic;
signal test_led_c : std_logic;
signal \N_153_1_cascade_\ : std_logic;
signal \init_pulses39_0_cascade_\ : std_logic;
signal \init_pulses_0_sqmuxa_cascade_\ : std_logic;
signal \countZ0Z_1\ : std_logic;
signal \countZ0Z_0\ : std_logic;
signal \bfn_9_25_0_\ : std_logic;
signal \countZ0Z_2\ : std_logic;
signal count_1_cry_1 : std_logic;
signal \countZ0Z_3\ : std_logic;
signal count_1_cry_2 : std_logic;
signal \countZ0Z_4\ : std_logic;
signal count_1_cry_3 : std_logic;
signal \countZ0Z_5\ : std_logic;
signal count_1_cry_4 : std_logic;
signal \countZ0Z_6\ : std_logic;
signal count_1_cry_5 : std_logic;
signal \countZ0Z_7\ : std_logic;
signal count_1_cry_6 : std_logic;
signal \countZ0Z_8\ : std_logic;
signal count_1_cry_7 : std_logic;
signal count_1_cry_8 : std_logic;
signal \countZ0Z_9\ : std_logic;
signal \bfn_9_26_0_\ : std_logic;
signal \countZ0Z_10\ : std_logic;
signal count_1_cry_9 : std_logic;
signal \countZ0Z_11\ : std_logic;
signal count_1_cry_10 : std_logic;
signal \countZ0Z_12\ : std_logic;
signal count_1_cry_11 : std_logic;
signal count_1_cry_12 : std_logic;
signal \countZ0Z_13\ : std_logic;
signal count6lto13_iso : std_logic;
signal un1_init_pulses_axb_0 : std_logic;
signal \bfn_10_21_0_\ : std_logic;
signal \init_pulses_RNO_0Z0Z_1\ : std_logic;
signal un1_init_pulses_cry_0 : std_logic;
signal \init_pulses_RNO_0Z0Z_2\ : std_logic;
signal un1_init_pulses_cry_1 : std_logic;
signal \init_pulses_RNO_0Z0Z_3\ : std_logic;
signal un1_init_pulses_cry_2 : std_logic;
signal \init_pulses_RNO_0Z0Z_4\ : std_logic;
signal un1_init_pulses_cry_3 : std_logic;
signal \init_pulses_RNO_0Z0Z_5\ : std_logic;
signal un1_init_pulses_cry_4 : std_logic;
signal \init_pulses_RNO_0Z0Z_6\ : std_logic;
signal un1_init_pulses_cry_5 : std_logic;
signal \init_pulses_RNO_0Z0Z_7\ : std_logic;
signal un1_init_pulses_cry_6 : std_logic;
signal un1_init_pulses_cry_7 : std_logic;
signal \init_pulses_RNO_0Z0Z_8\ : std_logic;
signal \bfn_10_22_0_\ : std_logic;
signal \init_pulses_RNO_0Z0Z_9\ : std_logic;
signal un1_init_pulses_cry_8 : std_logic;
signal un1_init_pulses_cry_9 : std_logic;
signal \init_pulses_RNO_0Z0Z_11\ : std_logic;
signal un1_init_pulses_cry_10 : std_logic;
signal \init_pulses_RNO_0Z0Z_12\ : std_logic;
signal un1_init_pulses_cry_11 : std_logic;
signal \init_pulses_RNO_0Z0Z_13\ : std_logic;
signal un1_init_pulses_cry_12 : std_logic;
signal \init_pulses_RNO_0Z0Z_14\ : std_logic;
signal un1_init_pulses_cry_13 : std_logic;
signal \init_pulses_RNO_0Z0Z_15\ : std_logic;
signal un1_init_pulses_cry_14 : std_logic;
signal un1_init_pulses_cry_15 : std_logic;
signal \bfn_10_23_0_\ : std_logic;
signal un1_init_pulses_cry_16 : std_logic;
signal un1_init_pulses_cry_17 : std_logic;
signal \init_pulses_RNO_0Z0Z_18_cascade_\ : std_logic;
signal \init_pulses_RNO_0Z0Z_10\ : std_logic;
signal \init_pulses_RNO_0Z0Z_16\ : std_logic;
signal init_pulses_0_sqmuxa : std_logic;
signal \init_pulses_RNO_0Z0Z_17\ : std_logic;
signal \init_pulsesZ0Z_15\ : std_logic;
signal \init_pulsesZ0Z_10\ : std_logic;
signal \init_pulsesZ0Z_0\ : std_logic;
signal \init_pulsesZ0Z_17\ : std_logic;
signal \init_pulsesZ0Z_13\ : std_logic;
signal \init_pulsesZ0Z_6\ : std_logic;
signal \init_pulsesZ0Z_11\ : std_logic;
signal \N_153_1\ : std_logic;
signal pulses2count_8_0_iv_0_1_10_0 : std_logic;
signal \N_44\ : std_logic;
signal \init_pulsesZ0Z_14\ : std_logic;
signal \pulses2countZ0Z_14\ : std_logic;
signal \pulses2countZ0Z_15\ : std_logic;
signal ppm_output_c : std_logic;
signal un15_0_iv_1_12 : std_logic;
signal \init_pulses_2_sqmuxa_0_cascade_\ : std_logic;
signal \N_51\ : std_logic;
signal \un15_0_12_cascade_\ : std_logic;
signal \N_323_i\ : std_logic;
signal \N_43_cascade_\ : std_logic;
signal \un15_0_i_0_0_cascade_\ : std_logic;
signal \CHOOSE_CHANNEL_fast_RNIPSOR8_0Z0Z_2\ : std_logic;
signal un15_0_12 : std_logic;
signal un15_0_i_0_0 : std_logic;
signal \CHOOSE_CHANNEL_fast_RNIPSOR8Z0Z_2\ : std_logic;
signal \PPM_STATE_r_1_1_cascade_\ : std_logic;
signal init_pulses_6_sqmuxa_0 : std_logic;
signal \pulses2countZ0Z_6\ : std_logic;
signal \init_pulsesZ0Z_7\ : std_logic;
signal \pulses2countZ0Z_7\ : std_logic;
signal \bfn_11_24_0_\ : std_logic;
signal counter11_0_data_tmp_0 : std_logic;
signal counter11_0_data_tmp_1 : std_logic;
signal \counter11_0_I_21_c_RNOZ0\ : std_logic;
signal counter11_0_data_tmp_2 : std_logic;
signal counter11_0_data_tmp_3 : std_logic;
signal counter11_0_data_tmp_4 : std_logic;
signal counter11_0_data_tmp_5 : std_logic;
signal \counter11_0_I_45_c_RNOZ0\ : std_logic;
signal counter11_0_data_tmp_6 : std_logic;
signal counter11_0_data_tmp_7 : std_logic;
signal \bfn_11_25_0_\ : std_logic;
signal counter11_0_data_tmp_8 : std_logic;
signal \counter11_0_N_2\ : std_logic;
signal \pulses2countZ0Z_0\ : std_logic;
signal \counter11_0_I_1_c_RNOZ0\ : std_logic;
signal \pulses2countZ0Z_10\ : std_logic;
signal \pulses2countZ0Z_11\ : std_logic;
signal \counter11_0_I_33_c_RNOZ0\ : std_logic;
signal \pulses2countZ0Z_13\ : std_logic;
signal \counter11_0_I_39_c_RNOZ0\ : std_logic;
signal \pulses2countZ0Z_17\ : std_logic;
signal \counter11_0_I_51_c_RNOZ0\ : std_logic;
signal \N_36_i\ : std_logic;
signal \bfn_11_26_0_\ : std_logic;
signal un1_counter_13_cry_0 : std_logic;
signal un1_counter_13_cry_1 : std_logic;
signal un1_counter_13_cry_2 : std_logic;
signal un1_counter_13_cry_3 : std_logic;
signal un1_counter_13_cry_4 : std_logic;
signal un1_counter_13_cry_5 : std_logic;
signal un1_counter_13_cry_6 : std_logic;
signal un1_counter_13_cry_7 : std_logic;
signal \bfn_11_27_0_\ : std_logic;
signal un1_counter_13_cry_8 : std_logic;
signal un1_counter_13_cry_9 : std_logic;
signal un1_counter_13_cry_10 : std_logic;
signal un1_counter_13_cry_11 : std_logic;
signal un1_counter_13_cry_12 : std_logic;
signal un1_counter_13_cry_13 : std_logic;
signal un1_counter_13_cry_14 : std_logic;
signal un1_counter_13_cry_15 : std_logic;
signal \bfn_11_28_0_\ : std_logic;
signal un1_counter_13_cry_16 : std_logic;
signal un1_counter_13_cry_17 : std_logic;
signal \un1_PPM_STATE_0_sqmuxa_0_i_g\ : std_logic;
signal \counterZ0Z_17\ : std_logic;
signal \counterZ0Z_14\ : std_logic;
signal \counterZ0Z_1\ : std_logic;
signal \N_43\ : std_logic;
signal \N_30_i\ : std_logic;
signal \CHOOSE_CHANNEL_fastZ0Z_1\ : std_logic;
signal \CHOOSE_CHANNEL_fastZ0Z_0\ : std_logic;
signal \CHOOSE_CHANNEL_fastZ0Z_3\ : std_logic;
signal \CHOOSE_CHANNEL_fastZ0Z_2\ : std_logic;
signal \N_15_i\ : std_logic;
signal \PPM_STATE_e_1_0\ : std_logic;
signal \CHOOSE_CHANNELZ0Z_2\ : std_logic;
signal \CHOOSE_CHANNELZ0Z_1\ : std_logic;
signal \CHOOSE_CHANNELZ0Z_3\ : std_logic;
signal \CHOOSE_CHANNELZ0Z_0\ : std_logic;
signal \CONSTANT_ONE_NET\ : std_logic;
signal \init_pulsesZ0Z_3\ : std_logic;
signal \init_pulsesZ0Z_1\ : std_logic;
signal \pulses2countZ0Z_1\ : std_logic;
signal \init_pulsesZ0Z_12\ : std_logic;
signal \pulses2countZ0Z_12\ : std_logic;
signal \init_pulsesZ0Z_16\ : std_logic;
signal \pulses2countZ0Z_16\ : std_logic;
signal init_pulses39_0 : std_logic;
signal un1_init_pulses39_2_0_0 : std_logic;
signal \init_pulsesZ0Z_2\ : std_logic;
signal \pulses2countZ0Z_2\ : std_logic;
signal \pulses2countZ0Z_3\ : std_logic;
signal \counter11_0_I_9_c_RNOZ0\ : std_logic;
signal \init_pulsesZ0Z_5\ : std_logic;
signal \counterZ0Z_3\ : std_logic;
signal \counterZ0Z_10\ : std_logic;
signal \counterZ0Z_2\ : std_logic;
signal \counterZ0Z_16\ : std_logic;
signal \PPM_STATEZ0Z_1\ : std_logic;
signal \PPM_STATEZ0Z_0\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_14\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_13\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_15\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1\ : std_logic;
signal pulses2count39_0 : std_logic;
signal \PPM_STATE_0_sqmuxa_1_cascade_\ : std_logic;
signal \counter11_0_N_2_THRU_CO\ : std_logic;
signal \un1_PPM_STATE_0_sqmuxa_0_i\ : std_logic;
signal \counterZ0Z_6\ : std_logic;
signal \counterZ0Z_0\ : std_logic;
signal \counterZ0Z_11\ : std_logic;
signal \counterZ0Z_7\ : std_logic;
signal \counterZ0Z_15\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_12_cascade_\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_16\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_2\ : std_logic;
signal \counterZ0Z_5\ : std_logic;
signal \pulses2countZ0Z_5\ : std_logic;
signal \counterZ0Z_4\ : std_logic;
signal \counter11_0_I_15_c_RNOZ0\ : std_logic;
signal \counterZ0Z_12\ : std_logic;
signal \counterZ0Z_13\ : std_logic;
signal \PPM_STATE_0_sqmuxa_1_0\ : std_logic;
signal \counterZ0Z_8\ : std_logic;
signal \counterZ0Z_9\ : std_logic;
signal \counter11_0_I_27_c_RNOZ0\ : std_logic;
signal \init_pulsesZ0Z_8\ : std_logic;
signal \pulses2countZ0Z_8\ : std_logic;
signal \init_pulsesZ0Z_9\ : std_logic;
signal \pulses2countZ0Z_9\ : std_logic;
signal \init_pulsesZ0Z_18\ : std_logic;
signal \counterZ0Z_18\ : std_logic;
signal \pulses2countZ0Z_18\ : std_logic;
signal \counter11_0_I_57_c_RNOZ0\ : std_logic;
signal \init_pulsesZ0Z_4\ : std_logic;
signal pulses2count22_0 : std_logic;
signal \pulses2countZ0Z_4\ : std_logic;
signal clk_c_g : std_logic;
signal \N_30_i_g\ : std_logic;
signal \_gnd_net_\ : std_logic;

signal clk_wire : std_logic;
signal test_led_wire : std_logic;
signal ppm_output_wire : std_logic;

begin
    clk_wire <= clk;
    test_led <= test_led_wire;
    ppm_output <= ppm_output_wire;

    \clk_ibuf_gb_io_preiogbuf\ : PRE_IO_GBUF
    port map (
            PADSIGNALTOGLOBALBUFFER => \N__5125\,
            GLOBALBUFFEROUTPUT => clk_c_g
        );

    \clk_ibuf_gb_io_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__5127\,
            DIN => \N__5126\,
            DOUT => \N__5125\,
            PACKAGEPIN => clk_wire
        );

    \clk_ibuf_gb_io_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__5127\,
            PADOUT => \N__5126\,
            PADIN => \N__5125\,
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

    \test_led_obuf_iopad\ : IO_PAD
    generic map (
            PULLUP => '0',
            IO_STANDARD => "SB_LVCMOS"
        )
    port map (
            OE => \N__5116\,
            DIN => \N__5115\,
            DOUT => \N__5114\,
            PACKAGEPIN => test_led_wire
        );

    \test_led_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__5116\,
            PADOUT => \N__5115\,
            PADIN => \N__5114\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__2094\,
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
            OE => \N__5107\,
            DIN => \N__5106\,
            DOUT => \N__5105\,
            PACKAGEPIN => ppm_output_wire
        );

    \ppm_output_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__5107\,
            PADOUT => \N__5106\,
            PADIN => \N__5105\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__2907\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \I__1186\ : InMux
    port map (
            O => \N__5088\,
            I => \N__5083\
        );

    \I__1185\ : InMux
    port map (
            O => \N__5087\,
            I => \N__5080\
        );

    \I__1184\ : InMux
    port map (
            O => \N__5086\,
            I => \N__5077\
        );

    \I__1183\ : LocalMux
    port map (
            O => \N__5083\,
            I => \N__5074\
        );

    \I__1182\ : LocalMux
    port map (
            O => \N__5080\,
            I => \counterZ0Z_12\
        );

    \I__1181\ : LocalMux
    port map (
            O => \N__5077\,
            I => \counterZ0Z_12\
        );

    \I__1180\ : Odrv4
    port map (
            O => \N__5074\,
            I => \counterZ0Z_12\
        );

    \I__1179\ : InMux
    port map (
            O => \N__5067\,
            I => \N__5064\
        );

    \I__1178\ : LocalMux
    port map (
            O => \N__5064\,
            I => \N__5059\
        );

    \I__1177\ : InMux
    port map (
            O => \N__5063\,
            I => \N__5056\
        );

    \I__1176\ : InMux
    port map (
            O => \N__5062\,
            I => \N__5053\
        );

    \I__1175\ : Span4Mux_h
    port map (
            O => \N__5059\,
            I => \N__5050\
        );

    \I__1174\ : LocalMux
    port map (
            O => \N__5056\,
            I => \counterZ0Z_13\
        );

    \I__1173\ : LocalMux
    port map (
            O => \N__5053\,
            I => \counterZ0Z_13\
        );

    \I__1172\ : Odrv4
    port map (
            O => \N__5050\,
            I => \counterZ0Z_13\
        );

    \I__1171\ : InMux
    port map (
            O => \N__5043\,
            I => \N__5040\
        );

    \I__1170\ : LocalMux
    port map (
            O => \N__5040\,
            I => \PPM_STATE_0_sqmuxa_1_0\
        );

    \I__1169\ : CascadeMux
    port map (
            O => \N__5037\,
            I => \N__5033\
        );

    \I__1168\ : InMux
    port map (
            O => \N__5036\,
            I => \N__5029\
        );

    \I__1167\ : InMux
    port map (
            O => \N__5033\,
            I => \N__5026\
        );

    \I__1166\ : InMux
    port map (
            O => \N__5032\,
            I => \N__5023\
        );

    \I__1165\ : LocalMux
    port map (
            O => \N__5029\,
            I => \counterZ0Z_8\
        );

    \I__1164\ : LocalMux
    port map (
            O => \N__5026\,
            I => \counterZ0Z_8\
        );

    \I__1163\ : LocalMux
    port map (
            O => \N__5023\,
            I => \counterZ0Z_8\
        );

    \I__1162\ : InMux
    port map (
            O => \N__5016\,
            I => \N__5011\
        );

    \I__1161\ : CascadeMux
    port map (
            O => \N__5015\,
            I => \N__5008\
        );

    \I__1160\ : InMux
    port map (
            O => \N__5014\,
            I => \N__5005\
        );

    \I__1159\ : LocalMux
    port map (
            O => \N__5011\,
            I => \N__5002\
        );

    \I__1158\ : InMux
    port map (
            O => \N__5008\,
            I => \N__4999\
        );

    \I__1157\ : LocalMux
    port map (
            O => \N__5005\,
            I => \counterZ0Z_9\
        );

    \I__1156\ : Odrv4
    port map (
            O => \N__5002\,
            I => \counterZ0Z_9\
        );

    \I__1155\ : LocalMux
    port map (
            O => \N__4999\,
            I => \counterZ0Z_9\
        );

    \I__1154\ : InMux
    port map (
            O => \N__4992\,
            I => \N__4989\
        );

    \I__1153\ : LocalMux
    port map (
            O => \N__4989\,
            I => \N__4986\
        );

    \I__1152\ : Odrv4
    port map (
            O => \N__4986\,
            I => \counter11_0_I_27_c_RNOZ0\
        );

    \I__1151\ : InMux
    port map (
            O => \N__4983\,
            I => \N__4980\
        );

    \I__1150\ : LocalMux
    port map (
            O => \N__4980\,
            I => \N__4977\
        );

    \I__1149\ : Span4Mux_v
    port map (
            O => \N__4977\,
            I => \N__4974\
        );

    \I__1148\ : Span4Mux_h
    port map (
            O => \N__4974\,
            I => \N__4970\
        );

    \I__1147\ : InMux
    port map (
            O => \N__4973\,
            I => \N__4967\
        );

    \I__1146\ : Odrv4
    port map (
            O => \N__4970\,
            I => \init_pulsesZ0Z_8\
        );

    \I__1145\ : LocalMux
    port map (
            O => \N__4967\,
            I => \init_pulsesZ0Z_8\
        );

    \I__1144\ : InMux
    port map (
            O => \N__4962\,
            I => \N__4959\
        );

    \I__1143\ : LocalMux
    port map (
            O => \N__4959\,
            I => \pulses2countZ0Z_8\
        );

    \I__1142\ : InMux
    port map (
            O => \N__4956\,
            I => \N__4953\
        );

    \I__1141\ : LocalMux
    port map (
            O => \N__4953\,
            I => \N__4950\
        );

    \I__1140\ : Span4Mux_v
    port map (
            O => \N__4950\,
            I => \N__4946\
        );

    \I__1139\ : InMux
    port map (
            O => \N__4949\,
            I => \N__4943\
        );

    \I__1138\ : Odrv4
    port map (
            O => \N__4946\,
            I => \init_pulsesZ0Z_9\
        );

    \I__1137\ : LocalMux
    port map (
            O => \N__4943\,
            I => \init_pulsesZ0Z_9\
        );

    \I__1136\ : InMux
    port map (
            O => \N__4938\,
            I => \N__4935\
        );

    \I__1135\ : LocalMux
    port map (
            O => \N__4935\,
            I => \pulses2countZ0Z_9\
        );

    \I__1134\ : InMux
    port map (
            O => \N__4932\,
            I => \N__4929\
        );

    \I__1133\ : LocalMux
    port map (
            O => \N__4929\,
            I => \N__4926\
        );

    \I__1132\ : Span4Mux_v
    port map (
            O => \N__4926\,
            I => \N__4922\
        );

    \I__1131\ : InMux
    port map (
            O => \N__4925\,
            I => \N__4919\
        );

    \I__1130\ : Odrv4
    port map (
            O => \N__4922\,
            I => \init_pulsesZ0Z_18\
        );

    \I__1129\ : LocalMux
    port map (
            O => \N__4919\,
            I => \init_pulsesZ0Z_18\
        );

    \I__1128\ : CascadeMux
    port map (
            O => \N__4914\,
            I => \N__4911\
        );

    \I__1127\ : InMux
    port map (
            O => \N__4911\,
            I => \N__4907\
        );

    \I__1126\ : InMux
    port map (
            O => \N__4910\,
            I => \N__4903\
        );

    \I__1125\ : LocalMux
    port map (
            O => \N__4907\,
            I => \N__4900\
        );

    \I__1124\ : InMux
    port map (
            O => \N__4906\,
            I => \N__4897\
        );

    \I__1123\ : LocalMux
    port map (
            O => \N__4903\,
            I => \counterZ0Z_18\
        );

    \I__1122\ : Odrv4
    port map (
            O => \N__4900\,
            I => \counterZ0Z_18\
        );

    \I__1121\ : LocalMux
    port map (
            O => \N__4897\,
            I => \counterZ0Z_18\
        );

    \I__1120\ : InMux
    port map (
            O => \N__4890\,
            I => \N__4887\
        );

    \I__1119\ : LocalMux
    port map (
            O => \N__4887\,
            I => \pulses2countZ0Z_18\
        );

    \I__1118\ : InMux
    port map (
            O => \N__4884\,
            I => \N__4881\
        );

    \I__1117\ : LocalMux
    port map (
            O => \N__4881\,
            I => \N__4878\
        );

    \I__1116\ : Odrv4
    port map (
            O => \N__4878\,
            I => \counter11_0_I_57_c_RNOZ0\
        );

    \I__1115\ : InMux
    port map (
            O => \N__4875\,
            I => \N__4872\
        );

    \I__1114\ : LocalMux
    port map (
            O => \N__4872\,
            I => \N__4869\
        );

    \I__1113\ : Span4Mux_v
    port map (
            O => \N__4869\,
            I => \N__4865\
        );

    \I__1112\ : InMux
    port map (
            O => \N__4868\,
            I => \N__4862\
        );

    \I__1111\ : Odrv4
    port map (
            O => \N__4865\,
            I => \init_pulsesZ0Z_4\
        );

    \I__1110\ : LocalMux
    port map (
            O => \N__4862\,
            I => \init_pulsesZ0Z_4\
        );

    \I__1109\ : InMux
    port map (
            O => \N__4857\,
            I => \N__4845\
        );

    \I__1108\ : InMux
    port map (
            O => \N__4856\,
            I => \N__4836\
        );

    \I__1107\ : InMux
    port map (
            O => \N__4855\,
            I => \N__4825\
        );

    \I__1106\ : InMux
    port map (
            O => \N__4854\,
            I => \N__4825\
        );

    \I__1105\ : InMux
    port map (
            O => \N__4853\,
            I => \N__4825\
        );

    \I__1104\ : InMux
    port map (
            O => \N__4852\,
            I => \N__4825\
        );

    \I__1103\ : InMux
    port map (
            O => \N__4851\,
            I => \N__4825\
        );

    \I__1102\ : InMux
    port map (
            O => \N__4850\,
            I => \N__4818\
        );

    \I__1101\ : InMux
    port map (
            O => \N__4849\,
            I => \N__4818\
        );

    \I__1100\ : InMux
    port map (
            O => \N__4848\,
            I => \N__4818\
        );

    \I__1099\ : LocalMux
    port map (
            O => \N__4845\,
            I => \N__4815\
        );

    \I__1098\ : InMux
    port map (
            O => \N__4844\,
            I => \N__4812\
        );

    \I__1097\ : InMux
    port map (
            O => \N__4843\,
            I => \N__4801\
        );

    \I__1096\ : InMux
    port map (
            O => \N__4842\,
            I => \N__4801\
        );

    \I__1095\ : InMux
    port map (
            O => \N__4841\,
            I => \N__4801\
        );

    \I__1094\ : InMux
    port map (
            O => \N__4840\,
            I => \N__4801\
        );

    \I__1093\ : InMux
    port map (
            O => \N__4839\,
            I => \N__4801\
        );

    \I__1092\ : LocalMux
    port map (
            O => \N__4836\,
            I => \N__4798\
        );

    \I__1091\ : LocalMux
    port map (
            O => \N__4825\,
            I => \N__4795\
        );

    \I__1090\ : LocalMux
    port map (
            O => \N__4818\,
            I => \N__4792\
        );

    \I__1089\ : Span4Mux_v
    port map (
            O => \N__4815\,
            I => \N__4788\
        );

    \I__1088\ : LocalMux
    port map (
            O => \N__4812\,
            I => \N__4777\
        );

    \I__1087\ : LocalMux
    port map (
            O => \N__4801\,
            I => \N__4777\
        );

    \I__1086\ : Span4Mux_v
    port map (
            O => \N__4798\,
            I => \N__4777\
        );

    \I__1085\ : Span4Mux_h
    port map (
            O => \N__4795\,
            I => \N__4777\
        );

    \I__1084\ : Span4Mux_v
    port map (
            O => \N__4792\,
            I => \N__4777\
        );

    \I__1083\ : InMux
    port map (
            O => \N__4791\,
            I => \N__4774\
        );

    \I__1082\ : Odrv4
    port map (
            O => \N__4788\,
            I => pulses2count22_0
        );

    \I__1081\ : Odrv4
    port map (
            O => \N__4777\,
            I => pulses2count22_0
        );

    \I__1080\ : LocalMux
    port map (
            O => \N__4774\,
            I => pulses2count22_0
        );

    \I__1079\ : InMux
    port map (
            O => \N__4767\,
            I => \N__4764\
        );

    \I__1078\ : LocalMux
    port map (
            O => \N__4764\,
            I => \pulses2countZ0Z_4\
        );

    \I__1077\ : ClkMux
    port map (
            O => \N__4761\,
            I => \N__4689\
        );

    \I__1076\ : ClkMux
    port map (
            O => \N__4760\,
            I => \N__4689\
        );

    \I__1075\ : ClkMux
    port map (
            O => \N__4759\,
            I => \N__4689\
        );

    \I__1074\ : ClkMux
    port map (
            O => \N__4758\,
            I => \N__4689\
        );

    \I__1073\ : ClkMux
    port map (
            O => \N__4757\,
            I => \N__4689\
        );

    \I__1072\ : ClkMux
    port map (
            O => \N__4756\,
            I => \N__4689\
        );

    \I__1071\ : ClkMux
    port map (
            O => \N__4755\,
            I => \N__4689\
        );

    \I__1070\ : ClkMux
    port map (
            O => \N__4754\,
            I => \N__4689\
        );

    \I__1069\ : ClkMux
    port map (
            O => \N__4753\,
            I => \N__4689\
        );

    \I__1068\ : ClkMux
    port map (
            O => \N__4752\,
            I => \N__4689\
        );

    \I__1067\ : ClkMux
    port map (
            O => \N__4751\,
            I => \N__4689\
        );

    \I__1066\ : ClkMux
    port map (
            O => \N__4750\,
            I => \N__4689\
        );

    \I__1065\ : ClkMux
    port map (
            O => \N__4749\,
            I => \N__4689\
        );

    \I__1064\ : ClkMux
    port map (
            O => \N__4748\,
            I => \N__4689\
        );

    \I__1063\ : ClkMux
    port map (
            O => \N__4747\,
            I => \N__4689\
        );

    \I__1062\ : ClkMux
    port map (
            O => \N__4746\,
            I => \N__4689\
        );

    \I__1061\ : ClkMux
    port map (
            O => \N__4745\,
            I => \N__4689\
        );

    \I__1060\ : ClkMux
    port map (
            O => \N__4744\,
            I => \N__4689\
        );

    \I__1059\ : ClkMux
    port map (
            O => \N__4743\,
            I => \N__4689\
        );

    \I__1058\ : ClkMux
    port map (
            O => \N__4742\,
            I => \N__4689\
        );

    \I__1057\ : ClkMux
    port map (
            O => \N__4741\,
            I => \N__4689\
        );

    \I__1056\ : ClkMux
    port map (
            O => \N__4740\,
            I => \N__4689\
        );

    \I__1055\ : ClkMux
    port map (
            O => \N__4739\,
            I => \N__4689\
        );

    \I__1054\ : ClkMux
    port map (
            O => \N__4738\,
            I => \N__4689\
        );

    \I__1053\ : GlobalMux
    port map (
            O => \N__4689\,
            I => \N__4686\
        );

    \I__1052\ : gio2CtrlBuf
    port map (
            O => \N__4686\,
            I => clk_c_g
        );

    \I__1051\ : CEMux
    port map (
            O => \N__4683\,
            I => \N__4653\
        );

    \I__1050\ : CEMux
    port map (
            O => \N__4682\,
            I => \N__4653\
        );

    \I__1049\ : CEMux
    port map (
            O => \N__4681\,
            I => \N__4653\
        );

    \I__1048\ : CEMux
    port map (
            O => \N__4680\,
            I => \N__4653\
        );

    \I__1047\ : CEMux
    port map (
            O => \N__4679\,
            I => \N__4653\
        );

    \I__1046\ : CEMux
    port map (
            O => \N__4678\,
            I => \N__4653\
        );

    \I__1045\ : CEMux
    port map (
            O => \N__4677\,
            I => \N__4653\
        );

    \I__1044\ : CEMux
    port map (
            O => \N__4676\,
            I => \N__4653\
        );

    \I__1043\ : CEMux
    port map (
            O => \N__4675\,
            I => \N__4653\
        );

    \I__1042\ : CEMux
    port map (
            O => \N__4674\,
            I => \N__4653\
        );

    \I__1041\ : GlobalMux
    port map (
            O => \N__4653\,
            I => \N__4650\
        );

    \I__1040\ : gio2CtrlBuf
    port map (
            O => \N__4650\,
            I => \N_30_i_g\
        );

    \I__1039\ : InMux
    port map (
            O => \N__4647\,
            I => \N__4642\
        );

    \I__1038\ : InMux
    port map (
            O => \N__4646\,
            I => \N__4637\
        );

    \I__1037\ : InMux
    port map (
            O => \N__4645\,
            I => \N__4637\
        );

    \I__1036\ : LocalMux
    port map (
            O => \N__4642\,
            I => \counterZ0Z_3\
        );

    \I__1035\ : LocalMux
    port map (
            O => \N__4637\,
            I => \counterZ0Z_3\
        );

    \I__1034\ : CascadeMux
    port map (
            O => \N__4632\,
            I => \N__4629\
        );

    \I__1033\ : InMux
    port map (
            O => \N__4629\,
            I => \N__4624\
        );

    \I__1032\ : InMux
    port map (
            O => \N__4628\,
            I => \N__4621\
        );

    \I__1031\ : InMux
    port map (
            O => \N__4627\,
            I => \N__4618\
        );

    \I__1030\ : LocalMux
    port map (
            O => \N__4624\,
            I => \N__4615\
        );

    \I__1029\ : LocalMux
    port map (
            O => \N__4621\,
            I => \N__4612\
        );

    \I__1028\ : LocalMux
    port map (
            O => \N__4618\,
            I => \counterZ0Z_10\
        );

    \I__1027\ : Odrv4
    port map (
            O => \N__4615\,
            I => \counterZ0Z_10\
        );

    \I__1026\ : Odrv4
    port map (
            O => \N__4612\,
            I => \counterZ0Z_10\
        );

    \I__1025\ : InMux
    port map (
            O => \N__4605\,
            I => \N__4600\
        );

    \I__1024\ : InMux
    port map (
            O => \N__4604\,
            I => \N__4597\
        );

    \I__1023\ : InMux
    port map (
            O => \N__4603\,
            I => \N__4594\
        );

    \I__1022\ : LocalMux
    port map (
            O => \N__4600\,
            I => \counterZ0Z_2\
        );

    \I__1021\ : LocalMux
    port map (
            O => \N__4597\,
            I => \counterZ0Z_2\
        );

    \I__1020\ : LocalMux
    port map (
            O => \N__4594\,
            I => \counterZ0Z_2\
        );

    \I__1019\ : InMux
    port map (
            O => \N__4587\,
            I => \N__4582\
        );

    \I__1018\ : InMux
    port map (
            O => \N__4586\,
            I => \N__4579\
        );

    \I__1017\ : InMux
    port map (
            O => \N__4585\,
            I => \N__4576\
        );

    \I__1016\ : LocalMux
    port map (
            O => \N__4582\,
            I => \N__4573\
        );

    \I__1015\ : LocalMux
    port map (
            O => \N__4579\,
            I => \N__4570\
        );

    \I__1014\ : LocalMux
    port map (
            O => \N__4576\,
            I => \counterZ0Z_16\
        );

    \I__1013\ : Odrv4
    port map (
            O => \N__4573\,
            I => \counterZ0Z_16\
        );

    \I__1012\ : Odrv4
    port map (
            O => \N__4570\,
            I => \counterZ0Z_16\
        );

    \I__1011\ : CascadeMux
    port map (
            O => \N__4563\,
            I => \N__4556\
        );

    \I__1010\ : InMux
    port map (
            O => \N__4562\,
            I => \N__4550\
        );

    \I__1009\ : CascadeMux
    port map (
            O => \N__4561\,
            I => \N__4546\
        );

    \I__1008\ : CascadeMux
    port map (
            O => \N__4560\,
            I => \N__4543\
        );

    \I__1007\ : CascadeMux
    port map (
            O => \N__4559\,
            I => \N__4538\
        );

    \I__1006\ : InMux
    port map (
            O => \N__4556\,
            I => \N__4532\
        );

    \I__1005\ : InMux
    port map (
            O => \N__4555\,
            I => \N__4532\
        );

    \I__1004\ : InMux
    port map (
            O => \N__4554\,
            I => \N__4527\
        );

    \I__1003\ : InMux
    port map (
            O => \N__4553\,
            I => \N__4527\
        );

    \I__1002\ : LocalMux
    port map (
            O => \N__4550\,
            I => \N__4524\
        );

    \I__1001\ : InMux
    port map (
            O => \N__4549\,
            I => \N__4515\
        );

    \I__1000\ : InMux
    port map (
            O => \N__4546\,
            I => \N__4515\
        );

    \I__999\ : InMux
    port map (
            O => \N__4543\,
            I => \N__4515\
        );

    \I__998\ : InMux
    port map (
            O => \N__4542\,
            I => \N__4515\
        );

    \I__997\ : InMux
    port map (
            O => \N__4541\,
            I => \N__4512\
        );

    \I__996\ : InMux
    port map (
            O => \N__4538\,
            I => \N__4507\
        );

    \I__995\ : InMux
    port map (
            O => \N__4537\,
            I => \N__4507\
        );

    \I__994\ : LocalMux
    port map (
            O => \N__4532\,
            I => \PPM_STATEZ0Z_1\
        );

    \I__993\ : LocalMux
    port map (
            O => \N__4527\,
            I => \PPM_STATEZ0Z_1\
        );

    \I__992\ : Odrv4
    port map (
            O => \N__4524\,
            I => \PPM_STATEZ0Z_1\
        );

    \I__991\ : LocalMux
    port map (
            O => \N__4515\,
            I => \PPM_STATEZ0Z_1\
        );

    \I__990\ : LocalMux
    port map (
            O => \N__4512\,
            I => \PPM_STATEZ0Z_1\
        );

    \I__989\ : LocalMux
    port map (
            O => \N__4507\,
            I => \PPM_STATEZ0Z_1\
        );

    \I__988\ : CascadeMux
    port map (
            O => \N__4494\,
            I => \N__4491\
        );

    \I__987\ : InMux
    port map (
            O => \N__4491\,
            I => \N__4488\
        );

    \I__986\ : LocalMux
    port map (
            O => \N__4488\,
            I => \N__4481\
        );

    \I__985\ : InMux
    port map (
            O => \N__4487\,
            I => \N__4472\
        );

    \I__984\ : InMux
    port map (
            O => \N__4486\,
            I => \N__4467\
        );

    \I__983\ : InMux
    port map (
            O => \N__4485\,
            I => \N__4467\
        );

    \I__982\ : InMux
    port map (
            O => \N__4484\,
            I => \N__4464\
        );

    \I__981\ : Span4Mux_v
    port map (
            O => \N__4481\,
            I => \N__4461\
        );

    \I__980\ : InMux
    port map (
            O => \N__4480\,
            I => \N__4454\
        );

    \I__979\ : InMux
    port map (
            O => \N__4479\,
            I => \N__4454\
        );

    \I__978\ : InMux
    port map (
            O => \N__4478\,
            I => \N__4454\
        );

    \I__977\ : InMux
    port map (
            O => \N__4477\,
            I => \N__4447\
        );

    \I__976\ : InMux
    port map (
            O => \N__4476\,
            I => \N__4447\
        );

    \I__975\ : InMux
    port map (
            O => \N__4475\,
            I => \N__4447\
        );

    \I__974\ : LocalMux
    port map (
            O => \N__4472\,
            I => \PPM_STATEZ0Z_0\
        );

    \I__973\ : LocalMux
    port map (
            O => \N__4467\,
            I => \PPM_STATEZ0Z_0\
        );

    \I__972\ : LocalMux
    port map (
            O => \N__4464\,
            I => \PPM_STATEZ0Z_0\
        );

    \I__971\ : Odrv4
    port map (
            O => \N__4461\,
            I => \PPM_STATEZ0Z_0\
        );

    \I__970\ : LocalMux
    port map (
            O => \N__4454\,
            I => \PPM_STATEZ0Z_0\
        );

    \I__969\ : LocalMux
    port map (
            O => \N__4447\,
            I => \PPM_STATEZ0Z_0\
        );

    \I__968\ : InMux
    port map (
            O => \N__4434\,
            I => \N__4431\
        );

    \I__967\ : LocalMux
    port map (
            O => \N__4431\,
            I => \N__4428\
        );

    \I__966\ : Span4Mux_v
    port map (
            O => \N__4428\,
            I => \N__4425\
        );

    \I__965\ : Odrv4
    port map (
            O => \N__4425\,
            I => \PPM_STATE_0_sqmuxa_1_14\
        );

    \I__964\ : InMux
    port map (
            O => \N__4422\,
            I => \N__4419\
        );

    \I__963\ : LocalMux
    port map (
            O => \N__4419\,
            I => \PPM_STATE_0_sqmuxa_1_13\
        );

    \I__962\ : InMux
    port map (
            O => \N__4416\,
            I => \N__4413\
        );

    \I__961\ : LocalMux
    port map (
            O => \N__4413\,
            I => \PPM_STATE_0_sqmuxa_1_15\
        );

    \I__960\ : InMux
    port map (
            O => \N__4410\,
            I => \N__4407\
        );

    \I__959\ : LocalMux
    port map (
            O => \N__4407\,
            I => \N__4402\
        );

    \I__958\ : InMux
    port map (
            O => \N__4406\,
            I => \N__4399\
        );

    \I__957\ : InMux
    port map (
            O => \N__4405\,
            I => \N__4396\
        );

    \I__956\ : Span4Mux_h
    port map (
            O => \N__4402\,
            I => \N__4393\
        );

    \I__955\ : LocalMux
    port map (
            O => \N__4399\,
            I => \N__4390\
        );

    \I__954\ : LocalMux
    port map (
            O => \N__4396\,
            I => \N__4387\
        );

    \I__953\ : Odrv4
    port map (
            O => \N__4393\,
            I => \PPM_STATE_0_sqmuxa_1\
        );

    \I__952\ : Odrv12
    port map (
            O => \N__4390\,
            I => \PPM_STATE_0_sqmuxa_1\
        );

    \I__951\ : Odrv4
    port map (
            O => \N__4387\,
            I => \PPM_STATE_0_sqmuxa_1\
        );

    \I__950\ : InMux
    port map (
            O => \N__4380\,
            I => \N__4376\
        );

    \I__949\ : InMux
    port map (
            O => \N__4379\,
            I => \N__4373\
        );

    \I__948\ : LocalMux
    port map (
            O => \N__4376\,
            I => \N__4369\
        );

    \I__947\ : LocalMux
    port map (
            O => \N__4373\,
            I => \N__4366\
        );

    \I__946\ : InMux
    port map (
            O => \N__4372\,
            I => \N__4363\
        );

    \I__945\ : Span4Mux_h
    port map (
            O => \N__4369\,
            I => \N__4356\
        );

    \I__944\ : Span4Mux_h
    port map (
            O => \N__4366\,
            I => \N__4356\
        );

    \I__943\ : LocalMux
    port map (
            O => \N__4363\,
            I => \N__4356\
        );

    \I__942\ : Odrv4
    port map (
            O => \N__4356\,
            I => pulses2count39_0
        );

    \I__941\ : CascadeMux
    port map (
            O => \N__4353\,
            I => \PPM_STATE_0_sqmuxa_1_cascade_\
        );

    \I__940\ : InMux
    port map (
            O => \N__4350\,
            I => \N__4345\
        );

    \I__939\ : InMux
    port map (
            O => \N__4349\,
            I => \N__4341\
        );

    \I__938\ : InMux
    port map (
            O => \N__4348\,
            I => \N__4338\
        );

    \I__937\ : LocalMux
    port map (
            O => \N__4345\,
            I => \N__4335\
        );

    \I__936\ : InMux
    port map (
            O => \N__4344\,
            I => \N__4331\
        );

    \I__935\ : LocalMux
    port map (
            O => \N__4341\,
            I => \N__4328\
        );

    \I__934\ : LocalMux
    port map (
            O => \N__4338\,
            I => \N__4325\
        );

    \I__933\ : Span4Mux_h
    port map (
            O => \N__4335\,
            I => \N__4322\
        );

    \I__932\ : InMux
    port map (
            O => \N__4334\,
            I => \N__4319\
        );

    \I__931\ : LocalMux
    port map (
            O => \N__4331\,
            I => \counter11_0_N_2_THRU_CO\
        );

    \I__930\ : Odrv4
    port map (
            O => \N__4328\,
            I => \counter11_0_N_2_THRU_CO\
        );

    \I__929\ : Odrv4
    port map (
            O => \N__4325\,
            I => \counter11_0_N_2_THRU_CO\
        );

    \I__928\ : Odrv4
    port map (
            O => \N__4322\,
            I => \counter11_0_N_2_THRU_CO\
        );

    \I__927\ : LocalMux
    port map (
            O => \N__4319\,
            I => \counter11_0_N_2_THRU_CO\
        );

    \I__926\ : IoInMux
    port map (
            O => \N__4308\,
            I => \N__4305\
        );

    \I__925\ : LocalMux
    port map (
            O => \N__4305\,
            I => \N__4302\
        );

    \I__924\ : Odrv12
    port map (
            O => \N__4302\,
            I => \un1_PPM_STATE_0_sqmuxa_0_i\
        );

    \I__923\ : InMux
    port map (
            O => \N__4299\,
            I => \N__4294\
        );

    \I__922\ : InMux
    port map (
            O => \N__4298\,
            I => \N__4291\
        );

    \I__921\ : InMux
    port map (
            O => \N__4297\,
            I => \N__4288\
        );

    \I__920\ : LocalMux
    port map (
            O => \N__4294\,
            I => \N__4285\
        );

    \I__919\ : LocalMux
    port map (
            O => \N__4291\,
            I => \counterZ0Z_6\
        );

    \I__918\ : LocalMux
    port map (
            O => \N__4288\,
            I => \counterZ0Z_6\
        );

    \I__917\ : Odrv12
    port map (
            O => \N__4285\,
            I => \counterZ0Z_6\
        );

    \I__916\ : InMux
    port map (
            O => \N__4278\,
            I => \N__4273\
        );

    \I__915\ : InMux
    port map (
            O => \N__4277\,
            I => \N__4270\
        );

    \I__914\ : InMux
    port map (
            O => \N__4276\,
            I => \N__4267\
        );

    \I__913\ : LocalMux
    port map (
            O => \N__4273\,
            I => \counterZ0Z_0\
        );

    \I__912\ : LocalMux
    port map (
            O => \N__4270\,
            I => \counterZ0Z_0\
        );

    \I__911\ : LocalMux
    port map (
            O => \N__4267\,
            I => \counterZ0Z_0\
        );

    \I__910\ : InMux
    port map (
            O => \N__4260\,
            I => \N__4255\
        );

    \I__909\ : InMux
    port map (
            O => \N__4259\,
            I => \N__4252\
        );

    \I__908\ : InMux
    port map (
            O => \N__4258\,
            I => \N__4249\
        );

    \I__907\ : LocalMux
    port map (
            O => \N__4255\,
            I => \N__4246\
        );

    \I__906\ : LocalMux
    port map (
            O => \N__4252\,
            I => \counterZ0Z_11\
        );

    \I__905\ : LocalMux
    port map (
            O => \N__4249\,
            I => \counterZ0Z_11\
        );

    \I__904\ : Odrv4
    port map (
            O => \N__4246\,
            I => \counterZ0Z_11\
        );

    \I__903\ : InMux
    port map (
            O => \N__4239\,
            I => \N__4234\
        );

    \I__902\ : InMux
    port map (
            O => \N__4238\,
            I => \N__4231\
        );

    \I__901\ : InMux
    port map (
            O => \N__4237\,
            I => \N__4228\
        );

    \I__900\ : LocalMux
    port map (
            O => \N__4234\,
            I => \N__4225\
        );

    \I__899\ : LocalMux
    port map (
            O => \N__4231\,
            I => \counterZ0Z_7\
        );

    \I__898\ : LocalMux
    port map (
            O => \N__4228\,
            I => \counterZ0Z_7\
        );

    \I__897\ : Odrv12
    port map (
            O => \N__4225\,
            I => \counterZ0Z_7\
        );

    \I__896\ : InMux
    port map (
            O => \N__4218\,
            I => \N__4213\
        );

    \I__895\ : InMux
    port map (
            O => \N__4217\,
            I => \N__4210\
        );

    \I__894\ : InMux
    port map (
            O => \N__4216\,
            I => \N__4207\
        );

    \I__893\ : LocalMux
    port map (
            O => \N__4213\,
            I => \N__4204\
        );

    \I__892\ : LocalMux
    port map (
            O => \N__4210\,
            I => \counterZ0Z_15\
        );

    \I__891\ : LocalMux
    port map (
            O => \N__4207\,
            I => \counterZ0Z_15\
        );

    \I__890\ : Odrv4
    port map (
            O => \N__4204\,
            I => \counterZ0Z_15\
        );

    \I__889\ : CascadeMux
    port map (
            O => \N__4197\,
            I => \PPM_STATE_0_sqmuxa_1_12_cascade_\
        );

    \I__888\ : CascadeMux
    port map (
            O => \N__4194\,
            I => \N__4191\
        );

    \I__887\ : InMux
    port map (
            O => \N__4191\,
            I => \N__4188\
        );

    \I__886\ : LocalMux
    port map (
            O => \N__4188\,
            I => \N__4185\
        );

    \I__885\ : Odrv4
    port map (
            O => \N__4185\,
            I => \PPM_STATE_0_sqmuxa_1_16\
        );

    \I__884\ : InMux
    port map (
            O => \N__4182\,
            I => \N__4179\
        );

    \I__883\ : LocalMux
    port map (
            O => \N__4179\,
            I => \PPM_STATE_0_sqmuxa_1_2\
        );

    \I__882\ : InMux
    port map (
            O => \N__4176\,
            I => \N__4171\
        );

    \I__881\ : InMux
    port map (
            O => \N__4175\,
            I => \N__4166\
        );

    \I__880\ : InMux
    port map (
            O => \N__4174\,
            I => \N__4166\
        );

    \I__879\ : LocalMux
    port map (
            O => \N__4171\,
            I => \counterZ0Z_5\
        );

    \I__878\ : LocalMux
    port map (
            O => \N__4166\,
            I => \counterZ0Z_5\
        );

    \I__877\ : CascadeMux
    port map (
            O => \N__4161\,
            I => \N__4158\
        );

    \I__876\ : InMux
    port map (
            O => \N__4158\,
            I => \N__4155\
        );

    \I__875\ : LocalMux
    port map (
            O => \N__4155\,
            I => \pulses2countZ0Z_5\
        );

    \I__874\ : CascadeMux
    port map (
            O => \N__4152\,
            I => \N__4148\
        );

    \I__873\ : InMux
    port map (
            O => \N__4151\,
            I => \N__4144\
        );

    \I__872\ : InMux
    port map (
            O => \N__4148\,
            I => \N__4139\
        );

    \I__871\ : InMux
    port map (
            O => \N__4147\,
            I => \N__4139\
        );

    \I__870\ : LocalMux
    port map (
            O => \N__4144\,
            I => \counterZ0Z_4\
        );

    \I__869\ : LocalMux
    port map (
            O => \N__4139\,
            I => \counterZ0Z_4\
        );

    \I__868\ : CascadeMux
    port map (
            O => \N__4134\,
            I => \N__4131\
        );

    \I__867\ : InMux
    port map (
            O => \N__4131\,
            I => \N__4128\
        );

    \I__866\ : LocalMux
    port map (
            O => \N__4128\,
            I => \N__4125\
        );

    \I__865\ : Odrv4
    port map (
            O => \N__4125\,
            I => \counter11_0_I_15_c_RNOZ0\
        );

    \I__864\ : CascadeMux
    port map (
            O => \N__4122\,
            I => \N__4119\
        );

    \I__863\ : InMux
    port map (
            O => \N__4119\,
            I => \N__4111\
        );

    \I__862\ : InMux
    port map (
            O => \N__4118\,
            I => \N__4111\
        );

    \I__861\ : CascadeMux
    port map (
            O => \N__4117\,
            I => \N__4106\
        );

    \I__860\ : CascadeMux
    port map (
            O => \N__4116\,
            I => \N__4102\
        );

    \I__859\ : LocalMux
    port map (
            O => \N__4111\,
            I => \N__4097\
        );

    \I__858\ : InMux
    port map (
            O => \N__4110\,
            I => \N__4088\
        );

    \I__857\ : InMux
    port map (
            O => \N__4109\,
            I => \N__4088\
        );

    \I__856\ : InMux
    port map (
            O => \N__4106\,
            I => \N__4088\
        );

    \I__855\ : InMux
    port map (
            O => \N__4105\,
            I => \N__4088\
        );

    \I__854\ : InMux
    port map (
            O => \N__4102\,
            I => \N__4081\
        );

    \I__853\ : InMux
    port map (
            O => \N__4101\,
            I => \N__4081\
        );

    \I__852\ : InMux
    port map (
            O => \N__4100\,
            I => \N__4081\
        );

    \I__851\ : Odrv4
    port map (
            O => \N__4097\,
            I => \CONSTANT_ONE_NET\
        );

    \I__850\ : LocalMux
    port map (
            O => \N__4088\,
            I => \CONSTANT_ONE_NET\
        );

    \I__849\ : LocalMux
    port map (
            O => \N__4081\,
            I => \CONSTANT_ONE_NET\
        );

    \I__848\ : InMux
    port map (
            O => \N__4074\,
            I => \N__4071\
        );

    \I__847\ : LocalMux
    port map (
            O => \N__4071\,
            I => \N__4068\
        );

    \I__846\ : Span4Mux_h
    port map (
            O => \N__4068\,
            I => \N__4064\
        );

    \I__845\ : InMux
    port map (
            O => \N__4067\,
            I => \N__4061\
        );

    \I__844\ : Odrv4
    port map (
            O => \N__4064\,
            I => \init_pulsesZ0Z_3\
        );

    \I__843\ : LocalMux
    port map (
            O => \N__4061\,
            I => \init_pulsesZ0Z_3\
        );

    \I__842\ : CascadeMux
    port map (
            O => \N__4056\,
            I => \N__4053\
        );

    \I__841\ : InMux
    port map (
            O => \N__4053\,
            I => \N__4050\
        );

    \I__840\ : LocalMux
    port map (
            O => \N__4050\,
            I => \N__4047\
        );

    \I__839\ : Span4Mux_h
    port map (
            O => \N__4047\,
            I => \N__4043\
        );

    \I__838\ : InMux
    port map (
            O => \N__4046\,
            I => \N__4040\
        );

    \I__837\ : Odrv4
    port map (
            O => \N__4043\,
            I => \init_pulsesZ0Z_1\
        );

    \I__836\ : LocalMux
    port map (
            O => \N__4040\,
            I => \init_pulsesZ0Z_1\
        );

    \I__835\ : InMux
    port map (
            O => \N__4035\,
            I => \N__4032\
        );

    \I__834\ : LocalMux
    port map (
            O => \N__4032\,
            I => \pulses2countZ0Z_1\
        );

    \I__833\ : InMux
    port map (
            O => \N__4029\,
            I => \N__4026\
        );

    \I__832\ : LocalMux
    port map (
            O => \N__4026\,
            I => \N__4023\
        );

    \I__831\ : Span4Mux_h
    port map (
            O => \N__4023\,
            I => \N__4019\
        );

    \I__830\ : InMux
    port map (
            O => \N__4022\,
            I => \N__4016\
        );

    \I__829\ : Odrv4
    port map (
            O => \N__4019\,
            I => \init_pulsesZ0Z_12\
        );

    \I__828\ : LocalMux
    port map (
            O => \N__4016\,
            I => \init_pulsesZ0Z_12\
        );

    \I__827\ : CascadeMux
    port map (
            O => \N__4011\,
            I => \N__4008\
        );

    \I__826\ : InMux
    port map (
            O => \N__4008\,
            I => \N__4005\
        );

    \I__825\ : LocalMux
    port map (
            O => \N__4005\,
            I => \pulses2countZ0Z_12\
        );

    \I__824\ : InMux
    port map (
            O => \N__4002\,
            I => \N__3999\
        );

    \I__823\ : LocalMux
    port map (
            O => \N__3999\,
            I => \N__3996\
        );

    \I__822\ : Span4Mux_v
    port map (
            O => \N__3996\,
            I => \N__3992\
        );

    \I__821\ : InMux
    port map (
            O => \N__3995\,
            I => \N__3989\
        );

    \I__820\ : Odrv4
    port map (
            O => \N__3992\,
            I => \init_pulsesZ0Z_16\
        );

    \I__819\ : LocalMux
    port map (
            O => \N__3989\,
            I => \init_pulsesZ0Z_16\
        );

    \I__818\ : CascadeMux
    port map (
            O => \N__3984\,
            I => \N__3981\
        );

    \I__817\ : InMux
    port map (
            O => \N__3981\,
            I => \N__3978\
        );

    \I__816\ : LocalMux
    port map (
            O => \N__3978\,
            I => \pulses2countZ0Z_16\
        );

    \I__815\ : InMux
    port map (
            O => \N__3975\,
            I => \N__3963\
        );

    \I__814\ : InMux
    port map (
            O => \N__3974\,
            I => \N__3963\
        );

    \I__813\ : InMux
    port map (
            O => \N__3973\,
            I => \N__3963\
        );

    \I__812\ : InMux
    port map (
            O => \N__3972\,
            I => \N__3963\
        );

    \I__811\ : LocalMux
    port map (
            O => \N__3963\,
            I => \N__3960\
        );

    \I__810\ : Span4Mux_h
    port map (
            O => \N__3960\,
            I => \N__3957\
        );

    \I__809\ : Odrv4
    port map (
            O => \N__3957\,
            I => init_pulses39_0
        );

    \I__808\ : CascadeMux
    port map (
            O => \N__3954\,
            I => \N__3949\
        );

    \I__807\ : CascadeMux
    port map (
            O => \N__3953\,
            I => \N__3946\
        );

    \I__806\ : CascadeMux
    port map (
            O => \N__3952\,
            I => \N__3942\
        );

    \I__805\ : InMux
    port map (
            O => \N__3949\,
            I => \N__3933\
        );

    \I__804\ : InMux
    port map (
            O => \N__3946\,
            I => \N__3933\
        );

    \I__803\ : InMux
    port map (
            O => \N__3945\,
            I => \N__3933\
        );

    \I__802\ : InMux
    port map (
            O => \N__3942\,
            I => \N__3933\
        );

    \I__801\ : LocalMux
    port map (
            O => \N__3933\,
            I => un1_init_pulses39_2_0_0
        );

    \I__800\ : InMux
    port map (
            O => \N__3930\,
            I => \N__3927\
        );

    \I__799\ : LocalMux
    port map (
            O => \N__3927\,
            I => \N__3924\
        );

    \I__798\ : Span4Mux_h
    port map (
            O => \N__3924\,
            I => \N__3920\
        );

    \I__797\ : InMux
    port map (
            O => \N__3923\,
            I => \N__3917\
        );

    \I__796\ : Odrv4
    port map (
            O => \N__3920\,
            I => \init_pulsesZ0Z_2\
        );

    \I__795\ : LocalMux
    port map (
            O => \N__3917\,
            I => \init_pulsesZ0Z_2\
        );

    \I__794\ : InMux
    port map (
            O => \N__3912\,
            I => \N__3909\
        );

    \I__793\ : LocalMux
    port map (
            O => \N__3909\,
            I => \pulses2countZ0Z_2\
        );

    \I__792\ : CascadeMux
    port map (
            O => \N__3906\,
            I => \N__3903\
        );

    \I__791\ : InMux
    port map (
            O => \N__3903\,
            I => \N__3900\
        );

    \I__790\ : LocalMux
    port map (
            O => \N__3900\,
            I => \pulses2countZ0Z_3\
        );

    \I__789\ : CascadeMux
    port map (
            O => \N__3897\,
            I => \N__3894\
        );

    \I__788\ : InMux
    port map (
            O => \N__3894\,
            I => \N__3891\
        );

    \I__787\ : LocalMux
    port map (
            O => \N__3891\,
            I => \counter11_0_I_9_c_RNOZ0\
        );

    \I__786\ : InMux
    port map (
            O => \N__3888\,
            I => \N__3885\
        );

    \I__785\ : LocalMux
    port map (
            O => \N__3885\,
            I => \N__3882\
        );

    \I__784\ : Span4Mux_v
    port map (
            O => \N__3882\,
            I => \N__3878\
        );

    \I__783\ : InMux
    port map (
            O => \N__3881\,
            I => \N__3875\
        );

    \I__782\ : Odrv4
    port map (
            O => \N__3878\,
            I => \init_pulsesZ0Z_5\
        );

    \I__781\ : LocalMux
    port map (
            O => \N__3875\,
            I => \init_pulsesZ0Z_5\
        );

    \I__780\ : InMux
    port map (
            O => \N__3870\,
            I => \N__3867\
        );

    \I__779\ : LocalMux
    port map (
            O => \N__3867\,
            I => \N_43\
        );

    \I__778\ : IoInMux
    port map (
            O => \N__3864\,
            I => \N__3861\
        );

    \I__777\ : LocalMux
    port map (
            O => \N__3861\,
            I => \N__3858\
        );

    \I__776\ : Span12Mux_s9_v
    port map (
            O => \N__3858\,
            I => \N__3855\
        );

    \I__775\ : Odrv12
    port map (
            O => \N__3855\,
            I => \N_30_i\
        );

    \I__774\ : CascadeMux
    port map (
            O => \N__3852\,
            I => \N__3845\
        );

    \I__773\ : InMux
    port map (
            O => \N__3851\,
            I => \N__3842\
        );

    \I__772\ : InMux
    port map (
            O => \N__3850\,
            I => \N__3839\
        );

    \I__771\ : InMux
    port map (
            O => \N__3849\,
            I => \N__3836\
        );

    \I__770\ : InMux
    port map (
            O => \N__3848\,
            I => \N__3831\
        );

    \I__769\ : InMux
    port map (
            O => \N__3845\,
            I => \N__3831\
        );

    \I__768\ : LocalMux
    port map (
            O => \N__3842\,
            I => \CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__767\ : LocalMux
    port map (
            O => \N__3839\,
            I => \CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__766\ : LocalMux
    port map (
            O => \N__3836\,
            I => \CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__765\ : LocalMux
    port map (
            O => \N__3831\,
            I => \CHOOSE_CHANNEL_fastZ0Z_1\
        );

    \I__764\ : InMux
    port map (
            O => \N__3822\,
            I => \N__3815\
        );

    \I__763\ : InMux
    port map (
            O => \N__3821\,
            I => \N__3812\
        );

    \I__762\ : InMux
    port map (
            O => \N__3820\,
            I => \N__3805\
        );

    \I__761\ : InMux
    port map (
            O => \N__3819\,
            I => \N__3805\
        );

    \I__760\ : InMux
    port map (
            O => \N__3818\,
            I => \N__3805\
        );

    \I__759\ : LocalMux
    port map (
            O => \N__3815\,
            I => \CHOOSE_CHANNEL_fastZ0Z_0\
        );

    \I__758\ : LocalMux
    port map (
            O => \N__3812\,
            I => \CHOOSE_CHANNEL_fastZ0Z_0\
        );

    \I__757\ : LocalMux
    port map (
            O => \N__3805\,
            I => \CHOOSE_CHANNEL_fastZ0Z_0\
        );

    \I__756\ : CascadeMux
    port map (
            O => \N__3798\,
            I => \N__3792\
        );

    \I__755\ : CascadeMux
    port map (
            O => \N__3797\,
            I => \N__3789\
        );

    \I__754\ : InMux
    port map (
            O => \N__3796\,
            I => \N__3785\
        );

    \I__753\ : InMux
    port map (
            O => \N__3795\,
            I => \N__3782\
        );

    \I__752\ : InMux
    port map (
            O => \N__3792\,
            I => \N__3779\
        );

    \I__751\ : InMux
    port map (
            O => \N__3789\,
            I => \N__3774\
        );

    \I__750\ : InMux
    port map (
            O => \N__3788\,
            I => \N__3774\
        );

    \I__749\ : LocalMux
    port map (
            O => \N__3785\,
            I => \CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__748\ : LocalMux
    port map (
            O => \N__3782\,
            I => \CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__747\ : LocalMux
    port map (
            O => \N__3779\,
            I => \CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__746\ : LocalMux
    port map (
            O => \N__3774\,
            I => \CHOOSE_CHANNEL_fastZ0Z_3\
        );

    \I__745\ : CascadeMux
    port map (
            O => \N__3765\,
            I => \N__3760\
        );

    \I__744\ : InMux
    port map (
            O => \N__3764\,
            I => \N__3755\
        );

    \I__743\ : InMux
    port map (
            O => \N__3763\,
            I => \N__3752\
        );

    \I__742\ : InMux
    port map (
            O => \N__3760\,
            I => \N__3745\
        );

    \I__741\ : InMux
    port map (
            O => \N__3759\,
            I => \N__3745\
        );

    \I__740\ : InMux
    port map (
            O => \N__3758\,
            I => \N__3745\
        );

    \I__739\ : LocalMux
    port map (
            O => \N__3755\,
            I => \CHOOSE_CHANNEL_fastZ0Z_2\
        );

    \I__738\ : LocalMux
    port map (
            O => \N__3752\,
            I => \CHOOSE_CHANNEL_fastZ0Z_2\
        );

    \I__737\ : LocalMux
    port map (
            O => \N__3745\,
            I => \CHOOSE_CHANNEL_fastZ0Z_2\
        );

    \I__736\ : SRMux
    port map (
            O => \N__3738\,
            I => \N__3735\
        );

    \I__735\ : LocalMux
    port map (
            O => \N__3735\,
            I => \N__3732\
        );

    \I__734\ : Span4Mux_h
    port map (
            O => \N__3732\,
            I => \N__3729\
        );

    \I__733\ : Odrv4
    port map (
            O => \N__3729\,
            I => \N_15_i\
        );

    \I__732\ : CascadeMux
    port map (
            O => \N__3726\,
            I => \N__3723\
        );

    \I__731\ : InMux
    port map (
            O => \N__3723\,
            I => \N__3720\
        );

    \I__730\ : LocalMux
    port map (
            O => \N__3720\,
            I => \PPM_STATE_e_1_0\
        );

    \I__729\ : CascadeMux
    port map (
            O => \N__3717\,
            I => \N__3709\
        );

    \I__728\ : InMux
    port map (
            O => \N__3716\,
            I => \N__3705\
        );

    \I__727\ : InMux
    port map (
            O => \N__3715\,
            I => \N__3700\
        );

    \I__726\ : InMux
    port map (
            O => \N__3714\,
            I => \N__3697\
        );

    \I__725\ : InMux
    port map (
            O => \N__3713\,
            I => \N__3690\
        );

    \I__724\ : InMux
    port map (
            O => \N__3712\,
            I => \N__3690\
        );

    \I__723\ : InMux
    port map (
            O => \N__3709\,
            I => \N__3685\
        );

    \I__722\ : InMux
    port map (
            O => \N__3708\,
            I => \N__3685\
        );

    \I__721\ : LocalMux
    port map (
            O => \N__3705\,
            I => \N__3682\
        );

    \I__720\ : InMux
    port map (
            O => \N__3704\,
            I => \N__3679\
        );

    \I__719\ : InMux
    port map (
            O => \N__3703\,
            I => \N__3676\
        );

    \I__718\ : LocalMux
    port map (
            O => \N__3700\,
            I => \N__3671\
        );

    \I__717\ : LocalMux
    port map (
            O => \N__3697\,
            I => \N__3671\
        );

    \I__716\ : InMux
    port map (
            O => \N__3696\,
            I => \N__3668\
        );

    \I__715\ : InMux
    port map (
            O => \N__3695\,
            I => \N__3665\
        );

    \I__714\ : LocalMux
    port map (
            O => \N__3690\,
            I => \N__3658\
        );

    \I__713\ : LocalMux
    port map (
            O => \N__3685\,
            I => \N__3658\
        );

    \I__712\ : Span4Mux_v
    port map (
            O => \N__3682\,
            I => \N__3658\
        );

    \I__711\ : LocalMux
    port map (
            O => \N__3679\,
            I => \N__3655\
        );

    \I__710\ : LocalMux
    port map (
            O => \N__3676\,
            I => \N__3652\
        );

    \I__709\ : Span4Mux_v
    port map (
            O => \N__3671\,
            I => \N__3647\
        );

    \I__708\ : LocalMux
    port map (
            O => \N__3668\,
            I => \N__3647\
        );

    \I__707\ : LocalMux
    port map (
            O => \N__3665\,
            I => \CHOOSE_CHANNELZ0Z_2\
        );

    \I__706\ : Odrv4
    port map (
            O => \N__3658\,
            I => \CHOOSE_CHANNELZ0Z_2\
        );

    \I__705\ : Odrv12
    port map (
            O => \N__3655\,
            I => \CHOOSE_CHANNELZ0Z_2\
        );

    \I__704\ : Odrv4
    port map (
            O => \N__3652\,
            I => \CHOOSE_CHANNELZ0Z_2\
        );

    \I__703\ : Odrv4
    port map (
            O => \N__3647\,
            I => \CHOOSE_CHANNELZ0Z_2\
        );

    \I__702\ : InMux
    port map (
            O => \N__3636\,
            I => \N__3626\
        );

    \I__701\ : InMux
    port map (
            O => \N__3635\,
            I => \N__3626\
        );

    \I__700\ : CascadeMux
    port map (
            O => \N__3634\,
            I => \N__3623\
        );

    \I__699\ : InMux
    port map (
            O => \N__3633\,
            I => \N__3618\
        );

    \I__698\ : InMux
    port map (
            O => \N__3632\,
            I => \N__3615\
        );

    \I__697\ : InMux
    port map (
            O => \N__3631\,
            I => \N__3612\
        );

    \I__696\ : LocalMux
    port map (
            O => \N__3626\,
            I => \N__3607\
        );

    \I__695\ : InMux
    port map (
            O => \N__3623\,
            I => \N__3602\
        );

    \I__694\ : InMux
    port map (
            O => \N__3622\,
            I => \N__3602\
        );

    \I__693\ : InMux
    port map (
            O => \N__3621\,
            I => \N__3599\
        );

    \I__692\ : LocalMux
    port map (
            O => \N__3618\,
            I => \N__3594\
        );

    \I__691\ : LocalMux
    port map (
            O => \N__3615\,
            I => \N__3594\
        );

    \I__690\ : LocalMux
    port map (
            O => \N__3612\,
            I => \N__3591\
        );

    \I__689\ : InMux
    port map (
            O => \N__3611\,
            I => \N__3588\
        );

    \I__688\ : InMux
    port map (
            O => \N__3610\,
            I => \N__3584\
        );

    \I__687\ : Span4Mux_h
    port map (
            O => \N__3607\,
            I => \N__3575\
        );

    \I__686\ : LocalMux
    port map (
            O => \N__3602\,
            I => \N__3575\
        );

    \I__685\ : LocalMux
    port map (
            O => \N__3599\,
            I => \N__3575\
        );

    \I__684\ : Span4Mux_v
    port map (
            O => \N__3594\,
            I => \N__3575\
        );

    \I__683\ : Span4Mux_v
    port map (
            O => \N__3591\,
            I => \N__3572\
        );

    \I__682\ : LocalMux
    port map (
            O => \N__3588\,
            I => \N__3569\
        );

    \I__681\ : InMux
    port map (
            O => \N__3587\,
            I => \N__3566\
        );

    \I__680\ : LocalMux
    port map (
            O => \N__3584\,
            I => \N__3563\
        );

    \I__679\ : Odrv4
    port map (
            O => \N__3575\,
            I => \CHOOSE_CHANNELZ0Z_1\
        );

    \I__678\ : Odrv4
    port map (
            O => \N__3572\,
            I => \CHOOSE_CHANNELZ0Z_1\
        );

    \I__677\ : Odrv12
    port map (
            O => \N__3569\,
            I => \CHOOSE_CHANNELZ0Z_1\
        );

    \I__676\ : LocalMux
    port map (
            O => \N__3566\,
            I => \CHOOSE_CHANNELZ0Z_1\
        );

    \I__675\ : Odrv4
    port map (
            O => \N__3563\,
            I => \CHOOSE_CHANNELZ0Z_1\
        );

    \I__674\ : CascadeMux
    port map (
            O => \N__3552\,
            I => \N__3547\
        );

    \I__673\ : CascadeMux
    port map (
            O => \N__3551\,
            I => \N__3542\
        );

    \I__672\ : CascadeMux
    port map (
            O => \N__3550\,
            I => \N__3538\
        );

    \I__671\ : InMux
    port map (
            O => \N__3547\,
            I => \N__3534\
        );

    \I__670\ : CascadeMux
    port map (
            O => \N__3546\,
            I => \N__3531\
        );

    \I__669\ : CascadeMux
    port map (
            O => \N__3545\,
            I => \N__3528\
        );

    \I__668\ : InMux
    port map (
            O => \N__3542\,
            I => \N__3524\
        );

    \I__667\ : CascadeMux
    port map (
            O => \N__3541\,
            I => \N__3520\
        );

    \I__666\ : InMux
    port map (
            O => \N__3538\,
            I => \N__3514\
        );

    \I__665\ : InMux
    port map (
            O => \N__3537\,
            I => \N__3514\
        );

    \I__664\ : LocalMux
    port map (
            O => \N__3534\,
            I => \N__3511\
        );

    \I__663\ : InMux
    port map (
            O => \N__3531\,
            I => \N__3508\
        );

    \I__662\ : InMux
    port map (
            O => \N__3528\,
            I => \N__3505\
        );

    \I__661\ : InMux
    port map (
            O => \N__3527\,
            I => \N__3502\
        );

    \I__660\ : LocalMux
    port map (
            O => \N__3524\,
            I => \N__3499\
        );

    \I__659\ : InMux
    port map (
            O => \N__3523\,
            I => \N__3494\
        );

    \I__658\ : InMux
    port map (
            O => \N__3520\,
            I => \N__3494\
        );

    \I__657\ : InMux
    port map (
            O => \N__3519\,
            I => \N__3491\
        );

    \I__656\ : LocalMux
    port map (
            O => \N__3514\,
            I => \N__3488\
        );

    \I__655\ : Span4Mux_h
    port map (
            O => \N__3511\,
            I => \N__3481\
        );

    \I__654\ : LocalMux
    port map (
            O => \N__3508\,
            I => \N__3481\
        );

    \I__653\ : LocalMux
    port map (
            O => \N__3505\,
            I => \N__3481\
        );

    \I__652\ : LocalMux
    port map (
            O => \N__3502\,
            I => \N__3478\
        );

    \I__651\ : Span4Mux_h
    port map (
            O => \N__3499\,
            I => \N__3475\
        );

    \I__650\ : LocalMux
    port map (
            O => \N__3494\,
            I => \CHOOSE_CHANNELZ0Z_3\
        );

    \I__649\ : LocalMux
    port map (
            O => \N__3491\,
            I => \CHOOSE_CHANNELZ0Z_3\
        );

    \I__648\ : Odrv12
    port map (
            O => \N__3488\,
            I => \CHOOSE_CHANNELZ0Z_3\
        );

    \I__647\ : Odrv4
    port map (
            O => \N__3481\,
            I => \CHOOSE_CHANNELZ0Z_3\
        );

    \I__646\ : Odrv4
    port map (
            O => \N__3478\,
            I => \CHOOSE_CHANNELZ0Z_3\
        );

    \I__645\ : Odrv4
    port map (
            O => \N__3475\,
            I => \CHOOSE_CHANNELZ0Z_3\
        );

    \I__644\ : InMux
    port map (
            O => \N__3462\,
            I => \N__3458\
        );

    \I__643\ : InMux
    port map (
            O => \N__3461\,
            I => \N__3452\
        );

    \I__642\ : LocalMux
    port map (
            O => \N__3458\,
            I => \N__3446\
        );

    \I__641\ : InMux
    port map (
            O => \N__3457\,
            I => \N__3441\
        );

    \I__640\ : InMux
    port map (
            O => \N__3456\,
            I => \N__3441\
        );

    \I__639\ : InMux
    port map (
            O => \N__3455\,
            I => \N__3438\
        );

    \I__638\ : LocalMux
    port map (
            O => \N__3452\,
            I => \N__3430\
        );

    \I__637\ : InMux
    port map (
            O => \N__3451\,
            I => \N__3427\
        );

    \I__636\ : InMux
    port map (
            O => \N__3450\,
            I => \N__3424\
        );

    \I__635\ : InMux
    port map (
            O => \N__3449\,
            I => \N__3421\
        );

    \I__634\ : Span4Mux_v
    port map (
            O => \N__3446\,
            I => \N__3414\
        );

    \I__633\ : LocalMux
    port map (
            O => \N__3441\,
            I => \N__3414\
        );

    \I__632\ : LocalMux
    port map (
            O => \N__3438\,
            I => \N__3414\
        );

    \I__631\ : InMux
    port map (
            O => \N__3437\,
            I => \N__3409\
        );

    \I__630\ : InMux
    port map (
            O => \N__3436\,
            I => \N__3409\
        );

    \I__629\ : InMux
    port map (
            O => \N__3435\,
            I => \N__3404\
        );

    \I__628\ : InMux
    port map (
            O => \N__3434\,
            I => \N__3404\
        );

    \I__627\ : InMux
    port map (
            O => \N__3433\,
            I => \N__3401\
        );

    \I__626\ : Span4Mux_h
    port map (
            O => \N__3430\,
            I => \N__3392\
        );

    \I__625\ : LocalMux
    port map (
            O => \N__3427\,
            I => \N__3392\
        );

    \I__624\ : LocalMux
    port map (
            O => \N__3424\,
            I => \N__3392\
        );

    \I__623\ : LocalMux
    port map (
            O => \N__3421\,
            I => \N__3392\
        );

    \I__622\ : Odrv4
    port map (
            O => \N__3414\,
            I => \CHOOSE_CHANNELZ0Z_0\
        );

    \I__621\ : LocalMux
    port map (
            O => \N__3409\,
            I => \CHOOSE_CHANNELZ0Z_0\
        );

    \I__620\ : LocalMux
    port map (
            O => \N__3404\,
            I => \CHOOSE_CHANNELZ0Z_0\
        );

    \I__619\ : LocalMux
    port map (
            O => \N__3401\,
            I => \CHOOSE_CHANNELZ0Z_0\
        );

    \I__618\ : Odrv4
    port map (
            O => \N__3392\,
            I => \CHOOSE_CHANNELZ0Z_0\
        );

    \I__617\ : InMux
    port map (
            O => \N__3381\,
            I => un1_counter_13_cry_11
        );

    \I__616\ : InMux
    port map (
            O => \N__3378\,
            I => un1_counter_13_cry_12
        );

    \I__615\ : InMux
    port map (
            O => \N__3375\,
            I => un1_counter_13_cry_13
        );

    \I__614\ : InMux
    port map (
            O => \N__3372\,
            I => un1_counter_13_cry_14
        );

    \I__613\ : InMux
    port map (
            O => \N__3369\,
            I => \bfn_11_28_0_\
        );

    \I__612\ : InMux
    port map (
            O => \N__3366\,
            I => un1_counter_13_cry_16
        );

    \I__611\ : InMux
    port map (
            O => \N__3363\,
            I => un1_counter_13_cry_17
        );

    \I__610\ : SRMux
    port map (
            O => \N__3360\,
            I => \N__3351\
        );

    \I__609\ : SRMux
    port map (
            O => \N__3359\,
            I => \N__3351\
        );

    \I__608\ : SRMux
    port map (
            O => \N__3358\,
            I => \N__3351\
        );

    \I__607\ : GlobalMux
    port map (
            O => \N__3351\,
            I => \N__3348\
        );

    \I__606\ : gio2CtrlBuf
    port map (
            O => \N__3348\,
            I => \un1_PPM_STATE_0_sqmuxa_0_i_g\
        );

    \I__605\ : InMux
    port map (
            O => \N__3345\,
            I => \N__3340\
        );

    \I__604\ : InMux
    port map (
            O => \N__3344\,
            I => \N__3337\
        );

    \I__603\ : InMux
    port map (
            O => \N__3343\,
            I => \N__3334\
        );

    \I__602\ : LocalMux
    port map (
            O => \N__3340\,
            I => \N__3331\
        );

    \I__601\ : LocalMux
    port map (
            O => \N__3337\,
            I => \N__3328\
        );

    \I__600\ : LocalMux
    port map (
            O => \N__3334\,
            I => \counterZ0Z_17\
        );

    \I__599\ : Odrv4
    port map (
            O => \N__3331\,
            I => \counterZ0Z_17\
        );

    \I__598\ : Odrv4
    port map (
            O => \N__3328\,
            I => \counterZ0Z_17\
        );

    \I__597\ : InMux
    port map (
            O => \N__3321\,
            I => \N__3316\
        );

    \I__596\ : InMux
    port map (
            O => \N__3320\,
            I => \N__3313\
        );

    \I__595\ : InMux
    port map (
            O => \N__3319\,
            I => \N__3310\
        );

    \I__594\ : LocalMux
    port map (
            O => \N__3316\,
            I => \N__3307\
        );

    \I__593\ : LocalMux
    port map (
            O => \N__3313\,
            I => \N__3304\
        );

    \I__592\ : LocalMux
    port map (
            O => \N__3310\,
            I => \counterZ0Z_14\
        );

    \I__591\ : Odrv4
    port map (
            O => \N__3307\,
            I => \counterZ0Z_14\
        );

    \I__590\ : Odrv4
    port map (
            O => \N__3304\,
            I => \counterZ0Z_14\
        );

    \I__589\ : InMux
    port map (
            O => \N__3297\,
            I => \N__3293\
        );

    \I__588\ : InMux
    port map (
            O => \N__3296\,
            I => \N__3289\
        );

    \I__587\ : LocalMux
    port map (
            O => \N__3293\,
            I => \N__3286\
        );

    \I__586\ : InMux
    port map (
            O => \N__3292\,
            I => \N__3283\
        );

    \I__585\ : LocalMux
    port map (
            O => \N__3289\,
            I => \counterZ0Z_1\
        );

    \I__584\ : Odrv12
    port map (
            O => \N__3286\,
            I => \counterZ0Z_1\
        );

    \I__583\ : LocalMux
    port map (
            O => \N__3283\,
            I => \counterZ0Z_1\
        );

    \I__582\ : InMux
    port map (
            O => \N__3276\,
            I => un1_counter_13_cry_1
        );

    \I__581\ : InMux
    port map (
            O => \N__3273\,
            I => un1_counter_13_cry_2
        );

    \I__580\ : InMux
    port map (
            O => \N__3270\,
            I => un1_counter_13_cry_3
        );

    \I__579\ : InMux
    port map (
            O => \N__3267\,
            I => un1_counter_13_cry_4
        );

    \I__578\ : InMux
    port map (
            O => \N__3264\,
            I => un1_counter_13_cry_5
        );

    \I__577\ : InMux
    port map (
            O => \N__3261\,
            I => un1_counter_13_cry_6
        );

    \I__576\ : InMux
    port map (
            O => \N__3258\,
            I => \bfn_11_27_0_\
        );

    \I__575\ : InMux
    port map (
            O => \N__3255\,
            I => un1_counter_13_cry_8
        );

    \I__574\ : InMux
    port map (
            O => \N__3252\,
            I => un1_counter_13_cry_9
        );

    \I__573\ : InMux
    port map (
            O => \N__3249\,
            I => un1_counter_13_cry_10
        );

    \I__572\ : InMux
    port map (
            O => \N__3246\,
            I => \counter11_0_N_2\
        );

    \I__571\ : CascadeMux
    port map (
            O => \N__3243\,
            I => \N__3240\
        );

    \I__570\ : InMux
    port map (
            O => \N__3240\,
            I => \N__3237\
        );

    \I__569\ : LocalMux
    port map (
            O => \N__3237\,
            I => \pulses2countZ0Z_0\
        );

    \I__568\ : CascadeMux
    port map (
            O => \N__3234\,
            I => \N__3231\
        );

    \I__567\ : InMux
    port map (
            O => \N__3231\,
            I => \N__3228\
        );

    \I__566\ : LocalMux
    port map (
            O => \N__3228\,
            I => \counter11_0_I_1_c_RNOZ0\
        );

    \I__565\ : CascadeMux
    port map (
            O => \N__3225\,
            I => \N__3222\
        );

    \I__564\ : InMux
    port map (
            O => \N__3222\,
            I => \N__3219\
        );

    \I__563\ : LocalMux
    port map (
            O => \N__3219\,
            I => \pulses2countZ0Z_10\
        );

    \I__562\ : InMux
    port map (
            O => \N__3216\,
            I => \N__3213\
        );

    \I__561\ : LocalMux
    port map (
            O => \N__3213\,
            I => \pulses2countZ0Z_11\
        );

    \I__560\ : CascadeMux
    port map (
            O => \N__3210\,
            I => \N__3207\
        );

    \I__559\ : InMux
    port map (
            O => \N__3207\,
            I => \N__3204\
        );

    \I__558\ : LocalMux
    port map (
            O => \N__3204\,
            I => \counter11_0_I_33_c_RNOZ0\
        );

    \I__557\ : InMux
    port map (
            O => \N__3201\,
            I => \N__3198\
        );

    \I__556\ : LocalMux
    port map (
            O => \N__3198\,
            I => \pulses2countZ0Z_13\
        );

    \I__555\ : CascadeMux
    port map (
            O => \N__3195\,
            I => \N__3192\
        );

    \I__554\ : InMux
    port map (
            O => \N__3192\,
            I => \N__3189\
        );

    \I__553\ : LocalMux
    port map (
            O => \N__3189\,
            I => \counter11_0_I_39_c_RNOZ0\
        );

    \I__552\ : InMux
    port map (
            O => \N__3186\,
            I => \N__3183\
        );

    \I__551\ : LocalMux
    port map (
            O => \N__3183\,
            I => \pulses2countZ0Z_17\
        );

    \I__550\ : CascadeMux
    port map (
            O => \N__3180\,
            I => \N__3177\
        );

    \I__549\ : InMux
    port map (
            O => \N__3177\,
            I => \N__3174\
        );

    \I__548\ : LocalMux
    port map (
            O => \N__3174\,
            I => \counter11_0_I_51_c_RNOZ0\
        );

    \I__547\ : InMux
    port map (
            O => \N__3171\,
            I => \N__3167\
        );

    \I__546\ : CascadeMux
    port map (
            O => \N__3170\,
            I => \N__3164\
        );

    \I__545\ : LocalMux
    port map (
            O => \N__3167\,
            I => \N__3161\
        );

    \I__544\ : InMux
    port map (
            O => \N__3164\,
            I => \N__3158\
        );

    \I__543\ : Span4Mux_v
    port map (
            O => \N__3161\,
            I => \N__3155\
        );

    \I__542\ : LocalMux
    port map (
            O => \N__3158\,
            I => \N__3152\
        );

    \I__541\ : Odrv4
    port map (
            O => \N__3155\,
            I => \N_36_i\
        );

    \I__540\ : Odrv12
    port map (
            O => \N__3152\,
            I => \N_36_i\
        );

    \I__539\ : InMux
    port map (
            O => \N__3147\,
            I => un1_counter_13_cry_0
        );

    \I__538\ : CascadeMux
    port map (
            O => \N__3144\,
            I => \N__3141\
        );

    \I__537\ : InMux
    port map (
            O => \N__3141\,
            I => \N__3138\
        );

    \I__536\ : LocalMux
    port map (
            O => \N__3138\,
            I => \counter11_0_I_21_c_RNOZ0\
        );

    \I__535\ : InMux
    port map (
            O => \N__3135\,
            I => \N__3132\
        );

    \I__534\ : LocalMux
    port map (
            O => \N__3132\,
            I => \counter11_0_I_45_c_RNOZ0\
        );

    \I__533\ : CascadeMux
    port map (
            O => \N__3129\,
            I => \N_43_cascade_\
        );

    \I__532\ : CascadeMux
    port map (
            O => \N__3126\,
            I => \un15_0_i_0_0_cascade_\
        );

    \I__531\ : CascadeMux
    port map (
            O => \N__3123\,
            I => \N__3120\
        );

    \I__530\ : InMux
    port map (
            O => \N__3120\,
            I => \N__3117\
        );

    \I__529\ : LocalMux
    port map (
            O => \N__3117\,
            I => \CHOOSE_CHANNEL_fast_RNIPSOR8_0Z0Z_2\
        );

    \I__528\ : InMux
    port map (
            O => \N__3114\,
            I => \N__3110\
        );

    \I__527\ : InMux
    port map (
            O => \N__3113\,
            I => \N__3107\
        );

    \I__526\ : LocalMux
    port map (
            O => \N__3110\,
            I => un15_0_12
        );

    \I__525\ : LocalMux
    port map (
            O => \N__3107\,
            I => un15_0_12
        );

    \I__524\ : InMux
    port map (
            O => \N__3102\,
            I => \N__3095\
        );

    \I__523\ : InMux
    port map (
            O => \N__3101\,
            I => \N__3095\
        );

    \I__522\ : InMux
    port map (
            O => \N__3100\,
            I => \N__3092\
        );

    \I__521\ : LocalMux
    port map (
            O => \N__3095\,
            I => un15_0_i_0_0
        );

    \I__520\ : LocalMux
    port map (
            O => \N__3092\,
            I => un15_0_i_0_0
        );

    \I__519\ : CascadeMux
    port map (
            O => \N__3087\,
            I => \N__3084\
        );

    \I__518\ : InMux
    port map (
            O => \N__3084\,
            I => \N__3081\
        );

    \I__517\ : LocalMux
    port map (
            O => \N__3081\,
            I => \CHOOSE_CHANNEL_fast_RNIPSOR8Z0Z_2\
        );

    \I__516\ : CascadeMux
    port map (
            O => \N__3078\,
            I => \PPM_STATE_r_1_1_cascade_\
        );

    \I__515\ : CascadeMux
    port map (
            O => \N__3075\,
            I => \N__3066\
        );

    \I__514\ : CascadeMux
    port map (
            O => \N__3074\,
            I => \N__3063\
        );

    \I__513\ : CascadeMux
    port map (
            O => \N__3073\,
            I => \N__3058\
        );

    \I__512\ : CascadeMux
    port map (
            O => \N__3072\,
            I => \N__3055\
        );

    \I__511\ : CascadeMux
    port map (
            O => \N__3071\,
            I => \N__3052\
        );

    \I__510\ : CascadeMux
    port map (
            O => \N__3070\,
            I => \N__3042\
        );

    \I__509\ : CascadeMux
    port map (
            O => \N__3069\,
            I => \N__3039\
        );

    \I__508\ : InMux
    port map (
            O => \N__3066\,
            I => \N__3033\
        );

    \I__507\ : InMux
    port map (
            O => \N__3063\,
            I => \N__3033\
        );

    \I__506\ : CascadeMux
    port map (
            O => \N__3062\,
            I => \N__3030\
        );

    \I__505\ : CascadeMux
    port map (
            O => \N__3061\,
            I => \N__3027\
        );

    \I__504\ : InMux
    port map (
            O => \N__3058\,
            I => \N__3010\
        );

    \I__503\ : InMux
    port map (
            O => \N__3055\,
            I => \N__3010\
        );

    \I__502\ : InMux
    port map (
            O => \N__3052\,
            I => \N__3010\
        );

    \I__501\ : InMux
    port map (
            O => \N__3051\,
            I => \N__3010\
        );

    \I__500\ : InMux
    port map (
            O => \N__3050\,
            I => \N__3010\
        );

    \I__499\ : InMux
    port map (
            O => \N__3049\,
            I => \N__3010\
        );

    \I__498\ : InMux
    port map (
            O => \N__3048\,
            I => \N__3010\
        );

    \I__497\ : InMux
    port map (
            O => \N__3047\,
            I => \N__3003\
        );

    \I__496\ : InMux
    port map (
            O => \N__3046\,
            I => \N__3003\
        );

    \I__495\ : InMux
    port map (
            O => \N__3045\,
            I => \N__3003\
        );

    \I__494\ : InMux
    port map (
            O => \N__3042\,
            I => \N__2996\
        );

    \I__493\ : InMux
    port map (
            O => \N__3039\,
            I => \N__2996\
        );

    \I__492\ : InMux
    port map (
            O => \N__3038\,
            I => \N__2996\
        );

    \I__491\ : LocalMux
    port map (
            O => \N__3033\,
            I => \N__2993\
        );

    \I__490\ : InMux
    port map (
            O => \N__3030\,
            I => \N__2986\
        );

    \I__489\ : InMux
    port map (
            O => \N__3027\,
            I => \N__2986\
        );

    \I__488\ : InMux
    port map (
            O => \N__3026\,
            I => \N__2986\
        );

    \I__487\ : InMux
    port map (
            O => \N__3025\,
            I => \N__2983\
        );

    \I__486\ : LocalMux
    port map (
            O => \N__3010\,
            I => \N__2980\
        );

    \I__485\ : LocalMux
    port map (
            O => \N__3003\,
            I => \N__2975\
        );

    \I__484\ : LocalMux
    port map (
            O => \N__2996\,
            I => \N__2975\
        );

    \I__483\ : Span4Mux_v
    port map (
            O => \N__2993\,
            I => \N__2972\
        );

    \I__482\ : LocalMux
    port map (
            O => \N__2986\,
            I => \N__2965\
        );

    \I__481\ : LocalMux
    port map (
            O => \N__2983\,
            I => \N__2965\
        );

    \I__480\ : Span4Mux_h
    port map (
            O => \N__2980\,
            I => \N__2965\
        );

    \I__479\ : Span4Mux_h
    port map (
            O => \N__2975\,
            I => \N__2962\
        );

    \I__478\ : Odrv4
    port map (
            O => \N__2972\,
            I => init_pulses_6_sqmuxa_0
        );

    \I__477\ : Odrv4
    port map (
            O => \N__2965\,
            I => init_pulses_6_sqmuxa_0
        );

    \I__476\ : Odrv4
    port map (
            O => \N__2962\,
            I => init_pulses_6_sqmuxa_0
        );

    \I__475\ : InMux
    port map (
            O => \N__2955\,
            I => \N__2952\
        );

    \I__474\ : LocalMux
    port map (
            O => \N__2952\,
            I => \pulses2countZ0Z_6\
        );

    \I__473\ : InMux
    port map (
            O => \N__2949\,
            I => \N__2946\
        );

    \I__472\ : LocalMux
    port map (
            O => \N__2946\,
            I => \N__2943\
        );

    \I__471\ : Span4Mux_h
    port map (
            O => \N__2943\,
            I => \N__2939\
        );

    \I__470\ : InMux
    port map (
            O => \N__2942\,
            I => \N__2936\
        );

    \I__469\ : Odrv4
    port map (
            O => \N__2939\,
            I => \init_pulsesZ0Z_7\
        );

    \I__468\ : LocalMux
    port map (
            O => \N__2936\,
            I => \init_pulsesZ0Z_7\
        );

    \I__467\ : CascadeMux
    port map (
            O => \N__2931\,
            I => \N__2928\
        );

    \I__466\ : InMux
    port map (
            O => \N__2928\,
            I => \N__2925\
        );

    \I__465\ : LocalMux
    port map (
            O => \N__2925\,
            I => \pulses2countZ0Z_7\
        );

    \I__464\ : InMux
    port map (
            O => \N__2922\,
            I => \N__2919\
        );

    \I__463\ : LocalMux
    port map (
            O => \N__2919\,
            I => \pulses2countZ0Z_14\
        );

    \I__462\ : CascadeMux
    port map (
            O => \N__2916\,
            I => \N__2913\
        );

    \I__461\ : InMux
    port map (
            O => \N__2913\,
            I => \N__2910\
        );

    \I__460\ : LocalMux
    port map (
            O => \N__2910\,
            I => \pulses2countZ0Z_15\
        );

    \I__459\ : IoInMux
    port map (
            O => \N__2907\,
            I => \N__2904\
        );

    \I__458\ : LocalMux
    port map (
            O => \N__2904\,
            I => \N__2901\
        );

    \I__457\ : Span4Mux_s0_v
    port map (
            O => \N__2901\,
            I => \N__2897\
        );

    \I__456\ : CascadeMux
    port map (
            O => \N__2900\,
            I => \N__2894\
        );

    \I__455\ : Span4Mux_v
    port map (
            O => \N__2897\,
            I => \N__2891\
        );

    \I__454\ : InMux
    port map (
            O => \N__2894\,
            I => \N__2888\
        );

    \I__453\ : Odrv4
    port map (
            O => \N__2891\,
            I => ppm_output_c
        );

    \I__452\ : LocalMux
    port map (
            O => \N__2888\,
            I => ppm_output_c
        );

    \I__451\ : InMux
    port map (
            O => \N__2883\,
            I => \N__2880\
        );

    \I__450\ : LocalMux
    port map (
            O => \N__2880\,
            I => un15_0_iv_1_12
        );

    \I__449\ : CascadeMux
    port map (
            O => \N__2877\,
            I => \init_pulses_2_sqmuxa_0_cascade_\
        );

    \I__448\ : InMux
    port map (
            O => \N__2874\,
            I => \N__2868\
        );

    \I__447\ : InMux
    port map (
            O => \N__2873\,
            I => \N__2868\
        );

    \I__446\ : LocalMux
    port map (
            O => \N__2868\,
            I => \N__2865\
        );

    \I__445\ : Span4Mux_v
    port map (
            O => \N__2865\,
            I => \N__2861\
        );

    \I__444\ : InMux
    port map (
            O => \N__2864\,
            I => \N__2858\
        );

    \I__443\ : Odrv4
    port map (
            O => \N__2861\,
            I => \N_51\
        );

    \I__442\ : LocalMux
    port map (
            O => \N__2858\,
            I => \N_51\
        );

    \I__441\ : CascadeMux
    port map (
            O => \N__2853\,
            I => \un15_0_12_cascade_\
        );

    \I__440\ : CascadeMux
    port map (
            O => \N__2850\,
            I => \N__2844\
        );

    \I__439\ : CascadeMux
    port map (
            O => \N__2849\,
            I => \N__2841\
        );

    \I__438\ : CascadeMux
    port map (
            O => \N__2848\,
            I => \N__2838\
        );

    \I__437\ : CascadeMux
    port map (
            O => \N__2847\,
            I => \N__2835\
        );

    \I__436\ : InMux
    port map (
            O => \N__2844\,
            I => \N__2830\
        );

    \I__435\ : InMux
    port map (
            O => \N__2841\,
            I => \N__2830\
        );

    \I__434\ : InMux
    port map (
            O => \N__2838\,
            I => \N__2825\
        );

    \I__433\ : InMux
    port map (
            O => \N__2835\,
            I => \N__2825\
        );

    \I__432\ : LocalMux
    port map (
            O => \N__2830\,
            I => \N_323_i\
        );

    \I__431\ : LocalMux
    port map (
            O => \N__2825\,
            I => \N_323_i\
        );

    \I__430\ : InMux
    port map (
            O => \N__2820\,
            I => \N__2816\
        );

    \I__429\ : InMux
    port map (
            O => \N__2819\,
            I => \N__2813\
        );

    \I__428\ : LocalMux
    port map (
            O => \N__2816\,
            I => \init_pulsesZ0Z_15\
        );

    \I__427\ : LocalMux
    port map (
            O => \N__2813\,
            I => \init_pulsesZ0Z_15\
        );

    \I__426\ : InMux
    port map (
            O => \N__2808\,
            I => \N__2804\
        );

    \I__425\ : InMux
    port map (
            O => \N__2807\,
            I => \N__2801\
        );

    \I__424\ : LocalMux
    port map (
            O => \N__2804\,
            I => \N__2798\
        );

    \I__423\ : LocalMux
    port map (
            O => \N__2801\,
            I => \init_pulsesZ0Z_10\
        );

    \I__422\ : Odrv4
    port map (
            O => \N__2798\,
            I => \init_pulsesZ0Z_10\
        );

    \I__421\ : CascadeMux
    port map (
            O => \N__2793\,
            I => \N__2789\
        );

    \I__420\ : InMux
    port map (
            O => \N__2792\,
            I => \N__2786\
        );

    \I__419\ : InMux
    port map (
            O => \N__2789\,
            I => \N__2783\
        );

    \I__418\ : LocalMux
    port map (
            O => \N__2786\,
            I => \N__2778\
        );

    \I__417\ : LocalMux
    port map (
            O => \N__2783\,
            I => \N__2778\
        );

    \I__416\ : Odrv4
    port map (
            O => \N__2778\,
            I => \init_pulsesZ0Z_0\
        );

    \I__415\ : InMux
    port map (
            O => \N__2775\,
            I => \N__2771\
        );

    \I__414\ : InMux
    port map (
            O => \N__2774\,
            I => \N__2768\
        );

    \I__413\ : LocalMux
    port map (
            O => \N__2771\,
            I => \init_pulsesZ0Z_17\
        );

    \I__412\ : LocalMux
    port map (
            O => \N__2768\,
            I => \init_pulsesZ0Z_17\
        );

    \I__411\ : InMux
    port map (
            O => \N__2763\,
            I => \N__2760\
        );

    \I__410\ : LocalMux
    port map (
            O => \N__2760\,
            I => \N__2756\
        );

    \I__409\ : InMux
    port map (
            O => \N__2759\,
            I => \N__2753\
        );

    \I__408\ : Odrv4
    port map (
            O => \N__2756\,
            I => \init_pulsesZ0Z_13\
        );

    \I__407\ : LocalMux
    port map (
            O => \N__2753\,
            I => \init_pulsesZ0Z_13\
        );

    \I__406\ : InMux
    port map (
            O => \N__2748\,
            I => \N__2744\
        );

    \I__405\ : CascadeMux
    port map (
            O => \N__2747\,
            I => \N__2741\
        );

    \I__404\ : LocalMux
    port map (
            O => \N__2744\,
            I => \N__2738\
        );

    \I__403\ : InMux
    port map (
            O => \N__2741\,
            I => \N__2735\
        );

    \I__402\ : Odrv4
    port map (
            O => \N__2738\,
            I => \init_pulsesZ0Z_6\
        );

    \I__401\ : LocalMux
    port map (
            O => \N__2735\,
            I => \init_pulsesZ0Z_6\
        );

    \I__400\ : InMux
    port map (
            O => \N__2730\,
            I => \N__2727\
        );

    \I__399\ : LocalMux
    port map (
            O => \N__2727\,
            I => \N__2723\
        );

    \I__398\ : InMux
    port map (
            O => \N__2726\,
            I => \N__2720\
        );

    \I__397\ : Odrv4
    port map (
            O => \N__2723\,
            I => \init_pulsesZ0Z_11\
        );

    \I__396\ : LocalMux
    port map (
            O => \N__2720\,
            I => \init_pulsesZ0Z_11\
        );

    \I__395\ : InMux
    port map (
            O => \N__2715\,
            I => \N__2694\
        );

    \I__394\ : InMux
    port map (
            O => \N__2714\,
            I => \N__2685\
        );

    \I__393\ : InMux
    port map (
            O => \N__2713\,
            I => \N__2685\
        );

    \I__392\ : InMux
    port map (
            O => \N__2712\,
            I => \N__2685\
        );

    \I__391\ : InMux
    port map (
            O => \N__2711\,
            I => \N__2685\
        );

    \I__390\ : InMux
    port map (
            O => \N__2710\,
            I => \N__2680\
        );

    \I__389\ : InMux
    port map (
            O => \N__2709\,
            I => \N__2680\
        );

    \I__388\ : InMux
    port map (
            O => \N__2708\,
            I => \N__2677\
        );

    \I__387\ : InMux
    port map (
            O => \N__2707\,
            I => \N__2670\
        );

    \I__386\ : InMux
    port map (
            O => \N__2706\,
            I => \N__2670\
        );

    \I__385\ : InMux
    port map (
            O => \N__2705\,
            I => \N__2670\
        );

    \I__384\ : InMux
    port map (
            O => \N__2704\,
            I => \N__2659\
        );

    \I__383\ : InMux
    port map (
            O => \N__2703\,
            I => \N__2659\
        );

    \I__382\ : InMux
    port map (
            O => \N__2702\,
            I => \N__2659\
        );

    \I__381\ : InMux
    port map (
            O => \N__2701\,
            I => \N__2659\
        );

    \I__380\ : InMux
    port map (
            O => \N__2700\,
            I => \N__2659\
        );

    \I__379\ : InMux
    port map (
            O => \N__2699\,
            I => \N__2652\
        );

    \I__378\ : InMux
    port map (
            O => \N__2698\,
            I => \N__2652\
        );

    \I__377\ : InMux
    port map (
            O => \N__2697\,
            I => \N__2652\
        );

    \I__376\ : LocalMux
    port map (
            O => \N__2694\,
            I => \N__2645\
        );

    \I__375\ : LocalMux
    port map (
            O => \N__2685\,
            I => \N__2645\
        );

    \I__374\ : LocalMux
    port map (
            O => \N__2680\,
            I => \N__2645\
        );

    \I__373\ : LocalMux
    port map (
            O => \N__2677\,
            I => \N_153_1\
        );

    \I__372\ : LocalMux
    port map (
            O => \N__2670\,
            I => \N_153_1\
        );

    \I__371\ : LocalMux
    port map (
            O => \N__2659\,
            I => \N_153_1\
        );

    \I__370\ : LocalMux
    port map (
            O => \N__2652\,
            I => \N_153_1\
        );

    \I__369\ : Odrv4
    port map (
            O => \N__2645\,
            I => \N_153_1\
        );

    \I__368\ : CascadeMux
    port map (
            O => \N__2634\,
            I => \N__2631\
        );

    \I__367\ : InMux
    port map (
            O => \N__2631\,
            I => \N__2628\
        );

    \I__366\ : LocalMux
    port map (
            O => \N__2628\,
            I => \N__2625\
        );

    \I__365\ : Odrv4
    port map (
            O => \N__2625\,
            I => pulses2count_8_0_iv_0_1_10_0
        );

    \I__364\ : InMux
    port map (
            O => \N__2622\,
            I => \N__2616\
        );

    \I__363\ : InMux
    port map (
            O => \N__2621\,
            I => \N__2616\
        );

    \I__362\ : LocalMux
    port map (
            O => \N__2616\,
            I => \N_44\
        );

    \I__361\ : InMux
    port map (
            O => \N__2613\,
            I => \N__2610\
        );

    \I__360\ : LocalMux
    port map (
            O => \N__2610\,
            I => \N__2607\
        );

    \I__359\ : Span4Mux_v
    port map (
            O => \N__2607\,
            I => \N__2603\
        );

    \I__358\ : InMux
    port map (
            O => \N__2606\,
            I => \N__2600\
        );

    \I__357\ : Odrv4
    port map (
            O => \N__2603\,
            I => \init_pulsesZ0Z_14\
        );

    \I__356\ : LocalMux
    port map (
            O => \N__2600\,
            I => \init_pulsesZ0Z_14\
        );

    \I__355\ : InMux
    port map (
            O => \N__2595\,
            I => \N__2592\
        );

    \I__354\ : LocalMux
    port map (
            O => \N__2592\,
            I => \init_pulses_RNO_0Z0Z_14\
        );

    \I__353\ : InMux
    port map (
            O => \N__2589\,
            I => un1_init_pulses_cry_13
        );

    \I__352\ : InMux
    port map (
            O => \N__2586\,
            I => \N__2583\
        );

    \I__351\ : LocalMux
    port map (
            O => \N__2583\,
            I => \init_pulses_RNO_0Z0Z_15\
        );

    \I__350\ : InMux
    port map (
            O => \N__2580\,
            I => un1_init_pulses_cry_14
        );

    \I__349\ : InMux
    port map (
            O => \N__2577\,
            I => \bfn_10_23_0_\
        );

    \I__348\ : InMux
    port map (
            O => \N__2574\,
            I => un1_init_pulses_cry_16
        );

    \I__347\ : InMux
    port map (
            O => \N__2571\,
            I => un1_init_pulses_cry_17
        );

    \I__346\ : CascadeMux
    port map (
            O => \N__2568\,
            I => \init_pulses_RNO_0Z0Z_18_cascade_\
        );

    \I__345\ : InMux
    port map (
            O => \N__2565\,
            I => \N__2562\
        );

    \I__344\ : LocalMux
    port map (
            O => \N__2562\,
            I => \init_pulses_RNO_0Z0Z_10\
        );

    \I__343\ : InMux
    port map (
            O => \N__2559\,
            I => \N__2556\
        );

    \I__342\ : LocalMux
    port map (
            O => \N__2556\,
            I => \init_pulses_RNO_0Z0Z_16\
        );

    \I__341\ : CascadeMux
    port map (
            O => \N__2553\,
            I => \N__2542\
        );

    \I__340\ : CascadeMux
    port map (
            O => \N__2552\,
            I => \N__2537\
        );

    \I__339\ : CascadeMux
    port map (
            O => \N__2551\,
            I => \N__2533\
        );

    \I__338\ : CascadeMux
    port map (
            O => \N__2550\,
            I => \N__2530\
        );

    \I__337\ : CascadeMux
    port map (
            O => \N__2549\,
            I => \N__2523\
        );

    \I__336\ : CascadeMux
    port map (
            O => \N__2548\,
            I => \N__2520\
        );

    \I__335\ : CascadeMux
    port map (
            O => \N__2547\,
            I => \N__2516\
        );

    \I__334\ : InMux
    port map (
            O => \N__2546\,
            I => \N__2506\
        );

    \I__333\ : InMux
    port map (
            O => \N__2545\,
            I => \N__2506\
        );

    \I__332\ : InMux
    port map (
            O => \N__2542\,
            I => \N__2506\
        );

    \I__331\ : InMux
    port map (
            O => \N__2541\,
            I => \N__2506\
        );

    \I__330\ : InMux
    port map (
            O => \N__2540\,
            I => \N__2491\
        );

    \I__329\ : InMux
    port map (
            O => \N__2537\,
            I => \N__2491\
        );

    \I__328\ : InMux
    port map (
            O => \N__2536\,
            I => \N__2491\
        );

    \I__327\ : InMux
    port map (
            O => \N__2533\,
            I => \N__2491\
        );

    \I__326\ : InMux
    port map (
            O => \N__2530\,
            I => \N__2491\
        );

    \I__325\ : InMux
    port map (
            O => \N__2529\,
            I => \N__2491\
        );

    \I__324\ : InMux
    port map (
            O => \N__2528\,
            I => \N__2491\
        );

    \I__323\ : InMux
    port map (
            O => \N__2527\,
            I => \N__2486\
        );

    \I__322\ : InMux
    port map (
            O => \N__2526\,
            I => \N__2486\
        );

    \I__321\ : InMux
    port map (
            O => \N__2523\,
            I => \N__2475\
        );

    \I__320\ : InMux
    port map (
            O => \N__2520\,
            I => \N__2475\
        );

    \I__319\ : InMux
    port map (
            O => \N__2519\,
            I => \N__2475\
        );

    \I__318\ : InMux
    port map (
            O => \N__2516\,
            I => \N__2475\
        );

    \I__317\ : InMux
    port map (
            O => \N__2515\,
            I => \N__2475\
        );

    \I__316\ : LocalMux
    port map (
            O => \N__2506\,
            I => init_pulses_0_sqmuxa
        );

    \I__315\ : LocalMux
    port map (
            O => \N__2491\,
            I => init_pulses_0_sqmuxa
        );

    \I__314\ : LocalMux
    port map (
            O => \N__2486\,
            I => init_pulses_0_sqmuxa
        );

    \I__313\ : LocalMux
    port map (
            O => \N__2475\,
            I => init_pulses_0_sqmuxa
        );

    \I__312\ : InMux
    port map (
            O => \N__2466\,
            I => \N__2463\
        );

    \I__311\ : LocalMux
    port map (
            O => \N__2463\,
            I => \init_pulses_RNO_0Z0Z_17\
        );

    \I__310\ : InMux
    port map (
            O => \N__2460\,
            I => \N__2457\
        );

    \I__309\ : LocalMux
    port map (
            O => \N__2457\,
            I => \init_pulses_RNO_0Z0Z_5\
        );

    \I__308\ : InMux
    port map (
            O => \N__2454\,
            I => un1_init_pulses_cry_4
        );

    \I__307\ : InMux
    port map (
            O => \N__2451\,
            I => \N__2448\
        );

    \I__306\ : LocalMux
    port map (
            O => \N__2448\,
            I => \init_pulses_RNO_0Z0Z_6\
        );

    \I__305\ : InMux
    port map (
            O => \N__2445\,
            I => un1_init_pulses_cry_5
        );

    \I__304\ : InMux
    port map (
            O => \N__2442\,
            I => \N__2439\
        );

    \I__303\ : LocalMux
    port map (
            O => \N__2439\,
            I => \init_pulses_RNO_0Z0Z_7\
        );

    \I__302\ : InMux
    port map (
            O => \N__2436\,
            I => un1_init_pulses_cry_6
        );

    \I__301\ : InMux
    port map (
            O => \N__2433\,
            I => \N__2430\
        );

    \I__300\ : LocalMux
    port map (
            O => \N__2430\,
            I => \init_pulses_RNO_0Z0Z_8\
        );

    \I__299\ : InMux
    port map (
            O => \N__2427\,
            I => \bfn_10_22_0_\
        );

    \I__298\ : InMux
    port map (
            O => \N__2424\,
            I => \N__2421\
        );

    \I__297\ : LocalMux
    port map (
            O => \N__2421\,
            I => \init_pulses_RNO_0Z0Z_9\
        );

    \I__296\ : InMux
    port map (
            O => \N__2418\,
            I => un1_init_pulses_cry_8
        );

    \I__295\ : InMux
    port map (
            O => \N__2415\,
            I => un1_init_pulses_cry_9
        );

    \I__294\ : InMux
    port map (
            O => \N__2412\,
            I => \N__2409\
        );

    \I__293\ : LocalMux
    port map (
            O => \N__2409\,
            I => \init_pulses_RNO_0Z0Z_11\
        );

    \I__292\ : InMux
    port map (
            O => \N__2406\,
            I => un1_init_pulses_cry_10
        );

    \I__291\ : InMux
    port map (
            O => \N__2403\,
            I => \N__2400\
        );

    \I__290\ : LocalMux
    port map (
            O => \N__2400\,
            I => \init_pulses_RNO_0Z0Z_12\
        );

    \I__289\ : InMux
    port map (
            O => \N__2397\,
            I => un1_init_pulses_cry_11
        );

    \I__288\ : InMux
    port map (
            O => \N__2394\,
            I => \N__2391\
        );

    \I__287\ : LocalMux
    port map (
            O => \N__2391\,
            I => \init_pulses_RNO_0Z0Z_13\
        );

    \I__286\ : InMux
    port map (
            O => \N__2388\,
            I => un1_init_pulses_cry_12
        );

    \I__285\ : InMux
    port map (
            O => \N__2385\,
            I => count_1_cry_12
        );

    \I__284\ : InMux
    port map (
            O => \N__2382\,
            I => \N__2377\
        );

    \I__283\ : InMux
    port map (
            O => \N__2381\,
            I => \N__2372\
        );

    \I__282\ : InMux
    port map (
            O => \N__2380\,
            I => \N__2372\
        );

    \I__281\ : LocalMux
    port map (
            O => \N__2377\,
            I => \countZ0Z_13\
        );

    \I__280\ : LocalMux
    port map (
            O => \N__2372\,
            I => \countZ0Z_13\
        );

    \I__279\ : SRMux
    port map (
            O => \N__2367\,
            I => \N__2362\
        );

    \I__278\ : SRMux
    port map (
            O => \N__2366\,
            I => \N__2359\
        );

    \I__277\ : SRMux
    port map (
            O => \N__2365\,
            I => \N__2356\
        );

    \I__276\ : LocalMux
    port map (
            O => \N__2362\,
            I => count6lto13_iso
        );

    \I__275\ : LocalMux
    port map (
            O => \N__2359\,
            I => count6lto13_iso
        );

    \I__274\ : LocalMux
    port map (
            O => \N__2356\,
            I => count6lto13_iso
        );

    \I__273\ : InMux
    port map (
            O => \N__2349\,
            I => \N__2346\
        );

    \I__272\ : LocalMux
    port map (
            O => \N__2346\,
            I => un1_init_pulses_axb_0
        );

    \I__271\ : InMux
    port map (
            O => \N__2343\,
            I => \N__2340\
        );

    \I__270\ : LocalMux
    port map (
            O => \N__2340\,
            I => \init_pulses_RNO_0Z0Z_1\
        );

    \I__269\ : InMux
    port map (
            O => \N__2337\,
            I => un1_init_pulses_cry_0
        );

    \I__268\ : InMux
    port map (
            O => \N__2334\,
            I => \N__2331\
        );

    \I__267\ : LocalMux
    port map (
            O => \N__2331\,
            I => \init_pulses_RNO_0Z0Z_2\
        );

    \I__266\ : InMux
    port map (
            O => \N__2328\,
            I => un1_init_pulses_cry_1
        );

    \I__265\ : InMux
    port map (
            O => \N__2325\,
            I => \N__2322\
        );

    \I__264\ : LocalMux
    port map (
            O => \N__2322\,
            I => \init_pulses_RNO_0Z0Z_3\
        );

    \I__263\ : InMux
    port map (
            O => \N__2319\,
            I => un1_init_pulses_cry_2
        );

    \I__262\ : InMux
    port map (
            O => \N__2316\,
            I => \N__2313\
        );

    \I__261\ : LocalMux
    port map (
            O => \N__2313\,
            I => \init_pulses_RNO_0Z0Z_4\
        );

    \I__260\ : InMux
    port map (
            O => \N__2310\,
            I => un1_init_pulses_cry_3
        );

    \I__259\ : InMux
    port map (
            O => \N__2307\,
            I => \N__2304\
        );

    \I__258\ : LocalMux
    port map (
            O => \N__2304\,
            I => \countZ0Z_4\
        );

    \I__257\ : InMux
    port map (
            O => \N__2301\,
            I => count_1_cry_3
        );

    \I__256\ : InMux
    port map (
            O => \N__2298\,
            I => \N__2294\
        );

    \I__255\ : InMux
    port map (
            O => \N__2297\,
            I => \N__2291\
        );

    \I__254\ : LocalMux
    port map (
            O => \N__2294\,
            I => \countZ0Z_5\
        );

    \I__253\ : LocalMux
    port map (
            O => \N__2291\,
            I => \countZ0Z_5\
        );

    \I__252\ : InMux
    port map (
            O => \N__2286\,
            I => count_1_cry_4
        );

    \I__251\ : InMux
    port map (
            O => \N__2283\,
            I => \N__2279\
        );

    \I__250\ : InMux
    port map (
            O => \N__2282\,
            I => \N__2276\
        );

    \I__249\ : LocalMux
    port map (
            O => \N__2279\,
            I => \countZ0Z_6\
        );

    \I__248\ : LocalMux
    port map (
            O => \N__2276\,
            I => \countZ0Z_6\
        );

    \I__247\ : InMux
    port map (
            O => \N__2271\,
            I => count_1_cry_5
        );

    \I__246\ : InMux
    port map (
            O => \N__2268\,
            I => \N__2264\
        );

    \I__245\ : InMux
    port map (
            O => \N__2267\,
            I => \N__2261\
        );

    \I__244\ : LocalMux
    port map (
            O => \N__2264\,
            I => \countZ0Z_7\
        );

    \I__243\ : LocalMux
    port map (
            O => \N__2261\,
            I => \countZ0Z_7\
        );

    \I__242\ : InMux
    port map (
            O => \N__2256\,
            I => count_1_cry_6
        );

    \I__241\ : CascadeMux
    port map (
            O => \N__2253\,
            I => \N__2249\
        );

    \I__240\ : InMux
    port map (
            O => \N__2252\,
            I => \N__2246\
        );

    \I__239\ : InMux
    port map (
            O => \N__2249\,
            I => \N__2243\
        );

    \I__238\ : LocalMux
    port map (
            O => \N__2246\,
            I => \countZ0Z_8\
        );

    \I__237\ : LocalMux
    port map (
            O => \N__2243\,
            I => \countZ0Z_8\
        );

    \I__236\ : InMux
    port map (
            O => \N__2238\,
            I => count_1_cry_7
        );

    \I__235\ : InMux
    port map (
            O => \N__2235\,
            I => \N__2231\
        );

    \I__234\ : InMux
    port map (
            O => \N__2234\,
            I => \N__2228\
        );

    \I__233\ : LocalMux
    port map (
            O => \N__2231\,
            I => \countZ0Z_9\
        );

    \I__232\ : LocalMux
    port map (
            O => \N__2228\,
            I => \countZ0Z_9\
        );

    \I__231\ : InMux
    port map (
            O => \N__2223\,
            I => \bfn_9_26_0_\
        );

    \I__230\ : InMux
    port map (
            O => \N__2220\,
            I => \N__2216\
        );

    \I__229\ : InMux
    port map (
            O => \N__2219\,
            I => \N__2213\
        );

    \I__228\ : LocalMux
    port map (
            O => \N__2216\,
            I => \countZ0Z_10\
        );

    \I__227\ : LocalMux
    port map (
            O => \N__2213\,
            I => \countZ0Z_10\
        );

    \I__226\ : InMux
    port map (
            O => \N__2208\,
            I => count_1_cry_9
        );

    \I__225\ : InMux
    port map (
            O => \N__2205\,
            I => \N__2201\
        );

    \I__224\ : InMux
    port map (
            O => \N__2204\,
            I => \N__2198\
        );

    \I__223\ : LocalMux
    port map (
            O => \N__2201\,
            I => \countZ0Z_11\
        );

    \I__222\ : LocalMux
    port map (
            O => \N__2198\,
            I => \countZ0Z_11\
        );

    \I__221\ : InMux
    port map (
            O => \N__2193\,
            I => count_1_cry_10
        );

    \I__220\ : InMux
    port map (
            O => \N__2190\,
            I => \N__2185\
        );

    \I__219\ : InMux
    port map (
            O => \N__2189\,
            I => \N__2180\
        );

    \I__218\ : InMux
    port map (
            O => \N__2188\,
            I => \N__2180\
        );

    \I__217\ : LocalMux
    port map (
            O => \N__2185\,
            I => \countZ0Z_12\
        );

    \I__216\ : LocalMux
    port map (
            O => \N__2180\,
            I => \countZ0Z_12\
        );

    \I__215\ : InMux
    port map (
            O => \N__2175\,
            I => count_1_cry_11
        );

    \I__214\ : CascadeMux
    port map (
            O => \N__2172\,
            I => \init_pulses39_0_cascade_\
        );

    \I__213\ : CascadeMux
    port map (
            O => \N__2169\,
            I => \init_pulses_0_sqmuxa_cascade_\
        );

    \I__212\ : InMux
    port map (
            O => \N__2166\,
            I => \N__2162\
        );

    \I__211\ : InMux
    port map (
            O => \N__2165\,
            I => \N__2159\
        );

    \I__210\ : LocalMux
    port map (
            O => \N__2162\,
            I => \countZ0Z_1\
        );

    \I__209\ : LocalMux
    port map (
            O => \N__2159\,
            I => \countZ0Z_1\
        );

    \I__208\ : CascadeMux
    port map (
            O => \N__2154\,
            I => \N__2149\
        );

    \I__207\ : InMux
    port map (
            O => \N__2153\,
            I => \N__2144\
        );

    \I__206\ : InMux
    port map (
            O => \N__2152\,
            I => \N__2144\
        );

    \I__205\ : InMux
    port map (
            O => \N__2149\,
            I => \N__2141\
        );

    \I__204\ : LocalMux
    port map (
            O => \N__2144\,
            I => \countZ0Z_0\
        );

    \I__203\ : LocalMux
    port map (
            O => \N__2141\,
            I => \countZ0Z_0\
        );

    \I__202\ : InMux
    port map (
            O => \N__2136\,
            I => \N__2133\
        );

    \I__201\ : LocalMux
    port map (
            O => \N__2133\,
            I => \countZ0Z_2\
        );

    \I__200\ : InMux
    port map (
            O => \N__2130\,
            I => count_1_cry_1
        );

    \I__199\ : InMux
    port map (
            O => \N__2127\,
            I => \N__2124\
        );

    \I__198\ : LocalMux
    port map (
            O => \N__2124\,
            I => \countZ0Z_3\
        );

    \I__197\ : InMux
    port map (
            O => \N__2121\,
            I => count_1_cry_2
        );

    \I__196\ : CascadeMux
    port map (
            O => \N__2118\,
            I => \N_153_1_cascade_\
        );

    \I__195\ : CascadeMux
    port map (
            O => \N__2115\,
            I => \count6lto11_1_cascade_\
        );

    \I__194\ : InMux
    port map (
            O => \N__2112\,
            I => \N__2109\
        );

    \I__193\ : LocalMux
    port map (
            O => \N__2109\,
            I => count6lt11
        );

    \I__192\ : CascadeMux
    port map (
            O => \N__2106\,
            I => \count6lt11_cascade_\
        );

    \I__191\ : InMux
    port map (
            O => \N__2103\,
            I => \N__2100\
        );

    \I__190\ : LocalMux
    port map (
            O => \N__2100\,
            I => count6lto11_1
        );

    \I__189\ : CascadeMux
    port map (
            O => \N__2097\,
            I => \count6_0_cascade_\
        );

    \I__188\ : IoInMux
    port map (
            O => \N__2094\,
            I => \N__2091\
        );

    \I__187\ : LocalMux
    port map (
            O => \N__2091\,
            I => \N__2088\
        );

    \I__186\ : Span4Mux_s1_v
    port map (
            O => \N__2088\,
            I => \N__2085\
        );

    \I__185\ : Sp12to4
    port map (
            O => \N__2085\,
            I => \N__2082\
        );

    \I__184\ : Span12Mux_h
    port map (
            O => \N__2082\,
            I => \N__2079\
        );

    \I__183\ : Span12Mux_v
    port map (
            O => \N__2079\,
            I => \N__2076\
        );

    \I__182\ : Span12Mux_v
    port map (
            O => \N__2076\,
            I => \N__2072\
        );

    \I__181\ : InMux
    port map (
            O => \N__2075\,
            I => \N__2069\
        );

    \I__180\ : Odrv12
    port map (
            O => \N__2072\,
            I => test_led_c
        );

    \I__179\ : LocalMux
    port map (
            O => \N__2069\,
            I => test_led_c
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
            carryinitin => counter11_0_data_tmp_7,
            carryinitout => \bfn_11_25_0_\
        );

    \IN_MUX_bfv_9_25_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "00"
        )
    port map (
            carryinitin => '0',
            carryinitout => \bfn_9_25_0_\
        );

    \IN_MUX_bfv_9_26_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => count_1_cry_8,
            carryinitout => \bfn_9_26_0_\
        );

    \IN_MUX_bfv_10_21_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "00"
        )
    port map (
            carryinitin => '0',
            carryinitout => \bfn_10_21_0_\
        );

    \IN_MUX_bfv_10_22_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => un1_init_pulses_cry_7,
            carryinitout => \bfn_10_22_0_\
        );

    \IN_MUX_bfv_10_23_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => un1_init_pulses_cry_15,
            carryinitout => \bfn_10_23_0_\
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
            carryinitin => un1_counter_13_cry_7,
            carryinitout => \bfn_11_27_0_\
        );

    \IN_MUX_bfv_11_28_0_\ : ICE_CARRY_IN_MUX
    generic map (
            C_INIT => "10"
        )
    port map (
            carryinitin => un1_counter_13_cry_15,
            carryinitout => \bfn_11_28_0_\
        );

    \VCC\ : VCC
    port map (
            Y => \VCCG0\
        );

    \PPM_STATE_RNI981B2_0_0\ : ICE_GB
    port map (
            USERSIGNALTOGLOBALBUFFER => \N__3864\,
            GLOBALBUFFEROUTPUT => \N_30_i_g\
        );

    \counter11_0_I_57_c_RNIUTDL5_0\ : ICE_GB
    port map (
            USERSIGNALTOGLOBALBUFFER => \N__4308\,
            GLOBALBUFFEROUTPUT => \un1_PPM_STATE_0_sqmuxa_0_i_g\
        );

    \GND\ : GND
    port map (
            Y => \GNDG0\
        );

    \GND_Inst\ : GND
    port map (
            Y => \_gnd_net_\
        );

    \count_0_LC_8_25_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000011111111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__2152\,
            lcout => \countZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4754\,
            ce => 'H',
            sr => \N__2365\
        );

    \count_1_LC_8_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1010010101011010"
        )
    port map (
            in0 => \N__2153\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__2166\,
            lcout => \countZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4754\,
            ce => 'H',
            sr => \N__2365\
        );

    \count_RNIVO3Q_9_LC_8_26_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000100000000000"
        )
    port map (
            in0 => \N__2204\,
            in1 => \N__2219\,
            in2 => \_gnd_net_\,
            in3 => \N__2234\,
            lcout => count6lto11_1,
            ltout => \count6lto11_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \count_RNI67NP1_13_LC_8_26_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000100010101000"
        )
    port map (
            in0 => \N__2381\,
            in1 => \N__2189\,
            in2 => \N__2115\,
            in3 => \N__2112\,
            lcout => count6lto13_iso,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \count_RNIU4A7_5_LC_8_26_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000011100001111"
        )
    port map (
            in0 => \N__2267\,
            in1 => \N__2282\,
            in2 => \N__2253\,
            in3 => \N__2297\,
            lcout => count6lt11,
            ltout => \count6lt11_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \test_led_RNO_0_LC_8_26_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000101010001000"
        )
    port map (
            in0 => \N__2380\,
            in1 => \N__2188\,
            in2 => \N__2106\,
            in3 => \N__2103\,
            lcout => OPEN,
            ltout => \count6_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \test_ledZ0_LC_8_26_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111111110000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__2097\,
            in3 => \N__2075\,
            lcout => test_led_c,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4750\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_1_LC_9_20_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3621\,
            in2 => \_gnd_net_\,
            in3 => \N__3435\,
            lcout => \CHOOSE_CHANNELZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4761\,
            ce => \N__4677\,
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_0_LC_9_20_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000001110111"
        )
    port map (
            in0 => \N__3519\,
            in1 => \N__3695\,
            in2 => \_gnd_net_\,
            in3 => \N__3434\,
            lcout => \CHOOSE_CHANNELZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4761\,
            ce => \N__4677\,
            sr => \_gnd_net_\
        );

    \init_pulses_4_LC_9_21_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000011100000000"
        )
    port map (
            in0 => \N__2706\,
            in1 => \N__3050\,
            in2 => \N__2551\,
            in3 => \N__2316\,
            lcout => \init_pulsesZ0Z_4\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_5_LC_9_21_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001001100000000"
        )
    port map (
            in0 => \N__2698\,
            in1 => \N__2536\,
            in2 => \N__3072\,
            in3 => \N__2460\,
            lcout => \init_pulsesZ0Z_5\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_RNI31VH_1_LC_9_21_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3587\,
            in2 => \_gnd_net_\,
            in3 => \N__3433\,
            lcout => \N_153_1\,
            ltout => \N_153_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_1_LC_9_21_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000001001100"
        )
    port map (
            in0 => \N__3048\,
            in1 => \N__2343\,
            in2 => \N__2118\,
            in3 => \N__2528\,
            lcout => \init_pulsesZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_3_LC_9_21_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111100001000"
        )
    port map (
            in0 => \N__2705\,
            in1 => \N__3049\,
            in2 => \N__2550\,
            in3 => \N__2325\,
            lcout => \init_pulsesZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_7_LC_9_21_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001100100000"
        )
    port map (
            in0 => \N__2699\,
            in1 => \N__2540\,
            in2 => \N__3073\,
            in3 => \N__2442\,
            lcout => \init_pulsesZ0Z_7\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_6_LC_9_21_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000011100000000"
        )
    port map (
            in0 => \N__2707\,
            in1 => \N__3051\,
            in2 => \N__2552\,
            in3 => \N__2451\,
            lcout => \init_pulsesZ0Z_6\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_2_LC_9_21_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001001100000000"
        )
    port map (
            in0 => \N__2697\,
            in1 => \N__2529\,
            in2 => \N__3071\,
            in3 => \N__2334\,
            lcout => \init_pulsesZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4760\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_12_LC_9_22_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111100001000"
        )
    port map (
            in0 => \N__3045\,
            in1 => \N__2702\,
            in2 => \N__2547\,
            in3 => \N__2403\,
            lcout => \init_pulsesZ0Z_12\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4758\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_13_LC_9_22_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001100100000"
        )
    port map (
            in0 => \N__2701\,
            in1 => \N__2519\,
            in2 => \N__3070\,
            in3 => \N__2394\,
            lcout => \init_pulsesZ0Z_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4758\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_14_LC_9_22_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111100001000"
        )
    port map (
            in0 => \N__3046\,
            in1 => \N__2703\,
            in2 => \N__2548\,
            in3 => \N__2595\,
            lcout => \init_pulsesZ0Z_14\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4758\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_11_LC_9_22_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001001100000000"
        )
    port map (
            in0 => \N__2700\,
            in1 => \N__2515\,
            in2 => \N__3069\,
            in3 => \N__2412\,
            lcout => \init_pulsesZ0Z_11\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4758\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_8_LC_9_22_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000011100000000"
        )
    port map (
            in0 => \N__3047\,
            in1 => \N__2704\,
            in2 => \N__2549\,
            in3 => \N__2433\,
            lcout => \init_pulsesZ0Z_8\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4758\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_RNIA6U31_1_3_LC_9_22_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000100000000"
        )
    port map (
            in0 => \N__3610\,
            in1 => \N__3696\,
            in2 => \N__3551\,
            in3 => \N__3449\,
            lcout => init_pulses39_0,
            ltout => \init_pulses39_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_57_c_RNIRTLL1_LC_9_22_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000011000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4379\,
            in2 => \N__2172\,
            in3 => \N__4350\,
            lcout => init_pulses_0_sqmuxa,
            ltout => \init_pulses_0_sqmuxa_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_0_LC_9_22_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000010000001100"
        )
    port map (
            in0 => \N__3038\,
            in1 => \N__2349\,
            in2 => \N__2169\,
            in3 => \N__2708\,
            lcout => \init_pulsesZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4758\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_15_LC_9_23_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001100100000"
        )
    port map (
            in0 => \N__2709\,
            in1 => \N__2526\,
            in2 => \N__3074\,
            in3 => \N__2586\,
            lcout => \init_pulsesZ0Z_15\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4756\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_9_LC_9_23_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001001100000000"
        )
    port map (
            in0 => \N__2710\,
            in1 => \N__2527\,
            in2 => \N__3075\,
            in3 => \N__2424\,
            lcout => \init_pulsesZ0Z_9\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4756\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_RNIA6U31_0_3_LC_9_23_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000100000100"
        )
    port map (
            in0 => \N__3450\,
            in1 => \N__3714\,
            in2 => \N__3545\,
            in3 => \N__3611\,
            lcout => \N_44\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \count_1_cry_1_c_LC_9_25_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2165\,
            in2 => \N__2154\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \bfn_9_25_0_\,
            carryout => count_1_cry_1,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \count_2_LC_9_25_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2136\,
            in2 => \_gnd_net_\,
            in3 => \N__2130\,
            lcout => \countZ0Z_2\,
            ltout => OPEN,
            carryin => count_1_cry_1,
            carryout => count_1_cry_2,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_3_LC_9_25_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2127\,
            in2 => \_gnd_net_\,
            in3 => \N__2121\,
            lcout => \countZ0Z_3\,
            ltout => OPEN,
            carryin => count_1_cry_2,
            carryout => count_1_cry_3,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_4_LC_9_25_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2307\,
            in2 => \_gnd_net_\,
            in3 => \N__2301\,
            lcout => \countZ0Z_4\,
            ltout => OPEN,
            carryin => count_1_cry_3,
            carryout => count_1_cry_4,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_5_LC_9_25_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2298\,
            in2 => \_gnd_net_\,
            in3 => \N__2286\,
            lcout => \countZ0Z_5\,
            ltout => OPEN,
            carryin => count_1_cry_4,
            carryout => count_1_cry_5,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_6_LC_9_25_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2283\,
            in2 => \_gnd_net_\,
            in3 => \N__2271\,
            lcout => \countZ0Z_6\,
            ltout => OPEN,
            carryin => count_1_cry_5,
            carryout => count_1_cry_6,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_7_LC_9_25_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2268\,
            in2 => \_gnd_net_\,
            in3 => \N__2256\,
            lcout => \countZ0Z_7\,
            ltout => OPEN,
            carryin => count_1_cry_6,
            carryout => count_1_cry_7,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_8_LC_9_25_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2252\,
            in2 => \_gnd_net_\,
            in3 => \N__2238\,
            lcout => \countZ0Z_8\,
            ltout => OPEN,
            carryin => count_1_cry_7,
            carryout => count_1_cry_8,
            clk => \N__4751\,
            ce => 'H',
            sr => \N__2367\
        );

    \count_9_LC_9_26_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2235\,
            in2 => \_gnd_net_\,
            in3 => \N__2223\,
            lcout => \countZ0Z_9\,
            ltout => OPEN,
            carryin => \bfn_9_26_0_\,
            carryout => count_1_cry_9,
            clk => \N__4746\,
            ce => 'H',
            sr => \N__2366\
        );

    \count_10_LC_9_26_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2220\,
            in2 => \_gnd_net_\,
            in3 => \N__2208\,
            lcout => \countZ0Z_10\,
            ltout => OPEN,
            carryin => count_1_cry_9,
            carryout => count_1_cry_10,
            clk => \N__4746\,
            ce => 'H',
            sr => \N__2366\
        );

    \count_11_LC_9_26_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2205\,
            in2 => \_gnd_net_\,
            in3 => \N__2193\,
            lcout => \countZ0Z_11\,
            ltout => OPEN,
            carryin => count_1_cry_10,
            carryout => count_1_cry_11,
            clk => \N__4746\,
            ce => 'H',
            sr => \N__2366\
        );

    \count_12_LC_9_26_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2190\,
            in2 => \_gnd_net_\,
            in3 => \N__2175\,
            lcout => \countZ0Z_12\,
            ltout => OPEN,
            carryin => count_1_cry_11,
            carryout => count_1_cry_12,
            clk => \N__4746\,
            ce => 'H',
            sr => \N__2366\
        );

    \count_13_LC_9_26_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2382\,
            in2 => \_gnd_net_\,
            in3 => \N__2385\,
            lcout => \countZ0Z_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4746\,
            ce => 'H',
            sr => \N__2366\
        );

    \CHOOSE_CHANNEL_2_LC_10_20_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0100011000001010"
        )
    port map (
            in0 => \N__3712\,
            in1 => \N__3622\,
            in2 => \N__3541\,
            in3 => \N__3436\,
            lcout => \CHOOSE_CHANNELZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4759\,
            ce => \N__4676\,
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_3_LC_10_20_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011001110000000"
        )
    port map (
            in0 => \N__3437\,
            in1 => \N__3713\,
            in2 => \N__3634\,
            in3 => \N__3523\,
            lcout => \CHOOSE_CHANNELZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4759\,
            ce => \N__4676\,
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_0_LC_10_21_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0011110000111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3101\,
            in2 => \N__2793\,
            in3 => \_gnd_net_\,
            lcout => un1_init_pulses_axb_0,
            ltout => OPEN,
            carryin => \bfn_10_21_0_\,
            carryout => un1_init_pulses_cry_0,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_1_LC_10_21_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4046\,
            in2 => \N__2847\,
            in3 => \N__2337\,
            lcout => \init_pulses_RNO_0Z0Z_1\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_0,
            carryout => un1_init_pulses_cry_1,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_2_LC_10_21_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3923\,
            in2 => \N__3123\,
            in3 => \N__2328\,
            lcout => \init_pulses_RNO_0Z0Z_2\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_1,
            carryout => un1_init_pulses_cry_2,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_3_LC_10_21_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4067\,
            in2 => \N__2848\,
            in3 => \N__2319\,
            lcout => \init_pulses_RNO_0Z0Z_3\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_2,
            carryout => un1_init_pulses_cry_3,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_4_LC_10_21_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4868\,
            in2 => \_gnd_net_\,
            in3 => \N__2310\,
            lcout => \init_pulses_RNO_0Z0Z_4\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_3,
            carryout => un1_init_pulses_cry_4,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_5_LC_10_21_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3881\,
            in2 => \_gnd_net_\,
            in3 => \N__2454\,
            lcout => \init_pulses_RNO_0Z0Z_5\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_4,
            carryout => un1_init_pulses_cry_5,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_6_LC_10_21_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3102\,
            in2 => \N__2747\,
            in3 => \N__2445\,
            lcout => \init_pulses_RNO_0Z0Z_6\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_5,
            carryout => un1_init_pulses_cry_6,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_7_LC_10_21_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2942\,
            in2 => \_gnd_net_\,
            in3 => \N__2436\,
            lcout => \init_pulses_RNO_0Z0Z_7\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_6,
            carryout => un1_init_pulses_cry_7,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_8_LC_10_22_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4973\,
            in2 => \_gnd_net_\,
            in3 => \N__2427\,
            lcout => \init_pulses_RNO_0Z0Z_8\,
            ltout => OPEN,
            carryin => \bfn_10_22_0_\,
            carryout => un1_init_pulses_cry_8,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_9_LC_10_22_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4949\,
            in2 => \_gnd_net_\,
            in3 => \N__2418\,
            lcout => \init_pulses_RNO_0Z0Z_9\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_8,
            carryout => un1_init_pulses_cry_9,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_10_LC_10_22_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2808\,
            in2 => \_gnd_net_\,
            in3 => \N__2415\,
            lcout => \init_pulses_RNO_0Z0Z_10\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_9,
            carryout => un1_init_pulses_cry_10,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_11_LC_10_22_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2726\,
            in2 => \_gnd_net_\,
            in3 => \N__2406\,
            lcout => \init_pulses_RNO_0Z0Z_11\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_10,
            carryout => un1_init_pulses_cry_11,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_12_LC_10_22_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4022\,
            in2 => \N__2849\,
            in3 => \N__2397\,
            lcout => \init_pulses_RNO_0Z0Z_12\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_11,
            carryout => un1_init_pulses_cry_12,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_13_LC_10_22_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2759\,
            in2 => \N__3087\,
            in3 => \N__2388\,
            lcout => \init_pulses_RNO_0Z0Z_13\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_12,
            carryout => un1_init_pulses_cry_13,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_14_LC_10_22_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1100001100111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2606\,
            in2 => \N__2850\,
            in3 => \N__2589\,
            lcout => \init_pulses_RNO_0Z0Z_14\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_13,
            carryout => un1_init_pulses_cry_14,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_15_LC_10_22_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2819\,
            in2 => \_gnd_net_\,
            in3 => \N__2580\,
            lcout => \init_pulses_RNO_0Z0Z_15\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_14,
            carryout => un1_init_pulses_cry_15,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_16_LC_10_23_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3995\,
            in2 => \_gnd_net_\,
            in3 => \N__2577\,
            lcout => \init_pulses_RNO_0Z0Z_16\,
            ltout => OPEN,
            carryin => \bfn_10_23_0_\,
            carryout => un1_init_pulses_cry_16,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_17_LC_10_23_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2774\,
            in2 => \_gnd_net_\,
            in3 => \N__2574\,
            lcout => \init_pulses_RNO_0Z0Z_17\,
            ltout => OPEN,
            carryin => un1_init_pulses_cry_16,
            carryout => un1_init_pulses_cry_17,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_RNO_0_18_LC_10_23_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0101010110101010"
        )
    port map (
            in0 => \N__4925\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__2571\,
            lcout => OPEN,
            ltout => \init_pulses_RNO_0Z0Z_18_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_18_LC_10_23_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001000001010000"
        )
    port map (
            in0 => \N__2546\,
            in1 => \N__3026\,
            in2 => \N__2568\,
            in3 => \N__2714\,
            lcout => \init_pulsesZ0Z_18\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4752\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_10_LC_10_23_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0001001100000000"
        )
    port map (
            in0 => \N__2711\,
            in1 => \N__2541\,
            in2 => \N__3061\,
            in3 => \N__2565\,
            lcout => \init_pulsesZ0Z_10\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4752\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_16_LC_10_23_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111100001000"
        )
    port map (
            in0 => \N__3025\,
            in1 => \N__2713\,
            in2 => \N__2553\,
            in3 => \N__2559\,
            lcout => \init_pulsesZ0Z_16\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4752\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \init_pulses_17_LC_10_23_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001100100000"
        )
    port map (
            in0 => \N__2712\,
            in1 => \N__2545\,
            in2 => \N__3062\,
            in3 => \N__2466\,
            lcout => \init_pulsesZ0Z_17\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4752\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \pulses2count_RNO_0_11_LC_10_23_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000011100001111"
        )
    port map (
            in0 => \N__3704\,
            in1 => \N__3631\,
            in2 => \N__3546\,
            in3 => \N__3451\,
            lcout => pulses2count_8_0_iv_0_1_10_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \pulses2count_15_LC_10_24_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100010001000"
        )
    port map (
            in0 => \N__4855\,
            in1 => \N__2820\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \pulses2countZ0Z_15\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_10_LC_10_24_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4851\,
            in2 => \_gnd_net_\,
            in3 => \N__2807\,
            lcout => \pulses2countZ0Z_10\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_0_LC_10_24_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1101110111011101"
        )
    port map (
            in0 => \N__4854\,
            in1 => \N__2792\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \pulses2countZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_17_LC_10_24_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4852\,
            in2 => \_gnd_net_\,
            in3 => \N__2775\,
            lcout => \pulses2countZ0Z_17\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_13_LC_10_24_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0100010001010101"
        )
    port map (
            in0 => \N__2621\,
            in1 => \N__2763\,
            in2 => \_gnd_net_\,
            in3 => \N__2874\,
            lcout => \pulses2countZ0Z_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_6_LC_10_24_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110011111111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2748\,
            in2 => \_gnd_net_\,
            in3 => \N__4853\,
            lcout => \pulses2countZ0Z_6\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_11_LC_10_24_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000111110001111"
        )
    port map (
            in0 => \N__2730\,
            in1 => \N__2715\,
            in2 => \N__2634\,
            in3 => \N__3715\,
            lcout => \pulses2countZ0Z_11\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \pulses2count_14_LC_10_24_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1110111011001100"
        )
    port map (
            in0 => \N__2873\,
            in1 => \N__2622\,
            in2 => \_gnd_net_\,
            in3 => \N__2613\,
            lcout => \pulses2countZ0Z_14\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4748\,
            ce => \N__4681\,
            sr => \_gnd_net_\
        );

    \counter11_0_I_45_c_RNO_LC_10_25_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__2922\,
            in1 => \N__4218\,
            in2 => \N__2916\,
            in3 => \N__3320\,
            lcout => \counter11_0_I_45_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \ppm_output_reg_LC_10_26_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011110000011110"
        )
    port map (
            in0 => \N__4380\,
            in1 => \N__4405\,
            in2 => \N__2900\,
            in3 => \N__4344\,
            lcout => ppm_output_c,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4744\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_1_LC_11_20_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3455\,
            in2 => \_gnd_net_\,
            in3 => \N__3851\,
            lcout => \CHOOSE_CHANNEL_fastZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4757\,
            ce => \N__4675\,
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNICOMD1_2_LC_11_21_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000001101000111"
        )
    port map (
            in0 => \N__4537\,
            in1 => \N__3758\,
            in2 => \N__3797\,
            in3 => \N__4475\,
            lcout => un15_0_iv_1_12,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIEQVB1_0_LC_11_21_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3788\,
            in2 => \N__3852\,
            in3 => \N__3818\,
            lcout => \N_51\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNI8KMD1_0_LC_11_21_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000100000000"
        )
    port map (
            in0 => \N__3819\,
            in1 => \N__4476\,
            in2 => \N__4559\,
            in3 => \N__3848\,
            lcout => OPEN,
            ltout => \init_pulses_2_sqmuxa_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIIG2M4_2_LC_11_21_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011011110111111"
        )
    port map (
            in0 => \N__3759\,
            in1 => \N__2883\,
            in2 => \N__2877\,
            in3 => \N__2864\,
            lcout => un15_0_12,
            ltout => \un15_0_12_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIIG2M4_0_2_LC_11_21_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000111100001111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__2853\,
            in3 => \_gnd_net_\,
            lcout => \N_323_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIU3LQ1_0_LC_11_21_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1010000010000000"
        )
    port map (
            in0 => \N__3795\,
            in1 => \N__3820\,
            in2 => \N__3765\,
            in3 => \N__3850\,
            lcout => \N_43\,
            ltout => \N_43_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_RNI7CM54_0_LC_11_21_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000001"
        )
    port map (
            in0 => \N__4791\,
            in1 => \N__4541\,
            in2 => \N__3129\,
            in3 => \N__4477\,
            lcout => un15_0_i_0_0,
            ltout => \un15_0_i_0_0_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIPSOR8_0_2_LC_11_21_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__3126\,
            in3 => \N__3113\,
            lcout => \CHOOSE_CHANNEL_fast_RNIPSOR8_0Z0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIPSOR8_2_LC_11_22_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3114\,
            in2 => \_gnd_net_\,
            in3 => \N__3100\,
            lcout => \CHOOSE_CHANNEL_fast_RNIPSOR8Z0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_RNO_0_1_LC_11_22_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0101000001011010"
        )
    port map (
            in0 => \N__4480\,
            in1 => \_gnd_net_\,
            in2 => \N__4561\,
            in3 => \N__4349\,
            lcout => OPEN,
            ltout => \PPM_STATE_r_1_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_1_LC_11_22_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1011111110110000"
        )
    port map (
            in0 => \N__3633\,
            in1 => \N__4410\,
            in2 => \N__3078\,
            in3 => \N__4549\,
            lcout => \PPM_STATEZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4753\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_RNII9B21_3_LC_11_22_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000010000000000"
        )
    port map (
            in0 => \N__4479\,
            in1 => \N__3527\,
            in2 => \N__4560\,
            in3 => \N__3703\,
            lcout => init_pulses_6_sqmuxa_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_RNIB4CG_0_LC_11_22_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4542\,
            in2 => \_gnd_net_\,
            in3 => \N__4478\,
            lcout => \N_36_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_21_c_RNO_LC_11_23_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111101111011110"
        )
    port map (
            in0 => \N__4239\,
            in1 => \N__4299\,
            in2 => \N__2931\,
            in3 => \N__2955\,
            lcout => \counter11_0_I_21_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \pulses2count_7_LC_11_23_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__2949\,
            in2 => \_gnd_net_\,
            in3 => \N__4844\,
            lcout => \pulses2countZ0Z_7\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4749\,
            ce => \N__4679\,
            sr => \_gnd_net_\
        );

    \counter11_0_I_1_c_LC_11_24_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__3234\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \bfn_11_24_0_\,
            carryout => counter11_0_data_tmp_0,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_9_c_LC_11_24_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4110\,
            in2 => \N__3897\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_0,
            carryout => counter11_0_data_tmp_1,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_15_c_LC_11_24_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4100\,
            in2 => \N__4134\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_1,
            carryout => counter11_0_data_tmp_2,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_21_c_LC_11_24_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4105\,
            in2 => \N__3144\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_2,
            carryout => counter11_0_data_tmp_3,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_27_c_LC_11_24_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4992\,
            in2 => \N__4117\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_3,
            carryout => counter11_0_data_tmp_4,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_33_c_LC_11_24_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4109\,
            in2 => \N__3210\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_4,
            carryout => counter11_0_data_tmp_5,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_39_c_LC_11_24_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4101\,
            in2 => \N__3195\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_5,
            carryout => counter11_0_data_tmp_6,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_45_c_LC_11_24_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3135\,
            in2 => \N__4116\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_6,
            carryout => counter11_0_data_tmp_7,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_51_c_LC_11_25_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4118\,
            in2 => \N__3180\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => \bfn_11_25_0_\,
            carryout => counter11_0_data_tmp_8,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_57_c_LC_11_25_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4884\,
            in2 => \N__4122\,
            in3 => \_gnd_net_\,
            lcout => OPEN,
            ltout => OPEN,
            carryin => counter11_0_data_tmp_8,
            carryout => \counter11_0_N_2\,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_N_2_THRU_LUT4_0_LC_11_25_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111100000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__3246\,
            lcout => \counter11_0_N_2_THRU_CO\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_1_c_RNO_LC_11_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__4035\,
            in1 => \N__4276\,
            in2 => \N__3243\,
            in3 => \N__3292\,
            lcout => \counter11_0_I_1_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_33_c_RNO_LC_11_25_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__4260\,
            in1 => \N__4628\,
            in2 => \N__3225\,
            in3 => \N__3216\,
            lcout => \counter11_0_I_33_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_39_c_RNO_LC_11_25_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__5067\,
            in1 => \N__5088\,
            in2 => \N__4011\,
            in3 => \N__3201\,
            lcout => \counter11_0_I_39_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_51_c_RNO_LC_11_25_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111110110111110"
        )
    port map (
            in0 => \N__3344\,
            in1 => \N__4586\,
            in2 => \N__3984\,
            in3 => \N__3186\,
            lcout => \counter11_0_I_51_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_0_LC_11_26_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4278\,
            in2 => \N__3170\,
            in3 => \N__3171\,
            lcout => \counterZ0Z_0\,
            ltout => OPEN,
            carryin => \bfn_11_26_0_\,
            carryout => un1_counter_13_cry_0,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_1_LC_11_26_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3296\,
            in2 => \_gnd_net_\,
            in3 => \N__3147\,
            lcout => \counterZ0Z_1\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_0,
            carryout => un1_counter_13_cry_1,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_2_LC_11_26_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4605\,
            in2 => \_gnd_net_\,
            in3 => \N__3276\,
            lcout => \counterZ0Z_2\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_1,
            carryout => un1_counter_13_cry_2,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_3_LC_11_26_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4647\,
            in2 => \_gnd_net_\,
            in3 => \N__3273\,
            lcout => \counterZ0Z_3\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_2,
            carryout => un1_counter_13_cry_3,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_4_LC_11_26_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4151\,
            in2 => \_gnd_net_\,
            in3 => \N__3270\,
            lcout => \counterZ0Z_4\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_3,
            carryout => un1_counter_13_cry_4,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_5_LC_11_26_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4176\,
            in2 => \_gnd_net_\,
            in3 => \N__3267\,
            lcout => \counterZ0Z_5\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_4,
            carryout => un1_counter_13_cry_5,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_6_LC_11_26_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4298\,
            in2 => \_gnd_net_\,
            in3 => \N__3264\,
            lcout => \counterZ0Z_6\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_5,
            carryout => un1_counter_13_cry_6,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_7_LC_11_26_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4238\,
            in2 => \_gnd_net_\,
            in3 => \N__3261\,
            lcout => \counterZ0Z_7\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_6,
            carryout => un1_counter_13_cry_7,
            clk => \N__4742\,
            ce => 'H',
            sr => \N__3360\
        );

    \counter_8_LC_11_27_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5036\,
            in2 => \_gnd_net_\,
            in3 => \N__3258\,
            lcout => \counterZ0Z_8\,
            ltout => OPEN,
            carryin => \bfn_11_27_0_\,
            carryout => un1_counter_13_cry_8,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_9_LC_11_27_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5014\,
            in2 => \_gnd_net_\,
            in3 => \N__3255\,
            lcout => \counterZ0Z_9\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_8,
            carryout => un1_counter_13_cry_9,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_10_LC_11_27_2\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4627\,
            in2 => \_gnd_net_\,
            in3 => \N__3252\,
            lcout => \counterZ0Z_10\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_9,
            carryout => un1_counter_13_cry_10,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_11_LC_11_27_3\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4259\,
            in2 => \_gnd_net_\,
            in3 => \N__3249\,
            lcout => \counterZ0Z_11\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_10,
            carryout => un1_counter_13_cry_11,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_12_LC_11_27_4\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5087\,
            in2 => \_gnd_net_\,
            in3 => \N__3381\,
            lcout => \counterZ0Z_12\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_11,
            carryout => un1_counter_13_cry_12,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_13_LC_11_27_5\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5063\,
            in2 => \_gnd_net_\,
            in3 => \N__3378\,
            lcout => \counterZ0Z_13\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_12,
            carryout => un1_counter_13_cry_13,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_14_LC_11_27_6\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3319\,
            in2 => \_gnd_net_\,
            in3 => \N__3375\,
            lcout => \counterZ0Z_14\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_13,
            carryout => un1_counter_13_cry_14,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_15_LC_11_27_7\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4217\,
            in2 => \_gnd_net_\,
            in3 => \N__3372\,
            lcout => \counterZ0Z_15\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_14,
            carryout => un1_counter_13_cry_15,
            clk => \N__4740\,
            ce => 'H',
            sr => \N__3359\
        );

    \counter_16_LC_11_28_0\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4585\,
            in2 => \_gnd_net_\,
            in3 => \N__3369\,
            lcout => \counterZ0Z_16\,
            ltout => OPEN,
            carryin => \bfn_11_28_0_\,
            carryout => un1_counter_13_cry_16,
            clk => \N__4739\,
            ce => 'H',
            sr => \N__3358\
        );

    \counter_17_LC_11_28_1\ : LogicCell40
    generic map (
            C_ON => '1',
            SEQ_MODE => "1000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3343\,
            in2 => \_gnd_net_\,
            in3 => \N__3366\,
            lcout => \counterZ0Z_17\,
            ltout => OPEN,
            carryin => un1_counter_13_cry_16,
            carryout => un1_counter_13_cry_17,
            clk => \N__4739\,
            ce => 'H',
            sr => \N__3358\
        );

    \counter_18_LC_11_28_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4910\,
            in2 => \_gnd_net_\,
            in3 => \N__3363\,
            lcout => \counterZ0Z_18\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4739\,
            ce => 'H',
            sr => \N__3358\
        );

    \counter_RNI75D91_18_LC_11_30_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000100000000"
        )
    port map (
            in0 => \N__3345\,
            in1 => \N__3321\,
            in2 => \N__4914\,
            in3 => \N__3297\,
            lcout => \PPM_STATE_0_sqmuxa_1_14\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_0_LC_12_20_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000000001110111"
        )
    port map (
            in0 => \N__3537\,
            in1 => \N__3708\,
            in2 => \_gnd_net_\,
            in3 => \N__3822\,
            lcout => \CHOOSE_CHANNEL_fastZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4755\,
            ce => \N__4674\,
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_2_LC_12_20_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0000011110001000"
        )
    port map (
            in0 => \N__3635\,
            in1 => \N__3456\,
            in2 => \N__3550\,
            in3 => \N__3764\,
            lcout => \CHOOSE_CHANNEL_fastZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4755\,
            ce => \N__4674\,
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_3_LC_12_20_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000111110000000"
        )
    port map (
            in0 => \N__3457\,
            in1 => \N__3636\,
            in2 => \N__3717\,
            in3 => \N__3796\,
            lcout => \CHOOSE_CHANNEL_fastZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4755\,
            ce => \N__4674\,
            sr => \_gnd_net_\
        );

    \PPM_STATE_RNI981B2_0_LC_12_21_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000010001"
        )
    port map (
            in0 => \N__3870\,
            in1 => \N__4485\,
            in2 => \_gnd_net_\,
            in3 => \N__4555\,
            lcout => \N_30_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_RNO_0_0_LC_12_21_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000010100000101"
        )
    port map (
            in0 => \N__4486\,
            in1 => \_gnd_net_\,
            in2 => \N__4563\,
            in3 => \_gnd_net_\,
            lcout => \N_15_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_fast_RNIU3LQ1_0_0_LC_12_21_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000000001"
        )
    port map (
            in0 => \N__3849\,
            in1 => \N__3821\,
            in2 => \N__3798\,
            in3 => \N__3763\,
            lcout => pulses2count22_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_0_LC_12_22_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1001",
            LUT_INIT => "1000111110001000"
        )
    port map (
            in0 => \N__3462\,
            in1 => \N__4406\,
            in2 => \N__3726\,
            in3 => \N__4487\,
            lcout => \PPM_STATEZ0Z_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4747\,
            ce => 'H',
            sr => \N__3738\
        );

    \PPM_STATE_RNO_1_0_LC_12_23_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4348\,
            in2 => \_gnd_net_\,
            in3 => \N__4554\,
            lcout => \PPM_STATE_e_1_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CHOOSE_CHANNEL_RNIA6U31_3_LC_12_23_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1101100101110111"
        )
    port map (
            in0 => \N__3716\,
            in1 => \N__3632\,
            in2 => \N__3552\,
            in3 => \N__3461\,
            lcout => un1_init_pulses39_2_0_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \PPM_STATE_RNIB4CG_0_0_LC_12_23_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011001100000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4553\,
            in2 => \_gnd_net_\,
            in3 => \N__4484\,
            lcout => pulses2count39_0,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \CONSTANT_ONE_LUT4_LC_12_23_7\ : LogicCell40
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

    \pulses2count_3_LC_12_24_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011000000010000"
        )
    port map (
            in0 => \N__4841\,
            in1 => \N__3975\,
            in2 => \N__3954\,
            in3 => \N__4074\,
            lcout => \pulses2countZ0Z_3\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4743\,
            ce => \N__4678\,
            sr => \_gnd_net_\
        );

    \pulses2count_1_LC_12_24_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0100000001000100"
        )
    port map (
            in0 => \N__3973\,
            in1 => \N__3945\,
            in2 => \N__4056\,
            in3 => \N__4843\,
            lcout => \pulses2countZ0Z_1\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4743\,
            ce => \N__4678\,
            sr => \_gnd_net_\
        );

    \pulses2count_12_LC_12_24_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "0011000000010000"
        )
    port map (
            in0 => \N__4839\,
            in1 => \N__3972\,
            in2 => \N__3952\,
            in3 => \N__4029\,
            lcout => \pulses2countZ0Z_12\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4743\,
            ce => \N__4678\,
            sr => \_gnd_net_\
        );

    \pulses2count_16_LC_12_24_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4002\,
            in2 => \_gnd_net_\,
            in3 => \N__4842\,
            lcout => \pulses2countZ0Z_16\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4743\,
            ce => \N__4678\,
            sr => \_gnd_net_\
        );

    \pulses2count_2_LC_12_24_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1110111111001111"
        )
    port map (
            in0 => \N__4840\,
            in1 => \N__3974\,
            in2 => \N__3953\,
            in3 => \N__3930\,
            lcout => \pulses2countZ0Z_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4743\,
            ce => \N__4678\,
            sr => \_gnd_net_\
        );

    \counter11_0_I_9_c_RNO_LC_12_25_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0110111111110110"
        )
    port map (
            in0 => \N__4603\,
            in1 => \N__3912\,
            in2 => \N__3906\,
            in3 => \N__4645\,
            lcout => \counter11_0_I_9_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \pulses2count_5_LC_12_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__3888\,
            in2 => \_gnd_net_\,
            in3 => \N__4856\,
            lcout => \pulses2countZ0Z_5\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4741\,
            ce => \N__4680\,
            sr => \_gnd_net_\
        );

    \counter_RNIV1JM_2_LC_12_25_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000000000000000"
        )
    port map (
            in0 => \N__5016\,
            in1 => \N__4646\,
            in2 => \N__4632\,
            in3 => \N__4604\,
            lcout => \PPM_STATE_0_sqmuxa_1_13\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_RNI1JFM1_16_LC_12_25_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000010000000000"
        )
    port map (
            in0 => \N__4587\,
            in1 => \N__4562\,
            in2 => \N__4494\,
            in3 => \N__5043\,
            lcout => \PPM_STATE_0_sqmuxa_1_15\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_RNID6M35_2_LC_12_26_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1000000000000000"
        )
    port map (
            in0 => \N__4434\,
            in1 => \N__4422\,
            in2 => \N__4194\,
            in3 => \N__4416\,
            lcout => \PPM_STATE_0_sqmuxa_1\,
            ltout => \PPM_STATE_0_sqmuxa_1_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_57_c_RNIUTDL5_LC_12_26_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111000011111100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4372\,
            in2 => \N__4353\,
            in3 => \N__4334\,
            lcout => \un1_PPM_STATE_0_sqmuxa_0_i\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_RNI03JM_0_LC_12_26_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000100000000"
        )
    port map (
            in0 => \N__4297\,
            in1 => \N__4277\,
            in2 => \N__5037\,
            in3 => \N__4258\,
            lcout => OPEN,
            ltout => \PPM_STATE_0_sqmuxa_1_12_cascade_\,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_RNI6C6D1_7_LC_12_26_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0001000000000000"
        )
    port map (
            in0 => \N__4237\,
            in1 => \N__4216\,
            in2 => \N__4197\,
            in3 => \N__4182\,
            lcout => \PPM_STATE_0_sqmuxa_1_16\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_RNIP3J6_4_LC_12_26_4\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000001111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \N__4152\,
            in3 => \N__4175\,
            lcout => \PPM_STATE_0_sqmuxa_1_2\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_15_c_RNO_LC_12_26_5\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0111101111011110"
        )
    port map (
            in0 => \N__4174\,
            in1 => \N__4767\,
            in2 => \N__4161\,
            in3 => \N__4147\,
            lcout => \counter11_0_I_15_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter_RNINSCP_12_LC_12_26_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0000000000110011"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__5086\,
            in2 => \_gnd_net_\,
            in3 => \N__5062\,
            lcout => \PPM_STATE_0_sqmuxa_1_0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \counter11_0_I_27_c_RNO_LC_12_27_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0110111111110110"
        )
    port map (
            in0 => \N__5032\,
            in1 => \N__4962\,
            in2 => \N__5015\,
            in3 => \N__4938\,
            lcout => \counter11_0_I_27_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \pulses2count_8_LC_12_27_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4848\,
            in2 => \_gnd_net_\,
            in3 => \N__4983\,
            lcout => \pulses2countZ0Z_8\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4738\,
            ce => \N__4683\,
            sr => \_gnd_net_\
        );

    \pulses2count_9_LC_12_27_2\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100010001000"
        )
    port map (
            in0 => \N__4850\,
            in1 => \N__4956\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \pulses2countZ0Z_9\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4738\,
            ce => \N__4683\,
            sr => \_gnd_net_\
        );

    \pulses2count_18_LC_12_27_6\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1000100010001000"
        )
    port map (
            in0 => \N__4849\,
            in1 => \N__4932\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \pulses2countZ0Z_18\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4738\,
            ce => \N__4683\,
            sr => \_gnd_net_\
        );

    \counter11_0_I_57_c_RNO_LC_12_27_7\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "0011001111001100"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4906\,
            in2 => \_gnd_net_\,
            in3 => \N__4890\,
            lcout => \counter11_0_I_57_c_RNOZ0\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \pulses2count_4_LC_13_25_3\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "1000",
            LUT_INIT => "1100110000000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \N__4875\,
            in2 => \_gnd_net_\,
            in3 => \N__4857\,
            lcout => \pulses2countZ0Z_4\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \N__4745\,
            ce => \N__4682\,
            sr => \_gnd_net_\
        );
end \INTERFACE\;
