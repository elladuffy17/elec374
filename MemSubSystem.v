module Memory_Subsystem(
	input Clock, Clear, MARin, MDRin, W_sig, R_sig,
	input[31:0] BusMuxOut,
	inout[31:0] BusMuxInMDR); //not sure what to do for this pipeline --> does BusMuxIn-MDR & Address need to be diff sig and inout?

	wire[31:0] Data, MdataIn, MDMuxOut, MDROut;
	wire[8:0] Address;

	RAM RAM_MS(
		.address(Address),
		.clock(Clock),
		.data(Data),
		.wren(W_sig),
		.q(Data));
	
	mdr_unit MDR_MS(
		.q(MDROut),
		.busMuxOut(BusMuxOut), .mDataIn(BusMuxInMDR), 
		.clk(Clock), .clr(Clear), .MDRin(MDRin), .MDRread(R_sig));
  
	mar_unit MAR_MS(
		.Q(Address),
		.enable(MARin), .clk(clock), .clr(clear),
		.D(BusMuxOut));
 
endmodule