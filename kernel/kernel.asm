
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	8d013103          	ld	sp,-1840(sp) # 8000b8d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd57ff>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	5fc78793          	addi	a5,a5,1532 # 800017f6 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002aa:	000f47b7          	lui	a5,0xf4
    800002ae:	2407879b          	addiw	a5,a5,576
    800002b2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b6:	0200c7b7          	lui	a5,0x200c
    800002ba:	17e1                	addi	a5,a5,-8
    800002bc:	6398                	ld	a4,0(a5)
    800002be:	fe842783          	lw	a5,-24(s0)
    800002c2:	fec42683          	lw	a3,-20(s0)
    800002c6:	0036969b          	slliw	a3,a3,0x3
    800002ca:	2681                	sext.w	a3,a3
    800002cc:	8636                	mv	a2,a3
    800002ce:	020046b7          	lui	a3,0x2004
    800002d2:	96b2                	add	a3,a3,a2
    800002d4:	97ba                	add	a5,a5,a4
    800002d6:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d8:	fec42703          	lw	a4,-20(s0)
    800002dc:	87ba                	mv	a5,a4
    800002de:	078a                	slli	a5,a5,0x2
    800002e0:	97ba                	add	a5,a5,a4
    800002e2:	078e                	slli	a5,a5,0x3
    800002e4:	00014717          	auipc	a4,0x14
    800002e8:	d4c70713          	addi	a4,a4,-692 # 80014030 <timer_scratch>
    800002ec:	97ba                	add	a5,a5,a4
    800002ee:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f2:	fec42783          	lw	a5,-20(s0)
    800002f6:	0037979b          	slliw	a5,a5,0x3
    800002fa:	2781                	sext.w	a5,a5
    800002fc:	873e                	mv	a4,a5
    800002fe:	020047b7          	lui	a5,0x2004
    80000302:	973e                	add	a4,a4,a5
    80000304:	fe043783          	ld	a5,-32(s0)
    80000308:	07e1                	addi	a5,a5,24
    8000030a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030c:	fe043783          	ld	a5,-32(s0)
    80000310:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    80000314:	fe842703          	lw	a4,-24(s0)
    80000318:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000031a:	fe043783          	ld	a5,-32(s0)
    8000031e:	853e                	mv	a0,a5
    80000320:	00000097          	auipc	ra,0x0
    80000324:	e68080e7          	jalr	-408(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000328:	00009797          	auipc	a5,0x9
    8000032c:	83878793          	addi	a5,a5,-1992 # 80008b60 <timervec>
    80000330:	853e                	mv	a0,a5
    80000332:	00000097          	auipc	ra,0x0
    80000336:	dee080e7          	jalr	-530(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000033a:	00000097          	auipc	ra,0x0
    8000033e:	cfc080e7          	jalr	-772(ra) # 80000036 <r_mstatus>
    80000342:	87aa                	mv	a5,a0
    80000344:	0087e793          	ori	a5,a5,8
    80000348:	853e                	mv	a0,a5
    8000034a:	00000097          	auipc	ra,0x0
    8000034e:	d06080e7          	jalr	-762(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000352:	00000097          	auipc	ra,0x0
    80000356:	d66080e7          	jalr	-666(ra) # 800000b8 <r_mie>
    8000035a:	87aa                	mv	a5,a0
    8000035c:	0807e793          	ori	a5,a5,128
    80000360:	853e                	mv	a0,a5
    80000362:	00000097          	auipc	ra,0x0
    80000366:	d70080e7          	jalr	-656(ra) # 800000d2 <w_mie>
}
    8000036a:	0001                	nop
    8000036c:	60e2                	ld	ra,24(sp)
    8000036e:	6442                	ld	s0,16(sp)
    80000370:	6105                	addi	sp,sp,32
    80000372:	8082                	ret

0000000080000374 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000374:	1101                	addi	sp,sp,-32
    80000376:	ec06                	sd	ra,24(sp)
    80000378:	e822                	sd	s0,16(sp)
    8000037a:	1000                	addi	s0,sp,32
    8000037c:	87aa                	mv	a5,a0
    8000037e:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000382:	fec42783          	lw	a5,-20(s0)
    80000386:	0007871b          	sext.w	a4,a5
    8000038a:	10000793          	li	a5,256
    8000038e:	02f71363          	bne	a4,a5,800003b4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000392:	4521                	li	a0,8
    80000394:	00001097          	auipc	ra,0x1
    80000398:	aac080e7          	jalr	-1364(ra) # 80000e40 <uartputc_sync>
    8000039c:	02000513          	li	a0,32
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	aa0080e7          	jalr	-1376(ra) # 80000e40 <uartputc_sync>
    800003a8:	4521                	li	a0,8
    800003aa:	00001097          	auipc	ra,0x1
    800003ae:	a96080e7          	jalr	-1386(ra) # 80000e40 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b2:	a801                	j	800003c2 <consputc+0x4e>
    uartputc_sync(c);
    800003b4:	fec42783          	lw	a5,-20(s0)
    800003b8:	853e                	mv	a0,a5
    800003ba:	00001097          	auipc	ra,0x1
    800003be:	a86080e7          	jalr	-1402(ra) # 80000e40 <uartputc_sync>
}
    800003c2:	0001                	nop
    800003c4:	60e2                	ld	ra,24(sp)
    800003c6:	6442                	ld	s0,16(sp)
    800003c8:	6105                	addi	sp,sp,32
    800003ca:	8082                	ret

00000000800003cc <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003cc:	7179                	addi	sp,sp,-48
    800003ce:	f406                	sd	ra,40(sp)
    800003d0:	f022                	sd	s0,32(sp)
    800003d2:	1800                	addi	s0,sp,48
    800003d4:	87aa                	mv	a5,a0
    800003d6:	fcb43823          	sd	a1,-48(s0)
    800003da:	8732                	mv	a4,a2
    800003dc:	fcf42e23          	sw	a5,-36(s0)
    800003e0:	87ba                	mv	a5,a4
    800003e2:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e6:	fe042623          	sw	zero,-20(s0)
    800003ea:	a0a1                	j	80000432 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ec:	fec42703          	lw	a4,-20(s0)
    800003f0:	fd043783          	ld	a5,-48(s0)
    800003f4:	00f70633          	add	a2,a4,a5
    800003f8:	fdc42703          	lw	a4,-36(s0)
    800003fc:	feb40793          	addi	a5,s0,-21
    80000400:	4685                	li	a3,1
    80000402:	85ba                	mv	a1,a4
    80000404:	853e                	mv	a0,a5
    80000406:	00003097          	auipc	ra,0x3
    8000040a:	582080e7          	jalr	1410(ra) # 80003988 <either_copyin>
    8000040e:	87aa                	mv	a5,a0
    80000410:	873e                	mv	a4,a5
    80000412:	57fd                	li	a5,-1
    80000414:	02f70863          	beq	a4,a5,80000444 <consolewrite+0x78>
      break;
    uartputc(c);
    80000418:	feb44783          	lbu	a5,-21(s0)
    8000041c:	2781                	sext.w	a5,a5
    8000041e:	853e                	mv	a0,a5
    80000420:	00001097          	auipc	ra,0x1
    80000424:	960080e7          	jalr	-1696(ra) # 80000d80 <uartputc>
  for(i = 0; i < n; i++){
    80000428:	fec42783          	lw	a5,-20(s0)
    8000042c:	2785                	addiw	a5,a5,1
    8000042e:	fef42623          	sw	a5,-20(s0)
    80000432:	fec42703          	lw	a4,-20(s0)
    80000436:	fd842783          	lw	a5,-40(s0)
    8000043a:	2701                	sext.w	a4,a4
    8000043c:	2781                	sext.w	a5,a5
    8000043e:	faf747e3          	blt	a4,a5,800003ec <consolewrite+0x20>
    80000442:	a011                	j	80000446 <consolewrite+0x7a>
      break;
    80000444:	0001                	nop
  }

  return i;
    80000446:	fec42783          	lw	a5,-20(s0)
}
    8000044a:	853e                	mv	a0,a5
    8000044c:	70a2                	ld	ra,40(sp)
    8000044e:	7402                	ld	s0,32(sp)
    80000450:	6145                	addi	sp,sp,48
    80000452:	8082                	ret

0000000080000454 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000454:	7179                	addi	sp,sp,-48
    80000456:	f406                	sd	ra,40(sp)
    80000458:	f022                	sd	s0,32(sp)
    8000045a:	1800                	addi	s0,sp,48
    8000045c:	87aa                	mv	a5,a0
    8000045e:	fcb43823          	sd	a1,-48(s0)
    80000462:	8732                	mv	a4,a2
    80000464:	fcf42e23          	sw	a5,-36(s0)
    80000468:	87ba                	mv	a5,a4
    8000046a:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046e:	fd842783          	lw	a5,-40(s0)
    80000472:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000476:	00014517          	auipc	a0,0x14
    8000047a:	cfa50513          	addi	a0,a0,-774 # 80014170 <cons>
    8000047e:	00001097          	auipc	ra,0x1
    80000482:	df0080e7          	jalr	-528(ra) # 8000126e <acquire>
  while(n > 0){
    80000486:	a215                	j	800005aa <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    80000488:	00002097          	auipc	ra,0x2
    8000048c:	390080e7          	jalr	912(ra) # 80002818 <myproc>
    80000490:	87aa                	mv	a5,a0
    80000492:	579c                	lw	a5,40(a5)
    80000494:	cb99                	beqz	a5,800004aa <consoleread+0x56>
        release(&cons.lock);
    80000496:	00014517          	auipc	a0,0x14
    8000049a:	cda50513          	addi	a0,a0,-806 # 80014170 <cons>
    8000049e:	00001097          	auipc	ra,0x1
    800004a2:	e34080e7          	jalr	-460(ra) # 800012d2 <release>
        return -1;
    800004a6:	57fd                	li	a5,-1
    800004a8:	aa25                	j	800005e0 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    800004aa:	00014597          	auipc	a1,0x14
    800004ae:	cc658593          	addi	a1,a1,-826 # 80014170 <cons>
    800004b2:	00014517          	auipc	a0,0x14
    800004b6:	d5650513          	addi	a0,a0,-682 # 80014208 <cons+0x98>
    800004ba:	00003097          	auipc	ra,0x3
    800004be:	2a2080e7          	jalr	674(ra) # 8000375c <sleep>
    while(cons.r == cons.w){
    800004c2:	00014797          	auipc	a5,0x14
    800004c6:	cae78793          	addi	a5,a5,-850 # 80014170 <cons>
    800004ca:	0987a703          	lw	a4,152(a5)
    800004ce:	00014797          	auipc	a5,0x14
    800004d2:	ca278793          	addi	a5,a5,-862 # 80014170 <cons>
    800004d6:	09c7a783          	lw	a5,156(a5)
    800004da:	faf707e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004de:	00014797          	auipc	a5,0x14
    800004e2:	c9278793          	addi	a5,a5,-878 # 80014170 <cons>
    800004e6:	0987a783          	lw	a5,152(a5)
    800004ea:	2781                	sext.w	a5,a5
    800004ec:	0017871b          	addiw	a4,a5,1
    800004f0:	0007069b          	sext.w	a3,a4
    800004f4:	00014717          	auipc	a4,0x14
    800004f8:	c7c70713          	addi	a4,a4,-900 # 80014170 <cons>
    800004fc:	08d72c23          	sw	a3,152(a4)
    80000500:	07f7f793          	andi	a5,a5,127
    80000504:	2781                	sext.w	a5,a5
    80000506:	00014717          	auipc	a4,0x14
    8000050a:	c6a70713          	addi	a4,a4,-918 # 80014170 <cons>
    8000050e:	1782                	slli	a5,a5,0x20
    80000510:	9381                	srli	a5,a5,0x20
    80000512:	97ba                	add	a5,a5,a4
    80000514:	0187c783          	lbu	a5,24(a5)
    80000518:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    8000051c:	fe842783          	lw	a5,-24(s0)
    80000520:	0007871b          	sext.w	a4,a5
    80000524:	4791                	li	a5,4
    80000526:	02f71963          	bne	a4,a5,80000558 <consoleread+0x104>
      if(n < target){
    8000052a:	fd842703          	lw	a4,-40(s0)
    8000052e:	fec42783          	lw	a5,-20(s0)
    80000532:	2781                	sext.w	a5,a5
    80000534:	08f77163          	bgeu	a4,a5,800005b6 <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000538:	00014797          	auipc	a5,0x14
    8000053c:	c3878793          	addi	a5,a5,-968 # 80014170 <cons>
    80000540:	0987a783          	lw	a5,152(a5)
    80000544:	37fd                	addiw	a5,a5,-1
    80000546:	0007871b          	sext.w	a4,a5
    8000054a:	00014797          	auipc	a5,0x14
    8000054e:	c2678793          	addi	a5,a5,-986 # 80014170 <cons>
    80000552:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000556:	a085                	j	800005b6 <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000558:	fe842783          	lw	a5,-24(s0)
    8000055c:	0ff7f793          	andi	a5,a5,255
    80000560:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000564:	fe740713          	addi	a4,s0,-25
    80000568:	fdc42783          	lw	a5,-36(s0)
    8000056c:	4685                	li	a3,1
    8000056e:	863a                	mv	a2,a4
    80000570:	fd043583          	ld	a1,-48(s0)
    80000574:	853e                	mv	a0,a5
    80000576:	00003097          	auipc	ra,0x3
    8000057a:	39e080e7          	jalr	926(ra) # 80003914 <either_copyout>
    8000057e:	87aa                	mv	a5,a0
    80000580:	873e                	mv	a4,a5
    80000582:	57fd                	li	a5,-1
    80000584:	02f70b63          	beq	a4,a5,800005ba <consoleread+0x166>
      break;

    dst++;
    80000588:	fd043783          	ld	a5,-48(s0)
    8000058c:	0785                	addi	a5,a5,1
    8000058e:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000592:	fd842783          	lw	a5,-40(s0)
    80000596:	37fd                	addiw	a5,a5,-1
    80000598:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    8000059c:	fe842783          	lw	a5,-24(s0)
    800005a0:	0007871b          	sext.w	a4,a5
    800005a4:	47a9                	li	a5,10
    800005a6:	00f70c63          	beq	a4,a5,800005be <consoleread+0x16a>
  while(n > 0){
    800005aa:	fd842783          	lw	a5,-40(s0)
    800005ae:	2781                	sext.w	a5,a5
    800005b0:	f0f049e3          	bgtz	a5,800004c2 <consoleread+0x6e>
    800005b4:	a031                	j	800005c0 <consoleread+0x16c>
      break;
    800005b6:	0001                	nop
    800005b8:	a021                	j	800005c0 <consoleread+0x16c>
      break;
    800005ba:	0001                	nop
    800005bc:	a011                	j	800005c0 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005be:	0001                	nop
    }
  }
  release(&cons.lock);
    800005c0:	00014517          	auipc	a0,0x14
    800005c4:	bb050513          	addi	a0,a0,-1104 # 80014170 <cons>
    800005c8:	00001097          	auipc	ra,0x1
    800005cc:	d0a080e7          	jalr	-758(ra) # 800012d2 <release>

  return target - n;
    800005d0:	fd842783          	lw	a5,-40(s0)
    800005d4:	fec42703          	lw	a4,-20(s0)
    800005d8:	40f707bb          	subw	a5,a4,a5
    800005dc:	2781                	sext.w	a5,a5
    800005de:	2781                	sext.w	a5,a5
}
    800005e0:	853e                	mv	a0,a5
    800005e2:	70a2                	ld	ra,40(sp)
    800005e4:	7402                	ld	s0,32(sp)
    800005e6:	6145                	addi	sp,sp,48
    800005e8:	8082                	ret

00000000800005ea <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005ea:	1101                	addi	sp,sp,-32
    800005ec:	ec06                	sd	ra,24(sp)
    800005ee:	e822                	sd	s0,16(sp)
    800005f0:	1000                	addi	s0,sp,32
    800005f2:	87aa                	mv	a5,a0
    800005f4:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005f8:	00014517          	auipc	a0,0x14
    800005fc:	b7850513          	addi	a0,a0,-1160 # 80014170 <cons>
    80000600:	00001097          	auipc	ra,0x1
    80000604:	c6e080e7          	jalr	-914(ra) # 8000126e <acquire>

  switch(c){
    80000608:	fec42783          	lw	a5,-20(s0)
    8000060c:	0007871b          	sext.w	a4,a5
    80000610:	07f00793          	li	a5,127
    80000614:	0cf70763          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000618:	fec42783          	lw	a5,-20(s0)
    8000061c:	0007871b          	sext.w	a4,a5
    80000620:	07f00793          	li	a5,127
    80000624:	10e7c363          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000628:	fec42783          	lw	a5,-20(s0)
    8000062c:	0007871b          	sext.w	a4,a5
    80000630:	47d5                	li	a5,21
    80000632:	06f70163          	beq	a4,a5,80000694 <consoleintr+0xaa>
    80000636:	fec42783          	lw	a5,-20(s0)
    8000063a:	0007871b          	sext.w	a4,a5
    8000063e:	47d5                	li	a5,21
    80000640:	0ee7c563          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000644:	fec42783          	lw	a5,-20(s0)
    80000648:	0007871b          	sext.w	a4,a5
    8000064c:	47a1                	li	a5,8
    8000064e:	08f70a63          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000652:	fec42783          	lw	a5,-20(s0)
    80000656:	0007871b          	sext.w	a4,a5
    8000065a:	47c1                	li	a5,16
    8000065c:	0cf71763          	bne	a4,a5,8000072a <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000660:	00003097          	auipc	ra,0x3
    80000664:	39c080e7          	jalr	924(ra) # 800039fc <procdump>
    break;
    80000668:	aac1                	j	80000838 <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000066a:	00014797          	auipc	a5,0x14
    8000066e:	b0678793          	addi	a5,a5,-1274 # 80014170 <cons>
    80000672:	0a07a783          	lw	a5,160(a5)
    80000676:	37fd                	addiw	a5,a5,-1
    80000678:	0007871b          	sext.w	a4,a5
    8000067c:	00014797          	auipc	a5,0x14
    80000680:	af478793          	addi	a5,a5,-1292 # 80014170 <cons>
    80000684:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000688:	10000513          	li	a0,256
    8000068c:	00000097          	auipc	ra,0x0
    80000690:	ce8080e7          	jalr	-792(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    80000694:	00014797          	auipc	a5,0x14
    80000698:	adc78793          	addi	a5,a5,-1316 # 80014170 <cons>
    8000069c:	0a07a703          	lw	a4,160(a5)
    800006a0:	00014797          	auipc	a5,0x14
    800006a4:	ad078793          	addi	a5,a5,-1328 # 80014170 <cons>
    800006a8:	09c7a783          	lw	a5,156(a5)
    800006ac:	18f70163          	beq	a4,a5,8000082e <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    800006b0:	00014797          	auipc	a5,0x14
    800006b4:	ac078793          	addi	a5,a5,-1344 # 80014170 <cons>
    800006b8:	0a07a783          	lw	a5,160(a5)
    800006bc:	37fd                	addiw	a5,a5,-1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	07f7f793          	andi	a5,a5,127
    800006c4:	2781                	sext.w	a5,a5
    800006c6:	00014717          	auipc	a4,0x14
    800006ca:	aaa70713          	addi	a4,a4,-1366 # 80014170 <cons>
    800006ce:	1782                	slli	a5,a5,0x20
    800006d0:	9381                	srli	a5,a5,0x20
    800006d2:	97ba                	add	a5,a5,a4
    800006d4:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006d8:	873e                	mv	a4,a5
    800006da:	47a9                	li	a5,10
    800006dc:	f8f717e3          	bne	a4,a5,8000066a <consoleintr+0x80>
    }
    break;
    800006e0:	a2b9                	j	8000082e <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006e2:	00014797          	auipc	a5,0x14
    800006e6:	a8e78793          	addi	a5,a5,-1394 # 80014170 <cons>
    800006ea:	0a07a703          	lw	a4,160(a5)
    800006ee:	00014797          	auipc	a5,0x14
    800006f2:	a8278793          	addi	a5,a5,-1406 # 80014170 <cons>
    800006f6:	09c7a783          	lw	a5,156(a5)
    800006fa:	12f70c63          	beq	a4,a5,80000832 <consoleintr+0x248>
      cons.e--;
    800006fe:	00014797          	auipc	a5,0x14
    80000702:	a7278793          	addi	a5,a5,-1422 # 80014170 <cons>
    80000706:	0a07a783          	lw	a5,160(a5)
    8000070a:	37fd                	addiw	a5,a5,-1
    8000070c:	0007871b          	sext.w	a4,a5
    80000710:	00014797          	auipc	a5,0x14
    80000714:	a6078793          	addi	a5,a5,-1440 # 80014170 <cons>
    80000718:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000071c:	10000513          	li	a0,256
    80000720:	00000097          	auipc	ra,0x0
    80000724:	c54080e7          	jalr	-940(ra) # 80000374 <consputc>
    }
    break;
    80000728:	a229                	j	80000832 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8000072a:	fec42783          	lw	a5,-20(s0)
    8000072e:	2781                	sext.w	a5,a5
    80000730:	10078363          	beqz	a5,80000836 <consoleintr+0x24c>
    80000734:	00014797          	auipc	a5,0x14
    80000738:	a3c78793          	addi	a5,a5,-1476 # 80014170 <cons>
    8000073c:	0a07a703          	lw	a4,160(a5)
    80000740:	00014797          	auipc	a5,0x14
    80000744:	a3078793          	addi	a5,a5,-1488 # 80014170 <cons>
    80000748:	0987a783          	lw	a5,152(a5)
    8000074c:	40f707bb          	subw	a5,a4,a5
    80000750:	2781                	sext.w	a5,a5
    80000752:	873e                	mv	a4,a5
    80000754:	07f00793          	li	a5,127
    80000758:	0ce7ef63          	bltu	a5,a4,80000836 <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    8000075c:	fec42783          	lw	a5,-20(s0)
    80000760:	0007871b          	sext.w	a4,a5
    80000764:	47b5                	li	a5,13
    80000766:	00f70563          	beq	a4,a5,80000770 <consoleintr+0x186>
    8000076a:	fec42783          	lw	a5,-20(s0)
    8000076e:	a011                	j	80000772 <consoleintr+0x188>
    80000770:	47a9                	li	a5,10
    80000772:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000776:	fec42783          	lw	a5,-20(s0)
    8000077a:	853e                	mv	a0,a5
    8000077c:	00000097          	auipc	ra,0x0
    80000780:	bf8080e7          	jalr	-1032(ra) # 80000374 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000784:	00014797          	auipc	a5,0x14
    80000788:	9ec78793          	addi	a5,a5,-1556 # 80014170 <cons>
    8000078c:	0a07a783          	lw	a5,160(a5)
    80000790:	2781                	sext.w	a5,a5
    80000792:	0017871b          	addiw	a4,a5,1
    80000796:	0007069b          	sext.w	a3,a4
    8000079a:	00014717          	auipc	a4,0x14
    8000079e:	9d670713          	addi	a4,a4,-1578 # 80014170 <cons>
    800007a2:	0ad72023          	sw	a3,160(a4)
    800007a6:	07f7f793          	andi	a5,a5,127
    800007aa:	2781                	sext.w	a5,a5
    800007ac:	fec42703          	lw	a4,-20(s0)
    800007b0:	0ff77713          	andi	a4,a4,255
    800007b4:	00014697          	auipc	a3,0x14
    800007b8:	9bc68693          	addi	a3,a3,-1604 # 80014170 <cons>
    800007bc:	1782                	slli	a5,a5,0x20
    800007be:	9381                	srli	a5,a5,0x20
    800007c0:	97b6                	add	a5,a5,a3
    800007c2:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    800007c6:	fec42783          	lw	a5,-20(s0)
    800007ca:	0007871b          	sext.w	a4,a5
    800007ce:	47a9                	li	a5,10
    800007d0:	02f70a63          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007d4:	fec42783          	lw	a5,-20(s0)
    800007d8:	0007871b          	sext.w	a4,a5
    800007dc:	4791                	li	a5,4
    800007de:	02f70363          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007e2:	00014797          	auipc	a5,0x14
    800007e6:	98e78793          	addi	a5,a5,-1650 # 80014170 <cons>
    800007ea:	0a07a703          	lw	a4,160(a5)
    800007ee:	00014797          	auipc	a5,0x14
    800007f2:	98278793          	addi	a5,a5,-1662 # 80014170 <cons>
    800007f6:	0987a783          	lw	a5,152(a5)
    800007fa:	0807879b          	addiw	a5,a5,128
    800007fe:	2781                	sext.w	a5,a5
    80000800:	02f71b63          	bne	a4,a5,80000836 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000804:	00014797          	auipc	a5,0x14
    80000808:	96c78793          	addi	a5,a5,-1684 # 80014170 <cons>
    8000080c:	0a07a703          	lw	a4,160(a5)
    80000810:	00014797          	auipc	a5,0x14
    80000814:	96078793          	addi	a5,a5,-1696 # 80014170 <cons>
    80000818:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000081c:	00014517          	auipc	a0,0x14
    80000820:	9ec50513          	addi	a0,a0,-1556 # 80014208 <cons+0x98>
    80000824:	00003097          	auipc	ra,0x3
    80000828:	fb4080e7          	jalr	-76(ra) # 800037d8 <wakeup>
      }
    }
    break;
    8000082c:	a029                	j	80000836 <consoleintr+0x24c>
    break;
    8000082e:	0001                	nop
    80000830:	a021                	j	80000838 <consoleintr+0x24e>
    break;
    80000832:	0001                	nop
    80000834:	a011                	j	80000838 <consoleintr+0x24e>
    break;
    80000836:	0001                	nop
  }
  
  release(&cons.lock);
    80000838:	00014517          	auipc	a0,0x14
    8000083c:	93850513          	addi	a0,a0,-1736 # 80014170 <cons>
    80000840:	00001097          	auipc	ra,0x1
    80000844:	a92080e7          	jalr	-1390(ra) # 800012d2 <release>
}
    80000848:	0001                	nop
    8000084a:	60e2                	ld	ra,24(sp)
    8000084c:	6442                	ld	s0,16(sp)
    8000084e:	6105                	addi	sp,sp,32
    80000850:	8082                	ret

0000000080000852 <consoleinit>:

void
consoleinit(void)
{
    80000852:	1141                	addi	sp,sp,-16
    80000854:	e406                	sd	ra,8(sp)
    80000856:	e022                	sd	s0,0(sp)
    80000858:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000085a:	0000a597          	auipc	a1,0xa
    8000085e:	7a658593          	addi	a1,a1,1958 # 8000b000 <etext>
    80000862:	00014517          	auipc	a0,0x14
    80000866:	90e50513          	addi	a0,a0,-1778 # 80014170 <cons>
    8000086a:	00001097          	auipc	ra,0x1
    8000086e:	9d4080e7          	jalr	-1580(ra) # 8000123e <initlock>

  uartinit();
    80000872:	00000097          	auipc	ra,0x0
    80000876:	494080e7          	jalr	1172(ra) # 80000d06 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000087a:	00024797          	auipc	a5,0x24
    8000087e:	4ee78793          	addi	a5,a5,1262 # 80024d68 <devsw>
    80000882:	00000717          	auipc	a4,0x0
    80000886:	bd270713          	addi	a4,a4,-1070 # 80000454 <consoleread>
    8000088a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000088c:	00024797          	auipc	a5,0x24
    80000890:	4dc78793          	addi	a5,a5,1244 # 80024d68 <devsw>
    80000894:	00000717          	auipc	a4,0x0
    80000898:	b3870713          	addi	a4,a4,-1224 # 800003cc <consolewrite>
    8000089c:	ef98                	sd	a4,24(a5)
}
    8000089e:	0001                	nop
    800008a0:	60a2                	ld	ra,8(sp)
    800008a2:	6402                	ld	s0,0(sp)
    800008a4:	0141                	addi	sp,sp,16
    800008a6:	8082                	ret

00000000800008a8 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008a8:	7139                	addi	sp,sp,-64
    800008aa:	fc06                	sd	ra,56(sp)
    800008ac:	f822                	sd	s0,48(sp)
    800008ae:	0080                	addi	s0,sp,64
    800008b0:	87aa                	mv	a5,a0
    800008b2:	86ae                	mv	a3,a1
    800008b4:	8732                	mv	a4,a2
    800008b6:	fcf42623          	sw	a5,-52(s0)
    800008ba:	87b6                	mv	a5,a3
    800008bc:	fcf42423          	sw	a5,-56(s0)
    800008c0:	87ba                	mv	a5,a4
    800008c2:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008c6:	fc442783          	lw	a5,-60(s0)
    800008ca:	2781                	sext.w	a5,a5
    800008cc:	c78d                	beqz	a5,800008f6 <printint+0x4e>
    800008ce:	fcc42783          	lw	a5,-52(s0)
    800008d2:	01f7d79b          	srliw	a5,a5,0x1f
    800008d6:	0ff7f793          	andi	a5,a5,255
    800008da:	fcf42223          	sw	a5,-60(s0)
    800008de:	fc442783          	lw	a5,-60(s0)
    800008e2:	2781                	sext.w	a5,a5
    800008e4:	cb89                	beqz	a5,800008f6 <printint+0x4e>
    x = -xx;
    800008e6:	fcc42783          	lw	a5,-52(s0)
    800008ea:	40f007bb          	negw	a5,a5
    800008ee:	2781                	sext.w	a5,a5
    800008f0:	fef42423          	sw	a5,-24(s0)
    800008f4:	a029                	j	800008fe <printint+0x56>
  else
    x = xx;
    800008f6:	fcc42783          	lw	a5,-52(s0)
    800008fa:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008fe:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000902:	fc842783          	lw	a5,-56(s0)
    80000906:	fe842703          	lw	a4,-24(s0)
    8000090a:	02f777bb          	remuw	a5,a4,a5
    8000090e:	0007861b          	sext.w	a2,a5
    80000912:	fec42783          	lw	a5,-20(s0)
    80000916:	0017871b          	addiw	a4,a5,1
    8000091a:	fee42623          	sw	a4,-20(s0)
    8000091e:	0000b697          	auipc	a3,0xb
    80000922:	e7268693          	addi	a3,a3,-398 # 8000b790 <digits>
    80000926:	02061713          	slli	a4,a2,0x20
    8000092a:	9301                	srli	a4,a4,0x20
    8000092c:	9736                	add	a4,a4,a3
    8000092e:	00074703          	lbu	a4,0(a4)
    80000932:	ff040693          	addi	a3,s0,-16
    80000936:	97b6                	add	a5,a5,a3
    80000938:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000093c:	fc842783          	lw	a5,-56(s0)
    80000940:	fe842703          	lw	a4,-24(s0)
    80000944:	02f757bb          	divuw	a5,a4,a5
    80000948:	fef42423          	sw	a5,-24(s0)
    8000094c:	fe842783          	lw	a5,-24(s0)
    80000950:	2781                	sext.w	a5,a5
    80000952:	fbc5                	bnez	a5,80000902 <printint+0x5a>

  if(sign)
    80000954:	fc442783          	lw	a5,-60(s0)
    80000958:	2781                	sext.w	a5,a5
    8000095a:	cf85                	beqz	a5,80000992 <printint+0xea>
    buf[i++] = '-';
    8000095c:	fec42783          	lw	a5,-20(s0)
    80000960:	0017871b          	addiw	a4,a5,1
    80000964:	fee42623          	sw	a4,-20(s0)
    80000968:	ff040713          	addi	a4,s0,-16
    8000096c:	97ba                	add	a5,a5,a4
    8000096e:	02d00713          	li	a4,45
    80000972:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000976:	a831                	j	80000992 <printint+0xea>
    consputc(buf[i]);
    80000978:	fec42783          	lw	a5,-20(s0)
    8000097c:	ff040713          	addi	a4,s0,-16
    80000980:	97ba                	add	a5,a5,a4
    80000982:	fe87c783          	lbu	a5,-24(a5)
    80000986:	2781                	sext.w	a5,a5
    80000988:	853e                	mv	a0,a5
    8000098a:	00000097          	auipc	ra,0x0
    8000098e:	9ea080e7          	jalr	-1558(ra) # 80000374 <consputc>
  while(--i >= 0)
    80000992:	fec42783          	lw	a5,-20(s0)
    80000996:	37fd                	addiw	a5,a5,-1
    80000998:	fef42623          	sw	a5,-20(s0)
    8000099c:	fec42783          	lw	a5,-20(s0)
    800009a0:	2781                	sext.w	a5,a5
    800009a2:	fc07dbe3          	bgez	a5,80000978 <printint+0xd0>
}
    800009a6:	0001                	nop
    800009a8:	0001                	nop
    800009aa:	70e2                	ld	ra,56(sp)
    800009ac:	7442                	ld	s0,48(sp)
    800009ae:	6121                	addi	sp,sp,64
    800009b0:	8082                	ret

00000000800009b2 <printptr>:

static void
printptr(uint64 x)
{
    800009b2:	7179                	addi	sp,sp,-48
    800009b4:	f406                	sd	ra,40(sp)
    800009b6:	f022                	sd	s0,32(sp)
    800009b8:	1800                	addi	s0,sp,48
    800009ba:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009be:	03000513          	li	a0,48
    800009c2:	00000097          	auipc	ra,0x0
    800009c6:	9b2080e7          	jalr	-1614(ra) # 80000374 <consputc>
  consputc('x');
    800009ca:	07800513          	li	a0,120
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9a6080e7          	jalr	-1626(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009d6:	fe042623          	sw	zero,-20(s0)
    800009da:	a81d                	j	80000a10 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009dc:	fd843783          	ld	a5,-40(s0)
    800009e0:	93f1                	srli	a5,a5,0x3c
    800009e2:	0000b717          	auipc	a4,0xb
    800009e6:	dae70713          	addi	a4,a4,-594 # 8000b790 <digits>
    800009ea:	97ba                	add	a5,a5,a4
    800009ec:	0007c783          	lbu	a5,0(a5)
    800009f0:	2781                	sext.w	a5,a5
    800009f2:	853e                	mv	a0,a5
    800009f4:	00000097          	auipc	ra,0x0
    800009f8:	980080e7          	jalr	-1664(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009fc:	fec42783          	lw	a5,-20(s0)
    80000a00:	2785                	addiw	a5,a5,1
    80000a02:	fef42623          	sw	a5,-20(s0)
    80000a06:	fd843783          	ld	a5,-40(s0)
    80000a0a:	0792                	slli	a5,a5,0x4
    80000a0c:	fcf43c23          	sd	a5,-40(s0)
    80000a10:	fec42783          	lw	a5,-20(s0)
    80000a14:	873e                	mv	a4,a5
    80000a16:	47bd                	li	a5,15
    80000a18:	fce7f2e3          	bgeu	a5,a4,800009dc <printptr+0x2a>
}
    80000a1c:	0001                	nop
    80000a1e:	0001                	nop
    80000a20:	70a2                	ld	ra,40(sp)
    80000a22:	7402                	ld	s0,32(sp)
    80000a24:	6145                	addi	sp,sp,48
    80000a26:	8082                	ret

0000000080000a28 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a28:	7119                	addi	sp,sp,-128
    80000a2a:	fc06                	sd	ra,56(sp)
    80000a2c:	f822                	sd	s0,48(sp)
    80000a2e:	0080                	addi	s0,sp,64
    80000a30:	fca43423          	sd	a0,-56(s0)
    80000a34:	e40c                	sd	a1,8(s0)
    80000a36:	e810                	sd	a2,16(s0)
    80000a38:	ec14                	sd	a3,24(s0)
    80000a3a:	f018                	sd	a4,32(s0)
    80000a3c:	f41c                	sd	a5,40(s0)
    80000a3e:	03043823          	sd	a6,48(s0)
    80000a42:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a46:	00013797          	auipc	a5,0x13
    80000a4a:	7d278793          	addi	a5,a5,2002 # 80014218 <pr>
    80000a4e:	4f9c                	lw	a5,24(a5)
    80000a50:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a54:	fdc42783          	lw	a5,-36(s0)
    80000a58:	2781                	sext.w	a5,a5
    80000a5a:	cb89                	beqz	a5,80000a6c <printf+0x44>
    acquire(&pr.lock);
    80000a5c:	00013517          	auipc	a0,0x13
    80000a60:	7bc50513          	addi	a0,a0,1980 # 80014218 <pr>
    80000a64:	00001097          	auipc	ra,0x1
    80000a68:	80a080e7          	jalr	-2038(ra) # 8000126e <acquire>

  if (fmt == 0)
    80000a6c:	fc843783          	ld	a5,-56(s0)
    80000a70:	eb89                	bnez	a5,80000a82 <printf+0x5a>
    panic("null fmt");
    80000a72:	0000a517          	auipc	a0,0xa
    80000a76:	59650513          	addi	a0,a0,1430 # 8000b008 <etext+0x8>
    80000a7a:	00000097          	auipc	ra,0x0
    80000a7e:	204080e7          	jalr	516(ra) # 80000c7e <panic>

  va_start(ap, fmt);
    80000a82:	04040793          	addi	a5,s0,64
    80000a86:	fcf43023          	sd	a5,-64(s0)
    80000a8a:	fc043783          	ld	a5,-64(s0)
    80000a8e:	fc878793          	addi	a5,a5,-56
    80000a92:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a96:	fe042623          	sw	zero,-20(s0)
    80000a9a:	a24d                	j	80000c3c <printf+0x214>
    if(c != '%'){
    80000a9c:	fd842783          	lw	a5,-40(s0)
    80000aa0:	0007871b          	sext.w	a4,a5
    80000aa4:	02500793          	li	a5,37
    80000aa8:	00f70a63          	beq	a4,a5,80000abc <printf+0x94>
      consputc(c);
    80000aac:	fd842783          	lw	a5,-40(s0)
    80000ab0:	853e                	mv	a0,a5
    80000ab2:	00000097          	auipc	ra,0x0
    80000ab6:	8c2080e7          	jalr	-1854(ra) # 80000374 <consputc>
      continue;
    80000aba:	aaa5                	j	80000c32 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000abc:	fec42783          	lw	a5,-20(s0)
    80000ac0:	2785                	addiw	a5,a5,1
    80000ac2:	fef42623          	sw	a5,-20(s0)
    80000ac6:	fec42783          	lw	a5,-20(s0)
    80000aca:	fc843703          	ld	a4,-56(s0)
    80000ace:	97ba                	add	a5,a5,a4
    80000ad0:	0007c783          	lbu	a5,0(a5)
    80000ad4:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ad8:	fd842783          	lw	a5,-40(s0)
    80000adc:	2781                	sext.w	a5,a5
    80000ade:	16078e63          	beqz	a5,80000c5a <printf+0x232>
      break;
    switch(c){
    80000ae2:	fd842783          	lw	a5,-40(s0)
    80000ae6:	0007871b          	sext.w	a4,a5
    80000aea:	07800793          	li	a5,120
    80000aee:	08f70963          	beq	a4,a5,80000b80 <printf+0x158>
    80000af2:	fd842783          	lw	a5,-40(s0)
    80000af6:	0007871b          	sext.w	a4,a5
    80000afa:	07800793          	li	a5,120
    80000afe:	10e7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b02:	fd842783          	lw	a5,-40(s0)
    80000b06:	0007871b          	sext.w	a4,a5
    80000b0a:	07300793          	li	a5,115
    80000b0e:	0af70563          	beq	a4,a5,80000bb8 <printf+0x190>
    80000b12:	fd842783          	lw	a5,-40(s0)
    80000b16:	0007871b          	sext.w	a4,a5
    80000b1a:	07300793          	li	a5,115
    80000b1e:	0ee7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b22:	fd842783          	lw	a5,-40(s0)
    80000b26:	0007871b          	sext.w	a4,a5
    80000b2a:	07000793          	li	a5,112
    80000b2e:	06f70863          	beq	a4,a5,80000b9e <printf+0x176>
    80000b32:	fd842783          	lw	a5,-40(s0)
    80000b36:	0007871b          	sext.w	a4,a5
    80000b3a:	07000793          	li	a5,112
    80000b3e:	0ce7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b42:	fd842783          	lw	a5,-40(s0)
    80000b46:	0007871b          	sext.w	a4,a5
    80000b4a:	02500793          	li	a5,37
    80000b4e:	0af70d63          	beq	a4,a5,80000c08 <printf+0x1e0>
    80000b52:	fd842783          	lw	a5,-40(s0)
    80000b56:	0007871b          	sext.w	a4,a5
    80000b5a:	06400793          	li	a5,100
    80000b5e:	0af71c63          	bne	a4,a5,80000c16 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b62:	fd043783          	ld	a5,-48(s0)
    80000b66:	00878713          	addi	a4,a5,8
    80000b6a:	fce43823          	sd	a4,-48(s0)
    80000b6e:	439c                	lw	a5,0(a5)
    80000b70:	4605                	li	a2,1
    80000b72:	45a9                	li	a1,10
    80000b74:	853e                	mv	a0,a5
    80000b76:	00000097          	auipc	ra,0x0
    80000b7a:	d32080e7          	jalr	-718(ra) # 800008a8 <printint>
      break;
    80000b7e:	a855                	j	80000c32 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b80:	fd043783          	ld	a5,-48(s0)
    80000b84:	00878713          	addi	a4,a5,8
    80000b88:	fce43823          	sd	a4,-48(s0)
    80000b8c:	439c                	lw	a5,0(a5)
    80000b8e:	4605                	li	a2,1
    80000b90:	45c1                	li	a1,16
    80000b92:	853e                	mv	a0,a5
    80000b94:	00000097          	auipc	ra,0x0
    80000b98:	d14080e7          	jalr	-748(ra) # 800008a8 <printint>
      break;
    80000b9c:	a859                	j	80000c32 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b9e:	fd043783          	ld	a5,-48(s0)
    80000ba2:	00878713          	addi	a4,a5,8
    80000ba6:	fce43823          	sd	a4,-48(s0)
    80000baa:	639c                	ld	a5,0(a5)
    80000bac:	853e                	mv	a0,a5
    80000bae:	00000097          	auipc	ra,0x0
    80000bb2:	e04080e7          	jalr	-508(ra) # 800009b2 <printptr>
      break;
    80000bb6:	a8b5                	j	80000c32 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bb8:	fd043783          	ld	a5,-48(s0)
    80000bbc:	00878713          	addi	a4,a5,8
    80000bc0:	fce43823          	sd	a4,-48(s0)
    80000bc4:	639c                	ld	a5,0(a5)
    80000bc6:	fef43023          	sd	a5,-32(s0)
    80000bca:	fe043783          	ld	a5,-32(s0)
    80000bce:	e79d                	bnez	a5,80000bfc <printf+0x1d4>
        s = "(null)";
    80000bd0:	0000a797          	auipc	a5,0xa
    80000bd4:	44878793          	addi	a5,a5,1096 # 8000b018 <etext+0x18>
    80000bd8:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bdc:	a005                	j	80000bfc <printf+0x1d4>
        consputc(*s);
    80000bde:	fe043783          	ld	a5,-32(s0)
    80000be2:	0007c783          	lbu	a5,0(a5)
    80000be6:	2781                	sext.w	a5,a5
    80000be8:	853e                	mv	a0,a5
    80000bea:	fffff097          	auipc	ra,0xfffff
    80000bee:	78a080e7          	jalr	1930(ra) # 80000374 <consputc>
      for(; *s; s++)
    80000bf2:	fe043783          	ld	a5,-32(s0)
    80000bf6:	0785                	addi	a5,a5,1
    80000bf8:	fef43023          	sd	a5,-32(s0)
    80000bfc:	fe043783          	ld	a5,-32(s0)
    80000c00:	0007c783          	lbu	a5,0(a5)
    80000c04:	ffe9                	bnez	a5,80000bde <printf+0x1b6>
      break;
    80000c06:	a035                	j	80000c32 <printf+0x20a>
    case '%':
      consputc('%');
    80000c08:	02500513          	li	a0,37
    80000c0c:	fffff097          	auipc	ra,0xfffff
    80000c10:	768080e7          	jalr	1896(ra) # 80000374 <consputc>
      break;
    80000c14:	a839                	j	80000c32 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c16:	02500513          	li	a0,37
    80000c1a:	fffff097          	auipc	ra,0xfffff
    80000c1e:	75a080e7          	jalr	1882(ra) # 80000374 <consputc>
      consputc(c);
    80000c22:	fd842783          	lw	a5,-40(s0)
    80000c26:	853e                	mv	a0,a5
    80000c28:	fffff097          	auipc	ra,0xfffff
    80000c2c:	74c080e7          	jalr	1868(ra) # 80000374 <consputc>
      break;
    80000c30:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c32:	fec42783          	lw	a5,-20(s0)
    80000c36:	2785                	addiw	a5,a5,1
    80000c38:	fef42623          	sw	a5,-20(s0)
    80000c3c:	fec42783          	lw	a5,-20(s0)
    80000c40:	fc843703          	ld	a4,-56(s0)
    80000c44:	97ba                	add	a5,a5,a4
    80000c46:	0007c783          	lbu	a5,0(a5)
    80000c4a:	fcf42c23          	sw	a5,-40(s0)
    80000c4e:	fd842783          	lw	a5,-40(s0)
    80000c52:	2781                	sext.w	a5,a5
    80000c54:	e40794e3          	bnez	a5,80000a9c <printf+0x74>
    80000c58:	a011                	j	80000c5c <printf+0x234>
      break;
    80000c5a:	0001                	nop
    }
  }

  if(locking)
    80000c5c:	fdc42783          	lw	a5,-36(s0)
    80000c60:	2781                	sext.w	a5,a5
    80000c62:	cb89                	beqz	a5,80000c74 <printf+0x24c>
    release(&pr.lock);
    80000c64:	00013517          	auipc	a0,0x13
    80000c68:	5b450513          	addi	a0,a0,1460 # 80014218 <pr>
    80000c6c:	00000097          	auipc	ra,0x0
    80000c70:	666080e7          	jalr	1638(ra) # 800012d2 <release>
}
    80000c74:	0001                	nop
    80000c76:	70e2                	ld	ra,56(sp)
    80000c78:	7442                	ld	s0,48(sp)
    80000c7a:	6109                	addi	sp,sp,128
    80000c7c:	8082                	ret

0000000080000c7e <panic>:

void
panic(char *s)
{
    80000c7e:	1101                	addi	sp,sp,-32
    80000c80:	ec06                	sd	ra,24(sp)
    80000c82:	e822                	sd	s0,16(sp)
    80000c84:	1000                	addi	s0,sp,32
    80000c86:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c8a:	00013797          	auipc	a5,0x13
    80000c8e:	58e78793          	addi	a5,a5,1422 # 80014218 <pr>
    80000c92:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c96:	0000a517          	auipc	a0,0xa
    80000c9a:	38a50513          	addi	a0,a0,906 # 8000b020 <etext+0x20>
    80000c9e:	00000097          	auipc	ra,0x0
    80000ca2:	d8a080e7          	jalr	-630(ra) # 80000a28 <printf>
  printf(s);
    80000ca6:	fe843503          	ld	a0,-24(s0)
    80000caa:	00000097          	auipc	ra,0x0
    80000cae:	d7e080e7          	jalr	-642(ra) # 80000a28 <printf>
  printf("\n");
    80000cb2:	0000a517          	auipc	a0,0xa
    80000cb6:	37650513          	addi	a0,a0,886 # 8000b028 <etext+0x28>
    80000cba:	00000097          	auipc	ra,0x0
    80000cbe:	d6e080e7          	jalr	-658(ra) # 80000a28 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cc2:	0000b797          	auipc	a5,0xb
    80000cc6:	33e78793          	addi	a5,a5,830 # 8000c000 <panicked>
    80000cca:	4705                	li	a4,1
    80000ccc:	c398                	sw	a4,0(a5)
  for(;;)
    80000cce:	a001                	j	80000cce <panic+0x50>

0000000080000cd0 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000cd0:	1141                	addi	sp,sp,-16
    80000cd2:	e406                	sd	ra,8(sp)
    80000cd4:	e022                	sd	s0,0(sp)
    80000cd6:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000cd8:	0000a597          	auipc	a1,0xa
    80000cdc:	35858593          	addi	a1,a1,856 # 8000b030 <etext+0x30>
    80000ce0:	00013517          	auipc	a0,0x13
    80000ce4:	53850513          	addi	a0,a0,1336 # 80014218 <pr>
    80000ce8:	00000097          	auipc	ra,0x0
    80000cec:	556080e7          	jalr	1366(ra) # 8000123e <initlock>
  pr.locking = 1;
    80000cf0:	00013797          	auipc	a5,0x13
    80000cf4:	52878793          	addi	a5,a5,1320 # 80014218 <pr>
    80000cf8:	4705                	li	a4,1
    80000cfa:	cf98                	sw	a4,24(a5)
}
    80000cfc:	0001                	nop
    80000cfe:	60a2                	ld	ra,8(sp)
    80000d00:	6402                	ld	s0,0(sp)
    80000d02:	0141                	addi	sp,sp,16
    80000d04:	8082                	ret

0000000080000d06 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d06:	1141                	addi	sp,sp,-16
    80000d08:	e406                	sd	ra,8(sp)
    80000d0a:	e022                	sd	s0,0(sp)
    80000d0c:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d0e:	100007b7          	lui	a5,0x10000
    80000d12:	0785                	addi	a5,a5,1
    80000d14:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d18:	100007b7          	lui	a5,0x10000
    80000d1c:	078d                	addi	a5,a5,3
    80000d1e:	f8000713          	li	a4,-128
    80000d22:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d26:	100007b7          	lui	a5,0x10000
    80000d2a:	470d                	li	a4,3
    80000d2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d30:	100007b7          	lui	a5,0x10000
    80000d34:	0785                	addi	a5,a5,1
    80000d36:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d3a:	100007b7          	lui	a5,0x10000
    80000d3e:	078d                	addi	a5,a5,3
    80000d40:	470d                	li	a4,3
    80000d42:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d46:	100007b7          	lui	a5,0x10000
    80000d4a:	0789                	addi	a5,a5,2
    80000d4c:	471d                	li	a4,7
    80000d4e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0785                	addi	a5,a5,1
    80000d58:	470d                	li	a4,3
    80000d5a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d5e:	0000a597          	auipc	a1,0xa
    80000d62:	2da58593          	addi	a1,a1,730 # 8000b038 <etext+0x38>
    80000d66:	00013517          	auipc	a0,0x13
    80000d6a:	4d250513          	addi	a0,a0,1234 # 80014238 <uart_tx_lock>
    80000d6e:	00000097          	auipc	ra,0x0
    80000d72:	4d0080e7          	jalr	1232(ra) # 8000123e <initlock>
}
    80000d76:	0001                	nop
    80000d78:	60a2                	ld	ra,8(sp)
    80000d7a:	6402                	ld	s0,0(sp)
    80000d7c:	0141                	addi	sp,sp,16
    80000d7e:	8082                	ret

0000000080000d80 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d80:	1101                	addi	sp,sp,-32
    80000d82:	ec06                	sd	ra,24(sp)
    80000d84:	e822                	sd	s0,16(sp)
    80000d86:	1000                	addi	s0,sp,32
    80000d88:	87aa                	mv	a5,a0
    80000d8a:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d8e:	00013517          	auipc	a0,0x13
    80000d92:	4aa50513          	addi	a0,a0,1194 # 80014238 <uart_tx_lock>
    80000d96:	00000097          	auipc	ra,0x0
    80000d9a:	4d8080e7          	jalr	1240(ra) # 8000126e <acquire>

  if(panicked){
    80000d9e:	0000b797          	auipc	a5,0xb
    80000da2:	26278793          	addi	a5,a5,610 # 8000c000 <panicked>
    80000da6:	439c                	lw	a5,0(a5)
    80000da8:	2781                	sext.w	a5,a5
    80000daa:	c391                	beqz	a5,80000dae <uartputc+0x2e>
    for(;;)
    80000dac:	a001                	j	80000dac <uartputc+0x2c>
      ;
  }

  while(1){
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000dae:	0000b797          	auipc	a5,0xb
    80000db2:	26278793          	addi	a5,a5,610 # 8000c010 <uart_tx_r>
    80000db6:	639c                	ld	a5,0(a5)
    80000db8:	02078713          	addi	a4,a5,32
    80000dbc:	0000b797          	auipc	a5,0xb
    80000dc0:	24c78793          	addi	a5,a5,588 # 8000c008 <uart_tx_w>
    80000dc4:	639c                	ld	a5,0(a5)
    80000dc6:	00f71f63          	bne	a4,a5,80000de4 <uartputc+0x64>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000dca:	00013597          	auipc	a1,0x13
    80000dce:	46e58593          	addi	a1,a1,1134 # 80014238 <uart_tx_lock>
    80000dd2:	0000b517          	auipc	a0,0xb
    80000dd6:	23e50513          	addi	a0,a0,574 # 8000c010 <uart_tx_r>
    80000dda:	00003097          	auipc	ra,0x3
    80000dde:	982080e7          	jalr	-1662(ra) # 8000375c <sleep>
    80000de2:	b7f1                	j	80000dae <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000de4:	0000b797          	auipc	a5,0xb
    80000de8:	22478793          	addi	a5,a5,548 # 8000c008 <uart_tx_w>
    80000dec:	639c                	ld	a5,0(a5)
    80000dee:	8bfd                	andi	a5,a5,31
    80000df0:	fec42703          	lw	a4,-20(s0)
    80000df4:	0ff77713          	andi	a4,a4,255
    80000df8:	00013697          	auipc	a3,0x13
    80000dfc:	45868693          	addi	a3,a3,1112 # 80014250 <uart_tx_buf>
    80000e00:	97b6                	add	a5,a5,a3
    80000e02:	00e78023          	sb	a4,0(a5)
      uart_tx_w += 1;
    80000e06:	0000b797          	auipc	a5,0xb
    80000e0a:	20278793          	addi	a5,a5,514 # 8000c008 <uart_tx_w>
    80000e0e:	639c                	ld	a5,0(a5)
    80000e10:	00178713          	addi	a4,a5,1
    80000e14:	0000b797          	auipc	a5,0xb
    80000e18:	1f478793          	addi	a5,a5,500 # 8000c008 <uart_tx_w>
    80000e1c:	e398                	sd	a4,0(a5)
      uartstart();
    80000e1e:	00000097          	auipc	ra,0x0
    80000e22:	084080e7          	jalr	132(ra) # 80000ea2 <uartstart>
      release(&uart_tx_lock);
    80000e26:	00013517          	auipc	a0,0x13
    80000e2a:	41250513          	addi	a0,a0,1042 # 80014238 <uart_tx_lock>
    80000e2e:	00000097          	auipc	ra,0x0
    80000e32:	4a4080e7          	jalr	1188(ra) # 800012d2 <release>
      return;
    80000e36:	0001                	nop
    }
  }
}
    80000e38:	60e2                	ld	ra,24(sp)
    80000e3a:	6442                	ld	s0,16(sp)
    80000e3c:	6105                	addi	sp,sp,32
    80000e3e:	8082                	ret

0000000080000e40 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e40:	1101                	addi	sp,sp,-32
    80000e42:	ec06                	sd	ra,24(sp)
    80000e44:	e822                	sd	s0,16(sp)
    80000e46:	1000                	addi	s0,sp,32
    80000e48:	87aa                	mv	a5,a0
    80000e4a:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4e:	00000097          	auipc	ra,0x0
    80000e52:	51e080e7          	jalr	1310(ra) # 8000136c <push_off>

  if(panicked){
    80000e56:	0000b797          	auipc	a5,0xb
    80000e5a:	1aa78793          	addi	a5,a5,426 # 8000c000 <panicked>
    80000e5e:	439c                	lw	a5,0(a5)
    80000e60:	2781                	sext.w	a5,a5
    80000e62:	c391                	beqz	a5,80000e66 <uartputc_sync+0x26>
    for(;;)
    80000e64:	a001                	j	80000e64 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e66:	0001                	nop
    80000e68:	100007b7          	lui	a5,0x10000
    80000e6c:	0795                	addi	a5,a5,5
    80000e6e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e72:	0ff7f793          	andi	a5,a5,255
    80000e76:	2781                	sext.w	a5,a5
    80000e78:	0207f793          	andi	a5,a5,32
    80000e7c:	2781                	sext.w	a5,a5
    80000e7e:	d7ed                	beqz	a5,80000e68 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e80:	100007b7          	lui	a5,0x10000
    80000e84:	fec42703          	lw	a4,-20(s0)
    80000e88:	0ff77713          	andi	a4,a4,255
    80000e8c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e90:	00000097          	auipc	ra,0x0
    80000e94:	534080e7          	jalr	1332(ra) # 800013c4 <pop_off>
}
    80000e98:	0001                	nop
    80000e9a:	60e2                	ld	ra,24(sp)
    80000e9c:	6442                	ld	s0,16(sp)
    80000e9e:	6105                	addi	sp,sp,32
    80000ea0:	8082                	ret

0000000080000ea2 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ea2:	1101                	addi	sp,sp,-32
    80000ea4:	ec06                	sd	ra,24(sp)
    80000ea6:	e822                	sd	s0,16(sp)
    80000ea8:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000eaa:	0000b797          	auipc	a5,0xb
    80000eae:	15e78793          	addi	a5,a5,350 # 8000c008 <uart_tx_w>
    80000eb2:	6398                	ld	a4,0(a5)
    80000eb4:	0000b797          	auipc	a5,0xb
    80000eb8:	15c78793          	addi	a5,a5,348 # 8000c010 <uart_tx_r>
    80000ebc:	639c                	ld	a5,0(a5)
    80000ebe:	06f70a63          	beq	a4,a5,80000f32 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ec2:	100007b7          	lui	a5,0x10000
    80000ec6:	0795                	addi	a5,a5,5
    80000ec8:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000ecc:	0ff7f793          	andi	a5,a5,255
    80000ed0:	2781                	sext.w	a5,a5
    80000ed2:	0207f793          	andi	a5,a5,32
    80000ed6:	2781                	sext.w	a5,a5
    80000ed8:	cfb9                	beqz	a5,80000f36 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000eda:	0000b797          	auipc	a5,0xb
    80000ede:	13678793          	addi	a5,a5,310 # 8000c010 <uart_tx_r>
    80000ee2:	639c                	ld	a5,0(a5)
    80000ee4:	8bfd                	andi	a5,a5,31
    80000ee6:	00013717          	auipc	a4,0x13
    80000eea:	36a70713          	addi	a4,a4,874 # 80014250 <uart_tx_buf>
    80000eee:	97ba                	add	a5,a5,a4
    80000ef0:	0007c783          	lbu	a5,0(a5)
    80000ef4:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000ef8:	0000b797          	auipc	a5,0xb
    80000efc:	11878793          	addi	a5,a5,280 # 8000c010 <uart_tx_r>
    80000f00:	639c                	ld	a5,0(a5)
    80000f02:	00178713          	addi	a4,a5,1
    80000f06:	0000b797          	auipc	a5,0xb
    80000f0a:	10a78793          	addi	a5,a5,266 # 8000c010 <uart_tx_r>
    80000f0e:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f10:	0000b517          	auipc	a0,0xb
    80000f14:	10050513          	addi	a0,a0,256 # 8000c010 <uart_tx_r>
    80000f18:	00003097          	auipc	ra,0x3
    80000f1c:	8c0080e7          	jalr	-1856(ra) # 800037d8 <wakeup>
    
    WriteReg(THR, c);
    80000f20:	100007b7          	lui	a5,0x10000
    80000f24:	fec42703          	lw	a4,-20(s0)
    80000f28:	0ff77713          	andi	a4,a4,255
    80000f2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f30:	bfad                	j	80000eaa <uartstart+0x8>
      return;
    80000f32:	0001                	nop
    80000f34:	a011                	j	80000f38 <uartstart+0x96>
      return;
    80000f36:	0001                	nop
  }
}
    80000f38:	60e2                	ld	ra,24(sp)
    80000f3a:	6442                	ld	s0,16(sp)
    80000f3c:	6105                	addi	sp,sp,32
    80000f3e:	8082                	ret

0000000080000f40 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f40:	1141                	addi	sp,sp,-16
    80000f42:	e422                	sd	s0,8(sp)
    80000f44:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f46:	100007b7          	lui	a5,0x10000
    80000f4a:	0795                	addi	a5,a5,5
    80000f4c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f50:	0ff7f793          	andi	a5,a5,255
    80000f54:	2781                	sext.w	a5,a5
    80000f56:	8b85                	andi	a5,a5,1
    80000f58:	2781                	sext.w	a5,a5
    80000f5a:	cb89                	beqz	a5,80000f6c <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f5c:	100007b7          	lui	a5,0x10000
    80000f60:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f64:	0ff7f793          	andi	a5,a5,255
    80000f68:	2781                	sext.w	a5,a5
    80000f6a:	a011                	j	80000f6e <uartgetc+0x2e>
  } else {
    return -1;
    80000f6c:	57fd                	li	a5,-1
  }
}
    80000f6e:	853e                	mv	a0,a5
    80000f70:	6422                	ld	s0,8(sp)
    80000f72:	0141                	addi	sp,sp,16
    80000f74:	8082                	ret

0000000080000f76 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f76:	1101                	addi	sp,sp,-32
    80000f78:	ec06                	sd	ra,24(sp)
    80000f7a:	e822                	sd	s0,16(sp)
    80000f7c:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f7e:	00000097          	auipc	ra,0x0
    80000f82:	fc2080e7          	jalr	-62(ra) # 80000f40 <uartgetc>
    80000f86:	87aa                	mv	a5,a0
    80000f88:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f8c:	fec42783          	lw	a5,-20(s0)
    80000f90:	0007871b          	sext.w	a4,a5
    80000f94:	57fd                	li	a5,-1
    80000f96:	00f70a63          	beq	a4,a5,80000faa <uartintr+0x34>
      break;
    consoleintr(c);
    80000f9a:	fec42783          	lw	a5,-20(s0)
    80000f9e:	853e                	mv	a0,a5
    80000fa0:	fffff097          	auipc	ra,0xfffff
    80000fa4:	64a080e7          	jalr	1610(ra) # 800005ea <consoleintr>
  while(1){
    80000fa8:	bfd9                	j	80000f7e <uartintr+0x8>
      break;
    80000faa:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fac:	00013517          	auipc	a0,0x13
    80000fb0:	28c50513          	addi	a0,a0,652 # 80014238 <uart_tx_lock>
    80000fb4:	00000097          	auipc	ra,0x0
    80000fb8:	2ba080e7          	jalr	698(ra) # 8000126e <acquire>
  uartstart();
    80000fbc:	00000097          	auipc	ra,0x0
    80000fc0:	ee6080e7          	jalr	-282(ra) # 80000ea2 <uartstart>
  release(&uart_tx_lock);
    80000fc4:	00013517          	auipc	a0,0x13
    80000fc8:	27450513          	addi	a0,a0,628 # 80014238 <uart_tx_lock>
    80000fcc:	00000097          	auipc	ra,0x0
    80000fd0:	306080e7          	jalr	774(ra) # 800012d2 <release>
}
    80000fd4:	0001                	nop
    80000fd6:	60e2                	ld	ra,24(sp)
    80000fd8:	6442                	ld	s0,16(sp)
    80000fda:	6105                	addi	sp,sp,32
    80000fdc:	8082                	ret

0000000080000fde <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fde:	1141                	addi	sp,sp,-16
    80000fe0:	e406                	sd	ra,8(sp)
    80000fe2:	e022                	sd	s0,0(sp)
    80000fe4:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000fe6:	0000a597          	auipc	a1,0xa
    80000fea:	05a58593          	addi	a1,a1,90 # 8000b040 <etext+0x40>
    80000fee:	00013517          	auipc	a0,0x13
    80000ff2:	28250513          	addi	a0,a0,642 # 80014270 <kmem>
    80000ff6:	00000097          	auipc	ra,0x0
    80000ffa:	248080e7          	jalr	584(ra) # 8000123e <initlock>
  freerange(end, (void*)PHYSTOP);
    80000ffe:	47c5                	li	a5,17
    80001000:	01b79593          	slli	a1,a5,0x1b
    80001004:	00028517          	auipc	a0,0x28
    80001008:	ffc50513          	addi	a0,a0,-4 # 80029000 <end>
    8000100c:	00000097          	auipc	ra,0x0
    80001010:	012080e7          	jalr	18(ra) # 8000101e <freerange>
}
    80001014:	0001                	nop
    80001016:	60a2                	ld	ra,8(sp)
    80001018:	6402                	ld	s0,0(sp)
    8000101a:	0141                	addi	sp,sp,16
    8000101c:	8082                	ret

000000008000101e <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    8000101e:	7179                	addi	sp,sp,-48
    80001020:	f406                	sd	ra,40(sp)
    80001022:	f022                	sd	s0,32(sp)
    80001024:	1800                	addi	s0,sp,48
    80001026:	fca43c23          	sd	a0,-40(s0)
    8000102a:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    8000102e:	fd843703          	ld	a4,-40(s0)
    80001032:	6785                	lui	a5,0x1
    80001034:	17fd                	addi	a5,a5,-1
    80001036:	973e                	add	a4,a4,a5
    80001038:	77fd                	lui	a5,0xfffff
    8000103a:	8ff9                	and	a5,a5,a4
    8000103c:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001040:	a829                	j	8000105a <freerange+0x3c>
    kfree(p);
    80001042:	fe843503          	ld	a0,-24(s0)
    80001046:	00000097          	auipc	ra,0x0
    8000104a:	030080e7          	jalr	48(ra) # 80001076 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000104e:	fe843703          	ld	a4,-24(s0)
    80001052:	6785                	lui	a5,0x1
    80001054:	97ba                	add	a5,a5,a4
    80001056:	fef43423          	sd	a5,-24(s0)
    8000105a:	fe843703          	ld	a4,-24(s0)
    8000105e:	6785                	lui	a5,0x1
    80001060:	97ba                	add	a5,a5,a4
    80001062:	fd043703          	ld	a4,-48(s0)
    80001066:	fcf77ee3          	bgeu	a4,a5,80001042 <freerange+0x24>
}
    8000106a:	0001                	nop
    8000106c:	0001                	nop
    8000106e:	70a2                	ld	ra,40(sp)
    80001070:	7402                	ld	s0,32(sp)
    80001072:	6145                	addi	sp,sp,48
    80001074:	8082                	ret

0000000080001076 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001076:	7179                	addi	sp,sp,-48
    80001078:	f406                	sd	ra,40(sp)
    8000107a:	f022                	sd	s0,32(sp)
    8000107c:	1800                	addi	s0,sp,48
    8000107e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001082:	fd843703          	ld	a4,-40(s0)
    80001086:	6785                	lui	a5,0x1
    80001088:	17fd                	addi	a5,a5,-1
    8000108a:	8ff9                	and	a5,a5,a4
    8000108c:	ef99                	bnez	a5,800010aa <kfree+0x34>
    8000108e:	fd843703          	ld	a4,-40(s0)
    80001092:	00028797          	auipc	a5,0x28
    80001096:	f6e78793          	addi	a5,a5,-146 # 80029000 <end>
    8000109a:	00f76863          	bltu	a4,a5,800010aa <kfree+0x34>
    8000109e:	fd843703          	ld	a4,-40(s0)
    800010a2:	47c5                	li	a5,17
    800010a4:	07ee                	slli	a5,a5,0x1b
    800010a6:	00f76a63          	bltu	a4,a5,800010ba <kfree+0x44>
    panic("kfree");
    800010aa:	0000a517          	auipc	a0,0xa
    800010ae:	f9e50513          	addi	a0,a0,-98 # 8000b048 <etext+0x48>
    800010b2:	00000097          	auipc	ra,0x0
    800010b6:	bcc080e7          	jalr	-1076(ra) # 80000c7e <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010ba:	6605                	lui	a2,0x1
    800010bc:	4585                	li	a1,1
    800010be:	fd843503          	ld	a0,-40(s0)
    800010c2:	00000097          	auipc	ra,0x0
    800010c6:	380080e7          	jalr	896(ra) # 80001442 <memset>

  r = (struct run*)pa;
    800010ca:	fd843783          	ld	a5,-40(s0)
    800010ce:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010d2:	00013517          	auipc	a0,0x13
    800010d6:	19e50513          	addi	a0,a0,414 # 80014270 <kmem>
    800010da:	00000097          	auipc	ra,0x0
    800010de:	194080e7          	jalr	404(ra) # 8000126e <acquire>
  r->next = kmem.freelist;
    800010e2:	00013797          	auipc	a5,0x13
    800010e6:	18e78793          	addi	a5,a5,398 # 80014270 <kmem>
    800010ea:	6f98                	ld	a4,24(a5)
    800010ec:	fe843783          	ld	a5,-24(s0)
    800010f0:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010f2:	00013797          	auipc	a5,0x13
    800010f6:	17e78793          	addi	a5,a5,382 # 80014270 <kmem>
    800010fa:	fe843703          	ld	a4,-24(s0)
    800010fe:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001100:	00013517          	auipc	a0,0x13
    80001104:	17050513          	addi	a0,a0,368 # 80014270 <kmem>
    80001108:	00000097          	auipc	ra,0x0
    8000110c:	1ca080e7          	jalr	458(ra) # 800012d2 <release>
}
    80001110:	0001                	nop
    80001112:	70a2                	ld	ra,40(sp)
    80001114:	7402                	ld	s0,32(sp)
    80001116:	6145                	addi	sp,sp,48
    80001118:	8082                	ret

000000008000111a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000111a:	1101                	addi	sp,sp,-32
    8000111c:	ec06                	sd	ra,24(sp)
    8000111e:	e822                	sd	s0,16(sp)
    80001120:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001122:	00013517          	auipc	a0,0x13
    80001126:	14e50513          	addi	a0,a0,334 # 80014270 <kmem>
    8000112a:	00000097          	auipc	ra,0x0
    8000112e:	144080e7          	jalr	324(ra) # 8000126e <acquire>
  r = kmem.freelist;
    80001132:	00013797          	auipc	a5,0x13
    80001136:	13e78793          	addi	a5,a5,318 # 80014270 <kmem>
    8000113a:	6f9c                	ld	a5,24(a5)
    8000113c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001140:	fe843783          	ld	a5,-24(s0)
    80001144:	cb89                	beqz	a5,80001156 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001146:	fe843783          	ld	a5,-24(s0)
    8000114a:	6398                	ld	a4,0(a5)
    8000114c:	00013797          	auipc	a5,0x13
    80001150:	12478793          	addi	a5,a5,292 # 80014270 <kmem>
    80001154:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001156:	00013517          	auipc	a0,0x13
    8000115a:	11a50513          	addi	a0,a0,282 # 80014270 <kmem>
    8000115e:	00000097          	auipc	ra,0x0
    80001162:	174080e7          	jalr	372(ra) # 800012d2 <release>

  if(r)
    80001166:	fe843783          	ld	a5,-24(s0)
    8000116a:	cb89                	beqz	a5,8000117c <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000116c:	6605                	lui	a2,0x1
    8000116e:	4595                	li	a1,5
    80001170:	fe843503          	ld	a0,-24(s0)
    80001174:	00000097          	auipc	ra,0x0
    80001178:	2ce080e7          	jalr	718(ra) # 80001442 <memset>
  return (void*)r;
    8000117c:	fe843783          	ld	a5,-24(s0)
}
    80001180:	853e                	mv	a0,a5
    80001182:	60e2                	ld	ra,24(sp)
    80001184:	6442                	ld	s0,16(sp)
    80001186:	6105                	addi	sp,sp,32
    80001188:	8082                	ret

000000008000118a <r_sstatus>:
{
    8000118a:	1101                	addi	sp,sp,-32
    8000118c:	ec22                	sd	s0,24(sp)
    8000118e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001190:	100027f3          	csrr	a5,sstatus
    80001194:	fef43423          	sd	a5,-24(s0)
  return x;
    80001198:	fe843783          	ld	a5,-24(s0)
}
    8000119c:	853e                	mv	a0,a5
    8000119e:	6462                	ld	s0,24(sp)
    800011a0:	6105                	addi	sp,sp,32
    800011a2:	8082                	ret

00000000800011a4 <w_sstatus>:
{
    800011a4:	1101                	addi	sp,sp,-32
    800011a6:	ec22                	sd	s0,24(sp)
    800011a8:	1000                	addi	s0,sp,32
    800011aa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011ae:	fe843783          	ld	a5,-24(s0)
    800011b2:	10079073          	csrw	sstatus,a5
}
    800011b6:	0001                	nop
    800011b8:	6462                	ld	s0,24(sp)
    800011ba:	6105                	addi	sp,sp,32
    800011bc:	8082                	ret

00000000800011be <intr_on>:
{
    800011be:	1141                	addi	sp,sp,-16
    800011c0:	e406                	sd	ra,8(sp)
    800011c2:	e022                	sd	s0,0(sp)
    800011c4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011c6:	00000097          	auipc	ra,0x0
    800011ca:	fc4080e7          	jalr	-60(ra) # 8000118a <r_sstatus>
    800011ce:	87aa                	mv	a5,a0
    800011d0:	0027e793          	ori	a5,a5,2
    800011d4:	853e                	mv	a0,a5
    800011d6:	00000097          	auipc	ra,0x0
    800011da:	fce080e7          	jalr	-50(ra) # 800011a4 <w_sstatus>
}
    800011de:	0001                	nop
    800011e0:	60a2                	ld	ra,8(sp)
    800011e2:	6402                	ld	s0,0(sp)
    800011e4:	0141                	addi	sp,sp,16
    800011e6:	8082                	ret

00000000800011e8 <intr_off>:
{
    800011e8:	1141                	addi	sp,sp,-16
    800011ea:	e406                	sd	ra,8(sp)
    800011ec:	e022                	sd	s0,0(sp)
    800011ee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800011f0:	00000097          	auipc	ra,0x0
    800011f4:	f9a080e7          	jalr	-102(ra) # 8000118a <r_sstatus>
    800011f8:	87aa                	mv	a5,a0
    800011fa:	9bf5                	andi	a5,a5,-3
    800011fc:	853e                	mv	a0,a5
    800011fe:	00000097          	auipc	ra,0x0
    80001202:	fa6080e7          	jalr	-90(ra) # 800011a4 <w_sstatus>
}
    80001206:	0001                	nop
    80001208:	60a2                	ld	ra,8(sp)
    8000120a:	6402                	ld	s0,0(sp)
    8000120c:	0141                	addi	sp,sp,16
    8000120e:	8082                	ret

0000000080001210 <intr_get>:
{
    80001210:	1101                	addi	sp,sp,-32
    80001212:	ec06                	sd	ra,24(sp)
    80001214:	e822                	sd	s0,16(sp)
    80001216:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f72080e7          	jalr	-142(ra) # 8000118a <r_sstatus>
    80001220:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001224:	fe843783          	ld	a5,-24(s0)
    80001228:	8b89                	andi	a5,a5,2
    8000122a:	00f037b3          	snez	a5,a5
    8000122e:	0ff7f793          	andi	a5,a5,255
    80001232:	2781                	sext.w	a5,a5
}
    80001234:	853e                	mv	a0,a5
    80001236:	60e2                	ld	ra,24(sp)
    80001238:	6442                	ld	s0,16(sp)
    8000123a:	6105                	addi	sp,sp,32
    8000123c:	8082                	ret

000000008000123e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000123e:	1101                	addi	sp,sp,-32
    80001240:	ec22                	sd	s0,24(sp)
    80001242:	1000                	addi	s0,sp,32
    80001244:	fea43423          	sd	a0,-24(s0)
    80001248:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000124c:	fe843783          	ld	a5,-24(s0)
    80001250:	fe043703          	ld	a4,-32(s0)
    80001254:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001256:	fe843783          	ld	a5,-24(s0)
    8000125a:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000125e:	fe843783          	ld	a5,-24(s0)
    80001262:	0007b823          	sd	zero,16(a5)
}
    80001266:	0001                	nop
    80001268:	6462                	ld	s0,24(sp)
    8000126a:	6105                	addi	sp,sp,32
    8000126c:	8082                	ret

000000008000126e <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000126e:	1101                	addi	sp,sp,-32
    80001270:	ec06                	sd	ra,24(sp)
    80001272:	e822                	sd	s0,16(sp)
    80001274:	1000                	addi	s0,sp,32
    80001276:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000127a:	00000097          	auipc	ra,0x0
    8000127e:	0f2080e7          	jalr	242(ra) # 8000136c <push_off>
  if(holding(lk))
    80001282:	fe843503          	ld	a0,-24(s0)
    80001286:	00000097          	auipc	ra,0x0
    8000128a:	0a2080e7          	jalr	162(ra) # 80001328 <holding>
    8000128e:	87aa                	mv	a5,a0
    80001290:	cb89                	beqz	a5,800012a2 <acquire+0x34>
    panic("acquire");
    80001292:	0000a517          	auipc	a0,0xa
    80001296:	dbe50513          	addi	a0,a0,-578 # 8000b050 <etext+0x50>
    8000129a:	00000097          	auipc	ra,0x0
    8000129e:	9e4080e7          	jalr	-1564(ra) # 80000c7e <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012a2:	0001                	nop
    800012a4:	fe843783          	ld	a5,-24(s0)
    800012a8:	4705                	li	a4,1
    800012aa:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012ae:	0007079b          	sext.w	a5,a4
    800012b2:	fbed                	bnez	a5,800012a4 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012b4:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012b8:	00001097          	auipc	ra,0x1
    800012bc:	522080e7          	jalr	1314(ra) # 800027da <mycpu>
    800012c0:	872a                	mv	a4,a0
    800012c2:	fe843783          	ld	a5,-24(s0)
    800012c6:	eb98                	sd	a4,16(a5)
}
    800012c8:	0001                	nop
    800012ca:	60e2                	ld	ra,24(sp)
    800012cc:	6442                	ld	s0,16(sp)
    800012ce:	6105                	addi	sp,sp,32
    800012d0:	8082                	ret

00000000800012d2 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012d2:	1101                	addi	sp,sp,-32
    800012d4:	ec06                	sd	ra,24(sp)
    800012d6:	e822                	sd	s0,16(sp)
    800012d8:	1000                	addi	s0,sp,32
    800012da:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012de:	fe843503          	ld	a0,-24(s0)
    800012e2:	00000097          	auipc	ra,0x0
    800012e6:	046080e7          	jalr	70(ra) # 80001328 <holding>
    800012ea:	87aa                	mv	a5,a0
    800012ec:	eb89                	bnez	a5,800012fe <release+0x2c>
    panic("release");
    800012ee:	0000a517          	auipc	a0,0xa
    800012f2:	d6a50513          	addi	a0,a0,-662 # 8000b058 <etext+0x58>
    800012f6:	00000097          	auipc	ra,0x0
    800012fa:	988080e7          	jalr	-1656(ra) # 80000c7e <panic>

  lk->cpu = 0;
    800012fe:	fe843783          	ld	a5,-24(s0)
    80001302:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001306:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000130a:	fe843783          	ld	a5,-24(s0)
    8000130e:	0f50000f          	fence	iorw,ow
    80001312:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001316:	00000097          	auipc	ra,0x0
    8000131a:	0ae080e7          	jalr	174(ra) # 800013c4 <pop_off>
}
    8000131e:	0001                	nop
    80001320:	60e2                	ld	ra,24(sp)
    80001322:	6442                	ld	s0,16(sp)
    80001324:	6105                	addi	sp,sp,32
    80001326:	8082                	ret

0000000080001328 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001328:	7139                	addi	sp,sp,-64
    8000132a:	fc06                	sd	ra,56(sp)
    8000132c:	f822                	sd	s0,48(sp)
    8000132e:	f426                	sd	s1,40(sp)
    80001330:	0080                	addi	s0,sp,64
    80001332:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001336:	fc843783          	ld	a5,-56(s0)
    8000133a:	439c                	lw	a5,0(a5)
    8000133c:	cf89                	beqz	a5,80001356 <holding+0x2e>
    8000133e:	fc843783          	ld	a5,-56(s0)
    80001342:	6b84                	ld	s1,16(a5)
    80001344:	00001097          	auipc	ra,0x1
    80001348:	496080e7          	jalr	1174(ra) # 800027da <mycpu>
    8000134c:	87aa                	mv	a5,a0
    8000134e:	00f49463          	bne	s1,a5,80001356 <holding+0x2e>
    80001352:	4785                	li	a5,1
    80001354:	a011                	j	80001358 <holding+0x30>
    80001356:	4781                	li	a5,0
    80001358:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000135c:	fdc42783          	lw	a5,-36(s0)
}
    80001360:	853e                	mv	a0,a5
    80001362:	70e2                	ld	ra,56(sp)
    80001364:	7442                	ld	s0,48(sp)
    80001366:	74a2                	ld	s1,40(sp)
    80001368:	6121                	addi	sp,sp,64
    8000136a:	8082                	ret

000000008000136c <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000136c:	1101                	addi	sp,sp,-32
    8000136e:	ec06                	sd	ra,24(sp)
    80001370:	e822                	sd	s0,16(sp)
    80001372:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001374:	00000097          	auipc	ra,0x0
    80001378:	e9c080e7          	jalr	-356(ra) # 80001210 <intr_get>
    8000137c:	87aa                	mv	a5,a0
    8000137e:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001382:	00000097          	auipc	ra,0x0
    80001386:	e66080e7          	jalr	-410(ra) # 800011e8 <intr_off>
  if(mycpu()->noff == 0)
    8000138a:	00001097          	auipc	ra,0x1
    8000138e:	450080e7          	jalr	1104(ra) # 800027da <mycpu>
    80001392:	87aa                	mv	a5,a0
    80001394:	5fbc                	lw	a5,120(a5)
    80001396:	eb89                	bnez	a5,800013a8 <push_off+0x3c>
    mycpu()->intena = old;
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	442080e7          	jalr	1090(ra) # 800027da <mycpu>
    800013a0:	872a                	mv	a4,a0
    800013a2:	fec42783          	lw	a5,-20(s0)
    800013a6:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	432080e7          	jalr	1074(ra) # 800027da <mycpu>
    800013b0:	87aa                	mv	a5,a0
    800013b2:	5fb8                	lw	a4,120(a5)
    800013b4:	2705                	addiw	a4,a4,1
    800013b6:	2701                	sext.w	a4,a4
    800013b8:	dfb8                	sw	a4,120(a5)
}
    800013ba:	0001                	nop
    800013bc:	60e2                	ld	ra,24(sp)
    800013be:	6442                	ld	s0,16(sp)
    800013c0:	6105                	addi	sp,sp,32
    800013c2:	8082                	ret

00000000800013c4 <pop_off>:

void
pop_off(void)
{
    800013c4:	1101                	addi	sp,sp,-32
    800013c6:	ec06                	sd	ra,24(sp)
    800013c8:	e822                	sd	s0,16(sp)
    800013ca:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	40e080e7          	jalr	1038(ra) # 800027da <mycpu>
    800013d4:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	e38080e7          	jalr	-456(ra) # 80001210 <intr_get>
    800013e0:	87aa                	mv	a5,a0
    800013e2:	cb89                	beqz	a5,800013f4 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013e4:	0000a517          	auipc	a0,0xa
    800013e8:	c7c50513          	addi	a0,a0,-900 # 8000b060 <etext+0x60>
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	892080e7          	jalr	-1902(ra) # 80000c7e <panic>
  if(c->noff < 1)
    800013f4:	fe843783          	ld	a5,-24(s0)
    800013f8:	5fbc                	lw	a5,120(a5)
    800013fa:	00f04a63          	bgtz	a5,8000140e <pop_off+0x4a>
    panic("pop_off");
    800013fe:	0000a517          	auipc	a0,0xa
    80001402:	c7a50513          	addi	a0,a0,-902 # 8000b078 <etext+0x78>
    80001406:	00000097          	auipc	ra,0x0
    8000140a:	878080e7          	jalr	-1928(ra) # 80000c7e <panic>
  c->noff -= 1;
    8000140e:	fe843783          	ld	a5,-24(s0)
    80001412:	5fbc                	lw	a5,120(a5)
    80001414:	37fd                	addiw	a5,a5,-1
    80001416:	0007871b          	sext.w	a4,a5
    8000141a:	fe843783          	ld	a5,-24(s0)
    8000141e:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001420:	fe843783          	ld	a5,-24(s0)
    80001424:	5fbc                	lw	a5,120(a5)
    80001426:	eb89                	bnez	a5,80001438 <pop_off+0x74>
    80001428:	fe843783          	ld	a5,-24(s0)
    8000142c:	5ffc                	lw	a5,124(a5)
    8000142e:	c789                	beqz	a5,80001438 <pop_off+0x74>
    intr_on();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	d8e080e7          	jalr	-626(ra) # 800011be <intr_on>
}
    80001438:	0001                	nop
    8000143a:	60e2                	ld	ra,24(sp)
    8000143c:	6442                	ld	s0,16(sp)
    8000143e:	6105                	addi	sp,sp,32
    80001440:	8082                	ret

0000000080001442 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001442:	7179                	addi	sp,sp,-48
    80001444:	f422                	sd	s0,40(sp)
    80001446:	1800                	addi	s0,sp,48
    80001448:	fca43c23          	sd	a0,-40(s0)
    8000144c:	87ae                	mv	a5,a1
    8000144e:	8732                	mv	a4,a2
    80001450:	fcf42a23          	sw	a5,-44(s0)
    80001454:	87ba                	mv	a5,a4
    80001456:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000145a:	fd843783          	ld	a5,-40(s0)
    8000145e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001462:	fe042623          	sw	zero,-20(s0)
    80001466:	a00d                	j	80001488 <memset+0x46>
    cdst[i] = c;
    80001468:	fec42783          	lw	a5,-20(s0)
    8000146c:	fe043703          	ld	a4,-32(s0)
    80001470:	97ba                	add	a5,a5,a4
    80001472:	fd442703          	lw	a4,-44(s0)
    80001476:	0ff77713          	andi	a4,a4,255
    8000147a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000147e:	fec42783          	lw	a5,-20(s0)
    80001482:	2785                	addiw	a5,a5,1
    80001484:	fef42623          	sw	a5,-20(s0)
    80001488:	fec42703          	lw	a4,-20(s0)
    8000148c:	fd042783          	lw	a5,-48(s0)
    80001490:	2781                	sext.w	a5,a5
    80001492:	fcf76be3          	bltu	a4,a5,80001468 <memset+0x26>
  }
  return dst;
    80001496:	fd843783          	ld	a5,-40(s0)
}
    8000149a:	853e                	mv	a0,a5
    8000149c:	7422                	ld	s0,40(sp)
    8000149e:	6145                	addi	sp,sp,48
    800014a0:	8082                	ret

00000000800014a2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014a2:	7139                	addi	sp,sp,-64
    800014a4:	fc22                	sd	s0,56(sp)
    800014a6:	0080                	addi	s0,sp,64
    800014a8:	fca43c23          	sd	a0,-40(s0)
    800014ac:	fcb43823          	sd	a1,-48(s0)
    800014b0:	87b2                	mv	a5,a2
    800014b2:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014b6:	fd843783          	ld	a5,-40(s0)
    800014ba:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014be:	fd043783          	ld	a5,-48(s0)
    800014c2:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014c6:	a0a1                	j	8000150e <memcmp+0x6c>
    if(*s1 != *s2)
    800014c8:	fe843783          	ld	a5,-24(s0)
    800014cc:	0007c703          	lbu	a4,0(a5)
    800014d0:	fe043783          	ld	a5,-32(s0)
    800014d4:	0007c783          	lbu	a5,0(a5)
    800014d8:	02f70163          	beq	a4,a5,800014fa <memcmp+0x58>
      return *s1 - *s2;
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	0007c783          	lbu	a5,0(a5)
    800014e4:	0007871b          	sext.w	a4,a5
    800014e8:	fe043783          	ld	a5,-32(s0)
    800014ec:	0007c783          	lbu	a5,0(a5)
    800014f0:	2781                	sext.w	a5,a5
    800014f2:	40f707bb          	subw	a5,a4,a5
    800014f6:	2781                	sext.w	a5,a5
    800014f8:	a01d                	j	8000151e <memcmp+0x7c>
    s1++, s2++;
    800014fa:	fe843783          	ld	a5,-24(s0)
    800014fe:	0785                	addi	a5,a5,1
    80001500:	fef43423          	sd	a5,-24(s0)
    80001504:	fe043783          	ld	a5,-32(s0)
    80001508:	0785                	addi	a5,a5,1
    8000150a:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000150e:	fcc42783          	lw	a5,-52(s0)
    80001512:	fff7871b          	addiw	a4,a5,-1
    80001516:	fce42623          	sw	a4,-52(s0)
    8000151a:	f7dd                	bnez	a5,800014c8 <memcmp+0x26>
  }

  return 0;
    8000151c:	4781                	li	a5,0
}
    8000151e:	853e                	mv	a0,a5
    80001520:	7462                	ld	s0,56(sp)
    80001522:	6121                	addi	sp,sp,64
    80001524:	8082                	ret

0000000080001526 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001526:	7139                	addi	sp,sp,-64
    80001528:	fc22                	sd	s0,56(sp)
    8000152a:	0080                	addi	s0,sp,64
    8000152c:	fca43c23          	sd	a0,-40(s0)
    80001530:	fcb43823          	sd	a1,-48(s0)
    80001534:	87b2                	mv	a5,a2
    80001536:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    8000153a:	fcc42783          	lw	a5,-52(s0)
    8000153e:	2781                	sext.w	a5,a5
    80001540:	e781                	bnez	a5,80001548 <memmove+0x22>
    return dst;
    80001542:	fd843783          	ld	a5,-40(s0)
    80001546:	a855                	j	800015fa <memmove+0xd4>
  
  s = src;
    80001548:	fd043783          	ld	a5,-48(s0)
    8000154c:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001550:	fd843783          	ld	a5,-40(s0)
    80001554:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001558:	fe843703          	ld	a4,-24(s0)
    8000155c:	fe043783          	ld	a5,-32(s0)
    80001560:	08f77463          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    80001564:	fcc46783          	lwu	a5,-52(s0)
    80001568:	fe843703          	ld	a4,-24(s0)
    8000156c:	97ba                	add	a5,a5,a4
    8000156e:	fe043703          	ld	a4,-32(s0)
    80001572:	06f77b63          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    s += n;
    80001576:	fcc46783          	lwu	a5,-52(s0)
    8000157a:	fe843703          	ld	a4,-24(s0)
    8000157e:	97ba                	add	a5,a5,a4
    80001580:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001584:	fcc46783          	lwu	a5,-52(s0)
    80001588:	fe043703          	ld	a4,-32(s0)
    8000158c:	97ba                	add	a5,a5,a4
    8000158e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001592:	a01d                	j	800015b8 <memmove+0x92>
      *--d = *--s;
    80001594:	fe843783          	ld	a5,-24(s0)
    80001598:	17fd                	addi	a5,a5,-1
    8000159a:	fef43423          	sd	a5,-24(s0)
    8000159e:	fe043783          	ld	a5,-32(s0)
    800015a2:	17fd                	addi	a5,a5,-1
    800015a4:	fef43023          	sd	a5,-32(s0)
    800015a8:	fe843783          	ld	a5,-24(s0)
    800015ac:	0007c703          	lbu	a4,0(a5)
    800015b0:	fe043783          	ld	a5,-32(s0)
    800015b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015b8:	fcc42783          	lw	a5,-52(s0)
    800015bc:	fff7871b          	addiw	a4,a5,-1
    800015c0:	fce42623          	sw	a4,-52(s0)
    800015c4:	fbe1                	bnez	a5,80001594 <memmove+0x6e>
  if(s < d && s + n > d){
    800015c6:	a805                	j	800015f6 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015c8:	fe843703          	ld	a4,-24(s0)
    800015cc:	00170793          	addi	a5,a4,1
    800015d0:	fef43423          	sd	a5,-24(s0)
    800015d4:	fe043783          	ld	a5,-32(s0)
    800015d8:	00178693          	addi	a3,a5,1
    800015dc:	fed43023          	sd	a3,-32(s0)
    800015e0:	00074703          	lbu	a4,0(a4)
    800015e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015e8:	fcc42783          	lw	a5,-52(s0)
    800015ec:	fff7871b          	addiw	a4,a5,-1
    800015f0:	fce42623          	sw	a4,-52(s0)
    800015f4:	fbf1                	bnez	a5,800015c8 <memmove+0xa2>

  return dst;
    800015f6:	fd843783          	ld	a5,-40(s0)
}
    800015fa:	853e                	mv	a0,a5
    800015fc:	7462                	ld	s0,56(sp)
    800015fe:	6121                	addi	sp,sp,64
    80001600:	8082                	ret

0000000080001602 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001602:	7179                	addi	sp,sp,-48
    80001604:	f406                	sd	ra,40(sp)
    80001606:	f022                	sd	s0,32(sp)
    80001608:	1800                	addi	s0,sp,48
    8000160a:	fea43423          	sd	a0,-24(s0)
    8000160e:	feb43023          	sd	a1,-32(s0)
    80001612:	87b2                	mv	a5,a2
    80001614:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001618:	fdc42783          	lw	a5,-36(s0)
    8000161c:	863e                	mv	a2,a5
    8000161e:	fe043583          	ld	a1,-32(s0)
    80001622:	fe843503          	ld	a0,-24(s0)
    80001626:	00000097          	auipc	ra,0x0
    8000162a:	f00080e7          	jalr	-256(ra) # 80001526 <memmove>
    8000162e:	87aa                	mv	a5,a0
}
    80001630:	853e                	mv	a0,a5
    80001632:	70a2                	ld	ra,40(sp)
    80001634:	7402                	ld	s0,32(sp)
    80001636:	6145                	addi	sp,sp,48
    80001638:	8082                	ret

000000008000163a <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163a:	7179                	addi	sp,sp,-48
    8000163c:	f422                	sd	s0,40(sp)
    8000163e:	1800                	addi	s0,sp,48
    80001640:	fea43423          	sd	a0,-24(s0)
    80001644:	feb43023          	sd	a1,-32(s0)
    80001648:	87b2                	mv	a5,a2
    8000164a:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000164e:	a005                	j	8000166e <strncmp+0x34>
    n--, p++, q++;
    80001650:	fdc42783          	lw	a5,-36(s0)
    80001654:	37fd                	addiw	a5,a5,-1
    80001656:	fcf42e23          	sw	a5,-36(s0)
    8000165a:	fe843783          	ld	a5,-24(s0)
    8000165e:	0785                	addi	a5,a5,1
    80001660:	fef43423          	sd	a5,-24(s0)
    80001664:	fe043783          	ld	a5,-32(s0)
    80001668:	0785                	addi	a5,a5,1
    8000166a:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000166e:	fdc42783          	lw	a5,-36(s0)
    80001672:	2781                	sext.w	a5,a5
    80001674:	c385                	beqz	a5,80001694 <strncmp+0x5a>
    80001676:	fe843783          	ld	a5,-24(s0)
    8000167a:	0007c783          	lbu	a5,0(a5)
    8000167e:	cb99                	beqz	a5,80001694 <strncmp+0x5a>
    80001680:	fe843783          	ld	a5,-24(s0)
    80001684:	0007c703          	lbu	a4,0(a5)
    80001688:	fe043783          	ld	a5,-32(s0)
    8000168c:	0007c783          	lbu	a5,0(a5)
    80001690:	fcf700e3          	beq	a4,a5,80001650 <strncmp+0x16>
  if(n == 0)
    80001694:	fdc42783          	lw	a5,-36(s0)
    80001698:	2781                	sext.w	a5,a5
    8000169a:	e399                	bnez	a5,800016a0 <strncmp+0x66>
    return 0;
    8000169c:	4781                	li	a5,0
    8000169e:	a839                	j	800016bc <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a0:	fe843783          	ld	a5,-24(s0)
    800016a4:	0007c783          	lbu	a5,0(a5)
    800016a8:	0007871b          	sext.w	a4,a5
    800016ac:	fe043783          	ld	a5,-32(s0)
    800016b0:	0007c783          	lbu	a5,0(a5)
    800016b4:	2781                	sext.w	a5,a5
    800016b6:	40f707bb          	subw	a5,a4,a5
    800016ba:	2781                	sext.w	a5,a5
}
    800016bc:	853e                	mv	a0,a5
    800016be:	7422                	ld	s0,40(sp)
    800016c0:	6145                	addi	sp,sp,48
    800016c2:	8082                	ret

00000000800016c4 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c4:	7139                	addi	sp,sp,-64
    800016c6:	fc22                	sd	s0,56(sp)
    800016c8:	0080                	addi	s0,sp,64
    800016ca:	fca43c23          	sd	a0,-40(s0)
    800016ce:	fcb43823          	sd	a1,-48(s0)
    800016d2:	87b2                	mv	a5,a2
    800016d4:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016d8:	fd843783          	ld	a5,-40(s0)
    800016dc:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e0:	0001                	nop
    800016e2:	fcc42783          	lw	a5,-52(s0)
    800016e6:	fff7871b          	addiw	a4,a5,-1
    800016ea:	fce42623          	sw	a4,-52(s0)
    800016ee:	02f05e63          	blez	a5,8000172a <strncpy+0x66>
    800016f2:	fd043703          	ld	a4,-48(s0)
    800016f6:	00170793          	addi	a5,a4,1
    800016fa:	fcf43823          	sd	a5,-48(s0)
    800016fe:	fd843783          	ld	a5,-40(s0)
    80001702:	00178693          	addi	a3,a5,1
    80001706:	fcd43c23          	sd	a3,-40(s0)
    8000170a:	00074703          	lbu	a4,0(a4)
    8000170e:	00e78023          	sb	a4,0(a5)
    80001712:	0007c783          	lbu	a5,0(a5)
    80001716:	f7f1                	bnez	a5,800016e2 <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001718:	a809                	j	8000172a <strncpy+0x66>
    *s++ = 0;
    8000171a:	fd843783          	ld	a5,-40(s0)
    8000171e:	00178713          	addi	a4,a5,1
    80001722:	fce43c23          	sd	a4,-40(s0)
    80001726:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172a:	fcc42783          	lw	a5,-52(s0)
    8000172e:	fff7871b          	addiw	a4,a5,-1
    80001732:	fce42623          	sw	a4,-52(s0)
    80001736:	fef042e3          	bgtz	a5,8000171a <strncpy+0x56>
  return os;
    8000173a:	fe843783          	ld	a5,-24(s0)
}
    8000173e:	853e                	mv	a0,a5
    80001740:	7462                	ld	s0,56(sp)
    80001742:	6121                	addi	sp,sp,64
    80001744:	8082                	ret

0000000080001746 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001746:	7139                	addi	sp,sp,-64
    80001748:	fc22                	sd	s0,56(sp)
    8000174a:	0080                	addi	s0,sp,64
    8000174c:	fca43c23          	sd	a0,-40(s0)
    80001750:	fcb43823          	sd	a1,-48(s0)
    80001754:	87b2                	mv	a5,a2
    80001756:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175a:	fd843783          	ld	a5,-40(s0)
    8000175e:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001762:	fcc42783          	lw	a5,-52(s0)
    80001766:	2781                	sext.w	a5,a5
    80001768:	00f04563          	bgtz	a5,80001772 <safestrcpy+0x2c>
    return os;
    8000176c:	fe843783          	ld	a5,-24(s0)
    80001770:	a0a1                	j	800017b8 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001772:	fcc42783          	lw	a5,-52(s0)
    80001776:	37fd                	addiw	a5,a5,-1
    80001778:	fcf42623          	sw	a5,-52(s0)
    8000177c:	fcc42783          	lw	a5,-52(s0)
    80001780:	2781                	sext.w	a5,a5
    80001782:	02f05563          	blez	a5,800017ac <safestrcpy+0x66>
    80001786:	fd043703          	ld	a4,-48(s0)
    8000178a:	00170793          	addi	a5,a4,1
    8000178e:	fcf43823          	sd	a5,-48(s0)
    80001792:	fd843783          	ld	a5,-40(s0)
    80001796:	00178693          	addi	a3,a5,1
    8000179a:	fcd43c23          	sd	a3,-40(s0)
    8000179e:	00074703          	lbu	a4,0(a4)
    800017a2:	00e78023          	sb	a4,0(a5)
    800017a6:	0007c783          	lbu	a5,0(a5)
    800017aa:	f7e1                	bnez	a5,80001772 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017ac:	fd843783          	ld	a5,-40(s0)
    800017b0:	00078023          	sb	zero,0(a5)
  return os;
    800017b4:	fe843783          	ld	a5,-24(s0)
}
    800017b8:	853e                	mv	a0,a5
    800017ba:	7462                	ld	s0,56(sp)
    800017bc:	6121                	addi	sp,sp,64
    800017be:	8082                	ret

00000000800017c0 <strlen>:

int
strlen(const char *s)
{
    800017c0:	7179                	addi	sp,sp,-48
    800017c2:	f422                	sd	s0,40(sp)
    800017c4:	1800                	addi	s0,sp,48
    800017c6:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017ca:	fe042623          	sw	zero,-20(s0)
    800017ce:	a031                	j	800017da <strlen+0x1a>
    800017d0:	fec42783          	lw	a5,-20(s0)
    800017d4:	2785                	addiw	a5,a5,1
    800017d6:	fef42623          	sw	a5,-20(s0)
    800017da:	fec42783          	lw	a5,-20(s0)
    800017de:	fd843703          	ld	a4,-40(s0)
    800017e2:	97ba                	add	a5,a5,a4
    800017e4:	0007c783          	lbu	a5,0(a5)
    800017e8:	f7e5                	bnez	a5,800017d0 <strlen+0x10>
    ;
  return n;
    800017ea:	fec42783          	lw	a5,-20(s0)
}
    800017ee:	853e                	mv	a0,a5
    800017f0:	7422                	ld	s0,40(sp)
    800017f2:	6145                	addi	sp,sp,48
    800017f4:	8082                	ret

00000000800017f6 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017f6:	1141                	addi	sp,sp,-16
    800017f8:	e406                	sd	ra,8(sp)
    800017fa:	e022                	sd	s0,0(sp)
    800017fc:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800017fe:	00001097          	auipc	ra,0x1
    80001802:	fb8080e7          	jalr	-72(ra) # 800027b6 <cpuid>
    80001806:	87aa                	mv	a5,a0
    80001808:	efd5                	bnez	a5,800018c4 <main+0xce>
    consoleinit();
    8000180a:	fffff097          	auipc	ra,0xfffff
    8000180e:	048080e7          	jalr	72(ra) # 80000852 <consoleinit>
    printfinit();
    80001812:	fffff097          	auipc	ra,0xfffff
    80001816:	4be080e7          	jalr	1214(ra) # 80000cd0 <printfinit>
    printf("\n");
    8000181a:	0000a517          	auipc	a0,0xa
    8000181e:	86650513          	addi	a0,a0,-1946 # 8000b080 <etext+0x80>
    80001822:	fffff097          	auipc	ra,0xfffff
    80001826:	206080e7          	jalr	518(ra) # 80000a28 <printf>
    printf("xv6 kernel is booting\n");
    8000182a:	0000a517          	auipc	a0,0xa
    8000182e:	85e50513          	addi	a0,a0,-1954 # 8000b088 <etext+0x88>
    80001832:	fffff097          	auipc	ra,0xfffff
    80001836:	1f6080e7          	jalr	502(ra) # 80000a28 <printf>
    printf("\n");
    8000183a:	0000a517          	auipc	a0,0xa
    8000183e:	84650513          	addi	a0,a0,-1978 # 8000b080 <etext+0x80>
    80001842:	fffff097          	auipc	ra,0xfffff
    80001846:	1e6080e7          	jalr	486(ra) # 80000a28 <printf>
    kinit();         // physical page allocator
    8000184a:	fffff097          	auipc	ra,0xfffff
    8000184e:	794080e7          	jalr	1940(ra) # 80000fde <kinit>
    kvminit();       // create kernel page table
    80001852:	00000097          	auipc	ra,0x0
    80001856:	1f4080e7          	jalr	500(ra) # 80001a46 <kvminit>
    kvminithart();   // turn on paging
    8000185a:	00000097          	auipc	ra,0x0
    8000185e:	212080e7          	jalr	530(ra) # 80001a6c <kvminithart>
    procinit();      // process table
    80001862:	00001097          	auipc	ra,0x1
    80001866:	e8e080e7          	jalr	-370(ra) # 800026f0 <procinit>
    trapinit();      // trap vectors
    8000186a:	00002097          	auipc	ra,0x2
    8000186e:	47a080e7          	jalr	1146(ra) # 80003ce4 <trapinit>
    trapinithart();  // install kernel trap vector
    80001872:	00002097          	auipc	ra,0x2
    80001876:	49c080e7          	jalr	1180(ra) # 80003d0e <trapinithart>
    plicinit();      // set up interrupt controller
    8000187a:	00007097          	auipc	ra,0x7
    8000187e:	310080e7          	jalr	784(ra) # 80008b8a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001882:	00007097          	auipc	ra,0x7
    80001886:	32c080e7          	jalr	812(ra) # 80008bae <plicinithart>
    binit();         // buffer cache
    8000188a:	00003097          	auipc	ra,0x3
    8000188e:	f2a080e7          	jalr	-214(ra) # 800047b4 <binit>
    iinit();         // inode table
    80001892:	00003097          	auipc	ra,0x3
    80001896:	776080e7          	jalr	1910(ra) # 80005008 <iinit>
    fileinit();      // file table
    8000189a:	00005097          	auipc	ra,0x5
    8000189e:	118080e7          	jalr	280(ra) # 800069b2 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a2:	00007097          	auipc	ra,0x7
    800018a6:	3e0080e7          	jalr	992(ra) # 80008c82 <virtio_disk_init>
    userinit();      // first user process
    800018aa:	00001097          	auipc	ra,0x1
    800018ae:	2ee080e7          	jalr	750(ra) # 80002b98 <userinit>
    __sync_synchronize();
    800018b2:	0ff0000f          	fence
    started = 1;
    800018b6:	00013797          	auipc	a5,0x13
    800018ba:	9da78793          	addi	a5,a5,-1574 # 80014290 <started>
    800018be:	4705                	li	a4,1
    800018c0:	c398                	sw	a4,0(a5)
    800018c2:	a0a9                	j	8000190c <main+0x116>
  } else {
    while(started == 0)
    800018c4:	0001                	nop
    800018c6:	00013797          	auipc	a5,0x13
    800018ca:	9ca78793          	addi	a5,a5,-1590 # 80014290 <started>
    800018ce:	439c                	lw	a5,0(a5)
    800018d0:	2781                	sext.w	a5,a5
    800018d2:	dbf5                	beqz	a5,800018c6 <main+0xd0>
      ;
    __sync_synchronize();
    800018d4:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018d8:	00001097          	auipc	ra,0x1
    800018dc:	ede080e7          	jalr	-290(ra) # 800027b6 <cpuid>
    800018e0:	87aa                	mv	a5,a0
    800018e2:	85be                	mv	a1,a5
    800018e4:	00009517          	auipc	a0,0x9
    800018e8:	7bc50513          	addi	a0,a0,1980 # 8000b0a0 <etext+0xa0>
    800018ec:	fffff097          	auipc	ra,0xfffff
    800018f0:	13c080e7          	jalr	316(ra) # 80000a28 <printf>
    kvminithart();    // turn on paging
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	178080e7          	jalr	376(ra) # 80001a6c <kvminithart>
    trapinithart();   // install kernel trap vector
    800018fc:	00002097          	auipc	ra,0x2
    80001900:	412080e7          	jalr	1042(ra) # 80003d0e <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001904:	00007097          	auipc	ra,0x7
    80001908:	2aa080e7          	jalr	682(ra) # 80008bae <plicinithart>
  }

 // changeSchedulingAlgorithm(2);
  scheduler();
    8000190c:	00002097          	auipc	ra,0x2
    80001910:	b08080e7          	jalr	-1272(ra) # 80003414 <scheduler>

0000000080001914 <w_satp>:
{
    80001914:	1101                	addi	sp,sp,-32
    80001916:	ec22                	sd	s0,24(sp)
    80001918:	1000                	addi	s0,sp,32
    8000191a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    8000191e:	fe843783          	ld	a5,-24(s0)
    80001922:	18079073          	csrw	satp,a5
}
    80001926:	0001                	nop
    80001928:	6462                	ld	s0,24(sp)
    8000192a:	6105                	addi	sp,sp,32
    8000192c:	8082                	ret

000000008000192e <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    8000192e:	1141                	addi	sp,sp,-16
    80001930:	e422                	sd	s0,8(sp)
    80001932:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001934:	12000073          	sfence.vma
}
    80001938:	0001                	nop
    8000193a:	6422                	ld	s0,8(sp)
    8000193c:	0141                	addi	sp,sp,16
    8000193e:	8082                	ret

0000000080001940 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001940:	1101                	addi	sp,sp,-32
    80001942:	ec06                	sd	ra,24(sp)
    80001944:	e822                	sd	s0,16(sp)
    80001946:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001948:	fffff097          	auipc	ra,0xfffff
    8000194c:	7d2080e7          	jalr	2002(ra) # 8000111a <kalloc>
    80001950:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001954:	6605                	lui	a2,0x1
    80001956:	4581                	li	a1,0
    80001958:	fe843503          	ld	a0,-24(s0)
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	ae6080e7          	jalr	-1306(ra) # 80001442 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001964:	4719                	li	a4,6
    80001966:	6685                	lui	a3,0x1
    80001968:	10000637          	lui	a2,0x10000
    8000196c:	100005b7          	lui	a1,0x10000
    80001970:	fe843503          	ld	a0,-24(s0)
    80001974:	00000097          	auipc	ra,0x0
    80001978:	298080e7          	jalr	664(ra) # 80001c0c <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    8000197c:	4719                	li	a4,6
    8000197e:	6685                	lui	a3,0x1
    80001980:	10001637          	lui	a2,0x10001
    80001984:	100015b7          	lui	a1,0x10001
    80001988:	fe843503          	ld	a0,-24(s0)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	280080e7          	jalr	640(ra) # 80001c0c <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001994:	4719                	li	a4,6
    80001996:	004006b7          	lui	a3,0x400
    8000199a:	0c000637          	lui	a2,0xc000
    8000199e:	0c0005b7          	lui	a1,0xc000
    800019a2:	fe843503          	ld	a0,-24(s0)
    800019a6:	00000097          	auipc	ra,0x0
    800019aa:	266080e7          	jalr	614(ra) # 80001c0c <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019ae:	00009717          	auipc	a4,0x9
    800019b2:	65270713          	addi	a4,a4,1618 # 8000b000 <etext>
    800019b6:	800007b7          	lui	a5,0x80000
    800019ba:	97ba                	add	a5,a5,a4
    800019bc:	4729                	li	a4,10
    800019be:	86be                	mv	a3,a5
    800019c0:	4785                	li	a5,1
    800019c2:	01f79613          	slli	a2,a5,0x1f
    800019c6:	4785                	li	a5,1
    800019c8:	01f79593          	slli	a1,a5,0x1f
    800019cc:	fe843503          	ld	a0,-24(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	23c080e7          	jalr	572(ra) # 80001c0c <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019d8:	00009597          	auipc	a1,0x9
    800019dc:	62858593          	addi	a1,a1,1576 # 8000b000 <etext>
    800019e0:	00009617          	auipc	a2,0x9
    800019e4:	62060613          	addi	a2,a2,1568 # 8000b000 <etext>
    800019e8:	00009797          	auipc	a5,0x9
    800019ec:	61878793          	addi	a5,a5,1560 # 8000b000 <etext>
    800019f0:	4745                	li	a4,17
    800019f2:	076e                	slli	a4,a4,0x1b
    800019f4:	40f707b3          	sub	a5,a4,a5
    800019f8:	4719                	li	a4,6
    800019fa:	86be                	mv	a3,a5
    800019fc:	fe843503          	ld	a0,-24(s0)
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	20c080e7          	jalr	524(ra) # 80001c0c <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a08:	00008797          	auipc	a5,0x8
    80001a0c:	5f878793          	addi	a5,a5,1528 # 8000a000 <_trampoline>
    80001a10:	4729                	li	a4,10
    80001a12:	6685                	lui	a3,0x1
    80001a14:	863e                	mv	a2,a5
    80001a16:	040007b7          	lui	a5,0x4000
    80001a1a:	17fd                	addi	a5,a5,-1
    80001a1c:	00c79593          	slli	a1,a5,0xc
    80001a20:	fe843503          	ld	a0,-24(s0)
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1e8080e7          	jalr	488(ra) # 80001c0c <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a2c:	fe843503          	ld	a0,-24(s0)
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	c04080e7          	jalr	-1020(ra) # 80002634 <proc_mapstacks>
  
  return kpgtbl;
    80001a38:	fe843783          	ld	a5,-24(s0)
}
    80001a3c:	853e                	mv	a0,a5
    80001a3e:	60e2                	ld	ra,24(sp)
    80001a40:	6442                	ld	s0,16(sp)
    80001a42:	6105                	addi	sp,sp,32
    80001a44:	8082                	ret

0000000080001a46 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a46:	1141                	addi	sp,sp,-16
    80001a48:	e406                	sd	ra,8(sp)
    80001a4a:	e022                	sd	s0,0(sp)
    80001a4c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a4e:	00000097          	auipc	ra,0x0
    80001a52:	ef2080e7          	jalr	-270(ra) # 80001940 <kvmmake>
    80001a56:	872a                	mv	a4,a0
    80001a58:	0000a797          	auipc	a5,0xa
    80001a5c:	5c078793          	addi	a5,a5,1472 # 8000c018 <kernel_pagetable>
    80001a60:	e398                	sd	a4,0(a5)
}
    80001a62:	0001                	nop
    80001a64:	60a2                	ld	ra,8(sp)
    80001a66:	6402                	ld	s0,0(sp)
    80001a68:	0141                	addi	sp,sp,16
    80001a6a:	8082                	ret

0000000080001a6c <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a6c:	1141                	addi	sp,sp,-16
    80001a6e:	e406                	sd	ra,8(sp)
    80001a70:	e022                	sd	s0,0(sp)
    80001a72:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a74:	0000a797          	auipc	a5,0xa
    80001a78:	5a478793          	addi	a5,a5,1444 # 8000c018 <kernel_pagetable>
    80001a7c:	639c                	ld	a5,0(a5)
    80001a7e:	00c7d713          	srli	a4,a5,0xc
    80001a82:	57fd                	li	a5,-1
    80001a84:	17fe                	slli	a5,a5,0x3f
    80001a86:	8fd9                	or	a5,a5,a4
    80001a88:	853e                	mv	a0,a5
    80001a8a:	00000097          	auipc	ra,0x0
    80001a8e:	e8a080e7          	jalr	-374(ra) # 80001914 <w_satp>
  sfence_vma();
    80001a92:	00000097          	auipc	ra,0x0
    80001a96:	e9c080e7          	jalr	-356(ra) # 8000192e <sfence_vma>
}
    80001a9a:	0001                	nop
    80001a9c:	60a2                	ld	ra,8(sp)
    80001a9e:	6402                	ld	s0,0(sp)
    80001aa0:	0141                	addi	sp,sp,16
    80001aa2:	8082                	ret

0000000080001aa4 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa4:	7139                	addi	sp,sp,-64
    80001aa6:	fc06                	sd	ra,56(sp)
    80001aa8:	f822                	sd	s0,48(sp)
    80001aaa:	0080                	addi	s0,sp,64
    80001aac:	fca43c23          	sd	a0,-40(s0)
    80001ab0:	fcb43823          	sd	a1,-48(s0)
    80001ab4:	87b2                	mv	a5,a2
    80001ab6:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001aba:	fd043703          	ld	a4,-48(s0)
    80001abe:	57fd                	li	a5,-1
    80001ac0:	83e9                	srli	a5,a5,0x1a
    80001ac2:	00e7fa63          	bgeu	a5,a4,80001ad6 <walk+0x32>
    panic("walk");
    80001ac6:	00009517          	auipc	a0,0x9
    80001aca:	5f250513          	addi	a0,a0,1522 # 8000b0b8 <etext+0xb8>
    80001ace:	fffff097          	auipc	ra,0xfffff
    80001ad2:	1b0080e7          	jalr	432(ra) # 80000c7e <panic>

  for(int level = 2; level > 0; level--) {
    80001ad6:	4789                	li	a5,2
    80001ad8:	fef42623          	sw	a5,-20(s0)
    80001adc:	a849                	j	80001b6e <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ade:	fec42703          	lw	a4,-20(s0)
    80001ae2:	87ba                	mv	a5,a4
    80001ae4:	0037979b          	slliw	a5,a5,0x3
    80001ae8:	9fb9                	addw	a5,a5,a4
    80001aea:	2781                	sext.w	a5,a5
    80001aec:	27b1                	addiw	a5,a5,12
    80001aee:	2781                	sext.w	a5,a5
    80001af0:	873e                	mv	a4,a5
    80001af2:	fd043783          	ld	a5,-48(s0)
    80001af6:	00e7d7b3          	srl	a5,a5,a4
    80001afa:	1ff7f793          	andi	a5,a5,511
    80001afe:	078e                	slli	a5,a5,0x3
    80001b00:	fd843703          	ld	a4,-40(s0)
    80001b04:	97ba                	add	a5,a5,a4
    80001b06:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0a:	fe043783          	ld	a5,-32(s0)
    80001b0e:	639c                	ld	a5,0(a5)
    80001b10:	8b85                	andi	a5,a5,1
    80001b12:	cb89                	beqz	a5,80001b24 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b14:	fe043783          	ld	a5,-32(s0)
    80001b18:	639c                	ld	a5,0(a5)
    80001b1a:	83a9                	srli	a5,a5,0xa
    80001b1c:	07b2                	slli	a5,a5,0xc
    80001b1e:	fcf43c23          	sd	a5,-40(s0)
    80001b22:	a089                	j	80001b64 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b24:	fcc42783          	lw	a5,-52(s0)
    80001b28:	2781                	sext.w	a5,a5
    80001b2a:	cb91                	beqz	a5,80001b3e <walk+0x9a>
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	5ee080e7          	jalr	1518(ra) # 8000111a <kalloc>
    80001b34:	fca43c23          	sd	a0,-40(s0)
    80001b38:	fd843783          	ld	a5,-40(s0)
    80001b3c:	e399                	bnez	a5,80001b42 <walk+0x9e>
        return 0;
    80001b3e:	4781                	li	a5,0
    80001b40:	a0a9                	j	80001b8a <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b42:	6605                	lui	a2,0x1
    80001b44:	4581                	li	a1,0
    80001b46:	fd843503          	ld	a0,-40(s0)
    80001b4a:	00000097          	auipc	ra,0x0
    80001b4e:	8f8080e7          	jalr	-1800(ra) # 80001442 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b52:	fd843783          	ld	a5,-40(s0)
    80001b56:	83b1                	srli	a5,a5,0xc
    80001b58:	07aa                	slli	a5,a5,0xa
    80001b5a:	0017e713          	ori	a4,a5,1
    80001b5e:	fe043783          	ld	a5,-32(s0)
    80001b62:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b64:	fec42783          	lw	a5,-20(s0)
    80001b68:	37fd                	addiw	a5,a5,-1
    80001b6a:	fef42623          	sw	a5,-20(s0)
    80001b6e:	fec42783          	lw	a5,-20(s0)
    80001b72:	2781                	sext.w	a5,a5
    80001b74:	f6f045e3          	bgtz	a5,80001ade <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b78:	fd043783          	ld	a5,-48(s0)
    80001b7c:	83b1                	srli	a5,a5,0xc
    80001b7e:	1ff7f793          	andi	a5,a5,511
    80001b82:	078e                	slli	a5,a5,0x3
    80001b84:	fd843703          	ld	a4,-40(s0)
    80001b88:	97ba                	add	a5,a5,a4
}
    80001b8a:	853e                	mv	a0,a5
    80001b8c:	70e2                	ld	ra,56(sp)
    80001b8e:	7442                	ld	s0,48(sp)
    80001b90:	6121                	addi	sp,sp,64
    80001b92:	8082                	ret

0000000080001b94 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b94:	7179                	addi	sp,sp,-48
    80001b96:	f406                	sd	ra,40(sp)
    80001b98:	f022                	sd	s0,32(sp)
    80001b9a:	1800                	addi	s0,sp,48
    80001b9c:	fca43c23          	sd	a0,-40(s0)
    80001ba0:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba4:	fd043703          	ld	a4,-48(s0)
    80001ba8:	57fd                	li	a5,-1
    80001baa:	83e9                	srli	a5,a5,0x1a
    80001bac:	00e7f463          	bgeu	a5,a4,80001bb4 <walkaddr+0x20>
    return 0;
    80001bb0:	4781                	li	a5,0
    80001bb2:	a881                	j	80001c02 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb4:	4601                	li	a2,0
    80001bb6:	fd043583          	ld	a1,-48(s0)
    80001bba:	fd843503          	ld	a0,-40(s0)
    80001bbe:	00000097          	auipc	ra,0x0
    80001bc2:	ee6080e7          	jalr	-282(ra) # 80001aa4 <walk>
    80001bc6:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bca:	fe843783          	ld	a5,-24(s0)
    80001bce:	e399                	bnez	a5,80001bd4 <walkaddr+0x40>
    return 0;
    80001bd0:	4781                	li	a5,0
    80001bd2:	a805                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd4:	fe843783          	ld	a5,-24(s0)
    80001bd8:	639c                	ld	a5,0(a5)
    80001bda:	8b85                	andi	a5,a5,1
    80001bdc:	e399                	bnez	a5,80001be2 <walkaddr+0x4e>
    return 0;
    80001bde:	4781                	li	a5,0
    80001be0:	a00d                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be2:	fe843783          	ld	a5,-24(s0)
    80001be6:	639c                	ld	a5,0(a5)
    80001be8:	8bc1                	andi	a5,a5,16
    80001bea:	e399                	bnez	a5,80001bf0 <walkaddr+0x5c>
    return 0;
    80001bec:	4781                	li	a5,0
    80001bee:	a811                	j	80001c02 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf0:	fe843783          	ld	a5,-24(s0)
    80001bf4:	639c                	ld	a5,0(a5)
    80001bf6:	83a9                	srli	a5,a5,0xa
    80001bf8:	07b2                	slli	a5,a5,0xc
    80001bfa:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001bfe:	fe043783          	ld	a5,-32(s0)
}
    80001c02:	853e                	mv	a0,a5
    80001c04:	70a2                	ld	ra,40(sp)
    80001c06:	7402                	ld	s0,32(sp)
    80001c08:	6145                	addi	sp,sp,48
    80001c0a:	8082                	ret

0000000080001c0c <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c0c:	7139                	addi	sp,sp,-64
    80001c0e:	fc06                	sd	ra,56(sp)
    80001c10:	f822                	sd	s0,48(sp)
    80001c12:	0080                	addi	s0,sp,64
    80001c14:	fea43423          	sd	a0,-24(s0)
    80001c18:	feb43023          	sd	a1,-32(s0)
    80001c1c:	fcc43c23          	sd	a2,-40(s0)
    80001c20:	fcd43823          	sd	a3,-48(s0)
    80001c24:	87ba                	mv	a5,a4
    80001c26:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2a:	fcc42783          	lw	a5,-52(s0)
    80001c2e:	873e                	mv	a4,a5
    80001c30:	fd843683          	ld	a3,-40(s0)
    80001c34:	fd043603          	ld	a2,-48(s0)
    80001c38:	fe043583          	ld	a1,-32(s0)
    80001c3c:	fe843503          	ld	a0,-24(s0)
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	026080e7          	jalr	38(ra) # 80001c66 <mappages>
    80001c48:	87aa                	mv	a5,a0
    80001c4a:	cb89                	beqz	a5,80001c5c <kvmmap+0x50>
    panic("kvmmap");
    80001c4c:	00009517          	auipc	a0,0x9
    80001c50:	47450513          	addi	a0,a0,1140 # 8000b0c0 <etext+0xc0>
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	02a080e7          	jalr	42(ra) # 80000c7e <panic>
}
    80001c5c:	0001                	nop
    80001c5e:	70e2                	ld	ra,56(sp)
    80001c60:	7442                	ld	s0,48(sp)
    80001c62:	6121                	addi	sp,sp,64
    80001c64:	8082                	ret

0000000080001c66 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c66:	711d                	addi	sp,sp,-96
    80001c68:	ec86                	sd	ra,88(sp)
    80001c6a:	e8a2                	sd	s0,80(sp)
    80001c6c:	1080                	addi	s0,sp,96
    80001c6e:	fca43423          	sd	a0,-56(s0)
    80001c72:	fcb43023          	sd	a1,-64(s0)
    80001c76:	fac43c23          	sd	a2,-72(s0)
    80001c7a:	fad43823          	sd	a3,-80(s0)
    80001c7e:	87ba                	mv	a5,a4
    80001c80:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001c84:	fb843783          	ld	a5,-72(s0)
    80001c88:	eb89                	bnez	a5,80001c9a <mappages+0x34>
    panic("mappages: size");
    80001c8a:	00009517          	auipc	a0,0x9
    80001c8e:	43e50513          	addi	a0,a0,1086 # 8000b0c8 <etext+0xc8>
    80001c92:	fffff097          	auipc	ra,0xfffff
    80001c96:	fec080e7          	jalr	-20(ra) # 80000c7e <panic>
  
  a = PGROUNDDOWN(va);
    80001c9a:	fc043703          	ld	a4,-64(s0)
    80001c9e:	77fd                	lui	a5,0xfffff
    80001ca0:	8ff9                	and	a5,a5,a4
    80001ca2:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001ca6:	fc043703          	ld	a4,-64(s0)
    80001caa:	fb843783          	ld	a5,-72(s0)
    80001cae:	97ba                	add	a5,a5,a4
    80001cb0:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd5fff>
    80001cb4:	77fd                	lui	a5,0xfffff
    80001cb6:	8ff9                	and	a5,a5,a4
    80001cb8:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001cbc:	4605                	li	a2,1
    80001cbe:	fe843583          	ld	a1,-24(s0)
    80001cc2:	fc843503          	ld	a0,-56(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	dde080e7          	jalr	-546(ra) # 80001aa4 <walk>
    80001cce:	fca43c23          	sd	a0,-40(s0)
    80001cd2:	fd843783          	ld	a5,-40(s0)
    80001cd6:	e399                	bnez	a5,80001cdc <mappages+0x76>
      return -1;
    80001cd8:	57fd                	li	a5,-1
    80001cda:	a085                	j	80001d3a <mappages+0xd4>
    if(*pte & PTE_V)
    80001cdc:	fd843783          	ld	a5,-40(s0)
    80001ce0:	639c                	ld	a5,0(a5)
    80001ce2:	8b85                	andi	a5,a5,1
    80001ce4:	cb89                	beqz	a5,80001cf6 <mappages+0x90>
      panic("mappages: remap");
    80001ce6:	00009517          	auipc	a0,0x9
    80001cea:	3f250513          	addi	a0,a0,1010 # 8000b0d8 <etext+0xd8>
    80001cee:	fffff097          	auipc	ra,0xfffff
    80001cf2:	f90080e7          	jalr	-112(ra) # 80000c7e <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001cf6:	fb043783          	ld	a5,-80(s0)
    80001cfa:	83b1                	srli	a5,a5,0xc
    80001cfc:	00a79713          	slli	a4,a5,0xa
    80001d00:	fac42783          	lw	a5,-84(s0)
    80001d04:	8fd9                	or	a5,a5,a4
    80001d06:	0017e713          	ori	a4,a5,1
    80001d0a:	fd843783          	ld	a5,-40(s0)
    80001d0e:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d10:	fe843703          	ld	a4,-24(s0)
    80001d14:	fe043783          	ld	a5,-32(s0)
    80001d18:	00f70f63          	beq	a4,a5,80001d36 <mappages+0xd0>
      break;
    a += PGSIZE;
    80001d1c:	fe843703          	ld	a4,-24(s0)
    80001d20:	6785                	lui	a5,0x1
    80001d22:	97ba                	add	a5,a5,a4
    80001d24:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d28:	fb043703          	ld	a4,-80(s0)
    80001d2c:	6785                	lui	a5,0x1
    80001d2e:	97ba                	add	a5,a5,a4
    80001d30:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d34:	b761                	j	80001cbc <mappages+0x56>
      break;
    80001d36:	0001                	nop
  }
  return 0;
    80001d38:	4781                	li	a5,0
}
    80001d3a:	853e                	mv	a0,a5
    80001d3c:	60e6                	ld	ra,88(sp)
    80001d3e:	6446                	ld	s0,80(sp)
    80001d40:	6125                	addi	sp,sp,96
    80001d42:	8082                	ret

0000000080001d44 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d44:	715d                	addi	sp,sp,-80
    80001d46:	e486                	sd	ra,72(sp)
    80001d48:	e0a2                	sd	s0,64(sp)
    80001d4a:	0880                	addi	s0,sp,80
    80001d4c:	fca43423          	sd	a0,-56(s0)
    80001d50:	fcb43023          	sd	a1,-64(s0)
    80001d54:	fac43c23          	sd	a2,-72(s0)
    80001d58:	87b6                	mv	a5,a3
    80001d5a:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d5e:	fc043703          	ld	a4,-64(s0)
    80001d62:	6785                	lui	a5,0x1
    80001d64:	17fd                	addi	a5,a5,-1
    80001d66:	8ff9                	and	a5,a5,a4
    80001d68:	cb89                	beqz	a5,80001d7a <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d6a:	00009517          	auipc	a0,0x9
    80001d6e:	37e50513          	addi	a0,a0,894 # 8000b0e8 <etext+0xe8>
    80001d72:	fffff097          	auipc	ra,0xfffff
    80001d76:	f0c080e7          	jalr	-244(ra) # 80000c7e <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d7a:	fc043783          	ld	a5,-64(s0)
    80001d7e:	fef43423          	sd	a5,-24(s0)
    80001d82:	a045                	j	80001e22 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d84:	4601                	li	a2,0
    80001d86:	fe843583          	ld	a1,-24(s0)
    80001d8a:	fc843503          	ld	a0,-56(s0)
    80001d8e:	00000097          	auipc	ra,0x0
    80001d92:	d16080e7          	jalr	-746(ra) # 80001aa4 <walk>
    80001d96:	fea43023          	sd	a0,-32(s0)
    80001d9a:	fe043783          	ld	a5,-32(s0)
    80001d9e:	eb89                	bnez	a5,80001db0 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001da0:	00009517          	auipc	a0,0x9
    80001da4:	36050513          	addi	a0,a0,864 # 8000b100 <etext+0x100>
    80001da8:	fffff097          	auipc	ra,0xfffff
    80001dac:	ed6080e7          	jalr	-298(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    80001db0:	fe043783          	ld	a5,-32(s0)
    80001db4:	639c                	ld	a5,0(a5)
    80001db6:	8b85                	andi	a5,a5,1
    80001db8:	eb89                	bnez	a5,80001dca <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001dba:	00009517          	auipc	a0,0x9
    80001dbe:	35650513          	addi	a0,a0,854 # 8000b110 <etext+0x110>
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	ebc080e7          	jalr	-324(ra) # 80000c7e <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001dca:	fe043783          	ld	a5,-32(s0)
    80001dce:	639c                	ld	a5,0(a5)
    80001dd0:	3ff7f713          	andi	a4,a5,1023
    80001dd4:	4785                	li	a5,1
    80001dd6:	00f71a63          	bne	a4,a5,80001dea <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dda:	00009517          	auipc	a0,0x9
    80001dde:	34e50513          	addi	a0,a0,846 # 8000b128 <etext+0x128>
    80001de2:	fffff097          	auipc	ra,0xfffff
    80001de6:	e9c080e7          	jalr	-356(ra) # 80000c7e <panic>
    if(do_free){
    80001dea:	fb442783          	lw	a5,-76(s0)
    80001dee:	2781                	sext.w	a5,a5
    80001df0:	cf99                	beqz	a5,80001e0e <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001df2:	fe043783          	ld	a5,-32(s0)
    80001df6:	639c                	ld	a5,0(a5)
    80001df8:	83a9                	srli	a5,a5,0xa
    80001dfa:	07b2                	slli	a5,a5,0xc
    80001dfc:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e00:	fd843783          	ld	a5,-40(s0)
    80001e04:	853e                	mv	a0,a5
    80001e06:	fffff097          	auipc	ra,0xfffff
    80001e0a:	270080e7          	jalr	624(ra) # 80001076 <kfree>
    }
    *pte = 0;
    80001e0e:	fe043783          	ld	a5,-32(s0)
    80001e12:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e16:	fe843703          	ld	a4,-24(s0)
    80001e1a:	6785                	lui	a5,0x1
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fef43423          	sd	a5,-24(s0)
    80001e22:	fb843783          	ld	a5,-72(s0)
    80001e26:	00c79713          	slli	a4,a5,0xc
    80001e2a:	fc043783          	ld	a5,-64(s0)
    80001e2e:	97ba                	add	a5,a5,a4
    80001e30:	fe843703          	ld	a4,-24(s0)
    80001e34:	f4f768e3          	bltu	a4,a5,80001d84 <uvmunmap+0x40>
  }
}
    80001e38:	0001                	nop
    80001e3a:	0001                	nop
    80001e3c:	60a6                	ld	ra,72(sp)
    80001e3e:	6406                	ld	s0,64(sp)
    80001e40:	6161                	addi	sp,sp,80
    80001e42:	8082                	ret

0000000080001e44 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e44:	1101                	addi	sp,sp,-32
    80001e46:	ec06                	sd	ra,24(sp)
    80001e48:	e822                	sd	s0,16(sp)
    80001e4a:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	2ce080e7          	jalr	718(ra) # 8000111a <kalloc>
    80001e54:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e58:	fe843783          	ld	a5,-24(s0)
    80001e5c:	e399                	bnez	a5,80001e62 <uvmcreate+0x1e>
    return 0;
    80001e5e:	4781                	li	a5,0
    80001e60:	a819                	j	80001e76 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e62:	6605                	lui	a2,0x1
    80001e64:	4581                	li	a1,0
    80001e66:	fe843503          	ld	a0,-24(s0)
    80001e6a:	fffff097          	auipc	ra,0xfffff
    80001e6e:	5d8080e7          	jalr	1496(ra) # 80001442 <memset>
  return pagetable;
    80001e72:	fe843783          	ld	a5,-24(s0)
}
    80001e76:	853e                	mv	a0,a5
    80001e78:	60e2                	ld	ra,24(sp)
    80001e7a:	6442                	ld	s0,16(sp)
    80001e7c:	6105                	addi	sp,sp,32
    80001e7e:	8082                	ret

0000000080001e80 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e80:	7139                	addi	sp,sp,-64
    80001e82:	fc06                	sd	ra,56(sp)
    80001e84:	f822                	sd	s0,48(sp)
    80001e86:	0080                	addi	s0,sp,64
    80001e88:	fca43c23          	sd	a0,-40(s0)
    80001e8c:	fcb43823          	sd	a1,-48(s0)
    80001e90:	87b2                	mv	a5,a2
    80001e92:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e96:	fcc42783          	lw	a5,-52(s0)
    80001e9a:	0007871b          	sext.w	a4,a5
    80001e9e:	6785                	lui	a5,0x1
    80001ea0:	00f76a63          	bltu	a4,a5,80001eb4 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001ea4:	00009517          	auipc	a0,0x9
    80001ea8:	29c50513          	addi	a0,a0,668 # 8000b140 <etext+0x140>
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	dd2080e7          	jalr	-558(ra) # 80000c7e <panic>
  mem = kalloc();
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	266080e7          	jalr	614(ra) # 8000111a <kalloc>
    80001ebc:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001ec0:	6605                	lui	a2,0x1
    80001ec2:	4581                	li	a1,0
    80001ec4:	fe843503          	ld	a0,-24(s0)
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	57a080e7          	jalr	1402(ra) # 80001442 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ed0:	fe843783          	ld	a5,-24(s0)
    80001ed4:	4779                	li	a4,30
    80001ed6:	86be                	mv	a3,a5
    80001ed8:	6605                	lui	a2,0x1
    80001eda:	4581                	li	a1,0
    80001edc:	fd843503          	ld	a0,-40(s0)
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	d86080e7          	jalr	-634(ra) # 80001c66 <mappages>
  memmove(mem, src, sz);
    80001ee8:	fcc42783          	lw	a5,-52(s0)
    80001eec:	863e                	mv	a2,a5
    80001eee:	fd043583          	ld	a1,-48(s0)
    80001ef2:	fe843503          	ld	a0,-24(s0)
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	630080e7          	jalr	1584(ra) # 80001526 <memmove>
}
    80001efe:	0001                	nop
    80001f00:	70e2                	ld	ra,56(sp)
    80001f02:	7442                	ld	s0,48(sp)
    80001f04:	6121                	addi	sp,sp,64
    80001f06:	8082                	ret

0000000080001f08 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001f08:	7139                	addi	sp,sp,-64
    80001f0a:	fc06                	sd	ra,56(sp)
    80001f0c:	f822                	sd	s0,48(sp)
    80001f0e:	0080                	addi	s0,sp,64
    80001f10:	fca43c23          	sd	a0,-40(s0)
    80001f14:	fcb43823          	sd	a1,-48(s0)
    80001f18:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f1c:	fc843703          	ld	a4,-56(s0)
    80001f20:	fd043783          	ld	a5,-48(s0)
    80001f24:	00f77563          	bgeu	a4,a5,80001f2e <uvmalloc+0x26>
    return oldsz;
    80001f28:	fd043783          	ld	a5,-48(s0)
    80001f2c:	a85d                	j	80001fe2 <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f2e:	fd043703          	ld	a4,-48(s0)
    80001f32:	6785                	lui	a5,0x1
    80001f34:	17fd                	addi	a5,a5,-1
    80001f36:	973e                	add	a4,a4,a5
    80001f38:	77fd                	lui	a5,0xfffff
    80001f3a:	8ff9                	and	a5,a5,a4
    80001f3c:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f40:	fd043783          	ld	a5,-48(s0)
    80001f44:	fef43423          	sd	a5,-24(s0)
    80001f48:	a069                	j	80001fd2 <uvmalloc+0xca>
    mem = kalloc();
    80001f4a:	fffff097          	auipc	ra,0xfffff
    80001f4e:	1d0080e7          	jalr	464(ra) # 8000111a <kalloc>
    80001f52:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f56:	fe043783          	ld	a5,-32(s0)
    80001f5a:	ef89                	bnez	a5,80001f74 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f5c:	fd043603          	ld	a2,-48(s0)
    80001f60:	fe843583          	ld	a1,-24(s0)
    80001f64:	fd843503          	ld	a0,-40(s0)
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	084080e7          	jalr	132(ra) # 80001fec <uvmdealloc>
      return 0;
    80001f70:	4781                	li	a5,0
    80001f72:	a885                	j	80001fe2 <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f74:	6605                	lui	a2,0x1
    80001f76:	4581                	li	a1,0
    80001f78:	fe043503          	ld	a0,-32(s0)
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	4c6080e7          	jalr	1222(ra) # 80001442 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f84:	fe043783          	ld	a5,-32(s0)
    80001f88:	4779                	li	a4,30
    80001f8a:	86be                	mv	a3,a5
    80001f8c:	6605                	lui	a2,0x1
    80001f8e:	fe843583          	ld	a1,-24(s0)
    80001f92:	fd843503          	ld	a0,-40(s0)
    80001f96:	00000097          	auipc	ra,0x0
    80001f9a:	cd0080e7          	jalr	-816(ra) # 80001c66 <mappages>
    80001f9e:	87aa                	mv	a5,a0
    80001fa0:	c39d                	beqz	a5,80001fc6 <uvmalloc+0xbe>
      kfree(mem);
    80001fa2:	fe043503          	ld	a0,-32(s0)
    80001fa6:	fffff097          	auipc	ra,0xfffff
    80001faa:	0d0080e7          	jalr	208(ra) # 80001076 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001fae:	fd043603          	ld	a2,-48(s0)
    80001fb2:	fe843583          	ld	a1,-24(s0)
    80001fb6:	fd843503          	ld	a0,-40(s0)
    80001fba:	00000097          	auipc	ra,0x0
    80001fbe:	032080e7          	jalr	50(ra) # 80001fec <uvmdealloc>
      return 0;
    80001fc2:	4781                	li	a5,0
    80001fc4:	a839                	j	80001fe2 <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fc6:	fe843703          	ld	a4,-24(s0)
    80001fca:	6785                	lui	a5,0x1
    80001fcc:	97ba                	add	a5,a5,a4
    80001fce:	fef43423          	sd	a5,-24(s0)
    80001fd2:	fe843703          	ld	a4,-24(s0)
    80001fd6:	fc843783          	ld	a5,-56(s0)
    80001fda:	f6f768e3          	bltu	a4,a5,80001f4a <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fde:	fc843783          	ld	a5,-56(s0)
}
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	70e2                	ld	ra,56(sp)
    80001fe6:	7442                	ld	s0,48(sp)
    80001fe8:	6121                	addi	sp,sp,64
    80001fea:	8082                	ret

0000000080001fec <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fec:	7139                	addi	sp,sp,-64
    80001fee:	fc06                	sd	ra,56(sp)
    80001ff0:	f822                	sd	s0,48(sp)
    80001ff2:	0080                	addi	s0,sp,64
    80001ff4:	fca43c23          	sd	a0,-40(s0)
    80001ff8:	fcb43823          	sd	a1,-48(s0)
    80001ffc:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002000:	fc843703          	ld	a4,-56(s0)
    80002004:	fd043783          	ld	a5,-48(s0)
    80002008:	00f76563          	bltu	a4,a5,80002012 <uvmdealloc+0x26>
    return oldsz;
    8000200c:	fd043783          	ld	a5,-48(s0)
    80002010:	a885                	j	80002080 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002012:	fc843703          	ld	a4,-56(s0)
    80002016:	6785                	lui	a5,0x1
    80002018:	17fd                	addi	a5,a5,-1
    8000201a:	973e                	add	a4,a4,a5
    8000201c:	77fd                	lui	a5,0xfffff
    8000201e:	8f7d                	and	a4,a4,a5
    80002020:	fd043683          	ld	a3,-48(s0)
    80002024:	6785                	lui	a5,0x1
    80002026:	17fd                	addi	a5,a5,-1
    80002028:	96be                	add	a3,a3,a5
    8000202a:	77fd                	lui	a5,0xfffff
    8000202c:	8ff5                	and	a5,a5,a3
    8000202e:	04f77763          	bgeu	a4,a5,8000207c <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002032:	fd043703          	ld	a4,-48(s0)
    80002036:	6785                	lui	a5,0x1
    80002038:	17fd                	addi	a5,a5,-1
    8000203a:	973e                	add	a4,a4,a5
    8000203c:	77fd                	lui	a5,0xfffff
    8000203e:	8f7d                	and	a4,a4,a5
    80002040:	fc843683          	ld	a3,-56(s0)
    80002044:	6785                	lui	a5,0x1
    80002046:	17fd                	addi	a5,a5,-1
    80002048:	96be                	add	a3,a3,a5
    8000204a:	77fd                	lui	a5,0xfffff
    8000204c:	8ff5                	and	a5,a5,a3
    8000204e:	40f707b3          	sub	a5,a4,a5
    80002052:	83b1                	srli	a5,a5,0xc
    80002054:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002058:	fc843703          	ld	a4,-56(s0)
    8000205c:	6785                	lui	a5,0x1
    8000205e:	17fd                	addi	a5,a5,-1
    80002060:	973e                	add	a4,a4,a5
    80002062:	77fd                	lui	a5,0xfffff
    80002064:	8ff9                	and	a5,a5,a4
    80002066:	fec42703          	lw	a4,-20(s0)
    8000206a:	4685                	li	a3,1
    8000206c:	863a                	mv	a2,a4
    8000206e:	85be                	mv	a1,a5
    80002070:	fd843503          	ld	a0,-40(s0)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	cd0080e7          	jalr	-816(ra) # 80001d44 <uvmunmap>
  }

  return newsz;
    8000207c:	fc843783          	ld	a5,-56(s0)
}
    80002080:	853e                	mv	a0,a5
    80002082:	70e2                	ld	ra,56(sp)
    80002084:	7442                	ld	s0,48(sp)
    80002086:	6121                	addi	sp,sp,64
    80002088:	8082                	ret

000000008000208a <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000208a:	7139                	addi	sp,sp,-64
    8000208c:	fc06                	sd	ra,56(sp)
    8000208e:	f822                	sd	s0,48(sp)
    80002090:	0080                	addi	s0,sp,64
    80002092:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002096:	fe042623          	sw	zero,-20(s0)
    8000209a:	a88d                	j	8000210c <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000209c:	fec42783          	lw	a5,-20(s0)
    800020a0:	078e                	slli	a5,a5,0x3
    800020a2:	fc843703          	ld	a4,-56(s0)
    800020a6:	97ba                	add	a5,a5,a4
    800020a8:	639c                	ld	a5,0(a5)
    800020aa:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020ae:	fe043783          	ld	a5,-32(s0)
    800020b2:	8b85                	andi	a5,a5,1
    800020b4:	cb9d                	beqz	a5,800020ea <freewalk+0x60>
    800020b6:	fe043783          	ld	a5,-32(s0)
    800020ba:	8bb9                	andi	a5,a5,14
    800020bc:	e79d                	bnez	a5,800020ea <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020be:	fe043783          	ld	a5,-32(s0)
    800020c2:	83a9                	srli	a5,a5,0xa
    800020c4:	07b2                	slli	a5,a5,0xc
    800020c6:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020ca:	fd843783          	ld	a5,-40(s0)
    800020ce:	853e                	mv	a0,a5
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	fba080e7          	jalr	-70(ra) # 8000208a <freewalk>
      pagetable[i] = 0;
    800020d8:	fec42783          	lw	a5,-20(s0)
    800020dc:	078e                	slli	a5,a5,0x3
    800020de:	fc843703          	ld	a4,-56(s0)
    800020e2:	97ba                	add	a5,a5,a4
    800020e4:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd6000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020e8:	a829                	j	80002102 <freewalk+0x78>
    } else if(pte & PTE_V){
    800020ea:	fe043783          	ld	a5,-32(s0)
    800020ee:	8b85                	andi	a5,a5,1
    800020f0:	cb89                	beqz	a5,80002102 <freewalk+0x78>
      panic("freewalk: leaf");
    800020f2:	00009517          	auipc	a0,0x9
    800020f6:	06e50513          	addi	a0,a0,110 # 8000b160 <etext+0x160>
    800020fa:	fffff097          	auipc	ra,0xfffff
    800020fe:	b84080e7          	jalr	-1148(ra) # 80000c7e <panic>
  for(int i = 0; i < 512; i++){
    80002102:	fec42783          	lw	a5,-20(s0)
    80002106:	2785                	addiw	a5,a5,1
    80002108:	fef42623          	sw	a5,-20(s0)
    8000210c:	fec42783          	lw	a5,-20(s0)
    80002110:	0007871b          	sext.w	a4,a5
    80002114:	1ff00793          	li	a5,511
    80002118:	f8e7d2e3          	bge	a5,a4,8000209c <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000211c:	fc843503          	ld	a0,-56(s0)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	f56080e7          	jalr	-170(ra) # 80001076 <kfree>
}
    80002128:	0001                	nop
    8000212a:	70e2                	ld	ra,56(sp)
    8000212c:	7442                	ld	s0,48(sp)
    8000212e:	6121                	addi	sp,sp,64
    80002130:	8082                	ret

0000000080002132 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002132:	1101                	addi	sp,sp,-32
    80002134:	ec06                	sd	ra,24(sp)
    80002136:	e822                	sd	s0,16(sp)
    80002138:	1000                	addi	s0,sp,32
    8000213a:	fea43423          	sd	a0,-24(s0)
    8000213e:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002142:	fe043783          	ld	a5,-32(s0)
    80002146:	c385                	beqz	a5,80002166 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002148:	fe043703          	ld	a4,-32(s0)
    8000214c:	6785                	lui	a5,0x1
    8000214e:	17fd                	addi	a5,a5,-1
    80002150:	97ba                	add	a5,a5,a4
    80002152:	83b1                	srli	a5,a5,0xc
    80002154:	4685                	li	a3,1
    80002156:	863e                	mv	a2,a5
    80002158:	4581                	li	a1,0
    8000215a:	fe843503          	ld	a0,-24(s0)
    8000215e:	00000097          	auipc	ra,0x0
    80002162:	be6080e7          	jalr	-1050(ra) # 80001d44 <uvmunmap>
  freewalk(pagetable);
    80002166:	fe843503          	ld	a0,-24(s0)
    8000216a:	00000097          	auipc	ra,0x0
    8000216e:	f20080e7          	jalr	-224(ra) # 8000208a <freewalk>
}
    80002172:	0001                	nop
    80002174:	60e2                	ld	ra,24(sp)
    80002176:	6442                	ld	s0,16(sp)
    80002178:	6105                	addi	sp,sp,32
    8000217a:	8082                	ret

000000008000217c <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000217c:	711d                	addi	sp,sp,-96
    8000217e:	ec86                	sd	ra,88(sp)
    80002180:	e8a2                	sd	s0,80(sp)
    80002182:	1080                	addi	s0,sp,96
    80002184:	faa43c23          	sd	a0,-72(s0)
    80002188:	fab43823          	sd	a1,-80(s0)
    8000218c:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002190:	fe043423          	sd	zero,-24(s0)
    80002194:	a0d9                	j	8000225a <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002196:	4601                	li	a2,0
    80002198:	fe843583          	ld	a1,-24(s0)
    8000219c:	fb843503          	ld	a0,-72(s0)
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	904080e7          	jalr	-1788(ra) # 80001aa4 <walk>
    800021a8:	fea43023          	sd	a0,-32(s0)
    800021ac:	fe043783          	ld	a5,-32(s0)
    800021b0:	eb89                	bnez	a5,800021c2 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021b2:	00009517          	auipc	a0,0x9
    800021b6:	fbe50513          	addi	a0,a0,-66 # 8000b170 <etext+0x170>
    800021ba:	fffff097          	auipc	ra,0xfffff
    800021be:	ac4080e7          	jalr	-1340(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    800021c2:	fe043783          	ld	a5,-32(s0)
    800021c6:	639c                	ld	a5,0(a5)
    800021c8:	8b85                	andi	a5,a5,1
    800021ca:	eb89                	bnez	a5,800021dc <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021cc:	00009517          	auipc	a0,0x9
    800021d0:	fc450513          	addi	a0,a0,-60 # 8000b190 <etext+0x190>
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	aaa080e7          	jalr	-1366(ra) # 80000c7e <panic>
    pa = PTE2PA(*pte);
    800021dc:	fe043783          	ld	a5,-32(s0)
    800021e0:	639c                	ld	a5,0(a5)
    800021e2:	83a9                	srli	a5,a5,0xa
    800021e4:	07b2                	slli	a5,a5,0xc
    800021e6:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021ea:	fe043783          	ld	a5,-32(s0)
    800021ee:	639c                	ld	a5,0(a5)
    800021f0:	2781                	sext.w	a5,a5
    800021f2:	3ff7f793          	andi	a5,a5,1023
    800021f6:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021fa:	fffff097          	auipc	ra,0xfffff
    800021fe:	f20080e7          	jalr	-224(ra) # 8000111a <kalloc>
    80002202:	fca43423          	sd	a0,-56(s0)
    80002206:	fc843783          	ld	a5,-56(s0)
    8000220a:	c3a5                	beqz	a5,8000226a <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000220c:	fd843783          	ld	a5,-40(s0)
    80002210:	6605                	lui	a2,0x1
    80002212:	85be                	mv	a1,a5
    80002214:	fc843503          	ld	a0,-56(s0)
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	30e080e7          	jalr	782(ra) # 80001526 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002220:	fc843783          	ld	a5,-56(s0)
    80002224:	fd442703          	lw	a4,-44(s0)
    80002228:	86be                	mv	a3,a5
    8000222a:	6605                	lui	a2,0x1
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fb043503          	ld	a0,-80(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	a32080e7          	jalr	-1486(ra) # 80001c66 <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	cb81                	beqz	a5,8000224e <uvmcopy+0xd2>
      kfree(mem);
    80002240:	fc843503          	ld	a0,-56(s0)
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	e32080e7          	jalr	-462(ra) # 80001076 <kfree>
      goto err;
    8000224c:	a005                	j	8000226c <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000224e:	fe843703          	ld	a4,-24(s0)
    80002252:	6785                	lui	a5,0x1
    80002254:	97ba                	add	a5,a5,a4
    80002256:	fef43423          	sd	a5,-24(s0)
    8000225a:	fe843703          	ld	a4,-24(s0)
    8000225e:	fa843783          	ld	a5,-88(s0)
    80002262:	f2f76ae3          	bltu	a4,a5,80002196 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002266:	4781                	li	a5,0
    80002268:	a839                	j	80002286 <uvmcopy+0x10a>
      goto err;
    8000226a:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000226c:	fe843783          	ld	a5,-24(s0)
    80002270:	83b1                	srli	a5,a5,0xc
    80002272:	4685                	li	a3,1
    80002274:	863e                	mv	a2,a5
    80002276:	4581                	li	a1,0
    80002278:	fb043503          	ld	a0,-80(s0)
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	ac8080e7          	jalr	-1336(ra) # 80001d44 <uvmunmap>
  return -1;
    80002284:	57fd                	li	a5,-1
}
    80002286:	853e                	mv	a0,a5
    80002288:	60e6                	ld	ra,88(sp)
    8000228a:	6446                	ld	s0,80(sp)
    8000228c:	6125                	addi	sp,sp,96
    8000228e:	8082                	ret

0000000080002290 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002290:	7179                	addi	sp,sp,-48
    80002292:	f406                	sd	ra,40(sp)
    80002294:	f022                	sd	s0,32(sp)
    80002296:	1800                	addi	s0,sp,48
    80002298:	fca43c23          	sd	a0,-40(s0)
    8000229c:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800022a0:	4601                	li	a2,0
    800022a2:	fd043583          	ld	a1,-48(s0)
    800022a6:	fd843503          	ld	a0,-40(s0)
    800022aa:	fffff097          	auipc	ra,0xfffff
    800022ae:	7fa080e7          	jalr	2042(ra) # 80001aa4 <walk>
    800022b2:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022b6:	fe843783          	ld	a5,-24(s0)
    800022ba:	eb89                	bnez	a5,800022cc <uvmclear+0x3c>
    panic("uvmclear");
    800022bc:	00009517          	auipc	a0,0x9
    800022c0:	ef450513          	addi	a0,a0,-268 # 8000b1b0 <etext+0x1b0>
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>
  *pte &= ~PTE_U;
    800022cc:	fe843783          	ld	a5,-24(s0)
    800022d0:	639c                	ld	a5,0(a5)
    800022d2:	fef7f713          	andi	a4,a5,-17
    800022d6:	fe843783          	ld	a5,-24(s0)
    800022da:	e398                	sd	a4,0(a5)
}
    800022dc:	0001                	nop
    800022de:	70a2                	ld	ra,40(sp)
    800022e0:	7402                	ld	s0,32(sp)
    800022e2:	6145                	addi	sp,sp,48
    800022e4:	8082                	ret

00000000800022e6 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022e6:	715d                	addi	sp,sp,-80
    800022e8:	e486                	sd	ra,72(sp)
    800022ea:	e0a2                	sd	s0,64(sp)
    800022ec:	0880                	addi	s0,sp,80
    800022ee:	fca43423          	sd	a0,-56(s0)
    800022f2:	fcb43023          	sd	a1,-64(s0)
    800022f6:	fac43c23          	sd	a2,-72(s0)
    800022fa:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022fe:	a055                	j	800023a2 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002300:	fc043703          	ld	a4,-64(s0)
    80002304:	77fd                	lui	a5,0xfffff
    80002306:	8ff9                	and	a5,a5,a4
    80002308:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000230c:	fe043583          	ld	a1,-32(s0)
    80002310:	fc843503          	ld	a0,-56(s0)
    80002314:	00000097          	auipc	ra,0x0
    80002318:	880080e7          	jalr	-1920(ra) # 80001b94 <walkaddr>
    8000231c:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002320:	fd843783          	ld	a5,-40(s0)
    80002324:	e399                	bnez	a5,8000232a <copyout+0x44>
      return -1;
    80002326:	57fd                	li	a5,-1
    80002328:	a049                	j	800023aa <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000232a:	fe043703          	ld	a4,-32(s0)
    8000232e:	fc043783          	ld	a5,-64(s0)
    80002332:	8f1d                	sub	a4,a4,a5
    80002334:	6785                	lui	a5,0x1
    80002336:	97ba                	add	a5,a5,a4
    80002338:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000233c:	fe843703          	ld	a4,-24(s0)
    80002340:	fb043783          	ld	a5,-80(s0)
    80002344:	00e7f663          	bgeu	a5,a4,80002350 <copyout+0x6a>
      n = len;
    80002348:	fb043783          	ld	a5,-80(s0)
    8000234c:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002350:	fc043703          	ld	a4,-64(s0)
    80002354:	fe043783          	ld	a5,-32(s0)
    80002358:	8f1d                	sub	a4,a4,a5
    8000235a:	fd843783          	ld	a5,-40(s0)
    8000235e:	97ba                	add	a5,a5,a4
    80002360:	873e                	mv	a4,a5
    80002362:	fe843783          	ld	a5,-24(s0)
    80002366:	2781                	sext.w	a5,a5
    80002368:	863e                	mv	a2,a5
    8000236a:	fb843583          	ld	a1,-72(s0)
    8000236e:	853a                	mv	a0,a4
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	1b6080e7          	jalr	438(ra) # 80001526 <memmove>

    len -= n;
    80002378:	fb043703          	ld	a4,-80(s0)
    8000237c:	fe843783          	ld	a5,-24(s0)
    80002380:	40f707b3          	sub	a5,a4,a5
    80002384:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002388:	fb843703          	ld	a4,-72(s0)
    8000238c:	fe843783          	ld	a5,-24(s0)
    80002390:	97ba                	add	a5,a5,a4
    80002392:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002396:	fe043703          	ld	a4,-32(s0)
    8000239a:	6785                	lui	a5,0x1
    8000239c:	97ba                	add	a5,a5,a4
    8000239e:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800023a2:	fb043783          	ld	a5,-80(s0)
    800023a6:	ffa9                	bnez	a5,80002300 <copyout+0x1a>
  }
  return 0;
    800023a8:	4781                	li	a5,0
}
    800023aa:	853e                	mv	a0,a5
    800023ac:	60a6                	ld	ra,72(sp)
    800023ae:	6406                	ld	s0,64(sp)
    800023b0:	6161                	addi	sp,sp,80
    800023b2:	8082                	ret

00000000800023b4 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023b4:	715d                	addi	sp,sp,-80
    800023b6:	e486                	sd	ra,72(sp)
    800023b8:	e0a2                	sd	s0,64(sp)
    800023ba:	0880                	addi	s0,sp,80
    800023bc:	fca43423          	sd	a0,-56(s0)
    800023c0:	fcb43023          	sd	a1,-64(s0)
    800023c4:	fac43c23          	sd	a2,-72(s0)
    800023c8:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023cc:	a055                	j	80002470 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023ce:	fb843703          	ld	a4,-72(s0)
    800023d2:	77fd                	lui	a5,0xfffff
    800023d4:	8ff9                	and	a5,a5,a4
    800023d6:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023da:	fe043583          	ld	a1,-32(s0)
    800023de:	fc843503          	ld	a0,-56(s0)
    800023e2:	fffff097          	auipc	ra,0xfffff
    800023e6:	7b2080e7          	jalr	1970(ra) # 80001b94 <walkaddr>
    800023ea:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023ee:	fd843783          	ld	a5,-40(s0)
    800023f2:	e399                	bnez	a5,800023f8 <copyin+0x44>
      return -1;
    800023f4:	57fd                	li	a5,-1
    800023f6:	a049                	j	80002478 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023f8:	fe043703          	ld	a4,-32(s0)
    800023fc:	fb843783          	ld	a5,-72(s0)
    80002400:	8f1d                	sub	a4,a4,a5
    80002402:	6785                	lui	a5,0x1
    80002404:	97ba                	add	a5,a5,a4
    80002406:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000240a:	fe843703          	ld	a4,-24(s0)
    8000240e:	fb043783          	ld	a5,-80(s0)
    80002412:	00e7f663          	bgeu	a5,a4,8000241e <copyin+0x6a>
      n = len;
    80002416:	fb043783          	ld	a5,-80(s0)
    8000241a:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000241e:	fb843703          	ld	a4,-72(s0)
    80002422:	fe043783          	ld	a5,-32(s0)
    80002426:	8f1d                	sub	a4,a4,a5
    80002428:	fd843783          	ld	a5,-40(s0)
    8000242c:	97ba                	add	a5,a5,a4
    8000242e:	873e                	mv	a4,a5
    80002430:	fe843783          	ld	a5,-24(s0)
    80002434:	2781                	sext.w	a5,a5
    80002436:	863e                	mv	a2,a5
    80002438:	85ba                	mv	a1,a4
    8000243a:	fc043503          	ld	a0,-64(s0)
    8000243e:	fffff097          	auipc	ra,0xfffff
    80002442:	0e8080e7          	jalr	232(ra) # 80001526 <memmove>

    len -= n;
    80002446:	fb043703          	ld	a4,-80(s0)
    8000244a:	fe843783          	ld	a5,-24(s0)
    8000244e:	40f707b3          	sub	a5,a4,a5
    80002452:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002456:	fc043703          	ld	a4,-64(s0)
    8000245a:	fe843783          	ld	a5,-24(s0)
    8000245e:	97ba                	add	a5,a5,a4
    80002460:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002464:	fe043703          	ld	a4,-32(s0)
    80002468:	6785                	lui	a5,0x1
    8000246a:	97ba                	add	a5,a5,a4
    8000246c:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002470:	fb043783          	ld	a5,-80(s0)
    80002474:	ffa9                	bnez	a5,800023ce <copyin+0x1a>
  }
  return 0;
    80002476:	4781                	li	a5,0
}
    80002478:	853e                	mv	a0,a5
    8000247a:	60a6                	ld	ra,72(sp)
    8000247c:	6406                	ld	s0,64(sp)
    8000247e:	6161                	addi	sp,sp,80
    80002480:	8082                	ret

0000000080002482 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002482:	711d                	addi	sp,sp,-96
    80002484:	ec86                	sd	ra,88(sp)
    80002486:	e8a2                	sd	s0,80(sp)
    80002488:	1080                	addi	s0,sp,96
    8000248a:	faa43c23          	sd	a0,-72(s0)
    8000248e:	fab43823          	sd	a1,-80(s0)
    80002492:	fac43423          	sd	a2,-88(s0)
    80002496:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000249a:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000249e:	a0f1                	j	8000256a <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800024a0:	fa843703          	ld	a4,-88(s0)
    800024a4:	77fd                	lui	a5,0xfffff
    800024a6:	8ff9                	and	a5,a5,a4
    800024a8:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800024ac:	fd043583          	ld	a1,-48(s0)
    800024b0:	fb843503          	ld	a0,-72(s0)
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	6e0080e7          	jalr	1760(ra) # 80001b94 <walkaddr>
    800024bc:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024c0:	fc843783          	ld	a5,-56(s0)
    800024c4:	e399                	bnez	a5,800024ca <copyinstr+0x48>
      return -1;
    800024c6:	57fd                	li	a5,-1
    800024c8:	a87d                	j	80002586 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024ca:	fd043703          	ld	a4,-48(s0)
    800024ce:	fa843783          	ld	a5,-88(s0)
    800024d2:	8f1d                	sub	a4,a4,a5
    800024d4:	6785                	lui	a5,0x1
    800024d6:	97ba                	add	a5,a5,a4
    800024d8:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024dc:	fe843703          	ld	a4,-24(s0)
    800024e0:	fa043783          	ld	a5,-96(s0)
    800024e4:	00e7f663          	bgeu	a5,a4,800024f0 <copyinstr+0x6e>
      n = max;
    800024e8:	fa043783          	ld	a5,-96(s0)
    800024ec:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024f0:	fa843703          	ld	a4,-88(s0)
    800024f4:	fd043783          	ld	a5,-48(s0)
    800024f8:	8f1d                	sub	a4,a4,a5
    800024fa:	fc843783          	ld	a5,-56(s0)
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002504:	a891                	j	80002558 <copyinstr+0xd6>
      if(*p == '\0'){
    80002506:	fd843783          	ld	a5,-40(s0)
    8000250a:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000250e:	eb89                	bnez	a5,80002520 <copyinstr+0x9e>
        *dst = '\0';
    80002510:	fb043783          	ld	a5,-80(s0)
    80002514:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002518:	4785                	li	a5,1
    8000251a:	fef42223          	sw	a5,-28(s0)
        break;
    8000251e:	a081                	j	8000255e <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002520:	fd843783          	ld	a5,-40(s0)
    80002524:	0007c703          	lbu	a4,0(a5)
    80002528:	fb043783          	ld	a5,-80(s0)
    8000252c:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002530:	fe843783          	ld	a5,-24(s0)
    80002534:	17fd                	addi	a5,a5,-1
    80002536:	fef43423          	sd	a5,-24(s0)
      --max;
    8000253a:	fa043783          	ld	a5,-96(s0)
    8000253e:	17fd                	addi	a5,a5,-1
    80002540:	faf43023          	sd	a5,-96(s0)
      p++;
    80002544:	fd843783          	ld	a5,-40(s0)
    80002548:	0785                	addi	a5,a5,1
    8000254a:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000254e:	fb043783          	ld	a5,-80(s0)
    80002552:	0785                	addi	a5,a5,1
    80002554:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002558:	fe843783          	ld	a5,-24(s0)
    8000255c:	f7cd                	bnez	a5,80002506 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000255e:	fd043703          	ld	a4,-48(s0)
    80002562:	6785                	lui	a5,0x1
    80002564:	97ba                	add	a5,a5,a4
    80002566:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000256a:	fe442783          	lw	a5,-28(s0)
    8000256e:	2781                	sext.w	a5,a5
    80002570:	e781                	bnez	a5,80002578 <copyinstr+0xf6>
    80002572:	fa043783          	ld	a5,-96(s0)
    80002576:	f78d                	bnez	a5,800024a0 <copyinstr+0x1e>
  }
  if(got_null){
    80002578:	fe442783          	lw	a5,-28(s0)
    8000257c:	2781                	sext.w	a5,a5
    8000257e:	c399                	beqz	a5,80002584 <copyinstr+0x102>
    return 0;
    80002580:	4781                	li	a5,0
    80002582:	a011                	j	80002586 <copyinstr+0x104>
  } else {
    return -1;
    80002584:	57fd                	li	a5,-1
  }
}
    80002586:	853e                	mv	a0,a5
    80002588:	60e6                	ld	ra,88(sp)
    8000258a:	6446                	ld	s0,80(sp)
    8000258c:	6125                	addi	sp,sp,96
    8000258e:	8082                	ret

0000000080002590 <r_sstatus>:
{
    80002590:	1101                	addi	sp,sp,-32
    80002592:	ec22                	sd	s0,24(sp)
    80002594:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002596:	100027f3          	csrr	a5,sstatus
    8000259a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000259e:	fe843783          	ld	a5,-24(s0)
}
    800025a2:	853e                	mv	a0,a5
    800025a4:	6462                	ld	s0,24(sp)
    800025a6:	6105                	addi	sp,sp,32
    800025a8:	8082                	ret

00000000800025aa <w_sstatus>:
{
    800025aa:	1101                	addi	sp,sp,-32
    800025ac:	ec22                	sd	s0,24(sp)
    800025ae:	1000                	addi	s0,sp,32
    800025b0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025b4:	fe843783          	ld	a5,-24(s0)
    800025b8:	10079073          	csrw	sstatus,a5
}
    800025bc:	0001                	nop
    800025be:	6462                	ld	s0,24(sp)
    800025c0:	6105                	addi	sp,sp,32
    800025c2:	8082                	ret

00000000800025c4 <intr_on>:
{
    800025c4:	1141                	addi	sp,sp,-16
    800025c6:	e406                	sd	ra,8(sp)
    800025c8:	e022                	sd	s0,0(sp)
    800025ca:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	fc4080e7          	jalr	-60(ra) # 80002590 <r_sstatus>
    800025d4:	87aa                	mv	a5,a0
    800025d6:	0027e793          	ori	a5,a5,2
    800025da:	853e                	mv	a0,a5
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	fce080e7          	jalr	-50(ra) # 800025aa <w_sstatus>
}
    800025e4:	0001                	nop
    800025e6:	60a2                	ld	ra,8(sp)
    800025e8:	6402                	ld	s0,0(sp)
    800025ea:	0141                	addi	sp,sp,16
    800025ec:	8082                	ret

00000000800025ee <intr_get>:
{
    800025ee:	1101                	addi	sp,sp,-32
    800025f0:	ec06                	sd	ra,24(sp)
    800025f2:	e822                	sd	s0,16(sp)
    800025f4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025f6:	00000097          	auipc	ra,0x0
    800025fa:	f9a080e7          	jalr	-102(ra) # 80002590 <r_sstatus>
    800025fe:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002602:	fe843783          	ld	a5,-24(s0)
    80002606:	8b89                	andi	a5,a5,2
    80002608:	00f037b3          	snez	a5,a5
    8000260c:	0ff7f793          	andi	a5,a5,255
    80002610:	2781                	sext.w	a5,a5
}
    80002612:	853e                	mv	a0,a5
    80002614:	60e2                	ld	ra,24(sp)
    80002616:	6442                	ld	s0,16(sp)
    80002618:	6105                	addi	sp,sp,32
    8000261a:	8082                	ret

000000008000261c <r_tp>:
{
    8000261c:	1101                	addi	sp,sp,-32
    8000261e:	ec22                	sd	s0,24(sp)
    80002620:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002622:	8792                	mv	a5,tp
    80002624:	fef43423          	sd	a5,-24(s0)
  return x;
    80002628:	fe843783          	ld	a5,-24(s0)
}
    8000262c:	853e                	mv	a0,a5
    8000262e:	6462                	ld	s0,24(sp)
    80002630:	6105                	addi	sp,sp,32
    80002632:	8082                	ret

0000000080002634 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002634:	7139                	addi	sp,sp,-64
    80002636:	fc06                	sd	ra,56(sp)
    80002638:	f822                	sd	s0,48(sp)
    8000263a:	0080                	addi	s0,sp,64
    8000263c:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002640:	00012797          	auipc	a5,0x12
    80002644:	09878793          	addi	a5,a5,152 # 800146d8 <proc>
    80002648:	fef43423          	sd	a5,-24(s0)
    8000264c:	a061                	j	800026d4 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    8000264e:	fffff097          	auipc	ra,0xfffff
    80002652:	acc080e7          	jalr	-1332(ra) # 8000111a <kalloc>
    80002656:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000265a:	fe043783          	ld	a5,-32(s0)
    8000265e:	eb89                	bnez	a5,80002670 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002660:	00009517          	auipc	a0,0x9
    80002664:	b6050513          	addi	a0,a0,-1184 # 8000b1c0 <etext+0x1c0>
    80002668:	ffffe097          	auipc	ra,0xffffe
    8000266c:	616080e7          	jalr	1558(ra) # 80000c7e <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002670:	fe843703          	ld	a4,-24(s0)
    80002674:	00012797          	auipc	a5,0x12
    80002678:	06478793          	addi	a5,a5,100 # 800146d8 <proc>
    8000267c:	40f707b3          	sub	a5,a4,a5
    80002680:	4047d713          	srai	a4,a5,0x4
    80002684:	00009797          	auipc	a5,0x9
    80002688:	c7478793          	addi	a5,a5,-908 # 8000b2f8 <etext+0x2f8>
    8000268c:	639c                	ld	a5,0(a5)
    8000268e:	02f707b3          	mul	a5,a4,a5
    80002692:	2781                	sext.w	a5,a5
    80002694:	2785                	addiw	a5,a5,1
    80002696:	2781                	sext.w	a5,a5
    80002698:	00d7979b          	slliw	a5,a5,0xd
    8000269c:	2781                	sext.w	a5,a5
    8000269e:	873e                	mv	a4,a5
    800026a0:	040007b7          	lui	a5,0x4000
    800026a4:	17fd                	addi	a5,a5,-1
    800026a6:	07b2                	slli	a5,a5,0xc
    800026a8:	8f99                	sub	a5,a5,a4
    800026aa:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800026ae:	fe043783          	ld	a5,-32(s0)
    800026b2:	4719                	li	a4,6
    800026b4:	6685                	lui	a3,0x1
    800026b6:	863e                	mv	a2,a5
    800026b8:	fd843583          	ld	a1,-40(s0)
    800026bc:	fc843503          	ld	a0,-56(s0)
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	54c080e7          	jalr	1356(ra) # 80001c0c <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026c8:	fe843783          	ld	a5,-24(s0)
    800026cc:	19078793          	addi	a5,a5,400 # 4000190 <_entry-0x7bfffe70>
    800026d0:	fef43423          	sd	a5,-24(s0)
    800026d4:	fe843703          	ld	a4,-24(s0)
    800026d8:	00018797          	auipc	a5,0x18
    800026dc:	40078793          	addi	a5,a5,1024 # 8001aad8 <pid_lock>
    800026e0:	f6f767e3          	bltu	a4,a5,8000264e <proc_mapstacks+0x1a>
  }
}
    800026e4:	0001                	nop
    800026e6:	0001                	nop
    800026e8:	70e2                	ld	ra,56(sp)
    800026ea:	7442                	ld	s0,48(sp)
    800026ec:	6121                	addi	sp,sp,64
    800026ee:	8082                	ret

00000000800026f0 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026f0:	1101                	addi	sp,sp,-32
    800026f2:	ec06                	sd	ra,24(sp)
    800026f4:	e822                	sd	s0,16(sp)
    800026f6:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800026f8:	00009597          	auipc	a1,0x9
    800026fc:	ad058593          	addi	a1,a1,-1328 # 8000b1c8 <etext+0x1c8>
    80002700:	00018517          	auipc	a0,0x18
    80002704:	3d850513          	addi	a0,a0,984 # 8001aad8 <pid_lock>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	b36080e7          	jalr	-1226(ra) # 8000123e <initlock>
  initlock(&wait_lock, "wait_lock");
    80002710:	00009597          	auipc	a1,0x9
    80002714:	ac058593          	addi	a1,a1,-1344 # 8000b1d0 <etext+0x1d0>
    80002718:	00018517          	auipc	a0,0x18
    8000271c:	3f050513          	addi	a0,a0,1008 # 8001ab08 <wait_lock>
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b1e080e7          	jalr	-1250(ra) # 8000123e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002728:	00012797          	auipc	a5,0x12
    8000272c:	fb078793          	addi	a5,a5,-80 # 800146d8 <proc>
    80002730:	fef43423          	sd	a5,-24(s0)
    80002734:	a09d                	j	8000279a <procinit+0xaa>
      initlock(&p->lock, "proc");
    80002736:	fe843783          	ld	a5,-24(s0)
    8000273a:	00009597          	auipc	a1,0x9
    8000273e:	aa658593          	addi	a1,a1,-1370 # 8000b1e0 <etext+0x1e0>
    80002742:	853e                	mv	a0,a5
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	afa080e7          	jalr	-1286(ra) # 8000123e <initlock>
      p->kstack = KSTACK((int) (p - proc));
    8000274c:	fe843703          	ld	a4,-24(s0)
    80002750:	00012797          	auipc	a5,0x12
    80002754:	f8878793          	addi	a5,a5,-120 # 800146d8 <proc>
    80002758:	40f707b3          	sub	a5,a4,a5
    8000275c:	4047d713          	srai	a4,a5,0x4
    80002760:	00009797          	auipc	a5,0x9
    80002764:	b9878793          	addi	a5,a5,-1128 # 8000b2f8 <etext+0x2f8>
    80002768:	639c                	ld	a5,0(a5)
    8000276a:	02f707b3          	mul	a5,a4,a5
    8000276e:	2781                	sext.w	a5,a5
    80002770:	2785                	addiw	a5,a5,1
    80002772:	2781                	sext.w	a5,a5
    80002774:	00d7979b          	slliw	a5,a5,0xd
    80002778:	2781                	sext.w	a5,a5
    8000277a:	873e                	mv	a4,a5
    8000277c:	040007b7          	lui	a5,0x4000
    80002780:	17fd                	addi	a5,a5,-1
    80002782:	07b2                	slli	a5,a5,0xc
    80002784:	8f99                	sub	a5,a5,a4
    80002786:	873e                	mv	a4,a5
    80002788:	fe843783          	ld	a5,-24(s0)
    8000278c:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    8000278e:	fe843783          	ld	a5,-24(s0)
    80002792:	19078793          	addi	a5,a5,400 # 4000190 <_entry-0x7bfffe70>
    80002796:	fef43423          	sd	a5,-24(s0)
    8000279a:	fe843703          	ld	a4,-24(s0)
    8000279e:	00018797          	auipc	a5,0x18
    800027a2:	33a78793          	addi	a5,a5,826 # 8001aad8 <pid_lock>
    800027a6:	f8f768e3          	bltu	a4,a5,80002736 <procinit+0x46>
  }
}
    800027aa:	0001                	nop
    800027ac:	0001                	nop
    800027ae:	60e2                	ld	ra,24(sp)
    800027b0:	6442                	ld	s0,16(sp)
    800027b2:	6105                	addi	sp,sp,32
    800027b4:	8082                	ret

00000000800027b6 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800027b6:	1101                	addi	sp,sp,-32
    800027b8:	ec06                	sd	ra,24(sp)
    800027ba:	e822                	sd	s0,16(sp)
    800027bc:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027be:	00000097          	auipc	ra,0x0
    800027c2:	e5e080e7          	jalr	-418(ra) # 8000261c <r_tp>
    800027c6:	87aa                	mv	a5,a0
    800027c8:	fef42623          	sw	a5,-20(s0)
  return id;
    800027cc:	fec42783          	lw	a5,-20(s0)
}
    800027d0:	853e                	mv	a0,a5
    800027d2:	60e2                	ld	ra,24(sp)
    800027d4:	6442                	ld	s0,16(sp)
    800027d6:	6105                	addi	sp,sp,32
    800027d8:	8082                	ret

00000000800027da <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027da:	1101                	addi	sp,sp,-32
    800027dc:	ec06                	sd	ra,24(sp)
    800027de:	e822                	sd	s0,16(sp)
    800027e0:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027e2:	00000097          	auipc	ra,0x0
    800027e6:	fd4080e7          	jalr	-44(ra) # 800027b6 <cpuid>
    800027ea:	87aa                	mv	a5,a0
    800027ec:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800027f0:	fec42703          	lw	a4,-20(s0)
    800027f4:	87ba                	mv	a5,a4
    800027f6:	0792                	slli	a5,a5,0x4
    800027f8:	97ba                	add	a5,a5,a4
    800027fa:	078e                	slli	a5,a5,0x3
    800027fc:	00012717          	auipc	a4,0x12
    80002800:	a9c70713          	addi	a4,a4,-1380 # 80014298 <cpus>
    80002804:	97ba                	add	a5,a5,a4
    80002806:	fef43023          	sd	a5,-32(s0)
  return c;
    8000280a:	fe043783          	ld	a5,-32(s0)
}
    8000280e:	853e                	mv	a0,a5
    80002810:	60e2                	ld	ra,24(sp)
    80002812:	6442                	ld	s0,16(sp)
    80002814:	6105                	addi	sp,sp,32
    80002816:	8082                	ret

0000000080002818 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    80002818:	1101                	addi	sp,sp,-32
    8000281a:	ec06                	sd	ra,24(sp)
    8000281c:	e822                	sd	s0,16(sp)
    8000281e:	1000                	addi	s0,sp,32
  push_off();
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	b4c080e7          	jalr	-1204(ra) # 8000136c <push_off>
  struct cpu *c = mycpu();
    80002828:	00000097          	auipc	ra,0x0
    8000282c:	fb2080e7          	jalr	-78(ra) # 800027da <mycpu>
    80002830:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002834:	fe843783          	ld	a5,-24(s0)
    80002838:	639c                	ld	a5,0(a5)
    8000283a:	fef43023          	sd	a5,-32(s0)
  pop_off();
    8000283e:	fffff097          	auipc	ra,0xfffff
    80002842:	b86080e7          	jalr	-1146(ra) # 800013c4 <pop_off>
  return p;
    80002846:	fe043783          	ld	a5,-32(s0)
}
    8000284a:	853e                	mv	a0,a5
    8000284c:	60e2                	ld	ra,24(sp)
    8000284e:	6442                	ld	s0,16(sp)
    80002850:	6105                	addi	sp,sp,32
    80002852:	8082                	ret

0000000080002854 <allocpid>:

int
allocpid() {
    80002854:	1101                	addi	sp,sp,-32
    80002856:	ec06                	sd	ra,24(sp)
    80002858:	e822                	sd	s0,16(sp)
    8000285a:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    8000285c:	00018517          	auipc	a0,0x18
    80002860:	27c50513          	addi	a0,a0,636 # 8001aad8 <pid_lock>
    80002864:	fffff097          	auipc	ra,0xfffff
    80002868:	a0a080e7          	jalr	-1526(ra) # 8000126e <acquire>
  pid = nextpid;
    8000286c:	00009797          	auipc	a5,0x9
    80002870:	f1478793          	addi	a5,a5,-236 # 8000b780 <nextpid>
    80002874:	439c                	lw	a5,0(a5)
    80002876:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    8000287a:	00009797          	auipc	a5,0x9
    8000287e:	f0678793          	addi	a5,a5,-250 # 8000b780 <nextpid>
    80002882:	439c                	lw	a5,0(a5)
    80002884:	2785                	addiw	a5,a5,1
    80002886:	0007871b          	sext.w	a4,a5
    8000288a:	00009797          	auipc	a5,0x9
    8000288e:	ef678793          	addi	a5,a5,-266 # 8000b780 <nextpid>
    80002892:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002894:	00018517          	auipc	a0,0x18
    80002898:	24450513          	addi	a0,a0,580 # 8001aad8 <pid_lock>
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	a36080e7          	jalr	-1482(ra) # 800012d2 <release>

  return pid;
    800028a4:	fec42783          	lw	a5,-20(s0)
}
    800028a8:	853e                	mv	a0,a5
    800028aa:	60e2                	ld	ra,24(sp)
    800028ac:	6442                	ld	s0,16(sp)
    800028ae:	6105                	addi	sp,sp,32
    800028b0:	8082                	ret

00000000800028b2 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    800028b2:	1101                	addi	sp,sp,-32
    800028b4:	ec06                	sd	ra,24(sp)
    800028b6:	e822                	sd	s0,16(sp)
    800028b8:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800028ba:	00012797          	auipc	a5,0x12
    800028be:	e1e78793          	addi	a5,a5,-482 # 800146d8 <proc>
    800028c2:	fef43423          	sd	a5,-24(s0)
    800028c6:	a80d                	j	800028f8 <allocproc+0x46>
    acquire(&p->lock);
    800028c8:	fe843783          	ld	a5,-24(s0)
    800028cc:	853e                	mv	a0,a5
    800028ce:	fffff097          	auipc	ra,0xfffff
    800028d2:	9a0080e7          	jalr	-1632(ra) # 8000126e <acquire>
    if(p->state == UNUSED) {
    800028d6:	fe843783          	ld	a5,-24(s0)
    800028da:	4f9c                	lw	a5,24(a5)
    800028dc:	cb85                	beqz	a5,8000290c <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    800028de:	fe843783          	ld	a5,-24(s0)
    800028e2:	853e                	mv	a0,a5
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	9ee080e7          	jalr	-1554(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028ec:	fe843783          	ld	a5,-24(s0)
    800028f0:	19078793          	addi	a5,a5,400
    800028f4:	fef43423          	sd	a5,-24(s0)
    800028f8:	fe843703          	ld	a4,-24(s0)
    800028fc:	00018797          	auipc	a5,0x18
    80002900:	1dc78793          	addi	a5,a5,476 # 8001aad8 <pid_lock>
    80002904:	fcf762e3          	bltu	a4,a5,800028c8 <allocproc+0x16>
    }
  }
  return 0;
    80002908:	4781                	li	a5,0
    8000290a:	a0e1                	j	800029d2 <allocproc+0x120>
      goto found;
    8000290c:	0001                	nop

found:
  p->pid = allocpid();
    8000290e:	00000097          	auipc	ra,0x0
    80002912:	f46080e7          	jalr	-186(ra) # 80002854 <allocpid>
    80002916:	87aa                	mv	a5,a0
    80002918:	873e                	mv	a4,a5
    8000291a:	fe843783          	ld	a5,-24(s0)
    8000291e:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002920:	fe843783          	ld	a5,-24(s0)
    80002924:	4705                	li	a4,1
    80002926:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002928:	ffffe097          	auipc	ra,0xffffe
    8000292c:	7f2080e7          	jalr	2034(ra) # 8000111a <kalloc>
    80002930:	872a                	mv	a4,a0
    80002932:	fe843783          	ld	a5,-24(s0)
    80002936:	efb8                	sd	a4,88(a5)
    80002938:	fe843783          	ld	a5,-24(s0)
    8000293c:	6fbc                	ld	a5,88(a5)
    8000293e:	e385                	bnez	a5,8000295e <allocproc+0xac>
    freeproc(p);
    80002940:	fe843503          	ld	a0,-24(s0)
    80002944:	00000097          	auipc	ra,0x0
    80002948:	098080e7          	jalr	152(ra) # 800029dc <freeproc>
    release(&p->lock);
    8000294c:	fe843783          	ld	a5,-24(s0)
    80002950:	853e                	mv	a0,a5
    80002952:	fffff097          	auipc	ra,0xfffff
    80002956:	980080e7          	jalr	-1664(ra) # 800012d2 <release>
    return 0;
    8000295a:	4781                	li	a5,0
    8000295c:	a89d                	j	800029d2 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    8000295e:	fe843503          	ld	a0,-24(s0)
    80002962:	00000097          	auipc	ra,0x0
    80002966:	118080e7          	jalr	280(ra) # 80002a7a <proc_pagetable>
    8000296a:	872a                	mv	a4,a0
    8000296c:	fe843783          	ld	a5,-24(s0)
    80002970:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002972:	fe843783          	ld	a5,-24(s0)
    80002976:	6bbc                	ld	a5,80(a5)
    80002978:	e385                	bnez	a5,80002998 <allocproc+0xe6>
    freeproc(p);
    8000297a:	fe843503          	ld	a0,-24(s0)
    8000297e:	00000097          	auipc	ra,0x0
    80002982:	05e080e7          	jalr	94(ra) # 800029dc <freeproc>
    release(&p->lock);
    80002986:	fe843783          	ld	a5,-24(s0)
    8000298a:	853e                	mv	a0,a5
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	946080e7          	jalr	-1722(ra) # 800012d2 <release>
    return 0;
    80002994:	4781                	li	a5,0
    80002996:	a835                	j	800029d2 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002998:	fe843783          	ld	a5,-24(s0)
    8000299c:	06078793          	addi	a5,a5,96
    800029a0:	07000613          	li	a2,112
    800029a4:	4581                	li	a1,0
    800029a6:	853e                	mv	a0,a5
    800029a8:	fffff097          	auipc	ra,0xfffff
    800029ac:	a9a080e7          	jalr	-1382(ra) # 80001442 <memset>
  p->context.ra = (uint64)forkret;
    800029b0:	00001717          	auipc	a4,0x1
    800029b4:	d5c70713          	addi	a4,a4,-676 # 8000370c <forkret>
    800029b8:	fe843783          	ld	a5,-24(s0)
    800029bc:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    800029be:	fe843783          	ld	a5,-24(s0)
    800029c2:	63b8                	ld	a4,64(a5)
    800029c4:	6785                	lui	a5,0x1
    800029c6:	973e                	add	a4,a4,a5
    800029c8:	fe843783          	ld	a5,-24(s0)
    800029cc:	f7b8                	sd	a4,104(a5)

  return p;
    800029ce:	fe843783          	ld	a5,-24(s0)
}
    800029d2:	853e                	mv	a0,a5
    800029d4:	60e2                	ld	ra,24(sp)
    800029d6:	6442                	ld	s0,16(sp)
    800029d8:	6105                	addi	sp,sp,32
    800029da:	8082                	ret

00000000800029dc <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    800029dc:	1101                	addi	sp,sp,-32
    800029de:	ec06                	sd	ra,24(sp)
    800029e0:	e822                	sd	s0,16(sp)
    800029e2:	1000                	addi	s0,sp,32
    800029e4:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    800029e8:	fe843783          	ld	a5,-24(s0)
    800029ec:	6fbc                	ld	a5,88(a5)
    800029ee:	cb89                	beqz	a5,80002a00 <freeproc+0x24>
    kfree((void*)p->trapframe);
    800029f0:	fe843783          	ld	a5,-24(s0)
    800029f4:	6fbc                	ld	a5,88(a5)
    800029f6:	853e                	mv	a0,a5
    800029f8:	ffffe097          	auipc	ra,0xffffe
    800029fc:	67e080e7          	jalr	1662(ra) # 80001076 <kfree>
  p->trapframe = 0;
    80002a00:	fe843783          	ld	a5,-24(s0)
    80002a04:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002a08:	fe843783          	ld	a5,-24(s0)
    80002a0c:	6bbc                	ld	a5,80(a5)
    80002a0e:	cf89                	beqz	a5,80002a28 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002a10:	fe843783          	ld	a5,-24(s0)
    80002a14:	6bb8                	ld	a4,80(a5)
    80002a16:	fe843783          	ld	a5,-24(s0)
    80002a1a:	67bc                	ld	a5,72(a5)
    80002a1c:	85be                	mv	a1,a5
    80002a1e:	853a                	mv	a0,a4
    80002a20:	00000097          	auipc	ra,0x0
    80002a24:	11a080e7          	jalr	282(ra) # 80002b3a <proc_freepagetable>
  p->pagetable = 0;
    80002a28:	fe843783          	ld	a5,-24(s0)
    80002a2c:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002a30:	fe843783          	ld	a5,-24(s0)
    80002a34:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002a38:	fe843783          	ld	a5,-24(s0)
    80002a3c:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002a40:	fe843783          	ld	a5,-24(s0)
    80002a44:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002a48:	fe843783          	ld	a5,-24(s0)
    80002a4c:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002a50:	fe843783          	ld	a5,-24(s0)
    80002a54:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002a58:	fe843783          	ld	a5,-24(s0)
    80002a5c:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002a60:	fe843783          	ld	a5,-24(s0)
    80002a64:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002a68:	fe843783          	ld	a5,-24(s0)
    80002a6c:	0007ac23          	sw	zero,24(a5)
}
    80002a70:	0001                	nop
    80002a72:	60e2                	ld	ra,24(sp)
    80002a74:	6442                	ld	s0,16(sp)
    80002a76:	6105                	addi	sp,sp,32
    80002a78:	8082                	ret

0000000080002a7a <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002a7a:	7179                	addi	sp,sp,-48
    80002a7c:	f406                	sd	ra,40(sp)
    80002a7e:	f022                	sd	s0,32(sp)
    80002a80:	1800                	addi	s0,sp,48
    80002a82:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002a86:	fffff097          	auipc	ra,0xfffff
    80002a8a:	3be080e7          	jalr	958(ra) # 80001e44 <uvmcreate>
    80002a8e:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002a92:	fe843783          	ld	a5,-24(s0)
    80002a96:	e399                	bnez	a5,80002a9c <proc_pagetable+0x22>
    return 0;
    80002a98:	4781                	li	a5,0
    80002a9a:	a859                	j	80002b30 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002a9c:	00007797          	auipc	a5,0x7
    80002aa0:	56478793          	addi	a5,a5,1380 # 8000a000 <_trampoline>
    80002aa4:	4729                	li	a4,10
    80002aa6:	86be                	mv	a3,a5
    80002aa8:	6605                	lui	a2,0x1
    80002aaa:	040007b7          	lui	a5,0x4000
    80002aae:	17fd                	addi	a5,a5,-1
    80002ab0:	00c79593          	slli	a1,a5,0xc
    80002ab4:	fe843503          	ld	a0,-24(s0)
    80002ab8:	fffff097          	auipc	ra,0xfffff
    80002abc:	1ae080e7          	jalr	430(ra) # 80001c66 <mappages>
    80002ac0:	87aa                	mv	a5,a0
    80002ac2:	0007db63          	bgez	a5,80002ad8 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002ac6:	4581                	li	a1,0
    80002ac8:	fe843503          	ld	a0,-24(s0)
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	666080e7          	jalr	1638(ra) # 80002132 <uvmfree>
    return 0;
    80002ad4:	4781                	li	a5,0
    80002ad6:	a8a9                	j	80002b30 <proc_pagetable+0xb6>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002ad8:	fd843783          	ld	a5,-40(s0)
    80002adc:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002ade:	4719                	li	a4,6
    80002ae0:	86be                	mv	a3,a5
    80002ae2:	6605                	lui	a2,0x1
    80002ae4:	020007b7          	lui	a5,0x2000
    80002ae8:	17fd                	addi	a5,a5,-1
    80002aea:	00d79593          	slli	a1,a5,0xd
    80002aee:	fe843503          	ld	a0,-24(s0)
    80002af2:	fffff097          	auipc	ra,0xfffff
    80002af6:	174080e7          	jalr	372(ra) # 80001c66 <mappages>
    80002afa:	87aa                	mv	a5,a0
    80002afc:	0207d863          	bgez	a5,80002b2c <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b00:	4681                	li	a3,0
    80002b02:	4605                	li	a2,1
    80002b04:	040007b7          	lui	a5,0x4000
    80002b08:	17fd                	addi	a5,a5,-1
    80002b0a:	00c79593          	slli	a1,a5,0xc
    80002b0e:	fe843503          	ld	a0,-24(s0)
    80002b12:	fffff097          	auipc	ra,0xfffff
    80002b16:	232080e7          	jalr	562(ra) # 80001d44 <uvmunmap>
    uvmfree(pagetable, 0);
    80002b1a:	4581                	li	a1,0
    80002b1c:	fe843503          	ld	a0,-24(s0)
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	612080e7          	jalr	1554(ra) # 80002132 <uvmfree>
    return 0;
    80002b28:	4781                	li	a5,0
    80002b2a:	a019                	j	80002b30 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002b2c:	fe843783          	ld	a5,-24(s0)
}
    80002b30:	853e                	mv	a0,a5
    80002b32:	70a2                	ld	ra,40(sp)
    80002b34:	7402                	ld	s0,32(sp)
    80002b36:	6145                	addi	sp,sp,48
    80002b38:	8082                	ret

0000000080002b3a <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002b3a:	1101                	addi	sp,sp,-32
    80002b3c:	ec06                	sd	ra,24(sp)
    80002b3e:	e822                	sd	s0,16(sp)
    80002b40:	1000                	addi	s0,sp,32
    80002b42:	fea43423          	sd	a0,-24(s0)
    80002b46:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b4a:	4681                	li	a3,0
    80002b4c:	4605                	li	a2,1
    80002b4e:	040007b7          	lui	a5,0x4000
    80002b52:	17fd                	addi	a5,a5,-1
    80002b54:	00c79593          	slli	a1,a5,0xc
    80002b58:	fe843503          	ld	a0,-24(s0)
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	1e8080e7          	jalr	488(ra) # 80001d44 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002b64:	4681                	li	a3,0
    80002b66:	4605                	li	a2,1
    80002b68:	020007b7          	lui	a5,0x2000
    80002b6c:	17fd                	addi	a5,a5,-1
    80002b6e:	00d79593          	slli	a1,a5,0xd
    80002b72:	fe843503          	ld	a0,-24(s0)
    80002b76:	fffff097          	auipc	ra,0xfffff
    80002b7a:	1ce080e7          	jalr	462(ra) # 80001d44 <uvmunmap>
  uvmfree(pagetable, sz);
    80002b7e:	fe043583          	ld	a1,-32(s0)
    80002b82:	fe843503          	ld	a0,-24(s0)
    80002b86:	fffff097          	auipc	ra,0xfffff
    80002b8a:	5ac080e7          	jalr	1452(ra) # 80002132 <uvmfree>
}
    80002b8e:	0001                	nop
    80002b90:	60e2                	ld	ra,24(sp)
    80002b92:	6442                	ld	s0,16(sp)
    80002b94:	6105                	addi	sp,sp,32
    80002b96:	8082                	ret

0000000080002b98 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002b98:	1101                	addi	sp,sp,-32
    80002b9a:	ec06                	sd	ra,24(sp)
    80002b9c:	e822                	sd	s0,16(sp)
    80002b9e:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	d12080e7          	jalr	-750(ra) # 800028b2 <allocproc>
    80002ba8:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002bac:	00009797          	auipc	a5,0x9
    80002bb0:	47478793          	addi	a5,a5,1140 # 8000c020 <initproc>
    80002bb4:	fe843703          	ld	a4,-24(s0)
    80002bb8:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002bba:	fe843783          	ld	a5,-24(s0)
    80002bbe:	6bbc                	ld	a5,80(a5)
    80002bc0:	03400613          	li	a2,52
    80002bc4:	00009597          	auipc	a1,0x9
    80002bc8:	be458593          	addi	a1,a1,-1052 # 8000b7a8 <initcode>
    80002bcc:	853e                	mv	a0,a5
    80002bce:	fffff097          	auipc	ra,0xfffff
    80002bd2:	2b2080e7          	jalr	690(ra) # 80001e80 <uvminit>
  p->sz = PGSIZE;
    80002bd6:	fe843783          	ld	a5,-24(s0)
    80002bda:	6705                	lui	a4,0x1
    80002bdc:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002bde:	fe843783          	ld	a5,-24(s0)
    80002be2:	6fbc                	ld	a5,88(a5)
    80002be4:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002be8:	fe843783          	ld	a5,-24(s0)
    80002bec:	6fbc                	ld	a5,88(a5)
    80002bee:	6705                	lui	a4,0x1
    80002bf0:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002bf2:	fe843783          	ld	a5,-24(s0)
    80002bf6:	15878793          	addi	a5,a5,344
    80002bfa:	4641                	li	a2,16
    80002bfc:	00008597          	auipc	a1,0x8
    80002c00:	5ec58593          	addi	a1,a1,1516 # 8000b1e8 <etext+0x1e8>
    80002c04:	853e                	mv	a0,a5
    80002c06:	fffff097          	auipc	ra,0xfffff
    80002c0a:	b40080e7          	jalr	-1216(ra) # 80001746 <safestrcpy>
  p->cwd = namei("/");
    80002c0e:	00008517          	auipc	a0,0x8
    80002c12:	5ea50513          	addi	a0,a0,1514 # 8000b1f8 <etext+0x1f8>
    80002c16:	00003097          	auipc	ra,0x3
    80002c1a:	4b2080e7          	jalr	1202(ra) # 800060c8 <namei>
    80002c1e:	872a                	mv	a4,a0
    80002c20:	fe843783          	ld	a5,-24(s0)
    80002c24:	14e7b823          	sd	a4,336(a5)

  put(p);
    80002c28:	fe843503          	ld	a0,-24(s0)
    80002c2c:	00000097          	auipc	ra,0x0
    80002c30:	738080e7          	jalr	1848(ra) # 80003364 <put>

  release(&p->lock);
    80002c34:	fe843783          	ld	a5,-24(s0)
    80002c38:	853e                	mv	a0,a5
    80002c3a:	ffffe097          	auipc	ra,0xffffe
    80002c3e:	698080e7          	jalr	1688(ra) # 800012d2 <release>
}
    80002c42:	0001                	nop
    80002c44:	60e2                	ld	ra,24(sp)
    80002c46:	6442                	ld	s0,16(sp)
    80002c48:	6105                	addi	sp,sp,32
    80002c4a:	8082                	ret

0000000080002c4c <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002c4c:	7179                	addi	sp,sp,-48
    80002c4e:	f406                	sd	ra,40(sp)
    80002c50:	f022                	sd	s0,32(sp)
    80002c52:	1800                	addi	s0,sp,48
    80002c54:	87aa                	mv	a5,a0
    80002c56:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002c5a:	00000097          	auipc	ra,0x0
    80002c5e:	bbe080e7          	jalr	-1090(ra) # 80002818 <myproc>
    80002c62:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002c66:	fe043783          	ld	a5,-32(s0)
    80002c6a:	67bc                	ld	a5,72(a5)
    80002c6c:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002c70:	fdc42783          	lw	a5,-36(s0)
    80002c74:	2781                	sext.w	a5,a5
    80002c76:	02f05e63          	blez	a5,80002cb2 <growproc+0x66>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002c7a:	fe043783          	ld	a5,-32(s0)
    80002c7e:	6bb4                	ld	a3,80(a5)
    80002c80:	fec46583          	lwu	a1,-20(s0)
    80002c84:	fdc42783          	lw	a5,-36(s0)
    80002c88:	fec42703          	lw	a4,-20(s0)
    80002c8c:	9fb9                	addw	a5,a5,a4
    80002c8e:	2781                	sext.w	a5,a5
    80002c90:	1782                	slli	a5,a5,0x20
    80002c92:	9381                	srli	a5,a5,0x20
    80002c94:	863e                	mv	a2,a5
    80002c96:	8536                	mv	a0,a3
    80002c98:	fffff097          	auipc	ra,0xfffff
    80002c9c:	270080e7          	jalr	624(ra) # 80001f08 <uvmalloc>
    80002ca0:	87aa                	mv	a5,a0
    80002ca2:	fef42623          	sw	a5,-20(s0)
    80002ca6:	fec42783          	lw	a5,-20(s0)
    80002caa:	2781                	sext.w	a5,a5
    80002cac:	ef95                	bnez	a5,80002ce8 <growproc+0x9c>
      return -1;
    80002cae:	57fd                	li	a5,-1
    80002cb0:	a091                	j	80002cf4 <growproc+0xa8>
    }
  } else if(n < 0){
    80002cb2:	fdc42783          	lw	a5,-36(s0)
    80002cb6:	2781                	sext.w	a5,a5
    80002cb8:	0207d863          	bgez	a5,80002ce8 <growproc+0x9c>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002cbc:	fe043783          	ld	a5,-32(s0)
    80002cc0:	6bb4                	ld	a3,80(a5)
    80002cc2:	fec46583          	lwu	a1,-20(s0)
    80002cc6:	fdc42783          	lw	a5,-36(s0)
    80002cca:	fec42703          	lw	a4,-20(s0)
    80002cce:	9fb9                	addw	a5,a5,a4
    80002cd0:	2781                	sext.w	a5,a5
    80002cd2:	1782                	slli	a5,a5,0x20
    80002cd4:	9381                	srli	a5,a5,0x20
    80002cd6:	863e                	mv	a2,a5
    80002cd8:	8536                	mv	a0,a3
    80002cda:	fffff097          	auipc	ra,0xfffff
    80002cde:	312080e7          	jalr	786(ra) # 80001fec <uvmdealloc>
    80002ce2:	87aa                	mv	a5,a0
    80002ce4:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002ce8:	fec46703          	lwu	a4,-20(s0)
    80002cec:	fe043783          	ld	a5,-32(s0)
    80002cf0:	e7b8                	sd	a4,72(a5)
  return 0;
    80002cf2:	4781                	li	a5,0
}
    80002cf4:	853e                	mv	a0,a5
    80002cf6:	70a2                	ld	ra,40(sp)
    80002cf8:	7402                	ld	s0,32(sp)
    80002cfa:	6145                	addi	sp,sp,48
    80002cfc:	8082                	ret

0000000080002cfe <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002cfe:	7179                	addi	sp,sp,-48
    80002d00:	f406                	sd	ra,40(sp)
    80002d02:	f022                	sd	s0,32(sp)
    80002d04:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002d06:	00000097          	auipc	ra,0x0
    80002d0a:	b12080e7          	jalr	-1262(ra) # 80002818 <myproc>
    80002d0e:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002d12:	00000097          	auipc	ra,0x0
    80002d16:	ba0080e7          	jalr	-1120(ra) # 800028b2 <allocproc>
    80002d1a:	fca43c23          	sd	a0,-40(s0)
    80002d1e:	fd843783          	ld	a5,-40(s0)
    80002d22:	e399                	bnez	a5,80002d28 <fork+0x2a>
    return -1;
    80002d24:	57fd                	li	a5,-1
    80002d26:	a241                	j	80002ea6 <fork+0x1a8>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002d28:	fe043783          	ld	a5,-32(s0)
    80002d2c:	6bb8                	ld	a4,80(a5)
    80002d2e:	fd843783          	ld	a5,-40(s0)
    80002d32:	6bb4                	ld	a3,80(a5)
    80002d34:	fe043783          	ld	a5,-32(s0)
    80002d38:	67bc                	ld	a5,72(a5)
    80002d3a:	863e                	mv	a2,a5
    80002d3c:	85b6                	mv	a1,a3
    80002d3e:	853a                	mv	a0,a4
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	43c080e7          	jalr	1084(ra) # 8000217c <uvmcopy>
    80002d48:	87aa                	mv	a5,a0
    80002d4a:	0207d163          	bgez	a5,80002d6c <fork+0x6e>
    freeproc(np);
    80002d4e:	fd843503          	ld	a0,-40(s0)
    80002d52:	00000097          	auipc	ra,0x0
    80002d56:	c8a080e7          	jalr	-886(ra) # 800029dc <freeproc>
    release(&np->lock);
    80002d5a:	fd843783          	ld	a5,-40(s0)
    80002d5e:	853e                	mv	a0,a5
    80002d60:	ffffe097          	auipc	ra,0xffffe
    80002d64:	572080e7          	jalr	1394(ra) # 800012d2 <release>
    return -1;
    80002d68:	57fd                	li	a5,-1
    80002d6a:	aa35                	j	80002ea6 <fork+0x1a8>
  }
  np->sz = p->sz;
    80002d6c:	fe043783          	ld	a5,-32(s0)
    80002d70:	67b8                	ld	a4,72(a5)
    80002d72:	fd843783          	ld	a5,-40(s0)
    80002d76:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002d78:	fe043783          	ld	a5,-32(s0)
    80002d7c:	6fb8                	ld	a4,88(a5)
    80002d7e:	fd843783          	ld	a5,-40(s0)
    80002d82:	6fbc                	ld	a5,88(a5)
    80002d84:	86be                	mv	a3,a5
    80002d86:	12000793          	li	a5,288
    80002d8a:	863e                	mv	a2,a5
    80002d8c:	85ba                	mv	a1,a4
    80002d8e:	8536                	mv	a0,a3
    80002d90:	fffff097          	auipc	ra,0xfffff
    80002d94:	872080e7          	jalr	-1934(ra) # 80001602 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002d98:	fd843783          	ld	a5,-40(s0)
    80002d9c:	6fbc                	ld	a5,88(a5)
    80002d9e:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002da2:	fe042623          	sw	zero,-20(s0)
    80002da6:	a0a9                	j	80002df0 <fork+0xf2>
    if(p->ofile[i])
    80002da8:	fe043703          	ld	a4,-32(s0)
    80002dac:	fec42783          	lw	a5,-20(s0)
    80002db0:	07e9                	addi	a5,a5,26
    80002db2:	078e                	slli	a5,a5,0x3
    80002db4:	97ba                	add	a5,a5,a4
    80002db6:	639c                	ld	a5,0(a5)
    80002db8:	c79d                	beqz	a5,80002de6 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002dba:	fe043703          	ld	a4,-32(s0)
    80002dbe:	fec42783          	lw	a5,-20(s0)
    80002dc2:	07e9                	addi	a5,a5,26
    80002dc4:	078e                	slli	a5,a5,0x3
    80002dc6:	97ba                	add	a5,a5,a4
    80002dc8:	639c                	ld	a5,0(a5)
    80002dca:	853e                	mv	a0,a5
    80002dcc:	00004097          	auipc	ra,0x4
    80002dd0:	c94080e7          	jalr	-876(ra) # 80006a60 <filedup>
    80002dd4:	86aa                	mv	a3,a0
    80002dd6:	fd843703          	ld	a4,-40(s0)
    80002dda:	fec42783          	lw	a5,-20(s0)
    80002dde:	07e9                	addi	a5,a5,26
    80002de0:	078e                	slli	a5,a5,0x3
    80002de2:	97ba                	add	a5,a5,a4
    80002de4:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002de6:	fec42783          	lw	a5,-20(s0)
    80002dea:	2785                	addiw	a5,a5,1
    80002dec:	fef42623          	sw	a5,-20(s0)
    80002df0:	fec42783          	lw	a5,-20(s0)
    80002df4:	0007871b          	sext.w	a4,a5
    80002df8:	47bd                	li	a5,15
    80002dfa:	fae7d7e3          	bge	a5,a4,80002da8 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002dfe:	fe043783          	ld	a5,-32(s0)
    80002e02:	1507b783          	ld	a5,336(a5)
    80002e06:	853e                	mv	a0,a5
    80002e08:	00002097          	auipc	ra,0x2
    80002e0c:	57e080e7          	jalr	1406(ra) # 80005386 <idup>
    80002e10:	872a                	mv	a4,a0
    80002e12:	fd843783          	ld	a5,-40(s0)
    80002e16:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002e1a:	fd843783          	ld	a5,-40(s0)
    80002e1e:	15878713          	addi	a4,a5,344
    80002e22:	fe043783          	ld	a5,-32(s0)
    80002e26:	15878793          	addi	a5,a5,344
    80002e2a:	4641                	li	a2,16
    80002e2c:	85be                	mv	a1,a5
    80002e2e:	853a                	mv	a0,a4
    80002e30:	fffff097          	auipc	ra,0xfffff
    80002e34:	916080e7          	jalr	-1770(ra) # 80001746 <safestrcpy>

  pid = np->pid;
    80002e38:	fd843783          	ld	a5,-40(s0)
    80002e3c:	5b9c                	lw	a5,48(a5)
    80002e3e:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002e42:	fd843783          	ld	a5,-40(s0)
    80002e46:	853e                	mv	a0,a5
    80002e48:	ffffe097          	auipc	ra,0xffffe
    80002e4c:	48a080e7          	jalr	1162(ra) # 800012d2 <release>

  acquire(&wait_lock);
    80002e50:	00018517          	auipc	a0,0x18
    80002e54:	cb850513          	addi	a0,a0,-840 # 8001ab08 <wait_lock>
    80002e58:	ffffe097          	auipc	ra,0xffffe
    80002e5c:	416080e7          	jalr	1046(ra) # 8000126e <acquire>
  np->parent = p;
    80002e60:	fd843783          	ld	a5,-40(s0)
    80002e64:	fe043703          	ld	a4,-32(s0)
    80002e68:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002e6a:	00018517          	auipc	a0,0x18
    80002e6e:	c9e50513          	addi	a0,a0,-866 # 8001ab08 <wait_lock>
    80002e72:	ffffe097          	auipc	ra,0xffffe
    80002e76:	460080e7          	jalr	1120(ra) # 800012d2 <release>

  acquire(&np->lock);
    80002e7a:	fd843783          	ld	a5,-40(s0)
    80002e7e:	853e                	mv	a0,a5
    80002e80:	ffffe097          	auipc	ra,0xffffe
    80002e84:	3ee080e7          	jalr	1006(ra) # 8000126e <acquire>
  put(np);
    80002e88:	fd843503          	ld	a0,-40(s0)
    80002e8c:	00000097          	auipc	ra,0x0
    80002e90:	4d8080e7          	jalr	1240(ra) # 80003364 <put>
  release(&np->lock);
    80002e94:	fd843783          	ld	a5,-40(s0)
    80002e98:	853e                	mv	a0,a5
    80002e9a:	ffffe097          	auipc	ra,0xffffe
    80002e9e:	438080e7          	jalr	1080(ra) # 800012d2 <release>

  return pid;
    80002ea2:	fd442783          	lw	a5,-44(s0)
}
    80002ea6:	853e                	mv	a0,a5
    80002ea8:	70a2                	ld	ra,40(sp)
    80002eaa:	7402                	ld	s0,32(sp)
    80002eac:	6145                	addi	sp,sp,48
    80002eae:	8082                	ret

0000000080002eb0 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002eb0:	7179                	addi	sp,sp,-48
    80002eb2:	f406                	sd	ra,40(sp)
    80002eb4:	f022                	sd	s0,32(sp)
    80002eb6:	1800                	addi	s0,sp,48
    80002eb8:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002ebc:	00012797          	auipc	a5,0x12
    80002ec0:	81c78793          	addi	a5,a5,-2020 # 800146d8 <proc>
    80002ec4:	fef43423          	sd	a5,-24(s0)
    80002ec8:	a081                	j	80002f08 <reparent+0x58>
    if(pp->parent == p){
    80002eca:	fe843783          	ld	a5,-24(s0)
    80002ece:	7f9c                	ld	a5,56(a5)
    80002ed0:	fd843703          	ld	a4,-40(s0)
    80002ed4:	02f71463          	bne	a4,a5,80002efc <reparent+0x4c>
      pp->parent = initproc;
    80002ed8:	00009797          	auipc	a5,0x9
    80002edc:	14878793          	addi	a5,a5,328 # 8000c020 <initproc>
    80002ee0:	6398                	ld	a4,0(a5)
    80002ee2:	fe843783          	ld	a5,-24(s0)
    80002ee6:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80002ee8:	00009797          	auipc	a5,0x9
    80002eec:	13878793          	addi	a5,a5,312 # 8000c020 <initproc>
    80002ef0:	639c                	ld	a5,0(a5)
    80002ef2:	853e                	mv	a0,a5
    80002ef4:	00001097          	auipc	ra,0x1
    80002ef8:	8e4080e7          	jalr	-1820(ra) # 800037d8 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002efc:	fe843783          	ld	a5,-24(s0)
    80002f00:	19078793          	addi	a5,a5,400
    80002f04:	fef43423          	sd	a5,-24(s0)
    80002f08:	fe843703          	ld	a4,-24(s0)
    80002f0c:	00018797          	auipc	a5,0x18
    80002f10:	bcc78793          	addi	a5,a5,-1076 # 8001aad8 <pid_lock>
    80002f14:	faf76be3          	bltu	a4,a5,80002eca <reparent+0x1a>
    }
  }
}
    80002f18:	0001                	nop
    80002f1a:	0001                	nop
    80002f1c:	70a2                	ld	ra,40(sp)
    80002f1e:	7402                	ld	s0,32(sp)
    80002f20:	6145                	addi	sp,sp,48
    80002f22:	8082                	ret

0000000080002f24 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002f24:	7139                	addi	sp,sp,-64
    80002f26:	fc06                	sd	ra,56(sp)
    80002f28:	f822                	sd	s0,48(sp)
    80002f2a:	0080                	addi	s0,sp,64
    80002f2c:	87aa                	mv	a5,a0
    80002f2e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002f32:	00000097          	auipc	ra,0x0
    80002f36:	8e6080e7          	jalr	-1818(ra) # 80002818 <myproc>
    80002f3a:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002f3e:	00009797          	auipc	a5,0x9
    80002f42:	0e278793          	addi	a5,a5,226 # 8000c020 <initproc>
    80002f46:	639c                	ld	a5,0(a5)
    80002f48:	fe043703          	ld	a4,-32(s0)
    80002f4c:	00f71a63          	bne	a4,a5,80002f60 <exit+0x3c>
    panic("init exiting");
    80002f50:	00008517          	auipc	a0,0x8
    80002f54:	2b050513          	addi	a0,a0,688 # 8000b200 <etext+0x200>
    80002f58:	ffffe097          	auipc	ra,0xffffe
    80002f5c:	d26080e7          	jalr	-730(ra) # 80000c7e <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80002f60:	fe042623          	sw	zero,-20(s0)
    80002f64:	a881                	j	80002fb4 <exit+0x90>
    if(p->ofile[fd]){
    80002f66:	fe043703          	ld	a4,-32(s0)
    80002f6a:	fec42783          	lw	a5,-20(s0)
    80002f6e:	07e9                	addi	a5,a5,26
    80002f70:	078e                	slli	a5,a5,0x3
    80002f72:	97ba                	add	a5,a5,a4
    80002f74:	639c                	ld	a5,0(a5)
    80002f76:	cb95                	beqz	a5,80002faa <exit+0x86>
      struct file *f = p->ofile[fd];
    80002f78:	fe043703          	ld	a4,-32(s0)
    80002f7c:	fec42783          	lw	a5,-20(s0)
    80002f80:	07e9                	addi	a5,a5,26
    80002f82:	078e                	slli	a5,a5,0x3
    80002f84:	97ba                	add	a5,a5,a4
    80002f86:	639c                	ld	a5,0(a5)
    80002f88:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80002f8c:	fd843503          	ld	a0,-40(s0)
    80002f90:	00004097          	auipc	ra,0x4
    80002f94:	b36080e7          	jalr	-1226(ra) # 80006ac6 <fileclose>
      p->ofile[fd] = 0;
    80002f98:	fe043703          	ld	a4,-32(s0)
    80002f9c:	fec42783          	lw	a5,-20(s0)
    80002fa0:	07e9                	addi	a5,a5,26
    80002fa2:	078e                	slli	a5,a5,0x3
    80002fa4:	97ba                	add	a5,a5,a4
    80002fa6:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80002faa:	fec42783          	lw	a5,-20(s0)
    80002fae:	2785                	addiw	a5,a5,1
    80002fb0:	fef42623          	sw	a5,-20(s0)
    80002fb4:	fec42783          	lw	a5,-20(s0)
    80002fb8:	0007871b          	sext.w	a4,a5
    80002fbc:	47bd                	li	a5,15
    80002fbe:	fae7d4e3          	bge	a5,a4,80002f66 <exit+0x42>
    }
  }

  begin_op();
    80002fc2:	00003097          	auipc	ra,0x3
    80002fc6:	46a080e7          	jalr	1130(ra) # 8000642c <begin_op>
  iput(p->cwd);
    80002fca:	fe043783          	ld	a5,-32(s0)
    80002fce:	1507b783          	ld	a5,336(a5)
    80002fd2:	853e                	mv	a0,a5
    80002fd4:	00002097          	auipc	ra,0x2
    80002fd8:	58c080e7          	jalr	1420(ra) # 80005560 <iput>
  end_op();
    80002fdc:	00003097          	auipc	ra,0x3
    80002fe0:	512080e7          	jalr	1298(ra) # 800064ee <end_op>
  p->cwd = 0;
    80002fe4:	fe043783          	ld	a5,-32(s0)
    80002fe8:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80002fec:	00018517          	auipc	a0,0x18
    80002ff0:	b1c50513          	addi	a0,a0,-1252 # 8001ab08 <wait_lock>
    80002ff4:	ffffe097          	auipc	ra,0xffffe
    80002ff8:	27a080e7          	jalr	634(ra) # 8000126e <acquire>

  // Give any children to init.
  reparent(p);
    80002ffc:	fe043503          	ld	a0,-32(s0)
    80003000:	00000097          	auipc	ra,0x0
    80003004:	eb0080e7          	jalr	-336(ra) # 80002eb0 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003008:	fe043783          	ld	a5,-32(s0)
    8000300c:	7f9c                	ld	a5,56(a5)
    8000300e:	853e                	mv	a0,a5
    80003010:	00000097          	auipc	ra,0x0
    80003014:	7c8080e7          	jalr	1992(ra) # 800037d8 <wakeup>
  
  acquire(&p->lock);
    80003018:	fe043783          	ld	a5,-32(s0)
    8000301c:	853e                	mv	a0,a5
    8000301e:	ffffe097          	auipc	ra,0xffffe
    80003022:	250080e7          	jalr	592(ra) # 8000126e <acquire>

  p->xstate = status;
    80003026:	fe043783          	ld	a5,-32(s0)
    8000302a:	fcc42703          	lw	a4,-52(s0)
    8000302e:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003030:	fe043783          	ld	a5,-32(s0)
    80003034:	4715                	li	a4,5
    80003036:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003038:	00018517          	auipc	a0,0x18
    8000303c:	ad050513          	addi	a0,a0,-1328 # 8001ab08 <wait_lock>
    80003040:	ffffe097          	auipc	ra,0xffffe
    80003044:	292080e7          	jalr	658(ra) # 800012d2 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003048:	00000097          	auipc	ra,0x0
    8000304c:	594080e7          	jalr	1428(ra) # 800035dc <sched>
  panic("zombie exit");
    80003050:	00008517          	auipc	a0,0x8
    80003054:	1c050513          	addi	a0,a0,448 # 8000b210 <etext+0x210>
    80003058:	ffffe097          	auipc	ra,0xffffe
    8000305c:	c26080e7          	jalr	-986(ra) # 80000c7e <panic>

0000000080003060 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    80003060:	7139                	addi	sp,sp,-64
    80003062:	fc06                	sd	ra,56(sp)
    80003064:	f822                	sd	s0,48(sp)
    80003066:	0080                	addi	s0,sp,64
    80003068:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    8000306c:	fffff097          	auipc	ra,0xfffff
    80003070:	7ac080e7          	jalr	1964(ra) # 80002818 <myproc>
    80003074:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003078:	00018517          	auipc	a0,0x18
    8000307c:	a9050513          	addi	a0,a0,-1392 # 8001ab08 <wait_lock>
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	1ee080e7          	jalr	494(ra) # 8000126e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003088:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    8000308c:	00011797          	auipc	a5,0x11
    80003090:	64c78793          	addi	a5,a5,1612 # 800146d8 <proc>
    80003094:	fef43423          	sd	a5,-24(s0)
    80003098:	a8d1                	j	8000316c <wait+0x10c>
      if(np->parent == p){
    8000309a:	fe843783          	ld	a5,-24(s0)
    8000309e:	7f9c                	ld	a5,56(a5)
    800030a0:	fd843703          	ld	a4,-40(s0)
    800030a4:	0af71e63          	bne	a4,a5,80003160 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&np->lock);
    800030a8:	fe843783          	ld	a5,-24(s0)
    800030ac:	853e                	mv	a0,a5
    800030ae:	ffffe097          	auipc	ra,0xffffe
    800030b2:	1c0080e7          	jalr	448(ra) # 8000126e <acquire>

        havekids = 1;
    800030b6:	4785                	li	a5,1
    800030b8:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    800030bc:	fe843783          	ld	a5,-24(s0)
    800030c0:	4f9c                	lw	a5,24(a5)
    800030c2:	873e                	mv	a4,a5
    800030c4:	4795                	li	a5,5
    800030c6:	08f71663          	bne	a4,a5,80003152 <wait+0xf2>
          // Found one.
          pid = np->pid;
    800030ca:	fe843783          	ld	a5,-24(s0)
    800030ce:	5b9c                	lw	a5,48(a5)
    800030d0:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    800030d4:	fc843783          	ld	a5,-56(s0)
    800030d8:	c7a9                	beqz	a5,80003122 <wait+0xc2>
    800030da:	fd843783          	ld	a5,-40(s0)
    800030de:	6bb8                	ld	a4,80(a5)
    800030e0:	fe843783          	ld	a5,-24(s0)
    800030e4:	02c78793          	addi	a5,a5,44
    800030e8:	4691                	li	a3,4
    800030ea:	863e                	mv	a2,a5
    800030ec:	fc843583          	ld	a1,-56(s0)
    800030f0:	853a                	mv	a0,a4
    800030f2:	fffff097          	auipc	ra,0xfffff
    800030f6:	1f4080e7          	jalr	500(ra) # 800022e6 <copyout>
    800030fa:	87aa                	mv	a5,a0
    800030fc:	0207d363          	bgez	a5,80003122 <wait+0xc2>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    80003100:	fe843783          	ld	a5,-24(s0)
    80003104:	853e                	mv	a0,a5
    80003106:	ffffe097          	auipc	ra,0xffffe
    8000310a:	1cc080e7          	jalr	460(ra) # 800012d2 <release>
            release(&wait_lock);
    8000310e:	00018517          	auipc	a0,0x18
    80003112:	9fa50513          	addi	a0,a0,-1542 # 8001ab08 <wait_lock>
    80003116:	ffffe097          	auipc	ra,0xffffe
    8000311a:	1bc080e7          	jalr	444(ra) # 800012d2 <release>
            return -1;
    8000311e:	57fd                	li	a5,-1
    80003120:	a859                	j	800031b6 <wait+0x156>
          }
          freeproc(np);
    80003122:	fe843503          	ld	a0,-24(s0)
    80003126:	00000097          	auipc	ra,0x0
    8000312a:	8b6080e7          	jalr	-1866(ra) # 800029dc <freeproc>
          release(&np->lock);
    8000312e:	fe843783          	ld	a5,-24(s0)
    80003132:	853e                	mv	a0,a5
    80003134:	ffffe097          	auipc	ra,0xffffe
    80003138:	19e080e7          	jalr	414(ra) # 800012d2 <release>
          release(&wait_lock);
    8000313c:	00018517          	auipc	a0,0x18
    80003140:	9cc50513          	addi	a0,a0,-1588 # 8001ab08 <wait_lock>
    80003144:	ffffe097          	auipc	ra,0xffffe
    80003148:	18e080e7          	jalr	398(ra) # 800012d2 <release>
          return pid;
    8000314c:	fd442783          	lw	a5,-44(s0)
    80003150:	a09d                	j	800031b6 <wait+0x156>
        }
        release(&np->lock);
    80003152:	fe843783          	ld	a5,-24(s0)
    80003156:	853e                	mv	a0,a5
    80003158:	ffffe097          	auipc	ra,0xffffe
    8000315c:	17a080e7          	jalr	378(ra) # 800012d2 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    80003160:	fe843783          	ld	a5,-24(s0)
    80003164:	19078793          	addi	a5,a5,400
    80003168:	fef43423          	sd	a5,-24(s0)
    8000316c:	fe843703          	ld	a4,-24(s0)
    80003170:	00018797          	auipc	a5,0x18
    80003174:	96878793          	addi	a5,a5,-1688 # 8001aad8 <pid_lock>
    80003178:	f2f761e3          	bltu	a4,a5,8000309a <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    8000317c:	fe442783          	lw	a5,-28(s0)
    80003180:	2781                	sext.w	a5,a5
    80003182:	c789                	beqz	a5,8000318c <wait+0x12c>
    80003184:	fd843783          	ld	a5,-40(s0)
    80003188:	579c                	lw	a5,40(a5)
    8000318a:	cb99                	beqz	a5,800031a0 <wait+0x140>
      release(&wait_lock);
    8000318c:	00018517          	auipc	a0,0x18
    80003190:	97c50513          	addi	a0,a0,-1668 # 8001ab08 <wait_lock>
    80003194:	ffffe097          	auipc	ra,0xffffe
    80003198:	13e080e7          	jalr	318(ra) # 800012d2 <release>
      return -1;
    8000319c:	57fd                	li	a5,-1
    8000319e:	a821                	j	800031b6 <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800031a0:	00018597          	auipc	a1,0x18
    800031a4:	96858593          	addi	a1,a1,-1688 # 8001ab08 <wait_lock>
    800031a8:	fd843503          	ld	a0,-40(s0)
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	5b0080e7          	jalr	1456(ra) # 8000375c <sleep>
    havekids = 0;
    800031b4:	bdd1                	j	80003088 <wait+0x28>
  }
}
    800031b6:	853e                	mv	a0,a5
    800031b8:	70e2                	ld	ra,56(sp)
    800031ba:	7442                	ld	s0,48(sp)
    800031bc:	6121                	addi	sp,sp,64
    800031be:	8082                	ret

00000000800031c0 <getCFS>:

//TO DO: Test da li syscall za promenu algoritma stvarno menja algoritam

struct proc*
getCFS(void)
{
    800031c0:	1101                	addi	sp,sp,-32
    800031c2:	ec06                	sd	ra,24(sp)
    800031c4:	e822                	sd	s0,16(sp)
    800031c6:	1000                	addi	s0,sp,32
    struct proc *p;
    struct proc *shortestExecutionTimeP; //var for storing the shortest process next in line for using the processor za CFS
    for(p = proc; p < &proc[NPROC]; p++)
    800031c8:	00011797          	auipc	a5,0x11
    800031cc:	51078793          	addi	a5,a5,1296 # 800146d8 <proc>
    800031d0:	fef43423          	sd	a5,-24(s0)
    800031d4:	a0ad                	j	8000323e <getCFS+0x7e>
    {
        acquire(&p->lock);
    800031d6:	fe843783          	ld	a5,-24(s0)
    800031da:	853e                	mv	a0,a5
    800031dc:	ffffe097          	auipc	ra,0xffffe
    800031e0:	092080e7          	jalr	146(ra) # 8000126e <acquire>
        if(p->state == RUNNABLE)
    800031e4:	fe843783          	ld	a5,-24(s0)
    800031e8:	4f9c                	lw	a5,24(a5)
    800031ea:	873e                	mv	a4,a5
    800031ec:	478d                	li	a5,3
    800031ee:	02f71b63          	bne	a4,a5,80003224 <getCFS+0x64>
        {
            shortestExecutionTimeP=p;
    800031f2:	fe843783          	ld	a5,-24(s0)
    800031f6:	fef43023          	sd	a5,-32(s0)
            if (shortestExecutionTimeP == 0) shortestExecutionTimeP = p;//prvi spreman proces
    800031fa:	fe043783          	ld	a5,-32(s0)
    800031fe:	e789                	bnez	a5,80003208 <getCFS+0x48>
    80003200:	fe843783          	ld	a5,-24(s0)
    80003204:	fef43023          	sd	a5,-32(s0)
            if (shortestExecutionTimeP->executionTime > p->executionTime) {
    80003208:	fe043783          	ld	a5,-32(s0)
    8000320c:	1807b703          	ld	a4,384(a5)
    80003210:	fe843783          	ld	a5,-24(s0)
    80003214:	1807b783          	ld	a5,384(a5)
    80003218:	00e7f663          	bgeu	a5,a4,80003224 <getCFS+0x64>
                shortestExecutionTimeP = p;
    8000321c:	fe843783          	ld	a5,-24(s0)
    80003220:	fef43023          	sd	a5,-32(s0)
            }
        }

        release(&p->lock);
    80003224:	fe843783          	ld	a5,-24(s0)
    80003228:	853e                	mv	a0,a5
    8000322a:	ffffe097          	auipc	ra,0xffffe
    8000322e:	0a8080e7          	jalr	168(ra) # 800012d2 <release>
    for(p = proc; p < &proc[NPROC]; p++)
    80003232:	fe843783          	ld	a5,-24(s0)
    80003236:	19078793          	addi	a5,a5,400
    8000323a:	fef43423          	sd	a5,-24(s0)
    8000323e:	fe843703          	ld	a4,-24(s0)
    80003242:	00018797          	auipc	a5,0x18
    80003246:	89678793          	addi	a5,a5,-1898 # 8001aad8 <pid_lock>
    8000324a:	f8f766e3          	bltu	a4,a5,800031d6 <getCFS+0x16>
    }

    if(shortestExecutionTimeP)
    8000324e:	fe043783          	ld	a5,-32(s0)
    80003252:	c3a1                	beqz	a5,80003292 <getCFS+0xd2>
    {
        acquire(&shortestExecutionTimeP->lock);
    80003254:	fe043783          	ld	a5,-32(s0)
    80003258:	853e                	mv	a0,a5
    8000325a:	ffffe097          	auipc	ra,0xffffe
    8000325e:	014080e7          	jalr	20(ra) # 8000126e <acquire>
        shortestExecutionTimeP->state=RUNNING;
    80003262:	fe043783          	ld	a5,-32(s0)
    80003266:	4711                	li	a4,4
    80003268:	cf98                	sw	a4,24(a5)
        shortestExecutionTimeP->executionTime = (ticks - shortestExecutionTimeP->startTime) / NPROC;
    8000326a:	00009797          	auipc	a5,0x9
    8000326e:	dbe78793          	addi	a5,a5,-578 # 8000c028 <ticks>
    80003272:	439c                	lw	a5,0(a5)
    80003274:	02079713          	slli	a4,a5,0x20
    80003278:	9301                	srli	a4,a4,0x20
    8000327a:	fe043783          	ld	a5,-32(s0)
    8000327e:	1787b783          	ld	a5,376(a5)
    80003282:	40f707b3          	sub	a5,a4,a5
    80003286:	0067d713          	srli	a4,a5,0x6
    8000328a:	fe043783          	ld	a5,-32(s0)
    8000328e:	18e7b023          	sd	a4,384(a5)
    }
    return shortestExecutionTimeP;
    80003292:	fe043783          	ld	a5,-32(s0)
}
    80003296:	853e                	mv	a0,a5
    80003298:	60e2                	ld	ra,24(sp)
    8000329a:	6442                	ld	s0,16(sp)
    8000329c:	6105                	addi	sp,sp,32
    8000329e:	8082                	ret

00000000800032a0 <getSJF>:

struct proc*
getSJF(void)
{
    800032a0:	7179                	addi	sp,sp,-48
    800032a2:	f406                	sd	ra,40(sp)
    800032a4:	f022                	sd	s0,32(sp)
    800032a6:	1800                	addi	s0,sp,48
    Time min_time=~0; //For calculating min time
    800032a8:	57fd                	li	a5,-1
    800032aa:	fef42623          	sw	a5,-20(s0)
    struct proc *chosen; //For SJF for the process with the shortest execution time
    struct proc *p;

    for(p = proc; p < &proc[NPROC]; p++)
    800032ae:	00011797          	auipc	a5,0x11
    800032b2:	42a78793          	addi	a5,a5,1066 # 800146d8 <proc>
    800032b6:	fcf43c23          	sd	a5,-40(s0)
    800032ba:	a8b9                	j	80003318 <getSJF+0x78>
    {
        acquire(&p->lock);
    800032bc:	fd843783          	ld	a5,-40(s0)
    800032c0:	853e                	mv	a0,a5
    800032c2:	ffffe097          	auipc	ra,0xffffe
    800032c6:	fac080e7          	jalr	-84(ra) # 8000126e <acquire>
        //proveravamo da li je proces alociran i spreman
        if(p->state == RUNNABLE && p->prediction<=min_time)
    800032ca:	fd843783          	ld	a5,-40(s0)
    800032ce:	4f9c                	lw	a5,24(a5)
    800032d0:	873e                	mv	a4,a5
    800032d2:	478d                	li	a5,3
    800032d4:	02f71563          	bne	a4,a5,800032fe <getSJF+0x5e>
    800032d8:	fd843783          	ld	a5,-40(s0)
    800032dc:	1687a703          	lw	a4,360(a5)
    800032e0:	fec42783          	lw	a5,-20(s0)
    800032e4:	2781                	sext.w	a5,a5
    800032e6:	00e7ec63          	bltu	a5,a4,800032fe <getSJF+0x5e>
        {
            min_time=p->prediction;
    800032ea:	fd843783          	ld	a5,-40(s0)
    800032ee:	1687a783          	lw	a5,360(a5)
    800032f2:	fef42623          	sw	a5,-20(s0)
            chosen=p;
    800032f6:	fd843783          	ld	a5,-40(s0)
    800032fa:	fef43023          	sd	a5,-32(s0)
        }
        release(&p->lock);
    800032fe:	fd843783          	ld	a5,-40(s0)
    80003302:	853e                	mv	a0,a5
    80003304:	ffffe097          	auipc	ra,0xffffe
    80003308:	fce080e7          	jalr	-50(ra) # 800012d2 <release>
    for(p = proc; p < &proc[NPROC]; p++)
    8000330c:	fd843783          	ld	a5,-40(s0)
    80003310:	19078793          	addi	a5,a5,400
    80003314:	fcf43c23          	sd	a5,-40(s0)
    80003318:	fd843703          	ld	a4,-40(s0)
    8000331c:	00017797          	auipc	a5,0x17
    80003320:	7bc78793          	addi	a5,a5,1980 # 8001aad8 <pid_lock>
    80003324:	f8f76ce3          	bltu	a4,a5,800032bc <getSJF+0x1c>
    }
    if(chosen)
    80003328:	fe043783          	ld	a5,-32(s0)
    8000332c:	c78d                	beqz	a5,80003356 <getSJF+0xb6>
    {
        acquire(&chosen->lock);
    8000332e:	fe043783          	ld	a5,-32(s0)
    80003332:	853e                	mv	a0,a5
    80003334:	ffffe097          	auipc	ra,0xffffe
    80003338:	f3a080e7          	jalr	-198(ra) # 8000126e <acquire>
        chosen->state=RUNNING;
    8000333c:	fe043783          	ld	a5,-32(s0)
    80003340:	4711                	li	a4,4
    80003342:	cf98                	sw	a4,24(a5)
        chosen->begin_process_time=ticks;
    80003344:	00009797          	auipc	a5,0x9
    80003348:	ce478793          	addi	a5,a5,-796 # 8000c028 <ticks>
    8000334c:	4398                	lw	a4,0(a5)
    8000334e:	fe043783          	ld	a5,-32(s0)
    80003352:	16e7a823          	sw	a4,368(a5)
    }
    return chosen;
    80003356:	fe043783          	ld	a5,-32(s0)
}
    8000335a:	853e                	mv	a0,a5
    8000335c:	70a2                	ld	ra,40(sp)
    8000335e:	7402                	ld	s0,32(sp)
    80003360:	6145                	addi	sp,sp,48
    80003362:	8082                	ret

0000000080003364 <put>:
//}

//Puts necessary parameters for scheduling the process
void
put(struct proc* p)
{
    80003364:	7179                	addi	sp,sp,-48
    80003366:	f406                	sd	ra,40(sp)
    80003368:	f022                	sd	s0,32(sp)
    8000336a:	1800                	addi	s0,sp,48
    8000336c:	fca43c23          	sd	a0,-40(s0)
    struct cpu* c=mycpu();
    80003370:	fffff097          	auipc	ra,0xfffff
    80003374:	46a080e7          	jalr	1130(ra) # 800027da <mycpu>
    80003378:	fea43423          	sd	a0,-24(s0)

    if(p){
    8000337c:	fd843783          	ld	a5,-40(s0)
    80003380:	c7c9                	beqz	a5,8000340a <put+0xa6>
        //CFS
        p->startTime = ticks;
    80003382:	00009797          	auipc	a5,0x9
    80003386:	ca678793          	addi	a5,a5,-858 # 8000c028 <ticks>
    8000338a:	439c                	lw	a5,0(a5)
    8000338c:	02079713          	slli	a4,a5,0x20
    80003390:	9301                	srli	a4,a4,0x20
    80003392:	fd843783          	ld	a5,-40(s0)
    80003396:	16e7bc23          	sd	a4,376(a5)

        //SJF
        if(p->state == RUNNING) p->last_CPU_burst=ticks-p->begin_process_time;
    8000339a:	fd843783          	ld	a5,-40(s0)
    8000339e:	4f9c                	lw	a5,24(a5)
    800033a0:	873e                	mv	a4,a5
    800033a2:	4791                	li	a5,4
    800033a4:	02f71363          	bne	a4,a5,800033ca <put+0x66>
    800033a8:	00009797          	auipc	a5,0x9
    800033ac:	c8078793          	addi	a5,a5,-896 # 8000c028 <ticks>
    800033b0:	4398                	lw	a4,0(a5)
    800033b2:	fd843783          	ld	a5,-40(s0)
    800033b6:	1707a783          	lw	a5,368(a5)
    800033ba:	40f707bb          	subw	a5,a4,a5
    800033be:	0007871b          	sext.w	a4,a5
    800033c2:	fd843783          	ld	a5,-40(s0)
    800033c6:	16e7a623          	sw	a4,364(a5)
        //printf("Ticks: %d \n",ticks);

        if(c->scheduler)
    800033ca:	fe843783          	ld	a5,-24(s0)
    800033ce:	63dc                	ld	a5,128(a5)
    800033d0:	cb8d                	beqz	a5,80003402 <put+0x9e>
        {
            //if(p->prediction==0) p->prediction=5;
            p->prediction=(p->prediction+p->last_CPU_burst) / c->scheduler->exsponential_variant;
    800033d2:	fd843783          	ld	a5,-40(s0)
    800033d6:	1687a703          	lw	a4,360(a5)
    800033da:	fd843783          	ld	a5,-40(s0)
    800033de:	16c7a783          	lw	a5,364(a5)
    800033e2:	9fb9                	addw	a5,a5,a4
    800033e4:	0007871b          	sext.w	a4,a5
    800033e8:	fe843783          	ld	a5,-24(s0)
    800033ec:	63dc                	ld	a5,128(a5)
    800033ee:	43dc                	lw	a5,4(a5)
    800033f0:	2781                	sext.w	a5,a5
    800033f2:	02f757bb          	divuw	a5,a4,a5
    800033f6:	0007871b          	sext.w	a4,a5
    800033fa:	fd843783          	ld	a5,-40(s0)
    800033fe:	16e7a423          	sw	a4,360(a5)
            //printf("Proc pred: %d \n",p->prediction);
        }

        //Start process
        p->state=RUNNABLE;
    80003402:	fd843783          	ld	a5,-40(s0)
    80003406:	470d                	li	a4,3
    80003408:	cf98                	sw	a4,24(a5)
    }

  /** OSNOVNA IMPLEMENTACIJA
    p->state = RUNNABLE;
    **/
}
    8000340a:	0001                	nop
    8000340c:	70a2                	ld	ra,40(sp)
    8000340e:	7402                	ld	s0,32(sp)
    80003410:	6145                	addi	sp,sp,48
    80003412:	8082                	ret

0000000080003414 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003414:	7179                	addi	sp,sp,-48
    80003416:	f406                	sd	ra,40(sp)
    80003418:	f022                	sd	s0,32(sp)
    8000341a:	1800                	addi	s0,sp,48
  struct proc *p;
  struct cpu *c = mycpu();
    8000341c:	fffff097          	auipc	ra,0xfffff
    80003420:	3be080e7          	jalr	958(ra) # 800027da <mycpu>
    80003424:	fea43023          	sd	a0,-32(s0)
  struct sch sch;
    sch.scheduling_algorithm=CFS;
    80003428:	4789                	li	a5,2
    8000342a:	fcf42823          	sw	a5,-48(s0)
    sch.exsponential_variant=1;
    8000342e:	4785                	li	a5,1
    80003430:	fcf42a23          	sw	a5,-44(s0)
//  c->scheduling_algorithm="SJF";
  //printf("%s \n",c->scheduling_algorithm);
  c->proc = 0;
    80003434:	fe043783          	ld	a5,-32(s0)
    80003438:	0007b023          	sd	zero,0(a5)
  for(;;){
      c->scheduler=&sch;
    8000343c:	fe043783          	ld	a5,-32(s0)
    80003440:	fd040713          	addi	a4,s0,-48
    80003444:	e3d8                	sd	a4,128(a5)
      //printf("CPU ex var: %d \n",c->scheduler->exsponential_variant);

    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003446:	fffff097          	auipc	ra,0xfffff
    8000344a:	17e080e7          	jalr	382(ra) # 800025c4 <intr_on>

      if(c->scheduler->scheduling_algorithm==SJF)
    8000344e:	fe043783          	ld	a5,-32(s0)
    80003452:	63dc                	ld	a5,128(a5)
    80003454:	439c                	lw	a5,0(a5)
    80003456:	873e                	mv	a4,a5
    80003458:	4785                	li	a5,1
    8000345a:	00f71963          	bne	a4,a5,8000346c <scheduler+0x58>
      {
          p=getSJF();
    8000345e:	00000097          	auipc	ra,0x0
    80003462:	e42080e7          	jalr	-446(ra) # 800032a0 <getSJF>
    80003466:	fea43423          	sd	a0,-24(s0)
    8000346a:	a039                	j	80003478 <scheduler+0x64>
      }
      else
      {
          p=getCFS();
    8000346c:	00000097          	auipc	ra,0x0
    80003470:	d54080e7          	jalr	-684(ra) # 800031c0 <getCFS>
    80003474:	fea43423          	sd	a0,-24(s0)
      }
    //p=get();
    if(p)
    80003478:	fe843783          	ld	a5,-24(s0)
    8000347c:	d3e1                	beqz	a5,8000343c <scheduler+0x28>
    {
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.

        c->proc = p;
    8000347e:	fe043783          	ld	a5,-32(s0)
    80003482:	fe843703          	ld	a4,-24(s0)
    80003486:	e398                	sd	a4,0(a5)

        swtch(&c->context, &p->context);
    80003488:	fe043783          	ld	a5,-32(s0)
    8000348c:	00878713          	addi	a4,a5,8
    80003490:	fe843783          	ld	a5,-24(s0)
    80003494:	06078793          	addi	a5,a5,96
    80003498:	85be                	mv	a1,a5
    8000349a:	853a                	mv	a0,a4
    8000349c:	00000097          	auipc	ra,0x0
    800034a0:	642080e7          	jalr	1602(ra) # 80003ade <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800034a4:	fe043783          	ld	a5,-32(s0)
    800034a8:	0007b023          	sd	zero,0(a5)


        //if(&p->lock.locked)
        release(&p->lock);
    800034ac:	fe843783          	ld	a5,-24(s0)
    800034b0:	853e                	mv	a0,a5
    800034b2:	ffffe097          	auipc	ra,0xffffe
    800034b6:	e20080e7          	jalr	-480(ra) # 800012d2 <release>
      c->scheduler=&sch;
    800034ba:	b749                	j	8000343c <scheduler+0x28>

00000000800034bc <changeSchedulingAlgorithm>:
    //if(process_lock.locked)release(&process_lock);
  }
}
//Fja za promenu algoritma rasporedjivanja na odredjenom procesoru
int changeSchedulingAlgorithm(char *type,int exsponential_variant,int bool)
{
    800034bc:	7179                	addi	sp,sp,-48
    800034be:	f406                	sd	ra,40(sp)
    800034c0:	f022                	sd	s0,32(sp)
    800034c2:	1800                	addi	s0,sp,48
    800034c4:	fca43c23          	sd	a0,-40(s0)
    800034c8:	87ae                	mv	a5,a1
    800034ca:	8732                	mv	a4,a2
    800034cc:	fcf42a23          	sw	a5,-44(s0)
    800034d0:	87ba                	mv	a5,a4
    800034d2:	fcf42823          	sw	a5,-48(s0)
    struct cpu *c = mycpu();
    800034d6:	fffff097          	auipc	ra,0xfffff
    800034da:	304080e7          	jalr	772(ra) # 800027da <mycpu>
    800034de:	fea43423          	sd	a0,-24(s0)
        if (type[0]=='S' && type[1]=='J' && type[2]=='F')c->scheduler->scheduling_algorithm= SJF;
    800034e2:	fd843783          	ld	a5,-40(s0)
    800034e6:	0007c783          	lbu	a5,0(a5)
    800034ea:	873e                	mv	a4,a5
    800034ec:	05300793          	li	a5,83
    800034f0:	02f71b63          	bne	a4,a5,80003526 <changeSchedulingAlgorithm+0x6a>
    800034f4:	fd843783          	ld	a5,-40(s0)
    800034f8:	0785                	addi	a5,a5,1
    800034fa:	0007c783          	lbu	a5,0(a5)
    800034fe:	873e                	mv	a4,a5
    80003500:	04a00793          	li	a5,74
    80003504:	02f71163          	bne	a4,a5,80003526 <changeSchedulingAlgorithm+0x6a>
    80003508:	fd843783          	ld	a5,-40(s0)
    8000350c:	0789                	addi	a5,a5,2
    8000350e:	0007c783          	lbu	a5,0(a5)
    80003512:	873e                	mv	a4,a5
    80003514:	04600793          	li	a5,70
    80003518:	00f71763          	bne	a4,a5,80003526 <changeSchedulingAlgorithm+0x6a>
    8000351c:	fe843783          	ld	a5,-24(s0)
    80003520:	63dc                	ld	a5,128(a5)
    80003522:	4705                	li	a4,1
    80003524:	c398                	sw	a4,0(a5)
        if (type[0]=='C' && type[1]=='F' && type[2]=='S')c->scheduler->scheduling_algorithm= CFS;
    80003526:	fd843783          	ld	a5,-40(s0)
    8000352a:	0007c783          	lbu	a5,0(a5)
    8000352e:	873e                	mv	a4,a5
    80003530:	04300793          	li	a5,67
    80003534:	02f71b63          	bne	a4,a5,8000356a <changeSchedulingAlgorithm+0xae>
    80003538:	fd843783          	ld	a5,-40(s0)
    8000353c:	0785                	addi	a5,a5,1
    8000353e:	0007c783          	lbu	a5,0(a5)
    80003542:	873e                	mv	a4,a5
    80003544:	04600793          	li	a5,70
    80003548:	02f71163          	bne	a4,a5,8000356a <changeSchedulingAlgorithm+0xae>
    8000354c:	fd843783          	ld	a5,-40(s0)
    80003550:	0789                	addi	a5,a5,2
    80003552:	0007c783          	lbu	a5,0(a5)
    80003556:	873e                	mv	a4,a5
    80003558:	05300793          	li	a5,83
    8000355c:	00f71763          	bne	a4,a5,8000356a <changeSchedulingAlgorithm+0xae>
    80003560:	fe843783          	ld	a5,-24(s0)
    80003564:	63dc                	ld	a5,128(a5)
    80003566:	4709                	li	a4,2
    80003568:	c398                	sw	a4,0(a5)

        c->scheduler->exsponential_variant=exsponential_variant;
    8000356a:	fe843783          	ld	a5,-24(s0)
    8000356e:	63dc                	ld	a5,128(a5)
    80003570:	fd442703          	lw	a4,-44(s0)
    80003574:	c3d8                	sw	a4,4(a5)
        c->scheduler->preemptive=bool;
    80003576:	fe843783          	ld	a5,-24(s0)
    8000357a:	63dc                	ld	a5,128(a5)
    8000357c:	fd042703          	lw	a4,-48(s0)
    80003580:	c798                	sw	a4,8(a5)
        printf("treca1-USPESNO: %d \n",c->scheduler->scheduling_algorithm);
    80003582:	fe843783          	ld	a5,-24(s0)
    80003586:	63dc                	ld	a5,128(a5)
    80003588:	439c                	lw	a5,0(a5)
    8000358a:	85be                	mv	a1,a5
    8000358c:	00008517          	auipc	a0,0x8
    80003590:	c9450513          	addi	a0,a0,-876 # 8000b220 <etext+0x220>
    80003594:	ffffd097          	auipc	ra,0xffffd
    80003598:	494080e7          	jalr	1172(ra) # 80000a28 <printf>
        printf("treca2-USPESNO: %d \n",c->scheduler->exsponential_variant);
    8000359c:	fe843783          	ld	a5,-24(s0)
    800035a0:	63dc                	ld	a5,128(a5)
    800035a2:	43dc                	lw	a5,4(a5)
    800035a4:	85be                	mv	a1,a5
    800035a6:	00008517          	auipc	a0,0x8
    800035aa:	c9250513          	addi	a0,a0,-878 # 8000b238 <etext+0x238>
    800035ae:	ffffd097          	auipc	ra,0xffffd
    800035b2:	47a080e7          	jalr	1146(ra) # 80000a28 <printf>
        printf("treca3-USPESNO: %d \n",c->scheduler->preemptive);
    800035b6:	fe843783          	ld	a5,-24(s0)
    800035ba:	63dc                	ld	a5,128(a5)
    800035bc:	479c                	lw	a5,8(a5)
    800035be:	85be                	mv	a1,a5
    800035c0:	00008517          	auipc	a0,0x8
    800035c4:	c9050513          	addi	a0,a0,-880 # 8000b250 <etext+0x250>
    800035c8:	ffffd097          	auipc	ra,0xffffd
    800035cc:	460080e7          	jalr	1120(ra) # 80000a28 <printf>
        return 0;
    800035d0:	4781                	li	a5,0
//    }
//    else return -1;

}
    800035d2:	853e                	mv	a0,a5
    800035d4:	70a2                	ld	ra,40(sp)
    800035d6:	7402                	ld	s0,32(sp)
    800035d8:	6145                	addi	sp,sp,48
    800035da:	8082                	ret

00000000800035dc <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800035dc:	7179                	addi	sp,sp,-48
    800035de:	f406                	sd	ra,40(sp)
    800035e0:	f022                	sd	s0,32(sp)
    800035e2:	ec26                	sd	s1,24(sp)
    800035e4:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800035e6:	fffff097          	auipc	ra,0xfffff
    800035ea:	232080e7          	jalr	562(ra) # 80002818 <myproc>
    800035ee:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800035f2:	fd843783          	ld	a5,-40(s0)
    800035f6:	853e                	mv	a0,a5
    800035f8:	ffffe097          	auipc	ra,0xffffe
    800035fc:	d30080e7          	jalr	-720(ra) # 80001328 <holding>
    80003600:	87aa                	mv	a5,a0
    80003602:	eb89                	bnez	a5,80003614 <sched+0x38>
    panic("sched p->lock");
    80003604:	00008517          	auipc	a0,0x8
    80003608:	c6450513          	addi	a0,a0,-924 # 8000b268 <etext+0x268>
    8000360c:	ffffd097          	auipc	ra,0xffffd
    80003610:	672080e7          	jalr	1650(ra) # 80000c7e <panic>
  if(mycpu()->noff != 1)
    80003614:	fffff097          	auipc	ra,0xfffff
    80003618:	1c6080e7          	jalr	454(ra) # 800027da <mycpu>
    8000361c:	87aa                	mv	a5,a0
    8000361e:	5fbc                	lw	a5,120(a5)
    80003620:	873e                	mv	a4,a5
    80003622:	4785                	li	a5,1
    80003624:	00f70a63          	beq	a4,a5,80003638 <sched+0x5c>
    panic("sched locks");
    80003628:	00008517          	auipc	a0,0x8
    8000362c:	c5050513          	addi	a0,a0,-944 # 8000b278 <etext+0x278>
    80003630:	ffffd097          	auipc	ra,0xffffd
    80003634:	64e080e7          	jalr	1614(ra) # 80000c7e <panic>
  if(p->state == RUNNING)
    80003638:	fd843783          	ld	a5,-40(s0)
    8000363c:	4f9c                	lw	a5,24(a5)
    8000363e:	873e                	mv	a4,a5
    80003640:	4791                	li	a5,4
    80003642:	00f71a63          	bne	a4,a5,80003656 <sched+0x7a>
    panic("sched running");
    80003646:	00008517          	auipc	a0,0x8
    8000364a:	c4250513          	addi	a0,a0,-958 # 8000b288 <etext+0x288>
    8000364e:	ffffd097          	auipc	ra,0xffffd
    80003652:	630080e7          	jalr	1584(ra) # 80000c7e <panic>
  if(intr_get())
    80003656:	fffff097          	auipc	ra,0xfffff
    8000365a:	f98080e7          	jalr	-104(ra) # 800025ee <intr_get>
    8000365e:	87aa                	mv	a5,a0
    80003660:	cb89                	beqz	a5,80003672 <sched+0x96>
    panic("sched interruptible");
    80003662:	00008517          	auipc	a0,0x8
    80003666:	c3650513          	addi	a0,a0,-970 # 8000b298 <etext+0x298>
    8000366a:	ffffd097          	auipc	ra,0xffffd
    8000366e:	614080e7          	jalr	1556(ra) # 80000c7e <panic>

  intena = mycpu()->intena;
    80003672:	fffff097          	auipc	ra,0xfffff
    80003676:	168080e7          	jalr	360(ra) # 800027da <mycpu>
    8000367a:	87aa                	mv	a5,a0
    8000367c:	5ffc                	lw	a5,124(a5)
    8000367e:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003682:	fd843783          	ld	a5,-40(s0)
    80003686:	06078493          	addi	s1,a5,96
    8000368a:	fffff097          	auipc	ra,0xfffff
    8000368e:	150080e7          	jalr	336(ra) # 800027da <mycpu>
    80003692:	87aa                	mv	a5,a0
    80003694:	07a1                	addi	a5,a5,8
    80003696:	85be                	mv	a1,a5
    80003698:	8526                	mv	a0,s1
    8000369a:	00000097          	auipc	ra,0x0
    8000369e:	444080e7          	jalr	1092(ra) # 80003ade <swtch>
  mycpu()->intena = intena;
    800036a2:	fffff097          	auipc	ra,0xfffff
    800036a6:	138080e7          	jalr	312(ra) # 800027da <mycpu>
    800036aa:	872a                	mv	a4,a0
    800036ac:	fd442783          	lw	a5,-44(s0)
    800036b0:	df7c                	sw	a5,124(a4)
}
    800036b2:	0001                	nop
    800036b4:	70a2                	ld	ra,40(sp)
    800036b6:	7402                	ld	s0,32(sp)
    800036b8:	64e2                	ld	s1,24(sp)
    800036ba:	6145                	addi	sp,sp,48
    800036bc:	8082                	ret

00000000800036be <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800036be:	1101                	addi	sp,sp,-32
    800036c0:	ec06                	sd	ra,24(sp)
    800036c2:	e822                	sd	s0,16(sp)
    800036c4:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800036c6:	fffff097          	auipc	ra,0xfffff
    800036ca:	152080e7          	jalr	338(ra) # 80002818 <myproc>
    800036ce:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800036d2:	fe843783          	ld	a5,-24(s0)
    800036d6:	853e                	mv	a0,a5
    800036d8:	ffffe097          	auipc	ra,0xffffe
    800036dc:	b96080e7          	jalr	-1130(ra) # 8000126e <acquire>
  put(p);
    800036e0:	fe843503          	ld	a0,-24(s0)
    800036e4:	00000097          	auipc	ra,0x0
    800036e8:	c80080e7          	jalr	-896(ra) # 80003364 <put>
  sched();
    800036ec:	00000097          	auipc	ra,0x0
    800036f0:	ef0080e7          	jalr	-272(ra) # 800035dc <sched>
  release(&p->lock);
    800036f4:	fe843783          	ld	a5,-24(s0)
    800036f8:	853e                	mv	a0,a5
    800036fa:	ffffe097          	auipc	ra,0xffffe
    800036fe:	bd8080e7          	jalr	-1064(ra) # 800012d2 <release>
}
    80003702:	0001                	nop
    80003704:	60e2                	ld	ra,24(sp)
    80003706:	6442                	ld	s0,16(sp)
    80003708:	6105                	addi	sp,sp,32
    8000370a:	8082                	ret

000000008000370c <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    8000370c:	1141                	addi	sp,sp,-16
    8000370e:	e406                	sd	ra,8(sp)
    80003710:	e022                	sd	s0,0(sp)
    80003712:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003714:	fffff097          	auipc	ra,0xfffff
    80003718:	104080e7          	jalr	260(ra) # 80002818 <myproc>
    8000371c:	87aa                	mv	a5,a0
    8000371e:	853e                	mv	a0,a5
    80003720:	ffffe097          	auipc	ra,0xffffe
    80003724:	bb2080e7          	jalr	-1102(ra) # 800012d2 <release>

  if (first) {
    80003728:	00008797          	auipc	a5,0x8
    8000372c:	05c78793          	addi	a5,a5,92 # 8000b784 <first.1721>
    80003730:	439c                	lw	a5,0(a5)
    80003732:	cf81                	beqz	a5,8000374a <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003734:	00008797          	auipc	a5,0x8
    80003738:	05078793          	addi	a5,a5,80 # 8000b784 <first.1721>
    8000373c:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003740:	4505                	li	a0,1
    80003742:	00001097          	auipc	ra,0x1
    80003746:	51e080e7          	jalr	1310(ra) # 80004c60 <fsinit>
  }

  usertrapret();
    8000374a:	00000097          	auipc	ra,0x0
    8000374e:	732080e7          	jalr	1842(ra) # 80003e7c <usertrapret>
}
    80003752:	0001                	nop
    80003754:	60a2                	ld	ra,8(sp)
    80003756:	6402                	ld	s0,0(sp)
    80003758:	0141                	addi	sp,sp,16
    8000375a:	8082                	ret

000000008000375c <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    8000375c:	7179                	addi	sp,sp,-48
    8000375e:	f406                	sd	ra,40(sp)
    80003760:	f022                	sd	s0,32(sp)
    80003762:	1800                	addi	s0,sp,48
    80003764:	fca43c23          	sd	a0,-40(s0)
    80003768:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000376c:	fffff097          	auipc	ra,0xfffff
    80003770:	0ac080e7          	jalr	172(ra) # 80002818 <myproc>
    80003774:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003778:	fe843783          	ld	a5,-24(s0)
    8000377c:	853e                	mv	a0,a5
    8000377e:	ffffe097          	auipc	ra,0xffffe
    80003782:	af0080e7          	jalr	-1296(ra) # 8000126e <acquire>
  release(lk);
    80003786:	fd043503          	ld	a0,-48(s0)
    8000378a:	ffffe097          	auipc	ra,0xffffe
    8000378e:	b48080e7          	jalr	-1208(ra) # 800012d2 <release>

  // Go to sleep.
  p->chan = chan;
    80003792:	fe843783          	ld	a5,-24(s0)
    80003796:	fd843703          	ld	a4,-40(s0)
    8000379a:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    8000379c:	fe843783          	ld	a5,-24(s0)
    800037a0:	4709                	li	a4,2
    800037a2:	cf98                	sw	a4,24(a5)

  sched();
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	e38080e7          	jalr	-456(ra) # 800035dc <sched>

  // Tidy up.
  p->chan = 0;
    800037ac:	fe843783          	ld	a5,-24(s0)
    800037b0:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800037b4:	fe843783          	ld	a5,-24(s0)
    800037b8:	853e                	mv	a0,a5
    800037ba:	ffffe097          	auipc	ra,0xffffe
    800037be:	b18080e7          	jalr	-1256(ra) # 800012d2 <release>
  acquire(lk);
    800037c2:	fd043503          	ld	a0,-48(s0)
    800037c6:	ffffe097          	auipc	ra,0xffffe
    800037ca:	aa8080e7          	jalr	-1368(ra) # 8000126e <acquire>
}
    800037ce:	0001                	nop
    800037d0:	70a2                	ld	ra,40(sp)
    800037d2:	7402                	ld	s0,32(sp)
    800037d4:	6145                	addi	sp,sp,48
    800037d6:	8082                	ret

00000000800037d8 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800037d8:	7179                	addi	sp,sp,-48
    800037da:	f406                	sd	ra,40(sp)
    800037dc:	f022                	sd	s0,32(sp)
    800037de:	1800                	addi	s0,sp,48
    800037e0:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800037e4:	00011797          	auipc	a5,0x11
    800037e8:	ef478793          	addi	a5,a5,-268 # 800146d8 <proc>
    800037ec:	fef43423          	sd	a5,-24(s0)
    800037f0:	a095                	j	80003854 <wakeup+0x7c>
    if(p != myproc()){
    800037f2:	fffff097          	auipc	ra,0xfffff
    800037f6:	026080e7          	jalr	38(ra) # 80002818 <myproc>
    800037fa:	872a                	mv	a4,a0
    800037fc:	fe843783          	ld	a5,-24(s0)
    80003800:	04e78463          	beq	a5,a4,80003848 <wakeup+0x70>
      acquire(&p->lock);
    80003804:	fe843783          	ld	a5,-24(s0)
    80003808:	853e                	mv	a0,a5
    8000380a:	ffffe097          	auipc	ra,0xffffe
    8000380e:	a64080e7          	jalr	-1436(ra) # 8000126e <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003812:	fe843783          	ld	a5,-24(s0)
    80003816:	4f9c                	lw	a5,24(a5)
    80003818:	873e                	mv	a4,a5
    8000381a:	4789                	li	a5,2
    8000381c:	00f71f63          	bne	a4,a5,8000383a <wakeup+0x62>
    80003820:	fe843783          	ld	a5,-24(s0)
    80003824:	739c                	ld	a5,32(a5)
    80003826:	fd843703          	ld	a4,-40(s0)
    8000382a:	00f71863          	bne	a4,a5,8000383a <wakeup+0x62>
          put(p);
    8000382e:	fe843503          	ld	a0,-24(s0)
    80003832:	00000097          	auipc	ra,0x0
    80003836:	b32080e7          	jalr	-1230(ra) # 80003364 <put>
      }
      release(&p->lock);
    8000383a:	fe843783          	ld	a5,-24(s0)
    8000383e:	853e                	mv	a0,a5
    80003840:	ffffe097          	auipc	ra,0xffffe
    80003844:	a92080e7          	jalr	-1390(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80003848:	fe843783          	ld	a5,-24(s0)
    8000384c:	19078793          	addi	a5,a5,400
    80003850:	fef43423          	sd	a5,-24(s0)
    80003854:	fe843703          	ld	a4,-24(s0)
    80003858:	00017797          	auipc	a5,0x17
    8000385c:	28078793          	addi	a5,a5,640 # 8001aad8 <pid_lock>
    80003860:	f8f769e3          	bltu	a4,a5,800037f2 <wakeup+0x1a>
    }
  }
}
    80003864:	0001                	nop
    80003866:	0001                	nop
    80003868:	70a2                	ld	ra,40(sp)
    8000386a:	7402                	ld	s0,32(sp)
    8000386c:	6145                	addi	sp,sp,48
    8000386e:	8082                	ret

0000000080003870 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003870:	7179                	addi	sp,sp,-48
    80003872:	f406                	sd	ra,40(sp)
    80003874:	f022                	sd	s0,32(sp)
    80003876:	1800                	addi	s0,sp,48
    80003878:	87aa                	mv	a5,a0
    8000387a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8000387e:	00011797          	auipc	a5,0x11
    80003882:	e5a78793          	addi	a5,a5,-422 # 800146d8 <proc>
    80003886:	fef43423          	sd	a5,-24(s0)
    8000388a:	a0bd                	j	800038f8 <kill+0x88>
    acquire(&p->lock);
    8000388c:	fe843783          	ld	a5,-24(s0)
    80003890:	853e                	mv	a0,a5
    80003892:	ffffe097          	auipc	ra,0xffffe
    80003896:	9dc080e7          	jalr	-1572(ra) # 8000126e <acquire>
    if(p->pid == pid){
    8000389a:	fe843783          	ld	a5,-24(s0)
    8000389e:	5b98                	lw	a4,48(a5)
    800038a0:	fdc42783          	lw	a5,-36(s0)
    800038a4:	2781                	sext.w	a5,a5
    800038a6:	02e79c63          	bne	a5,a4,800038de <kill+0x6e>
      p->killed = 1;
    800038aa:	fe843783          	ld	a5,-24(s0)
    800038ae:	4705                	li	a4,1
    800038b0:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800038b2:	fe843783          	ld	a5,-24(s0)
    800038b6:	4f9c                	lw	a5,24(a5)
    800038b8:	873e                	mv	a4,a5
    800038ba:	4789                	li	a5,2
    800038bc:	00f71863          	bne	a4,a5,800038cc <kill+0x5c>
        // Wake process from sleep().
        put(p);
    800038c0:	fe843503          	ld	a0,-24(s0)
    800038c4:	00000097          	auipc	ra,0x0
    800038c8:	aa0080e7          	jalr	-1376(ra) # 80003364 <put>
      }
      release(&p->lock);
    800038cc:	fe843783          	ld	a5,-24(s0)
    800038d0:	853e                	mv	a0,a5
    800038d2:	ffffe097          	auipc	ra,0xffffe
    800038d6:	a00080e7          	jalr	-1536(ra) # 800012d2 <release>
      return 0;
    800038da:	4781                	li	a5,0
    800038dc:	a03d                	j	8000390a <kill+0x9a>
    }
    release(&p->lock);
    800038de:	fe843783          	ld	a5,-24(s0)
    800038e2:	853e                	mv	a0,a5
    800038e4:	ffffe097          	auipc	ra,0xffffe
    800038e8:	9ee080e7          	jalr	-1554(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    800038ec:	fe843783          	ld	a5,-24(s0)
    800038f0:	19078793          	addi	a5,a5,400
    800038f4:	fef43423          	sd	a5,-24(s0)
    800038f8:	fe843703          	ld	a4,-24(s0)
    800038fc:	00017797          	auipc	a5,0x17
    80003900:	1dc78793          	addi	a5,a5,476 # 8001aad8 <pid_lock>
    80003904:	f8f764e3          	bltu	a4,a5,8000388c <kill+0x1c>
  }
  return -1;
    80003908:	57fd                	li	a5,-1
}
    8000390a:	853e                	mv	a0,a5
    8000390c:	70a2                	ld	ra,40(sp)
    8000390e:	7402                	ld	s0,32(sp)
    80003910:	6145                	addi	sp,sp,48
    80003912:	8082                	ret

0000000080003914 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003914:	7139                	addi	sp,sp,-64
    80003916:	fc06                	sd	ra,56(sp)
    80003918:	f822                	sd	s0,48(sp)
    8000391a:	0080                	addi	s0,sp,64
    8000391c:	87aa                	mv	a5,a0
    8000391e:	fcb43823          	sd	a1,-48(s0)
    80003922:	fcc43423          	sd	a2,-56(s0)
    80003926:	fcd43023          	sd	a3,-64(s0)
    8000392a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000392e:	fffff097          	auipc	ra,0xfffff
    80003932:	eea080e7          	jalr	-278(ra) # 80002818 <myproc>
    80003936:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    8000393a:	fdc42783          	lw	a5,-36(s0)
    8000393e:	2781                	sext.w	a5,a5
    80003940:	c38d                	beqz	a5,80003962 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003942:	fe843783          	ld	a5,-24(s0)
    80003946:	6bbc                	ld	a5,80(a5)
    80003948:	fc043683          	ld	a3,-64(s0)
    8000394c:	fc843603          	ld	a2,-56(s0)
    80003950:	fd043583          	ld	a1,-48(s0)
    80003954:	853e                	mv	a0,a5
    80003956:	fffff097          	auipc	ra,0xfffff
    8000395a:	990080e7          	jalr	-1648(ra) # 800022e6 <copyout>
    8000395e:	87aa                	mv	a5,a0
    80003960:	a839                	j	8000397e <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80003962:	fd043783          	ld	a5,-48(s0)
    80003966:	fc043703          	ld	a4,-64(s0)
    8000396a:	2701                	sext.w	a4,a4
    8000396c:	863a                	mv	a2,a4
    8000396e:	fc843583          	ld	a1,-56(s0)
    80003972:	853e                	mv	a0,a5
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	bb2080e7          	jalr	-1102(ra) # 80001526 <memmove>
    return 0;
    8000397c:	4781                	li	a5,0
  }
}
    8000397e:	853e                	mv	a0,a5
    80003980:	70e2                	ld	ra,56(sp)
    80003982:	7442                	ld	s0,48(sp)
    80003984:	6121                	addi	sp,sp,64
    80003986:	8082                	ret

0000000080003988 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003988:	7139                	addi	sp,sp,-64
    8000398a:	fc06                	sd	ra,56(sp)
    8000398c:	f822                	sd	s0,48(sp)
    8000398e:	0080                	addi	s0,sp,64
    80003990:	fca43c23          	sd	a0,-40(s0)
    80003994:	87ae                	mv	a5,a1
    80003996:	fcc43423          	sd	a2,-56(s0)
    8000399a:	fcd43023          	sd	a3,-64(s0)
    8000399e:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800039a2:	fffff097          	auipc	ra,0xfffff
    800039a6:	e76080e7          	jalr	-394(ra) # 80002818 <myproc>
    800039aa:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800039ae:	fd442783          	lw	a5,-44(s0)
    800039b2:	2781                	sext.w	a5,a5
    800039b4:	c38d                	beqz	a5,800039d6 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800039b6:	fe843783          	ld	a5,-24(s0)
    800039ba:	6bbc                	ld	a5,80(a5)
    800039bc:	fc043683          	ld	a3,-64(s0)
    800039c0:	fc843603          	ld	a2,-56(s0)
    800039c4:	fd843583          	ld	a1,-40(s0)
    800039c8:	853e                	mv	a0,a5
    800039ca:	fffff097          	auipc	ra,0xfffff
    800039ce:	9ea080e7          	jalr	-1558(ra) # 800023b4 <copyin>
    800039d2:	87aa                	mv	a5,a0
    800039d4:	a839                	j	800039f2 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    800039d6:	fc843783          	ld	a5,-56(s0)
    800039da:	fc043703          	ld	a4,-64(s0)
    800039de:	2701                	sext.w	a4,a4
    800039e0:	863a                	mv	a2,a4
    800039e2:	85be                	mv	a1,a5
    800039e4:	fd843503          	ld	a0,-40(s0)
    800039e8:	ffffe097          	auipc	ra,0xffffe
    800039ec:	b3e080e7          	jalr	-1218(ra) # 80001526 <memmove>
    return 0;
    800039f0:	4781                	li	a5,0
  }
}
    800039f2:	853e                	mv	a0,a5
    800039f4:	70e2                	ld	ra,56(sp)
    800039f6:	7442                	ld	s0,48(sp)
    800039f8:	6121                	addi	sp,sp,64
    800039fa:	8082                	ret

00000000800039fc <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    800039fc:	1101                	addi	sp,sp,-32
    800039fe:	ec06                	sd	ra,24(sp)
    80003a00:	e822                	sd	s0,16(sp)
    80003a02:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003a04:	00008517          	auipc	a0,0x8
    80003a08:	8ac50513          	addi	a0,a0,-1876 # 8000b2b0 <etext+0x2b0>
    80003a0c:	ffffd097          	auipc	ra,0xffffd
    80003a10:	01c080e7          	jalr	28(ra) # 80000a28 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003a14:	00011797          	auipc	a5,0x11
    80003a18:	cc478793          	addi	a5,a5,-828 # 800146d8 <proc>
    80003a1c:	fef43423          	sd	a5,-24(s0)
    80003a20:	a04d                	j	80003ac2 <procdump+0xc6>
    if(p->state == UNUSED)
    80003a22:	fe843783          	ld	a5,-24(s0)
    80003a26:	4f9c                	lw	a5,24(a5)
    80003a28:	c7d1                	beqz	a5,80003ab4 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003a2a:	fe843783          	ld	a5,-24(s0)
    80003a2e:	4f9c                	lw	a5,24(a5)
    80003a30:	873e                	mv	a4,a5
    80003a32:	4795                	li	a5,5
    80003a34:	02e7ee63          	bltu	a5,a4,80003a70 <procdump+0x74>
    80003a38:	fe843783          	ld	a5,-24(s0)
    80003a3c:	4f9c                	lw	a5,24(a5)
    80003a3e:	00008717          	auipc	a4,0x8
    80003a42:	da270713          	addi	a4,a4,-606 # 8000b7e0 <states.1758>
    80003a46:	1782                	slli	a5,a5,0x20
    80003a48:	9381                	srli	a5,a5,0x20
    80003a4a:	078e                	slli	a5,a5,0x3
    80003a4c:	97ba                	add	a5,a5,a4
    80003a4e:	639c                	ld	a5,0(a5)
    80003a50:	c385                	beqz	a5,80003a70 <procdump+0x74>
      state = states[p->state];
    80003a52:	fe843783          	ld	a5,-24(s0)
    80003a56:	4f9c                	lw	a5,24(a5)
    80003a58:	00008717          	auipc	a4,0x8
    80003a5c:	d8870713          	addi	a4,a4,-632 # 8000b7e0 <states.1758>
    80003a60:	1782                	slli	a5,a5,0x20
    80003a62:	9381                	srli	a5,a5,0x20
    80003a64:	078e                	slli	a5,a5,0x3
    80003a66:	97ba                	add	a5,a5,a4
    80003a68:	639c                	ld	a5,0(a5)
    80003a6a:	fef43023          	sd	a5,-32(s0)
    80003a6e:	a039                	j	80003a7c <procdump+0x80>
    else
      state = "???";
    80003a70:	00008797          	auipc	a5,0x8
    80003a74:	84878793          	addi	a5,a5,-1976 # 8000b2b8 <etext+0x2b8>
    80003a78:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003a7c:	fe843783          	ld	a5,-24(s0)
    80003a80:	5b98                	lw	a4,48(a5)
    80003a82:	fe843783          	ld	a5,-24(s0)
    80003a86:	15878793          	addi	a5,a5,344
    80003a8a:	86be                	mv	a3,a5
    80003a8c:	fe043603          	ld	a2,-32(s0)
    80003a90:	85ba                	mv	a1,a4
    80003a92:	00008517          	auipc	a0,0x8
    80003a96:	82e50513          	addi	a0,a0,-2002 # 8000b2c0 <etext+0x2c0>
    80003a9a:	ffffd097          	auipc	ra,0xffffd
    80003a9e:	f8e080e7          	jalr	-114(ra) # 80000a28 <printf>
    printf("\n");
    80003aa2:	00008517          	auipc	a0,0x8
    80003aa6:	80e50513          	addi	a0,a0,-2034 # 8000b2b0 <etext+0x2b0>
    80003aaa:	ffffd097          	auipc	ra,0xffffd
    80003aae:	f7e080e7          	jalr	-130(ra) # 80000a28 <printf>
    80003ab2:	a011                	j	80003ab6 <procdump+0xba>
      continue;
    80003ab4:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003ab6:	fe843783          	ld	a5,-24(s0)
    80003aba:	19078793          	addi	a5,a5,400
    80003abe:	fef43423          	sd	a5,-24(s0)
    80003ac2:	fe843703          	ld	a4,-24(s0)
    80003ac6:	00017797          	auipc	a5,0x17
    80003aca:	01278793          	addi	a5,a5,18 # 8001aad8 <pid_lock>
    80003ace:	f4f76ae3          	bltu	a4,a5,80003a22 <procdump+0x26>
  }
}
    80003ad2:	0001                	nop
    80003ad4:	0001                	nop
    80003ad6:	60e2                	ld	ra,24(sp)
    80003ad8:	6442                	ld	s0,16(sp)
    80003ada:	6105                	addi	sp,sp,32
    80003adc:	8082                	ret

0000000080003ade <swtch>:
    80003ade:	00153023          	sd	ra,0(a0)
    80003ae2:	00253423          	sd	sp,8(a0)
    80003ae6:	e900                	sd	s0,16(a0)
    80003ae8:	ed04                	sd	s1,24(a0)
    80003aea:	03253023          	sd	s2,32(a0)
    80003aee:	03353423          	sd	s3,40(a0)
    80003af2:	03453823          	sd	s4,48(a0)
    80003af6:	03553c23          	sd	s5,56(a0)
    80003afa:	05653023          	sd	s6,64(a0)
    80003afe:	05753423          	sd	s7,72(a0)
    80003b02:	05853823          	sd	s8,80(a0)
    80003b06:	05953c23          	sd	s9,88(a0)
    80003b0a:	07a53023          	sd	s10,96(a0)
    80003b0e:	07b53423          	sd	s11,104(a0)
    80003b12:	0005b083          	ld	ra,0(a1)
    80003b16:	0085b103          	ld	sp,8(a1)
    80003b1a:	6980                	ld	s0,16(a1)
    80003b1c:	6d84                	ld	s1,24(a1)
    80003b1e:	0205b903          	ld	s2,32(a1)
    80003b22:	0285b983          	ld	s3,40(a1)
    80003b26:	0305ba03          	ld	s4,48(a1)
    80003b2a:	0385ba83          	ld	s5,56(a1)
    80003b2e:	0405bb03          	ld	s6,64(a1)
    80003b32:	0485bb83          	ld	s7,72(a1)
    80003b36:	0505bc03          	ld	s8,80(a1)
    80003b3a:	0585bc83          	ld	s9,88(a1)
    80003b3e:	0605bd03          	ld	s10,96(a1)
    80003b42:	0685bd83          	ld	s11,104(a1)
    80003b46:	8082                	ret

0000000080003b48 <r_sstatus>:
{
    80003b48:	1101                	addi	sp,sp,-32
    80003b4a:	ec22                	sd	s0,24(sp)
    80003b4c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003b4e:	100027f3          	csrr	a5,sstatus
    80003b52:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b56:	fe843783          	ld	a5,-24(s0)
}
    80003b5a:	853e                	mv	a0,a5
    80003b5c:	6462                	ld	s0,24(sp)
    80003b5e:	6105                	addi	sp,sp,32
    80003b60:	8082                	ret

0000000080003b62 <w_sstatus>:
{
    80003b62:	1101                	addi	sp,sp,-32
    80003b64:	ec22                	sd	s0,24(sp)
    80003b66:	1000                	addi	s0,sp,32
    80003b68:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003b6c:	fe843783          	ld	a5,-24(s0)
    80003b70:	10079073          	csrw	sstatus,a5
}
    80003b74:	0001                	nop
    80003b76:	6462                	ld	s0,24(sp)
    80003b78:	6105                	addi	sp,sp,32
    80003b7a:	8082                	ret

0000000080003b7c <r_sip>:
{
    80003b7c:	1101                	addi	sp,sp,-32
    80003b7e:	ec22                	sd	s0,24(sp)
    80003b80:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003b82:	144027f3          	csrr	a5,sip
    80003b86:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b8a:	fe843783          	ld	a5,-24(s0)
}
    80003b8e:	853e                	mv	a0,a5
    80003b90:	6462                	ld	s0,24(sp)
    80003b92:	6105                	addi	sp,sp,32
    80003b94:	8082                	ret

0000000080003b96 <w_sip>:
{
    80003b96:	1101                	addi	sp,sp,-32
    80003b98:	ec22                	sd	s0,24(sp)
    80003b9a:	1000                	addi	s0,sp,32
    80003b9c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003ba0:	fe843783          	ld	a5,-24(s0)
    80003ba4:	14479073          	csrw	sip,a5
}
    80003ba8:	0001                	nop
    80003baa:	6462                	ld	s0,24(sp)
    80003bac:	6105                	addi	sp,sp,32
    80003bae:	8082                	ret

0000000080003bb0 <w_sepc>:
{
    80003bb0:	1101                	addi	sp,sp,-32
    80003bb2:	ec22                	sd	s0,24(sp)
    80003bb4:	1000                	addi	s0,sp,32
    80003bb6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003bba:	fe843783          	ld	a5,-24(s0)
    80003bbe:	14179073          	csrw	sepc,a5
}
    80003bc2:	0001                	nop
    80003bc4:	6462                	ld	s0,24(sp)
    80003bc6:	6105                	addi	sp,sp,32
    80003bc8:	8082                	ret

0000000080003bca <r_sepc>:
{
    80003bca:	1101                	addi	sp,sp,-32
    80003bcc:	ec22                	sd	s0,24(sp)
    80003bce:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003bd0:	141027f3          	csrr	a5,sepc
    80003bd4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bd8:	fe843783          	ld	a5,-24(s0)
}
    80003bdc:	853e                	mv	a0,a5
    80003bde:	6462                	ld	s0,24(sp)
    80003be0:	6105                	addi	sp,sp,32
    80003be2:	8082                	ret

0000000080003be4 <w_stvec>:
{
    80003be4:	1101                	addi	sp,sp,-32
    80003be6:	ec22                	sd	s0,24(sp)
    80003be8:	1000                	addi	s0,sp,32
    80003bea:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003bee:	fe843783          	ld	a5,-24(s0)
    80003bf2:	10579073          	csrw	stvec,a5
}
    80003bf6:	0001                	nop
    80003bf8:	6462                	ld	s0,24(sp)
    80003bfa:	6105                	addi	sp,sp,32
    80003bfc:	8082                	ret

0000000080003bfe <r_satp>:
{
    80003bfe:	1101                	addi	sp,sp,-32
    80003c00:	ec22                	sd	s0,24(sp)
    80003c02:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003c04:	180027f3          	csrr	a5,satp
    80003c08:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c0c:	fe843783          	ld	a5,-24(s0)
}
    80003c10:	853e                	mv	a0,a5
    80003c12:	6462                	ld	s0,24(sp)
    80003c14:	6105                	addi	sp,sp,32
    80003c16:	8082                	ret

0000000080003c18 <r_scause>:
{
    80003c18:	1101                	addi	sp,sp,-32
    80003c1a:	ec22                	sd	s0,24(sp)
    80003c1c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003c1e:	142027f3          	csrr	a5,scause
    80003c22:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c26:	fe843783          	ld	a5,-24(s0)
}
    80003c2a:	853e                	mv	a0,a5
    80003c2c:	6462                	ld	s0,24(sp)
    80003c2e:	6105                	addi	sp,sp,32
    80003c30:	8082                	ret

0000000080003c32 <r_stval>:
{
    80003c32:	1101                	addi	sp,sp,-32
    80003c34:	ec22                	sd	s0,24(sp)
    80003c36:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003c38:	143027f3          	csrr	a5,stval
    80003c3c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c40:	fe843783          	ld	a5,-24(s0)
}
    80003c44:	853e                	mv	a0,a5
    80003c46:	6462                	ld	s0,24(sp)
    80003c48:	6105                	addi	sp,sp,32
    80003c4a:	8082                	ret

0000000080003c4c <intr_on>:
{
    80003c4c:	1141                	addi	sp,sp,-16
    80003c4e:	e406                	sd	ra,8(sp)
    80003c50:	e022                	sd	s0,0(sp)
    80003c52:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003c54:	00000097          	auipc	ra,0x0
    80003c58:	ef4080e7          	jalr	-268(ra) # 80003b48 <r_sstatus>
    80003c5c:	87aa                	mv	a5,a0
    80003c5e:	0027e793          	ori	a5,a5,2
    80003c62:	853e                	mv	a0,a5
    80003c64:	00000097          	auipc	ra,0x0
    80003c68:	efe080e7          	jalr	-258(ra) # 80003b62 <w_sstatus>
}
    80003c6c:	0001                	nop
    80003c6e:	60a2                	ld	ra,8(sp)
    80003c70:	6402                	ld	s0,0(sp)
    80003c72:	0141                	addi	sp,sp,16
    80003c74:	8082                	ret

0000000080003c76 <intr_off>:
{
    80003c76:	1141                	addi	sp,sp,-16
    80003c78:	e406                	sd	ra,8(sp)
    80003c7a:	e022                	sd	s0,0(sp)
    80003c7c:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003c7e:	00000097          	auipc	ra,0x0
    80003c82:	eca080e7          	jalr	-310(ra) # 80003b48 <r_sstatus>
    80003c86:	87aa                	mv	a5,a0
    80003c88:	9bf5                	andi	a5,a5,-3
    80003c8a:	853e                	mv	a0,a5
    80003c8c:	00000097          	auipc	ra,0x0
    80003c90:	ed6080e7          	jalr	-298(ra) # 80003b62 <w_sstatus>
}
    80003c94:	0001                	nop
    80003c96:	60a2                	ld	ra,8(sp)
    80003c98:	6402                	ld	s0,0(sp)
    80003c9a:	0141                	addi	sp,sp,16
    80003c9c:	8082                	ret

0000000080003c9e <intr_get>:
{
    80003c9e:	1101                	addi	sp,sp,-32
    80003ca0:	ec06                	sd	ra,24(sp)
    80003ca2:	e822                	sd	s0,16(sp)
    80003ca4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003ca6:	00000097          	auipc	ra,0x0
    80003caa:	ea2080e7          	jalr	-350(ra) # 80003b48 <r_sstatus>
    80003cae:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003cb2:	fe843783          	ld	a5,-24(s0)
    80003cb6:	8b89                	andi	a5,a5,2
    80003cb8:	00f037b3          	snez	a5,a5
    80003cbc:	0ff7f793          	andi	a5,a5,255
    80003cc0:	2781                	sext.w	a5,a5
}
    80003cc2:	853e                	mv	a0,a5
    80003cc4:	60e2                	ld	ra,24(sp)
    80003cc6:	6442                	ld	s0,16(sp)
    80003cc8:	6105                	addi	sp,sp,32
    80003cca:	8082                	ret

0000000080003ccc <r_tp>:
{
    80003ccc:	1101                	addi	sp,sp,-32
    80003cce:	ec22                	sd	s0,24(sp)
    80003cd0:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003cd2:	8792                	mv	a5,tp
    80003cd4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003cd8:	fe843783          	ld	a5,-24(s0)
}
    80003cdc:	853e                	mv	a0,a5
    80003cde:	6462                	ld	s0,24(sp)
    80003ce0:	6105                	addi	sp,sp,32
    80003ce2:	8082                	ret

0000000080003ce4 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003ce4:	1141                	addi	sp,sp,-16
    80003ce6:	e406                	sd	ra,8(sp)
    80003ce8:	e022                	sd	s0,0(sp)
    80003cea:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003cec:	00007597          	auipc	a1,0x7
    80003cf0:	61458593          	addi	a1,a1,1556 # 8000b300 <etext+0x300>
    80003cf4:	00017517          	auipc	a0,0x17
    80003cf8:	e2c50513          	addi	a0,a0,-468 # 8001ab20 <tickslock>
    80003cfc:	ffffd097          	auipc	ra,0xffffd
    80003d00:	542080e7          	jalr	1346(ra) # 8000123e <initlock>
}
    80003d04:	0001                	nop
    80003d06:	60a2                	ld	ra,8(sp)
    80003d08:	6402                	ld	s0,0(sp)
    80003d0a:	0141                	addi	sp,sp,16
    80003d0c:	8082                	ret

0000000080003d0e <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003d0e:	1141                	addi	sp,sp,-16
    80003d10:	e406                	sd	ra,8(sp)
    80003d12:	e022                	sd	s0,0(sp)
    80003d14:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003d16:	00005797          	auipc	a5,0x5
    80003d1a:	dba78793          	addi	a5,a5,-582 # 80008ad0 <kernelvec>
    80003d1e:	853e                	mv	a0,a5
    80003d20:	00000097          	auipc	ra,0x0
    80003d24:	ec4080e7          	jalr	-316(ra) # 80003be4 <w_stvec>
}
    80003d28:	0001                	nop
    80003d2a:	60a2                	ld	ra,8(sp)
    80003d2c:	6402                	ld	s0,0(sp)
    80003d2e:	0141                	addi	sp,sp,16
    80003d30:	8082                	ret

0000000080003d32 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003d32:	7179                	addi	sp,sp,-48
    80003d34:	f406                	sd	ra,40(sp)
    80003d36:	f022                	sd	s0,32(sp)
    80003d38:	ec26                	sd	s1,24(sp)
    80003d3a:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003d3c:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003d40:	00000097          	auipc	ra,0x0
    80003d44:	e08080e7          	jalr	-504(ra) # 80003b48 <r_sstatus>
    80003d48:	87aa                	mv	a5,a0
    80003d4a:	1007f793          	andi	a5,a5,256
    80003d4e:	cb89                	beqz	a5,80003d60 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003d50:	00007517          	auipc	a0,0x7
    80003d54:	5b850513          	addi	a0,a0,1464 # 8000b308 <etext+0x308>
    80003d58:	ffffd097          	auipc	ra,0xffffd
    80003d5c:	f26080e7          	jalr	-218(ra) # 80000c7e <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003d60:	00005797          	auipc	a5,0x5
    80003d64:	d7078793          	addi	a5,a5,-656 # 80008ad0 <kernelvec>
    80003d68:	853e                	mv	a0,a5
    80003d6a:	00000097          	auipc	ra,0x0
    80003d6e:	e7a080e7          	jalr	-390(ra) # 80003be4 <w_stvec>

  struct proc *p = myproc();
    80003d72:	fffff097          	auipc	ra,0xfffff
    80003d76:	aa6080e7          	jalr	-1370(ra) # 80002818 <myproc>
    80003d7a:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003d7e:	fd043783          	ld	a5,-48(s0)
    80003d82:	6fa4                	ld	s1,88(a5)
    80003d84:	00000097          	auipc	ra,0x0
    80003d88:	e46080e7          	jalr	-442(ra) # 80003bca <r_sepc>
    80003d8c:	87aa                	mv	a5,a0
    80003d8e:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003d90:	00000097          	auipc	ra,0x0
    80003d94:	e88080e7          	jalr	-376(ra) # 80003c18 <r_scause>
    80003d98:	872a                	mv	a4,a0
    80003d9a:	47a1                	li	a5,8
    80003d9c:	02f71d63          	bne	a4,a5,80003dd6 <usertrap+0xa4>
    // system call

    if(p->killed)
    80003da0:	fd043783          	ld	a5,-48(s0)
    80003da4:	579c                	lw	a5,40(a5)
    80003da6:	c791                	beqz	a5,80003db2 <usertrap+0x80>
      exit(-1);
    80003da8:	557d                	li	a0,-1
    80003daa:	fffff097          	auipc	ra,0xfffff
    80003dae:	17a080e7          	jalr	378(ra) # 80002f24 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003db2:	fd043783          	ld	a5,-48(s0)
    80003db6:	6fbc                	ld	a5,88(a5)
    80003db8:	6f98                	ld	a4,24(a5)
    80003dba:	fd043783          	ld	a5,-48(s0)
    80003dbe:	6fbc                	ld	a5,88(a5)
    80003dc0:	0711                	addi	a4,a4,4
    80003dc2:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80003dc4:	00000097          	auipc	ra,0x0
    80003dc8:	e88080e7          	jalr	-376(ra) # 80003c4c <intr_on>

    syscall();
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	67e080e7          	jalr	1662(ra) # 8000444a <syscall>
    80003dd4:	a0b5                	j	80003e40 <usertrap+0x10e>
  } else if((which_dev = devintr()) != 0){
    80003dd6:	00000097          	auipc	ra,0x0
    80003dda:	346080e7          	jalr	838(ra) # 8000411c <devintr>
    80003dde:	87aa                	mv	a5,a0
    80003de0:	fcf42e23          	sw	a5,-36(s0)
    80003de4:	fdc42783          	lw	a5,-36(s0)
    80003de8:	2781                	sext.w	a5,a5
    80003dea:	ebb9                	bnez	a5,80003e40 <usertrap+0x10e>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003dec:	00000097          	auipc	ra,0x0
    80003df0:	e2c080e7          	jalr	-468(ra) # 80003c18 <r_scause>
    80003df4:	872a                	mv	a4,a0
    80003df6:	fd043783          	ld	a5,-48(s0)
    80003dfa:	5b9c                	lw	a5,48(a5)
    80003dfc:	863e                	mv	a2,a5
    80003dfe:	85ba                	mv	a1,a4
    80003e00:	00007517          	auipc	a0,0x7
    80003e04:	52850513          	addi	a0,a0,1320 # 8000b328 <etext+0x328>
    80003e08:	ffffd097          	auipc	ra,0xffffd
    80003e0c:	c20080e7          	jalr	-992(ra) # 80000a28 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	dba080e7          	jalr	-582(ra) # 80003bca <r_sepc>
    80003e18:	84aa                	mv	s1,a0
    80003e1a:	00000097          	auipc	ra,0x0
    80003e1e:	e18080e7          	jalr	-488(ra) # 80003c32 <r_stval>
    80003e22:	87aa                	mv	a5,a0
    80003e24:	863e                	mv	a2,a5
    80003e26:	85a6                	mv	a1,s1
    80003e28:	00007517          	auipc	a0,0x7
    80003e2c:	53050513          	addi	a0,a0,1328 # 8000b358 <etext+0x358>
    80003e30:	ffffd097          	auipc	ra,0xffffd
    80003e34:	bf8080e7          	jalr	-1032(ra) # 80000a28 <printf>
    p->killed = 1;
    80003e38:	fd043783          	ld	a5,-48(s0)
    80003e3c:	4705                	li	a4,1
    80003e3e:	d798                	sw	a4,40(a5)
  }

  if(p->killed)
    80003e40:	fd043783          	ld	a5,-48(s0)
    80003e44:	579c                	lw	a5,40(a5)
    80003e46:	c791                	beqz	a5,80003e52 <usertrap+0x120>
    exit(-1);
    80003e48:	557d                	li	a0,-1
    80003e4a:	fffff097          	auipc	ra,0xfffff
    80003e4e:	0da080e7          	jalr	218(ra) # 80002f24 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003e52:	fdc42783          	lw	a5,-36(s0)
    80003e56:	0007871b          	sext.w	a4,a5
    80003e5a:	4789                	li	a5,2
    80003e5c:	00f71663          	bne	a4,a5,80003e68 <usertrap+0x136>
    yield();
    80003e60:	00000097          	auipc	ra,0x0
    80003e64:	85e080e7          	jalr	-1954(ra) # 800036be <yield>

  usertrapret();
    80003e68:	00000097          	auipc	ra,0x0
    80003e6c:	014080e7          	jalr	20(ra) # 80003e7c <usertrapret>
}
    80003e70:	0001                	nop
    80003e72:	70a2                	ld	ra,40(sp)
    80003e74:	7402                	ld	s0,32(sp)
    80003e76:	64e2                	ld	s1,24(sp)
    80003e78:	6145                	addi	sp,sp,48
    80003e7a:	8082                	ret

0000000080003e7c <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003e7c:	7139                	addi	sp,sp,-64
    80003e7e:	fc06                	sd	ra,56(sp)
    80003e80:	f822                	sd	s0,48(sp)
    80003e82:	f426                	sd	s1,40(sp)
    80003e84:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80003e86:	fffff097          	auipc	ra,0xfffff
    80003e8a:	992080e7          	jalr	-1646(ra) # 80002818 <myproc>
    80003e8e:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003e92:	00000097          	auipc	ra,0x0
    80003e96:	de4080e7          	jalr	-540(ra) # 80003c76 <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80003e9a:	00006717          	auipc	a4,0x6
    80003e9e:	16670713          	addi	a4,a4,358 # 8000a000 <_trampoline>
    80003ea2:	00006797          	auipc	a5,0x6
    80003ea6:	15e78793          	addi	a5,a5,350 # 8000a000 <_trampoline>
    80003eaa:	8f1d                	sub	a4,a4,a5
    80003eac:	040007b7          	lui	a5,0x4000
    80003eb0:	17fd                	addi	a5,a5,-1
    80003eb2:	07b2                	slli	a5,a5,0xc
    80003eb4:	97ba                	add	a5,a5,a4
    80003eb6:	853e                	mv	a0,a5
    80003eb8:	00000097          	auipc	ra,0x0
    80003ebc:	d2c080e7          	jalr	-724(ra) # 80003be4 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003ec0:	fd843783          	ld	a5,-40(s0)
    80003ec4:	6fa4                	ld	s1,88(a5)
    80003ec6:	00000097          	auipc	ra,0x0
    80003eca:	d38080e7          	jalr	-712(ra) # 80003bfe <r_satp>
    80003ece:	87aa                	mv	a5,a0
    80003ed0:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003ed2:	fd843783          	ld	a5,-40(s0)
    80003ed6:	63b4                	ld	a3,64(a5)
    80003ed8:	fd843783          	ld	a5,-40(s0)
    80003edc:	6fbc                	ld	a5,88(a5)
    80003ede:	6705                	lui	a4,0x1
    80003ee0:	9736                	add	a4,a4,a3
    80003ee2:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003ee4:	fd843783          	ld	a5,-40(s0)
    80003ee8:	6fbc                	ld	a5,88(a5)
    80003eea:	00000717          	auipc	a4,0x0
    80003eee:	e4870713          	addi	a4,a4,-440 # 80003d32 <usertrap>
    80003ef2:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003ef4:	fd843783          	ld	a5,-40(s0)
    80003ef8:	6fa4                	ld	s1,88(a5)
    80003efa:	00000097          	auipc	ra,0x0
    80003efe:	dd2080e7          	jalr	-558(ra) # 80003ccc <r_tp>
    80003f02:	87aa                	mv	a5,a0
    80003f04:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003f06:	00000097          	auipc	ra,0x0
    80003f0a:	c42080e7          	jalr	-958(ra) # 80003b48 <r_sstatus>
    80003f0e:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003f12:	fd043783          	ld	a5,-48(s0)
    80003f16:	eff7f793          	andi	a5,a5,-257
    80003f1a:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003f1e:	fd043783          	ld	a5,-48(s0)
    80003f22:	0207e793          	ori	a5,a5,32
    80003f26:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    80003f2a:	fd043503          	ld	a0,-48(s0)
    80003f2e:	00000097          	auipc	ra,0x0
    80003f32:	c34080e7          	jalr	-972(ra) # 80003b62 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003f36:	fd843783          	ld	a5,-40(s0)
    80003f3a:	6fbc                	ld	a5,88(a5)
    80003f3c:	6f9c                	ld	a5,24(a5)
    80003f3e:	853e                	mv	a0,a5
    80003f40:	00000097          	auipc	ra,0x0
    80003f44:	c70080e7          	jalr	-912(ra) # 80003bb0 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003f48:	fd843783          	ld	a5,-40(s0)
    80003f4c:	6bbc                	ld	a5,80(a5)
    80003f4e:	00c7d713          	srli	a4,a5,0xc
    80003f52:	57fd                	li	a5,-1
    80003f54:	17fe                	slli	a5,a5,0x3f
    80003f56:	8fd9                	or	a5,a5,a4
    80003f58:	fcf43423          	sd	a5,-56(s0)

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80003f5c:	00006717          	auipc	a4,0x6
    80003f60:	13470713          	addi	a4,a4,308 # 8000a090 <userret>
    80003f64:	00006797          	auipc	a5,0x6
    80003f68:	09c78793          	addi	a5,a5,156 # 8000a000 <_trampoline>
    80003f6c:	8f1d                	sub	a4,a4,a5
    80003f6e:	040007b7          	lui	a5,0x4000
    80003f72:	17fd                	addi	a5,a5,-1
    80003f74:	07b2                	slli	a5,a5,0xc
    80003f76:	97ba                	add	a5,a5,a4
    80003f78:	fcf43023          	sd	a5,-64(s0)
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80003f7c:	fc043703          	ld	a4,-64(s0)
    80003f80:	fc843583          	ld	a1,-56(s0)
    80003f84:	020007b7          	lui	a5,0x2000
    80003f88:	17fd                	addi	a5,a5,-1
    80003f8a:	00d79513          	slli	a0,a5,0xd
    80003f8e:	9702                	jalr	a4
}
    80003f90:	0001                	nop
    80003f92:	70e2                	ld	ra,56(sp)
    80003f94:	7442                	ld	s0,48(sp)
    80003f96:	74a2                	ld	s1,40(sp)
    80003f98:	6121                	addi	sp,sp,64
    80003f9a:	8082                	ret

0000000080003f9c <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003f9c:	7139                	addi	sp,sp,-64
    80003f9e:	fc06                	sd	ra,56(sp)
    80003fa0:	f822                	sd	s0,48(sp)
    80003fa2:	f426                	sd	s1,40(sp)
    80003fa4:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003fa6:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003faa:	00000097          	auipc	ra,0x0
    80003fae:	c20080e7          	jalr	-992(ra) # 80003bca <r_sepc>
    80003fb2:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003fb6:	00000097          	auipc	ra,0x0
    80003fba:	b92080e7          	jalr	-1134(ra) # 80003b48 <r_sstatus>
    80003fbe:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003fc2:	00000097          	auipc	ra,0x0
    80003fc6:	c56080e7          	jalr	-938(ra) # 80003c18 <r_scause>
    80003fca:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003fce:	fc843783          	ld	a5,-56(s0)
    80003fd2:	1007f793          	andi	a5,a5,256
    80003fd6:	eb89                	bnez	a5,80003fe8 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003fd8:	00007517          	auipc	a0,0x7
    80003fdc:	3a050513          	addi	a0,a0,928 # 8000b378 <etext+0x378>
    80003fe0:	ffffd097          	auipc	ra,0xffffd
    80003fe4:	c9e080e7          	jalr	-866(ra) # 80000c7e <panic>
  if(intr_get() != 0)
    80003fe8:	00000097          	auipc	ra,0x0
    80003fec:	cb6080e7          	jalr	-842(ra) # 80003c9e <intr_get>
    80003ff0:	87aa                	mv	a5,a0
    80003ff2:	cb89                	beqz	a5,80004004 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003ff4:	00007517          	auipc	a0,0x7
    80003ff8:	3ac50513          	addi	a0,a0,940 # 8000b3a0 <etext+0x3a0>
    80003ffc:	ffffd097          	auipc	ra,0xffffd
    80004000:	c82080e7          	jalr	-894(ra) # 80000c7e <panic>

  if((which_dev = devintr()) == 0){
    80004004:	00000097          	auipc	ra,0x0
    80004008:	118080e7          	jalr	280(ra) # 8000411c <devintr>
    8000400c:	87aa                	mv	a5,a0
    8000400e:	fcf42e23          	sw	a5,-36(s0)
    80004012:	fdc42783          	lw	a5,-36(s0)
    80004016:	2781                	sext.w	a5,a5
    80004018:	e7b9                	bnez	a5,80004066 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    8000401a:	fc043583          	ld	a1,-64(s0)
    8000401e:	00007517          	auipc	a0,0x7
    80004022:	3a250513          	addi	a0,a0,930 # 8000b3c0 <etext+0x3c0>
    80004026:	ffffd097          	auipc	ra,0xffffd
    8000402a:	a02080e7          	jalr	-1534(ra) # 80000a28 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    8000402e:	00000097          	auipc	ra,0x0
    80004032:	b9c080e7          	jalr	-1124(ra) # 80003bca <r_sepc>
    80004036:	84aa                	mv	s1,a0
    80004038:	00000097          	auipc	ra,0x0
    8000403c:	bfa080e7          	jalr	-1030(ra) # 80003c32 <r_stval>
    80004040:	87aa                	mv	a5,a0
    80004042:	863e                	mv	a2,a5
    80004044:	85a6                	mv	a1,s1
    80004046:	00007517          	auipc	a0,0x7
    8000404a:	38a50513          	addi	a0,a0,906 # 8000b3d0 <etext+0x3d0>
    8000404e:	ffffd097          	auipc	ra,0xffffd
    80004052:	9da080e7          	jalr	-1574(ra) # 80000a28 <printf>
    panic("kerneltrap");
    80004056:	00007517          	auipc	a0,0x7
    8000405a:	39250513          	addi	a0,a0,914 # 8000b3e8 <etext+0x3e8>
    8000405e:	ffffd097          	auipc	ra,0xffffd
    80004062:	c20080e7          	jalr	-992(ra) # 80000c7e <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80004066:	fdc42783          	lw	a5,-36(s0)
    8000406a:	0007871b          	sext.w	a4,a5
    8000406e:	4789                	li	a5,2
    80004070:	02f71663          	bne	a4,a5,8000409c <kerneltrap+0x100>
    80004074:	ffffe097          	auipc	ra,0xffffe
    80004078:	7a4080e7          	jalr	1956(ra) # 80002818 <myproc>
    8000407c:	87aa                	mv	a5,a0
    8000407e:	cf99                	beqz	a5,8000409c <kerneltrap+0x100>
    80004080:	ffffe097          	auipc	ra,0xffffe
    80004084:	798080e7          	jalr	1944(ra) # 80002818 <myproc>
    80004088:	87aa                	mv	a5,a0
    8000408a:	4f9c                	lw	a5,24(a5)
    8000408c:	873e                	mv	a4,a5
    8000408e:	4791                	li	a5,4
    80004090:	00f71663          	bne	a4,a5,8000409c <kerneltrap+0x100>
    yield();
    80004094:	fffff097          	auipc	ra,0xfffff
    80004098:	62a080e7          	jalr	1578(ra) # 800036be <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    8000409c:	fd043503          	ld	a0,-48(s0)
    800040a0:	00000097          	auipc	ra,0x0
    800040a4:	b10080e7          	jalr	-1264(ra) # 80003bb0 <w_sepc>
  w_sstatus(sstatus);
    800040a8:	fc843503          	ld	a0,-56(s0)
    800040ac:	00000097          	auipc	ra,0x0
    800040b0:	ab6080e7          	jalr	-1354(ra) # 80003b62 <w_sstatus>
}
    800040b4:	0001                	nop
    800040b6:	70e2                	ld	ra,56(sp)
    800040b8:	7442                	ld	s0,48(sp)
    800040ba:	74a2                	ld	s1,40(sp)
    800040bc:	6121                	addi	sp,sp,64
    800040be:	8082                	ret

00000000800040c0 <clockintr>:

void
clockintr()
{
    800040c0:	1141                	addi	sp,sp,-16
    800040c2:	e406                	sd	ra,8(sp)
    800040c4:	e022                	sd	s0,0(sp)
    800040c6:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    800040c8:	00017517          	auipc	a0,0x17
    800040cc:	a5850513          	addi	a0,a0,-1448 # 8001ab20 <tickslock>
    800040d0:	ffffd097          	auipc	ra,0xffffd
    800040d4:	19e080e7          	jalr	414(ra) # 8000126e <acquire>
  ticks++;
    800040d8:	00008797          	auipc	a5,0x8
    800040dc:	f5078793          	addi	a5,a5,-176 # 8000c028 <ticks>
    800040e0:	439c                	lw	a5,0(a5)
    800040e2:	2785                	addiw	a5,a5,1
    800040e4:	0007871b          	sext.w	a4,a5
    800040e8:	00008797          	auipc	a5,0x8
    800040ec:	f4078793          	addi	a5,a5,-192 # 8000c028 <ticks>
    800040f0:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    800040f2:	00008517          	auipc	a0,0x8
    800040f6:	f3650513          	addi	a0,a0,-202 # 8000c028 <ticks>
    800040fa:	fffff097          	auipc	ra,0xfffff
    800040fe:	6de080e7          	jalr	1758(ra) # 800037d8 <wakeup>
  release(&tickslock);
    80004102:	00017517          	auipc	a0,0x17
    80004106:	a1e50513          	addi	a0,a0,-1506 # 8001ab20 <tickslock>
    8000410a:	ffffd097          	auipc	ra,0xffffd
    8000410e:	1c8080e7          	jalr	456(ra) # 800012d2 <release>
}
    80004112:	0001                	nop
    80004114:	60a2                	ld	ra,8(sp)
    80004116:	6402                	ld	s0,0(sp)
    80004118:	0141                	addi	sp,sp,16
    8000411a:	8082                	ret

000000008000411c <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    8000411c:	1101                	addi	sp,sp,-32
    8000411e:	ec06                	sd	ra,24(sp)
    80004120:	e822                	sd	s0,16(sp)
    80004122:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004124:	00000097          	auipc	ra,0x0
    80004128:	af4080e7          	jalr	-1292(ra) # 80003c18 <r_scause>
    8000412c:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80004130:	fe843783          	ld	a5,-24(s0)
    80004134:	0807d463          	bgez	a5,800041bc <devintr+0xa0>
     (scause & 0xff) == 9){
    80004138:	fe843783          	ld	a5,-24(s0)
    8000413c:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80004140:	47a5                	li	a5,9
    80004142:	06f71d63          	bne	a4,a5,800041bc <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004146:	00005097          	auipc	ra,0x5
    8000414a:	abc080e7          	jalr	-1348(ra) # 80008c02 <plic_claim>
    8000414e:	87aa                	mv	a5,a0
    80004150:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004154:	fe442783          	lw	a5,-28(s0)
    80004158:	0007871b          	sext.w	a4,a5
    8000415c:	47a9                	li	a5,10
    8000415e:	00f71763          	bne	a4,a5,8000416c <devintr+0x50>
      uartintr();
    80004162:	ffffd097          	auipc	ra,0xffffd
    80004166:	e14080e7          	jalr	-492(ra) # 80000f76 <uartintr>
    8000416a:	a825                	j	800041a2 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    8000416c:	fe442783          	lw	a5,-28(s0)
    80004170:	0007871b          	sext.w	a4,a5
    80004174:	4785                	li	a5,1
    80004176:	00f71763          	bne	a4,a5,80004184 <devintr+0x68>
      virtio_disk_intr();
    8000417a:	00005097          	auipc	ra,0x5
    8000417e:	39c080e7          	jalr	924(ra) # 80009516 <virtio_disk_intr>
    80004182:	a005                	j	800041a2 <devintr+0x86>
    } else if(irq){
    80004184:	fe442783          	lw	a5,-28(s0)
    80004188:	2781                	sext.w	a5,a5
    8000418a:	cf81                	beqz	a5,800041a2 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    8000418c:	fe442783          	lw	a5,-28(s0)
    80004190:	85be                	mv	a1,a5
    80004192:	00007517          	auipc	a0,0x7
    80004196:	26650513          	addi	a0,a0,614 # 8000b3f8 <etext+0x3f8>
    8000419a:	ffffd097          	auipc	ra,0xffffd
    8000419e:	88e080e7          	jalr	-1906(ra) # 80000a28 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800041a2:	fe442783          	lw	a5,-28(s0)
    800041a6:	2781                	sext.w	a5,a5
    800041a8:	cb81                	beqz	a5,800041b8 <devintr+0x9c>
      plic_complete(irq);
    800041aa:	fe442783          	lw	a5,-28(s0)
    800041ae:	853e                	mv	a0,a5
    800041b0:	00005097          	auipc	ra,0x5
    800041b4:	a90080e7          	jalr	-1392(ra) # 80008c40 <plic_complete>

    return 1;
    800041b8:	4785                	li	a5,1
    800041ba:	a081                	j	800041fa <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    800041bc:	fe843703          	ld	a4,-24(s0)
    800041c0:	57fd                	li	a5,-1
    800041c2:	17fe                	slli	a5,a5,0x3f
    800041c4:	0785                	addi	a5,a5,1
    800041c6:	02f71963          	bne	a4,a5,800041f8 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800041ca:	ffffe097          	auipc	ra,0xffffe
    800041ce:	5ec080e7          	jalr	1516(ra) # 800027b6 <cpuid>
    800041d2:	87aa                	mv	a5,a0
    800041d4:	e789                	bnez	a5,800041de <devintr+0xc2>
      clockintr();
    800041d6:	00000097          	auipc	ra,0x0
    800041da:	eea080e7          	jalr	-278(ra) # 800040c0 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800041de:	00000097          	auipc	ra,0x0
    800041e2:	99e080e7          	jalr	-1634(ra) # 80003b7c <r_sip>
    800041e6:	87aa                	mv	a5,a0
    800041e8:	9bf5                	andi	a5,a5,-3
    800041ea:	853e                	mv	a0,a5
    800041ec:	00000097          	auipc	ra,0x0
    800041f0:	9aa080e7          	jalr	-1622(ra) # 80003b96 <w_sip>

    return 2;
    800041f4:	4789                	li	a5,2
    800041f6:	a011                	j	800041fa <devintr+0xde>
  } else {
    return 0;
    800041f8:	4781                	li	a5,0
  }
}
    800041fa:	853e                	mv	a0,a5
    800041fc:	60e2                	ld	ra,24(sp)
    800041fe:	6442                	ld	s0,16(sp)
    80004200:	6105                	addi	sp,sp,32
    80004202:	8082                	ret

0000000080004204 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80004204:	7179                	addi	sp,sp,-48
    80004206:	f406                	sd	ra,40(sp)
    80004208:	f022                	sd	s0,32(sp)
    8000420a:	1800                	addi	s0,sp,48
    8000420c:	fca43c23          	sd	a0,-40(s0)
    80004210:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80004214:	ffffe097          	auipc	ra,0xffffe
    80004218:	604080e7          	jalr	1540(ra) # 80002818 <myproc>
    8000421c:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80004220:	fe843783          	ld	a5,-24(s0)
    80004224:	67bc                	ld	a5,72(a5)
    80004226:	fd843703          	ld	a4,-40(s0)
    8000422a:	00f77b63          	bgeu	a4,a5,80004240 <fetchaddr+0x3c>
    8000422e:	fd843783          	ld	a5,-40(s0)
    80004232:	00878713          	addi	a4,a5,8
    80004236:	fe843783          	ld	a5,-24(s0)
    8000423a:	67bc                	ld	a5,72(a5)
    8000423c:	00e7f463          	bgeu	a5,a4,80004244 <fetchaddr+0x40>
    return -1;
    80004240:	57fd                	li	a5,-1
    80004242:	a01d                	j	80004268 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004244:	fe843783          	ld	a5,-24(s0)
    80004248:	6bbc                	ld	a5,80(a5)
    8000424a:	46a1                	li	a3,8
    8000424c:	fd843603          	ld	a2,-40(s0)
    80004250:	fd043583          	ld	a1,-48(s0)
    80004254:	853e                	mv	a0,a5
    80004256:	ffffe097          	auipc	ra,0xffffe
    8000425a:	15e080e7          	jalr	350(ra) # 800023b4 <copyin>
    8000425e:	87aa                	mv	a5,a0
    80004260:	c399                	beqz	a5,80004266 <fetchaddr+0x62>
    return -1;
    80004262:	57fd                	li	a5,-1
    80004264:	a011                	j	80004268 <fetchaddr+0x64>
  return 0;
    80004266:	4781                	li	a5,0
}
    80004268:	853e                	mv	a0,a5
    8000426a:	70a2                	ld	ra,40(sp)
    8000426c:	7402                	ld	s0,32(sp)
    8000426e:	6145                	addi	sp,sp,48
    80004270:	8082                	ret

0000000080004272 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004272:	7139                	addi	sp,sp,-64
    80004274:	fc06                	sd	ra,56(sp)
    80004276:	f822                	sd	s0,48(sp)
    80004278:	0080                	addi	s0,sp,64
    8000427a:	fca43c23          	sd	a0,-40(s0)
    8000427e:	fcb43823          	sd	a1,-48(s0)
    80004282:	87b2                	mv	a5,a2
    80004284:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004288:	ffffe097          	auipc	ra,0xffffe
    8000428c:	590080e7          	jalr	1424(ra) # 80002818 <myproc>
    80004290:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    80004294:	fe843783          	ld	a5,-24(s0)
    80004298:	6bbc                	ld	a5,80(a5)
    8000429a:	fcc42703          	lw	a4,-52(s0)
    8000429e:	86ba                	mv	a3,a4
    800042a0:	fd843603          	ld	a2,-40(s0)
    800042a4:	fd043583          	ld	a1,-48(s0)
    800042a8:	853e                	mv	a0,a5
    800042aa:	ffffe097          	auipc	ra,0xffffe
    800042ae:	1d8080e7          	jalr	472(ra) # 80002482 <copyinstr>
    800042b2:	87aa                	mv	a5,a0
    800042b4:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    800042b8:	fe442783          	lw	a5,-28(s0)
    800042bc:	2781                	sext.w	a5,a5
    800042be:	0007d563          	bgez	a5,800042c8 <fetchstr+0x56>
    return err;
    800042c2:	fe442783          	lw	a5,-28(s0)
    800042c6:	a801                	j	800042d6 <fetchstr+0x64>
  return strlen(buf);
    800042c8:	fd043503          	ld	a0,-48(s0)
    800042cc:	ffffd097          	auipc	ra,0xffffd
    800042d0:	4f4080e7          	jalr	1268(ra) # 800017c0 <strlen>
    800042d4:	87aa                	mv	a5,a0
}
    800042d6:	853e                	mv	a0,a5
    800042d8:	70e2                	ld	ra,56(sp)
    800042da:	7442                	ld	s0,48(sp)
    800042dc:	6121                	addi	sp,sp,64
    800042de:	8082                	ret

00000000800042e0 <argraw>:

static uint64
argraw(int n)
{
    800042e0:	7179                	addi	sp,sp,-48
    800042e2:	f406                	sd	ra,40(sp)
    800042e4:	f022                	sd	s0,32(sp)
    800042e6:	1800                	addi	s0,sp,48
    800042e8:	87aa                	mv	a5,a0
    800042ea:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800042ee:	ffffe097          	auipc	ra,0xffffe
    800042f2:	52a080e7          	jalr	1322(ra) # 80002818 <myproc>
    800042f6:	fea43423          	sd	a0,-24(s0)
    800042fa:	fdc42783          	lw	a5,-36(s0)
    800042fe:	0007871b          	sext.w	a4,a5
    80004302:	4795                	li	a5,5
    80004304:	06e7e263          	bltu	a5,a4,80004368 <argraw+0x88>
    80004308:	fdc46783          	lwu	a5,-36(s0)
    8000430c:	00279713          	slli	a4,a5,0x2
    80004310:	00007797          	auipc	a5,0x7
    80004314:	11078793          	addi	a5,a5,272 # 8000b420 <etext+0x420>
    80004318:	97ba                	add	a5,a5,a4
    8000431a:	439c                	lw	a5,0(a5)
    8000431c:	0007871b          	sext.w	a4,a5
    80004320:	00007797          	auipc	a5,0x7
    80004324:	10078793          	addi	a5,a5,256 # 8000b420 <etext+0x420>
    80004328:	97ba                	add	a5,a5,a4
    8000432a:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    8000432c:	fe843783          	ld	a5,-24(s0)
    80004330:	6fbc                	ld	a5,88(a5)
    80004332:	7bbc                	ld	a5,112(a5)
    80004334:	a091                	j	80004378 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004336:	fe843783          	ld	a5,-24(s0)
    8000433a:	6fbc                	ld	a5,88(a5)
    8000433c:	7fbc                	ld	a5,120(a5)
    8000433e:	a82d                	j	80004378 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004340:	fe843783          	ld	a5,-24(s0)
    80004344:	6fbc                	ld	a5,88(a5)
    80004346:	63dc                	ld	a5,128(a5)
    80004348:	a805                	j	80004378 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    8000434a:	fe843783          	ld	a5,-24(s0)
    8000434e:	6fbc                	ld	a5,88(a5)
    80004350:	67dc                	ld	a5,136(a5)
    80004352:	a01d                	j	80004378 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004354:	fe843783          	ld	a5,-24(s0)
    80004358:	6fbc                	ld	a5,88(a5)
    8000435a:	6bdc                	ld	a5,144(a5)
    8000435c:	a831                	j	80004378 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000435e:	fe843783          	ld	a5,-24(s0)
    80004362:	6fbc                	ld	a5,88(a5)
    80004364:	6fdc                	ld	a5,152(a5)
    80004366:	a809                	j	80004378 <argraw+0x98>
  }
  panic("argraw");
    80004368:	00007517          	auipc	a0,0x7
    8000436c:	0b050513          	addi	a0,a0,176 # 8000b418 <etext+0x418>
    80004370:	ffffd097          	auipc	ra,0xffffd
    80004374:	90e080e7          	jalr	-1778(ra) # 80000c7e <panic>
  return -1;
}
    80004378:	853e                	mv	a0,a5
    8000437a:	70a2                	ld	ra,40(sp)
    8000437c:	7402                	ld	s0,32(sp)
    8000437e:	6145                	addi	sp,sp,48
    80004380:	8082                	ret

0000000080004382 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    80004382:	1101                	addi	sp,sp,-32
    80004384:	ec06                	sd	ra,24(sp)
    80004386:	e822                	sd	s0,16(sp)
    80004388:	1000                	addi	s0,sp,32
    8000438a:	87aa                	mv	a5,a0
    8000438c:	feb43023          	sd	a1,-32(s0)
    80004390:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004394:	fec42783          	lw	a5,-20(s0)
    80004398:	853e                	mv	a0,a5
    8000439a:	00000097          	auipc	ra,0x0
    8000439e:	f46080e7          	jalr	-186(ra) # 800042e0 <argraw>
    800043a2:	87aa                	mv	a5,a0
    800043a4:	0007871b          	sext.w	a4,a5
    800043a8:	fe043783          	ld	a5,-32(s0)
    800043ac:	c398                	sw	a4,0(a5)
  return 0;
    800043ae:	4781                	li	a5,0
}
    800043b0:	853e                	mv	a0,a5
    800043b2:	60e2                	ld	ra,24(sp)
    800043b4:	6442                	ld	s0,16(sp)
    800043b6:	6105                	addi	sp,sp,32
    800043b8:	8082                	ret

00000000800043ba <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    800043ba:	1101                	addi	sp,sp,-32
    800043bc:	ec06                	sd	ra,24(sp)
    800043be:	e822                	sd	s0,16(sp)
    800043c0:	1000                	addi	s0,sp,32
    800043c2:	87aa                	mv	a5,a0
    800043c4:	feb43023          	sd	a1,-32(s0)
    800043c8:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800043cc:	fec42783          	lw	a5,-20(s0)
    800043d0:	853e                	mv	a0,a5
    800043d2:	00000097          	auipc	ra,0x0
    800043d6:	f0e080e7          	jalr	-242(ra) # 800042e0 <argraw>
    800043da:	872a                	mv	a4,a0
    800043dc:	fe043783          	ld	a5,-32(s0)
    800043e0:	e398                	sd	a4,0(a5)
  return 0;
    800043e2:	4781                	li	a5,0
}
    800043e4:	853e                	mv	a0,a5
    800043e6:	60e2                	ld	ra,24(sp)
    800043e8:	6442                	ld	s0,16(sp)
    800043ea:	6105                	addi	sp,sp,32
    800043ec:	8082                	ret

00000000800043ee <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800043ee:	7179                	addi	sp,sp,-48
    800043f0:	f406                	sd	ra,40(sp)
    800043f2:	f022                	sd	s0,32(sp)
    800043f4:	1800                	addi	s0,sp,48
    800043f6:	87aa                	mv	a5,a0
    800043f8:	fcb43823          	sd	a1,-48(s0)
    800043fc:	8732                	mv	a4,a2
    800043fe:	fcf42e23          	sw	a5,-36(s0)
    80004402:	87ba                	mv	a5,a4
    80004404:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    80004408:	fe840713          	addi	a4,s0,-24
    8000440c:	fdc42783          	lw	a5,-36(s0)
    80004410:	85ba                	mv	a1,a4
    80004412:	853e                	mv	a0,a5
    80004414:	00000097          	auipc	ra,0x0
    80004418:	fa6080e7          	jalr	-90(ra) # 800043ba <argaddr>
    8000441c:	87aa                	mv	a5,a0
    8000441e:	0007d463          	bgez	a5,80004426 <argstr+0x38>
    return -1;
    80004422:	57fd                	li	a5,-1
    80004424:	a831                	j	80004440 <argstr+0x52>
  return fetchstr(addr, buf, max);
    80004426:	fe843783          	ld	a5,-24(s0)
    8000442a:	fd842703          	lw	a4,-40(s0)
    8000442e:	863a                	mv	a2,a4
    80004430:	fd043583          	ld	a1,-48(s0)
    80004434:	853e                	mv	a0,a5
    80004436:	00000097          	auipc	ra,0x0
    8000443a:	e3c080e7          	jalr	-452(ra) # 80004272 <fetchstr>
    8000443e:	87aa                	mv	a5,a0
}
    80004440:	853e                	mv	a0,a5
    80004442:	70a2                	ld	ra,40(sp)
    80004444:	7402                	ld	s0,32(sp)
    80004446:	6145                	addi	sp,sp,48
    80004448:	8082                	ret

000000008000444a <syscall>:
[SYS_changeSchedulingAlgorithm] sys_changeSchedulingAlgorithm,
};

void
syscall(void)
{
    8000444a:	7179                	addi	sp,sp,-48
    8000444c:	f406                	sd	ra,40(sp)
    8000444e:	f022                	sd	s0,32(sp)
    80004450:	ec26                	sd	s1,24(sp)
    80004452:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004454:	ffffe097          	auipc	ra,0xffffe
    80004458:	3c4080e7          	jalr	964(ra) # 80002818 <myproc>
    8000445c:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004460:	fd843783          	ld	a5,-40(s0)
    80004464:	6fbc                	ld	a5,88(a5)
    80004466:	77dc                	ld	a5,168(a5)
    80004468:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000446c:	fd442783          	lw	a5,-44(s0)
    80004470:	2781                	sext.w	a5,a5
    80004472:	04f05263          	blez	a5,800044b6 <syscall+0x6c>
    80004476:	fd442783          	lw	a5,-44(s0)
    8000447a:	873e                	mv	a4,a5
    8000447c:	47d9                	li	a5,22
    8000447e:	02e7ec63          	bltu	a5,a4,800044b6 <syscall+0x6c>
    80004482:	00007717          	auipc	a4,0x7
    80004486:	38e70713          	addi	a4,a4,910 # 8000b810 <syscalls>
    8000448a:	fd442783          	lw	a5,-44(s0)
    8000448e:	078e                	slli	a5,a5,0x3
    80004490:	97ba                	add	a5,a5,a4
    80004492:	639c                	ld	a5,0(a5)
    80004494:	c38d                	beqz	a5,800044b6 <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    80004496:	00007717          	auipc	a4,0x7
    8000449a:	37a70713          	addi	a4,a4,890 # 8000b810 <syscalls>
    8000449e:	fd442783          	lw	a5,-44(s0)
    800044a2:	078e                	slli	a5,a5,0x3
    800044a4:	97ba                	add	a5,a5,a4
    800044a6:	6398                	ld	a4,0(a5)
    800044a8:	fd843783          	ld	a5,-40(s0)
    800044ac:	6fa4                	ld	s1,88(a5)
    800044ae:	9702                	jalr	a4
    800044b0:	87aa                	mv	a5,a0
    800044b2:	f8bc                	sd	a5,112(s1)
    800044b4:	a815                	j	800044e8 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800044b6:	fd843783          	ld	a5,-40(s0)
    800044ba:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800044bc:	fd843783          	ld	a5,-40(s0)
    800044c0:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800044c4:	fd442683          	lw	a3,-44(s0)
    800044c8:	863e                	mv	a2,a5
    800044ca:	85ba                	mv	a1,a4
    800044cc:	00007517          	auipc	a0,0x7
    800044d0:	f6c50513          	addi	a0,a0,-148 # 8000b438 <etext+0x438>
    800044d4:	ffffc097          	auipc	ra,0xffffc
    800044d8:	554080e7          	jalr	1364(ra) # 80000a28 <printf>
    p->trapframe->a0 = -1;
    800044dc:	fd843783          	ld	a5,-40(s0)
    800044e0:	6fbc                	ld	a5,88(a5)
    800044e2:	577d                	li	a4,-1
    800044e4:	fbb8                	sd	a4,112(a5)
  }
}
    800044e6:	0001                	nop
    800044e8:	0001                	nop
    800044ea:	70a2                	ld	ra,40(sp)
    800044ec:	7402                	ld	s0,32(sp)
    800044ee:	64e2                	ld	s1,24(sp)
    800044f0:	6145                	addi	sp,sp,48
    800044f2:	8082                	ret

00000000800044f4 <sys_exit>:
#include "proc.h"


uint64
sys_exit(void)
{
    800044f4:	1101                	addi	sp,sp,-32
    800044f6:	ec06                	sd	ra,24(sp)
    800044f8:	e822                	sd	s0,16(sp)
    800044fa:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    800044fc:	fec40793          	addi	a5,s0,-20
    80004500:	85be                	mv	a1,a5
    80004502:	4501                	li	a0,0
    80004504:	00000097          	auipc	ra,0x0
    80004508:	e7e080e7          	jalr	-386(ra) # 80004382 <argint>
    8000450c:	87aa                	mv	a5,a0
    8000450e:	0007d463          	bgez	a5,80004516 <sys_exit+0x22>
    return -1;
    80004512:	57fd                	li	a5,-1
    80004514:	a809                	j	80004526 <sys_exit+0x32>
  exit(n);
    80004516:	fec42783          	lw	a5,-20(s0)
    8000451a:	853e                	mv	a0,a5
    8000451c:	fffff097          	auipc	ra,0xfffff
    80004520:	a08080e7          	jalr	-1528(ra) # 80002f24 <exit>
  return 0;  // not reached
    80004524:	4781                	li	a5,0
}
    80004526:	853e                	mv	a0,a5
    80004528:	60e2                	ld	ra,24(sp)
    8000452a:	6442                	ld	s0,16(sp)
    8000452c:	6105                	addi	sp,sp,32
    8000452e:	8082                	ret

0000000080004530 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004530:	1141                	addi	sp,sp,-16
    80004532:	e406                	sd	ra,8(sp)
    80004534:	e022                	sd	s0,0(sp)
    80004536:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004538:	ffffe097          	auipc	ra,0xffffe
    8000453c:	2e0080e7          	jalr	736(ra) # 80002818 <myproc>
    80004540:	87aa                	mv	a5,a0
    80004542:	5b9c                	lw	a5,48(a5)
}
    80004544:	853e                	mv	a0,a5
    80004546:	60a2                	ld	ra,8(sp)
    80004548:	6402                	ld	s0,0(sp)
    8000454a:	0141                	addi	sp,sp,16
    8000454c:	8082                	ret

000000008000454e <sys_fork>:

uint64
sys_fork(void)
{
    8000454e:	1141                	addi	sp,sp,-16
    80004550:	e406                	sd	ra,8(sp)
    80004552:	e022                	sd	s0,0(sp)
    80004554:	0800                	addi	s0,sp,16
  return fork();
    80004556:	ffffe097          	auipc	ra,0xffffe
    8000455a:	7a8080e7          	jalr	1960(ra) # 80002cfe <fork>
    8000455e:	87aa                	mv	a5,a0
}
    80004560:	853e                	mv	a0,a5
    80004562:	60a2                	ld	ra,8(sp)
    80004564:	6402                	ld	s0,0(sp)
    80004566:	0141                	addi	sp,sp,16
    80004568:	8082                	ret

000000008000456a <sys_wait>:

uint64
sys_wait(void)
{
    8000456a:	1101                	addi	sp,sp,-32
    8000456c:	ec06                	sd	ra,24(sp)
    8000456e:	e822                	sd	s0,16(sp)
    80004570:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80004572:	fe840793          	addi	a5,s0,-24
    80004576:	85be                	mv	a1,a5
    80004578:	4501                	li	a0,0
    8000457a:	00000097          	auipc	ra,0x0
    8000457e:	e40080e7          	jalr	-448(ra) # 800043ba <argaddr>
    80004582:	87aa                	mv	a5,a0
    80004584:	0007d463          	bgez	a5,8000458c <sys_wait+0x22>
    return -1;
    80004588:	57fd                	li	a5,-1
    8000458a:	a809                	j	8000459c <sys_wait+0x32>
  return wait(p);
    8000458c:	fe843783          	ld	a5,-24(s0)
    80004590:	853e                	mv	a0,a5
    80004592:	fffff097          	auipc	ra,0xfffff
    80004596:	ace080e7          	jalr	-1330(ra) # 80003060 <wait>
    8000459a:	87aa                	mv	a5,a0
}
    8000459c:	853e                	mv	a0,a5
    8000459e:	60e2                	ld	ra,24(sp)
    800045a0:	6442                	ld	s0,16(sp)
    800045a2:	6105                	addi	sp,sp,32
    800045a4:	8082                	ret

00000000800045a6 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800045a6:	1101                	addi	sp,sp,-32
    800045a8:	ec06                	sd	ra,24(sp)
    800045aa:	e822                	sd	s0,16(sp)
    800045ac:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800045ae:	fe840793          	addi	a5,s0,-24
    800045b2:	85be                	mv	a1,a5
    800045b4:	4501                	li	a0,0
    800045b6:	00000097          	auipc	ra,0x0
    800045ba:	dcc080e7          	jalr	-564(ra) # 80004382 <argint>
    800045be:	87aa                	mv	a5,a0
    800045c0:	0007d463          	bgez	a5,800045c8 <sys_sbrk+0x22>
    return -1;
    800045c4:	57fd                	li	a5,-1
    800045c6:	a03d                	j	800045f4 <sys_sbrk+0x4e>
  addr = myproc()->sz;
    800045c8:	ffffe097          	auipc	ra,0xffffe
    800045cc:	250080e7          	jalr	592(ra) # 80002818 <myproc>
    800045d0:	87aa                	mv	a5,a0
    800045d2:	67bc                	ld	a5,72(a5)
    800045d4:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    800045d8:	fe842783          	lw	a5,-24(s0)
    800045dc:	853e                	mv	a0,a5
    800045de:	ffffe097          	auipc	ra,0xffffe
    800045e2:	66e080e7          	jalr	1646(ra) # 80002c4c <growproc>
    800045e6:	87aa                	mv	a5,a0
    800045e8:	0007d463          	bgez	a5,800045f0 <sys_sbrk+0x4a>
    return -1;
    800045ec:	57fd                	li	a5,-1
    800045ee:	a019                	j	800045f4 <sys_sbrk+0x4e>
  return addr;
    800045f0:	fec42783          	lw	a5,-20(s0)
}
    800045f4:	853e                	mv	a0,a5
    800045f6:	60e2                	ld	ra,24(sp)
    800045f8:	6442                	ld	s0,16(sp)
    800045fa:	6105                	addi	sp,sp,32
    800045fc:	8082                	ret

00000000800045fe <sys_sleep>:

uint64
sys_sleep(void)
{
    800045fe:	1101                	addi	sp,sp,-32
    80004600:	ec06                	sd	ra,24(sp)
    80004602:	e822                	sd	s0,16(sp)
    80004604:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80004606:	fe840793          	addi	a5,s0,-24
    8000460a:	85be                	mv	a1,a5
    8000460c:	4501                	li	a0,0
    8000460e:	00000097          	auipc	ra,0x0
    80004612:	d74080e7          	jalr	-652(ra) # 80004382 <argint>
    80004616:	87aa                	mv	a5,a0
    80004618:	0007d463          	bgez	a5,80004620 <sys_sleep+0x22>
    return -1;
    8000461c:	57fd                	li	a5,-1
    8000461e:	a079                	j	800046ac <sys_sleep+0xae>
  acquire(&tickslock);
    80004620:	00016517          	auipc	a0,0x16
    80004624:	50050513          	addi	a0,a0,1280 # 8001ab20 <tickslock>
    80004628:	ffffd097          	auipc	ra,0xffffd
    8000462c:	c46080e7          	jalr	-954(ra) # 8000126e <acquire>
  ticks0 = ticks;
    80004630:	00008797          	auipc	a5,0x8
    80004634:	9f878793          	addi	a5,a5,-1544 # 8000c028 <ticks>
    80004638:	439c                	lw	a5,0(a5)
    8000463a:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000463e:	a835                	j	8000467a <sys_sleep+0x7c>
    if(myproc()->killed){
    80004640:	ffffe097          	auipc	ra,0xffffe
    80004644:	1d8080e7          	jalr	472(ra) # 80002818 <myproc>
    80004648:	87aa                	mv	a5,a0
    8000464a:	579c                	lw	a5,40(a5)
    8000464c:	cb99                	beqz	a5,80004662 <sys_sleep+0x64>
      release(&tickslock);
    8000464e:	00016517          	auipc	a0,0x16
    80004652:	4d250513          	addi	a0,a0,1234 # 8001ab20 <tickslock>
    80004656:	ffffd097          	auipc	ra,0xffffd
    8000465a:	c7c080e7          	jalr	-900(ra) # 800012d2 <release>
      return -1;
    8000465e:	57fd                	li	a5,-1
    80004660:	a0b1                	j	800046ac <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004662:	00016597          	auipc	a1,0x16
    80004666:	4be58593          	addi	a1,a1,1214 # 8001ab20 <tickslock>
    8000466a:	00008517          	auipc	a0,0x8
    8000466e:	9be50513          	addi	a0,a0,-1602 # 8000c028 <ticks>
    80004672:	fffff097          	auipc	ra,0xfffff
    80004676:	0ea080e7          	jalr	234(ra) # 8000375c <sleep>
  while(ticks - ticks0 < n){
    8000467a:	00008797          	auipc	a5,0x8
    8000467e:	9ae78793          	addi	a5,a5,-1618 # 8000c028 <ticks>
    80004682:	4398                	lw	a4,0(a5)
    80004684:	fec42783          	lw	a5,-20(s0)
    80004688:	40f707bb          	subw	a5,a4,a5
    8000468c:	0007871b          	sext.w	a4,a5
    80004690:	fe842783          	lw	a5,-24(s0)
    80004694:	2781                	sext.w	a5,a5
    80004696:	faf765e3          	bltu	a4,a5,80004640 <sys_sleep+0x42>
  }
  release(&tickslock);
    8000469a:	00016517          	auipc	a0,0x16
    8000469e:	48650513          	addi	a0,a0,1158 # 8001ab20 <tickslock>
    800046a2:	ffffd097          	auipc	ra,0xffffd
    800046a6:	c30080e7          	jalr	-976(ra) # 800012d2 <release>
  return 0;
    800046aa:	4781                	li	a5,0
}
    800046ac:	853e                	mv	a0,a5
    800046ae:	60e2                	ld	ra,24(sp)
    800046b0:	6442                	ld	s0,16(sp)
    800046b2:	6105                	addi	sp,sp,32
    800046b4:	8082                	ret

00000000800046b6 <sys_kill>:

uint64
sys_kill(void)
{
    800046b6:	1101                	addi	sp,sp,-32
    800046b8:	ec06                	sd	ra,24(sp)
    800046ba:	e822                	sd	s0,16(sp)
    800046bc:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    800046be:	fec40793          	addi	a5,s0,-20
    800046c2:	85be                	mv	a1,a5
    800046c4:	4501                	li	a0,0
    800046c6:	00000097          	auipc	ra,0x0
    800046ca:	cbc080e7          	jalr	-836(ra) # 80004382 <argint>
    800046ce:	87aa                	mv	a5,a0
    800046d0:	0007d463          	bgez	a5,800046d8 <sys_kill+0x22>
    return -1;
    800046d4:	57fd                	li	a5,-1
    800046d6:	a809                	j	800046e8 <sys_kill+0x32>
  return kill(pid);
    800046d8:	fec42783          	lw	a5,-20(s0)
    800046dc:	853e                	mv	a0,a5
    800046de:	fffff097          	auipc	ra,0xfffff
    800046e2:	192080e7          	jalr	402(ra) # 80003870 <kill>
    800046e6:	87aa                	mv	a5,a0
}
    800046e8:	853e                	mv	a0,a5
    800046ea:	60e2                	ld	ra,24(sp)
    800046ec:	6442                	ld	s0,16(sp)
    800046ee:	6105                	addi	sp,sp,32
    800046f0:	8082                	ret

00000000800046f2 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800046f2:	1101                	addi	sp,sp,-32
    800046f4:	ec06                	sd	ra,24(sp)
    800046f6:	e822                	sd	s0,16(sp)
    800046f8:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800046fa:	00016517          	auipc	a0,0x16
    800046fe:	42650513          	addi	a0,a0,1062 # 8001ab20 <tickslock>
    80004702:	ffffd097          	auipc	ra,0xffffd
    80004706:	b6c080e7          	jalr	-1172(ra) # 8000126e <acquire>
  xticks = ticks;
    8000470a:	00008797          	auipc	a5,0x8
    8000470e:	91e78793          	addi	a5,a5,-1762 # 8000c028 <ticks>
    80004712:	439c                	lw	a5,0(a5)
    80004714:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004718:	00016517          	auipc	a0,0x16
    8000471c:	40850513          	addi	a0,a0,1032 # 8001ab20 <tickslock>
    80004720:	ffffd097          	auipc	ra,0xffffd
    80004724:	bb2080e7          	jalr	-1102(ra) # 800012d2 <release>
  return xticks;
    80004728:	fec46783          	lwu	a5,-20(s0)
}
    8000472c:	853e                	mv	a0,a5
    8000472e:	60e2                	ld	ra,24(sp)
    80004730:	6442                	ld	s0,16(sp)
    80004732:	6105                	addi	sp,sp,32
    80004734:	8082                	ret

0000000080004736 <sys_changeSchedulingAlgorithm>:

uint64
sys_changeSchedulingAlgorithm(void)
{
    80004736:	1101                	addi	sp,sp,-32
    80004738:	ec06                	sd	ra,24(sp)
    8000473a:	e822                	sd	s0,16(sp)
    8000473c:	1000                	addi	s0,sp,32
    char sp[3];
    int ex;
    int bool;
    if(argstr(0, sp,4) < 0) //uzimamo prvi parametar koji nam govori koji algoritam da koristimo
    8000473e:	fe840793          	addi	a5,s0,-24
    80004742:	4611                	li	a2,4
    80004744:	85be                	mv	a1,a5
    80004746:	4501                	li	a0,0
    80004748:	00000097          	auipc	ra,0x0
    8000474c:	ca6080e7          	jalr	-858(ra) # 800043ee <argstr>
    80004750:	87aa                	mv	a5,a0
    80004752:	0007d463          	bgez	a5,8000475a <sys_changeSchedulingAlgorithm+0x24>
        return -1;
    80004756:	57fd                	li	a5,-1
    80004758:	a889                	j	800047aa <sys_changeSchedulingAlgorithm+0x74>
    if(argint(1, &ex) < 0) //uzimamo drugi parametar koji nam govori koji algoritam da koristimo
    8000475a:	fe440793          	addi	a5,s0,-28
    8000475e:	85be                	mv	a1,a5
    80004760:	4505                	li	a0,1
    80004762:	00000097          	auipc	ra,0x0
    80004766:	c20080e7          	jalr	-992(ra) # 80004382 <argint>
    8000476a:	87aa                	mv	a5,a0
    8000476c:	0007d463          	bgez	a5,80004774 <sys_changeSchedulingAlgorithm+0x3e>
        return -1;
    80004770:	57fd                	li	a5,-1
    80004772:	a825                	j	800047aa <sys_changeSchedulingAlgorithm+0x74>
    if(argint(2, &bool) < 0) //uzimamo treci parametar koji nam govori koji algoritam da koristimo
    80004774:	fe040793          	addi	a5,s0,-32
    80004778:	85be                	mv	a1,a5
    8000477a:	4509                	li	a0,2
    8000477c:	00000097          	auipc	ra,0x0
    80004780:	c06080e7          	jalr	-1018(ra) # 80004382 <argint>
    80004784:	87aa                	mv	a5,a0
    80004786:	0007d463          	bgez	a5,8000478e <sys_changeSchedulingAlgorithm+0x58>
        return -1;
    8000478a:	57fd                	li	a5,-1
    8000478c:	a839                	j	800047aa <sys_changeSchedulingAlgorithm+0x74>

//    printf(" prva1: %s  ",sp);
//    printf(" prva2: %d \n",ex);
    return changeSchedulingAlgorithm(sp,ex,bool);
    8000478e:	fe442703          	lw	a4,-28(s0)
    80004792:	fe042683          	lw	a3,-32(s0)
    80004796:	fe840793          	addi	a5,s0,-24
    8000479a:	8636                	mv	a2,a3
    8000479c:	85ba                	mv	a1,a4
    8000479e:	853e                	mv	a0,a5
    800047a0:	fffff097          	auipc	ra,0xfffff
    800047a4:	d1c080e7          	jalr	-740(ra) # 800034bc <changeSchedulingAlgorithm>
    800047a8:	87aa                	mv	a5,a0
    800047aa:	853e                	mv	a0,a5
    800047ac:	60e2                	ld	ra,24(sp)
    800047ae:	6442                	ld	s0,16(sp)
    800047b0:	6105                	addi	sp,sp,32
    800047b2:	8082                	ret

00000000800047b4 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800047b4:	1101                	addi	sp,sp,-32
    800047b6:	ec06                	sd	ra,24(sp)
    800047b8:	e822                	sd	s0,16(sp)
    800047ba:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800047bc:	00007597          	auipc	a1,0x7
    800047c0:	c9c58593          	addi	a1,a1,-868 # 8000b458 <etext+0x458>
    800047c4:	00016517          	auipc	a0,0x16
    800047c8:	37450513          	addi	a0,a0,884 # 8001ab38 <bcache>
    800047cc:	ffffd097          	auipc	ra,0xffffd
    800047d0:	a72080e7          	jalr	-1422(ra) # 8000123e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800047d4:	00016717          	auipc	a4,0x16
    800047d8:	36470713          	addi	a4,a4,868 # 8001ab38 <bcache>
    800047dc:	67a1                	lui	a5,0x8
    800047de:	97ba                	add	a5,a5,a4
    800047e0:	0001e717          	auipc	a4,0x1e
    800047e4:	5c070713          	addi	a4,a4,1472 # 80022da0 <bcache+0x8268>
    800047e8:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800047ec:	00016717          	auipc	a4,0x16
    800047f0:	34c70713          	addi	a4,a4,844 # 8001ab38 <bcache>
    800047f4:	67a1                	lui	a5,0x8
    800047f6:	97ba                	add	a5,a5,a4
    800047f8:	0001e717          	auipc	a4,0x1e
    800047fc:	5a870713          	addi	a4,a4,1448 # 80022da0 <bcache+0x8268>
    80004800:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004804:	00016797          	auipc	a5,0x16
    80004808:	34c78793          	addi	a5,a5,844 # 8001ab50 <bcache+0x18>
    8000480c:	fef43423          	sd	a5,-24(s0)
    80004810:	a895                	j	80004884 <binit+0xd0>
    b->next = bcache.head.next;
    80004812:	00016717          	auipc	a4,0x16
    80004816:	32670713          	addi	a4,a4,806 # 8001ab38 <bcache>
    8000481a:	67a1                	lui	a5,0x8
    8000481c:	97ba                	add	a5,a5,a4
    8000481e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004822:	fe843783          	ld	a5,-24(s0)
    80004826:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004828:	fe843783          	ld	a5,-24(s0)
    8000482c:	0001e717          	auipc	a4,0x1e
    80004830:	57470713          	addi	a4,a4,1396 # 80022da0 <bcache+0x8268>
    80004834:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004836:	fe843783          	ld	a5,-24(s0)
    8000483a:	07c1                	addi	a5,a5,16
    8000483c:	00007597          	auipc	a1,0x7
    80004840:	c2458593          	addi	a1,a1,-988 # 8000b460 <etext+0x460>
    80004844:	853e                	mv	a0,a5
    80004846:	00002097          	auipc	ra,0x2
    8000484a:	ff8080e7          	jalr	-8(ra) # 8000683e <initsleeplock>
    bcache.head.next->prev = b;
    8000484e:	00016717          	auipc	a4,0x16
    80004852:	2ea70713          	addi	a4,a4,746 # 8001ab38 <bcache>
    80004856:	67a1                	lui	a5,0x8
    80004858:	97ba                	add	a5,a5,a4
    8000485a:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000485e:	fe843703          	ld	a4,-24(s0)
    80004862:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004864:	00016717          	auipc	a4,0x16
    80004868:	2d470713          	addi	a4,a4,724 # 8001ab38 <bcache>
    8000486c:	67a1                	lui	a5,0x8
    8000486e:	97ba                	add	a5,a5,a4
    80004870:	fe843703          	ld	a4,-24(s0)
    80004874:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004878:	fe843783          	ld	a5,-24(s0)
    8000487c:	45878793          	addi	a5,a5,1112
    80004880:	fef43423          	sd	a5,-24(s0)
    80004884:	0001e797          	auipc	a5,0x1e
    80004888:	51c78793          	addi	a5,a5,1308 # 80022da0 <bcache+0x8268>
    8000488c:	fe843703          	ld	a4,-24(s0)
    80004890:	f8f761e3          	bltu	a4,a5,80004812 <binit+0x5e>
  }
}
    80004894:	0001                	nop
    80004896:	0001                	nop
    80004898:	60e2                	ld	ra,24(sp)
    8000489a:	6442                	ld	s0,16(sp)
    8000489c:	6105                	addi	sp,sp,32
    8000489e:	8082                	ret

00000000800048a0 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800048a0:	7179                	addi	sp,sp,-48
    800048a2:	f406                	sd	ra,40(sp)
    800048a4:	f022                	sd	s0,32(sp)
    800048a6:	1800                	addi	s0,sp,48
    800048a8:	87aa                	mv	a5,a0
    800048aa:	872e                	mv	a4,a1
    800048ac:	fcf42e23          	sw	a5,-36(s0)
    800048b0:	87ba                	mv	a5,a4
    800048b2:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800048b6:	00016517          	auipc	a0,0x16
    800048ba:	28250513          	addi	a0,a0,642 # 8001ab38 <bcache>
    800048be:	ffffd097          	auipc	ra,0xffffd
    800048c2:	9b0080e7          	jalr	-1616(ra) # 8000126e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800048c6:	00016717          	auipc	a4,0x16
    800048ca:	27270713          	addi	a4,a4,626 # 8001ab38 <bcache>
    800048ce:	67a1                	lui	a5,0x8
    800048d0:	97ba                	add	a5,a5,a4
    800048d2:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800048d6:	fef43423          	sd	a5,-24(s0)
    800048da:	a095                	j	8000493e <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800048dc:	fe843783          	ld	a5,-24(s0)
    800048e0:	4798                	lw	a4,8(a5)
    800048e2:	fdc42783          	lw	a5,-36(s0)
    800048e6:	2781                	sext.w	a5,a5
    800048e8:	04e79663          	bne	a5,a4,80004934 <bget+0x94>
    800048ec:	fe843783          	ld	a5,-24(s0)
    800048f0:	47d8                	lw	a4,12(a5)
    800048f2:	fd842783          	lw	a5,-40(s0)
    800048f6:	2781                	sext.w	a5,a5
    800048f8:	02e79e63          	bne	a5,a4,80004934 <bget+0x94>
      b->refcnt++;
    800048fc:	fe843783          	ld	a5,-24(s0)
    80004900:	43bc                	lw	a5,64(a5)
    80004902:	2785                	addiw	a5,a5,1
    80004904:	0007871b          	sext.w	a4,a5
    80004908:	fe843783          	ld	a5,-24(s0)
    8000490c:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000490e:	00016517          	auipc	a0,0x16
    80004912:	22a50513          	addi	a0,a0,554 # 8001ab38 <bcache>
    80004916:	ffffd097          	auipc	ra,0xffffd
    8000491a:	9bc080e7          	jalr	-1604(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    8000491e:	fe843783          	ld	a5,-24(s0)
    80004922:	07c1                	addi	a5,a5,16
    80004924:	853e                	mv	a0,a5
    80004926:	00002097          	auipc	ra,0x2
    8000492a:	f64080e7          	jalr	-156(ra) # 8000688a <acquiresleep>
      return b;
    8000492e:	fe843783          	ld	a5,-24(s0)
    80004932:	a07d                	j	800049e0 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004934:	fe843783          	ld	a5,-24(s0)
    80004938:	6bbc                	ld	a5,80(a5)
    8000493a:	fef43423          	sd	a5,-24(s0)
    8000493e:	fe843703          	ld	a4,-24(s0)
    80004942:	0001e797          	auipc	a5,0x1e
    80004946:	45e78793          	addi	a5,a5,1118 # 80022da0 <bcache+0x8268>
    8000494a:	f8f719e3          	bne	a4,a5,800048dc <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000494e:	00016717          	auipc	a4,0x16
    80004952:	1ea70713          	addi	a4,a4,490 # 8001ab38 <bcache>
    80004956:	67a1                	lui	a5,0x8
    80004958:	97ba                	add	a5,a5,a4
    8000495a:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    8000495e:	fef43423          	sd	a5,-24(s0)
    80004962:	a8b9                	j	800049c0 <bget+0x120>
    if(b->refcnt == 0) {
    80004964:	fe843783          	ld	a5,-24(s0)
    80004968:	43bc                	lw	a5,64(a5)
    8000496a:	e7b1                	bnez	a5,800049b6 <bget+0x116>
      b->dev = dev;
    8000496c:	fe843783          	ld	a5,-24(s0)
    80004970:	fdc42703          	lw	a4,-36(s0)
    80004974:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004976:	fe843783          	ld	a5,-24(s0)
    8000497a:	fd842703          	lw	a4,-40(s0)
    8000497e:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004980:	fe843783          	ld	a5,-24(s0)
    80004984:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004988:	fe843783          	ld	a5,-24(s0)
    8000498c:	4705                	li	a4,1
    8000498e:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004990:	00016517          	auipc	a0,0x16
    80004994:	1a850513          	addi	a0,a0,424 # 8001ab38 <bcache>
    80004998:	ffffd097          	auipc	ra,0xffffd
    8000499c:	93a080e7          	jalr	-1734(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    800049a0:	fe843783          	ld	a5,-24(s0)
    800049a4:	07c1                	addi	a5,a5,16
    800049a6:	853e                	mv	a0,a5
    800049a8:	00002097          	auipc	ra,0x2
    800049ac:	ee2080e7          	jalr	-286(ra) # 8000688a <acquiresleep>
      return b;
    800049b0:	fe843783          	ld	a5,-24(s0)
    800049b4:	a035                	j	800049e0 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800049b6:	fe843783          	ld	a5,-24(s0)
    800049ba:	67bc                	ld	a5,72(a5)
    800049bc:	fef43423          	sd	a5,-24(s0)
    800049c0:	fe843703          	ld	a4,-24(s0)
    800049c4:	0001e797          	auipc	a5,0x1e
    800049c8:	3dc78793          	addi	a5,a5,988 # 80022da0 <bcache+0x8268>
    800049cc:	f8f71ce3          	bne	a4,a5,80004964 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800049d0:	00007517          	auipc	a0,0x7
    800049d4:	a9850513          	addi	a0,a0,-1384 # 8000b468 <etext+0x468>
    800049d8:	ffffc097          	auipc	ra,0xffffc
    800049dc:	2a6080e7          	jalr	678(ra) # 80000c7e <panic>
}
    800049e0:	853e                	mv	a0,a5
    800049e2:	70a2                	ld	ra,40(sp)
    800049e4:	7402                	ld	s0,32(sp)
    800049e6:	6145                	addi	sp,sp,48
    800049e8:	8082                	ret

00000000800049ea <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    800049ea:	7179                	addi	sp,sp,-48
    800049ec:	f406                	sd	ra,40(sp)
    800049ee:	f022                	sd	s0,32(sp)
    800049f0:	1800                	addi	s0,sp,48
    800049f2:	87aa                	mv	a5,a0
    800049f4:	872e                	mv	a4,a1
    800049f6:	fcf42e23          	sw	a5,-36(s0)
    800049fa:	87ba                	mv	a5,a4
    800049fc:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004a00:	fd842703          	lw	a4,-40(s0)
    80004a04:	fdc42783          	lw	a5,-36(s0)
    80004a08:	85ba                	mv	a1,a4
    80004a0a:	853e                	mv	a0,a5
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	e94080e7          	jalr	-364(ra) # 800048a0 <bget>
    80004a14:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004a18:	fe843783          	ld	a5,-24(s0)
    80004a1c:	439c                	lw	a5,0(a5)
    80004a1e:	ef81                	bnez	a5,80004a36 <bread+0x4c>
    virtio_disk_rw(b, 0);
    80004a20:	4581                	li	a1,0
    80004a22:	fe843503          	ld	a0,-24(s0)
    80004a26:	00004097          	auipc	ra,0x4
    80004a2a:	754080e7          	jalr	1876(ra) # 8000917a <virtio_disk_rw>
    b->valid = 1;
    80004a2e:	fe843783          	ld	a5,-24(s0)
    80004a32:	4705                	li	a4,1
    80004a34:	c398                	sw	a4,0(a5)
  }
  return b;
    80004a36:	fe843783          	ld	a5,-24(s0)
}
    80004a3a:	853e                	mv	a0,a5
    80004a3c:	70a2                	ld	ra,40(sp)
    80004a3e:	7402                	ld	s0,32(sp)
    80004a40:	6145                	addi	sp,sp,48
    80004a42:	8082                	ret

0000000080004a44 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004a44:	1101                	addi	sp,sp,-32
    80004a46:	ec06                	sd	ra,24(sp)
    80004a48:	e822                	sd	s0,16(sp)
    80004a4a:	1000                	addi	s0,sp,32
    80004a4c:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004a50:	fe843783          	ld	a5,-24(s0)
    80004a54:	07c1                	addi	a5,a5,16
    80004a56:	853e                	mv	a0,a5
    80004a58:	00002097          	auipc	ra,0x2
    80004a5c:	ef2080e7          	jalr	-270(ra) # 8000694a <holdingsleep>
    80004a60:	87aa                	mv	a5,a0
    80004a62:	eb89                	bnez	a5,80004a74 <bwrite+0x30>
    panic("bwrite");
    80004a64:	00007517          	auipc	a0,0x7
    80004a68:	a1c50513          	addi	a0,a0,-1508 # 8000b480 <etext+0x480>
    80004a6c:	ffffc097          	auipc	ra,0xffffc
    80004a70:	212080e7          	jalr	530(ra) # 80000c7e <panic>
  virtio_disk_rw(b, 1);
    80004a74:	4585                	li	a1,1
    80004a76:	fe843503          	ld	a0,-24(s0)
    80004a7a:	00004097          	auipc	ra,0x4
    80004a7e:	700080e7          	jalr	1792(ra) # 8000917a <virtio_disk_rw>
}
    80004a82:	0001                	nop
    80004a84:	60e2                	ld	ra,24(sp)
    80004a86:	6442                	ld	s0,16(sp)
    80004a88:	6105                	addi	sp,sp,32
    80004a8a:	8082                	ret

0000000080004a8c <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004a8c:	1101                	addi	sp,sp,-32
    80004a8e:	ec06                	sd	ra,24(sp)
    80004a90:	e822                	sd	s0,16(sp)
    80004a92:	1000                	addi	s0,sp,32
    80004a94:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004a98:	fe843783          	ld	a5,-24(s0)
    80004a9c:	07c1                	addi	a5,a5,16
    80004a9e:	853e                	mv	a0,a5
    80004aa0:	00002097          	auipc	ra,0x2
    80004aa4:	eaa080e7          	jalr	-342(ra) # 8000694a <holdingsleep>
    80004aa8:	87aa                	mv	a5,a0
    80004aaa:	eb89                	bnez	a5,80004abc <brelse+0x30>
    panic("brelse");
    80004aac:	00007517          	auipc	a0,0x7
    80004ab0:	9dc50513          	addi	a0,a0,-1572 # 8000b488 <etext+0x488>
    80004ab4:	ffffc097          	auipc	ra,0xffffc
    80004ab8:	1ca080e7          	jalr	458(ra) # 80000c7e <panic>

  releasesleep(&b->lock);
    80004abc:	fe843783          	ld	a5,-24(s0)
    80004ac0:	07c1                	addi	a5,a5,16
    80004ac2:	853e                	mv	a0,a5
    80004ac4:	00002097          	auipc	ra,0x2
    80004ac8:	e34080e7          	jalr	-460(ra) # 800068f8 <releasesleep>

  acquire(&bcache.lock);
    80004acc:	00016517          	auipc	a0,0x16
    80004ad0:	06c50513          	addi	a0,a0,108 # 8001ab38 <bcache>
    80004ad4:	ffffc097          	auipc	ra,0xffffc
    80004ad8:	79a080e7          	jalr	1946(ra) # 8000126e <acquire>
  b->refcnt--;
    80004adc:	fe843783          	ld	a5,-24(s0)
    80004ae0:	43bc                	lw	a5,64(a5)
    80004ae2:	37fd                	addiw	a5,a5,-1
    80004ae4:	0007871b          	sext.w	a4,a5
    80004ae8:	fe843783          	ld	a5,-24(s0)
    80004aec:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004aee:	fe843783          	ld	a5,-24(s0)
    80004af2:	43bc                	lw	a5,64(a5)
    80004af4:	e7b5                	bnez	a5,80004b60 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004af6:	fe843783          	ld	a5,-24(s0)
    80004afa:	6bbc                	ld	a5,80(a5)
    80004afc:	fe843703          	ld	a4,-24(s0)
    80004b00:	6738                	ld	a4,72(a4)
    80004b02:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004b04:	fe843783          	ld	a5,-24(s0)
    80004b08:	67bc                	ld	a5,72(a5)
    80004b0a:	fe843703          	ld	a4,-24(s0)
    80004b0e:	6b38                	ld	a4,80(a4)
    80004b10:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004b12:	00016717          	auipc	a4,0x16
    80004b16:	02670713          	addi	a4,a4,38 # 8001ab38 <bcache>
    80004b1a:	67a1                	lui	a5,0x8
    80004b1c:	97ba                	add	a5,a5,a4
    80004b1e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b22:	fe843783          	ld	a5,-24(s0)
    80004b26:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004b28:	fe843783          	ld	a5,-24(s0)
    80004b2c:	0001e717          	auipc	a4,0x1e
    80004b30:	27470713          	addi	a4,a4,628 # 80022da0 <bcache+0x8268>
    80004b34:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004b36:	00016717          	auipc	a4,0x16
    80004b3a:	00270713          	addi	a4,a4,2 # 8001ab38 <bcache>
    80004b3e:	67a1                	lui	a5,0x8
    80004b40:	97ba                	add	a5,a5,a4
    80004b42:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b46:	fe843703          	ld	a4,-24(s0)
    80004b4a:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004b4c:	00016717          	auipc	a4,0x16
    80004b50:	fec70713          	addi	a4,a4,-20 # 8001ab38 <bcache>
    80004b54:	67a1                	lui	a5,0x8
    80004b56:	97ba                	add	a5,a5,a4
    80004b58:	fe843703          	ld	a4,-24(s0)
    80004b5c:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004b60:	00016517          	auipc	a0,0x16
    80004b64:	fd850513          	addi	a0,a0,-40 # 8001ab38 <bcache>
    80004b68:	ffffc097          	auipc	ra,0xffffc
    80004b6c:	76a080e7          	jalr	1898(ra) # 800012d2 <release>
}
    80004b70:	0001                	nop
    80004b72:	60e2                	ld	ra,24(sp)
    80004b74:	6442                	ld	s0,16(sp)
    80004b76:	6105                	addi	sp,sp,32
    80004b78:	8082                	ret

0000000080004b7a <bpin>:

void
bpin(struct buf *b) {
    80004b7a:	1101                	addi	sp,sp,-32
    80004b7c:	ec06                	sd	ra,24(sp)
    80004b7e:	e822                	sd	s0,16(sp)
    80004b80:	1000                	addi	s0,sp,32
    80004b82:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004b86:	00016517          	auipc	a0,0x16
    80004b8a:	fb250513          	addi	a0,a0,-78 # 8001ab38 <bcache>
    80004b8e:	ffffc097          	auipc	ra,0xffffc
    80004b92:	6e0080e7          	jalr	1760(ra) # 8000126e <acquire>
  b->refcnt++;
    80004b96:	fe843783          	ld	a5,-24(s0)
    80004b9a:	43bc                	lw	a5,64(a5)
    80004b9c:	2785                	addiw	a5,a5,1
    80004b9e:	0007871b          	sext.w	a4,a5
    80004ba2:	fe843783          	ld	a5,-24(s0)
    80004ba6:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004ba8:	00016517          	auipc	a0,0x16
    80004bac:	f9050513          	addi	a0,a0,-112 # 8001ab38 <bcache>
    80004bb0:	ffffc097          	auipc	ra,0xffffc
    80004bb4:	722080e7          	jalr	1826(ra) # 800012d2 <release>
}
    80004bb8:	0001                	nop
    80004bba:	60e2                	ld	ra,24(sp)
    80004bbc:	6442                	ld	s0,16(sp)
    80004bbe:	6105                	addi	sp,sp,32
    80004bc0:	8082                	ret

0000000080004bc2 <bunpin>:

void
bunpin(struct buf *b) {
    80004bc2:	1101                	addi	sp,sp,-32
    80004bc4:	ec06                	sd	ra,24(sp)
    80004bc6:	e822                	sd	s0,16(sp)
    80004bc8:	1000                	addi	s0,sp,32
    80004bca:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004bce:	00016517          	auipc	a0,0x16
    80004bd2:	f6a50513          	addi	a0,a0,-150 # 8001ab38 <bcache>
    80004bd6:	ffffc097          	auipc	ra,0xffffc
    80004bda:	698080e7          	jalr	1688(ra) # 8000126e <acquire>
  b->refcnt--;
    80004bde:	fe843783          	ld	a5,-24(s0)
    80004be2:	43bc                	lw	a5,64(a5)
    80004be4:	37fd                	addiw	a5,a5,-1
    80004be6:	0007871b          	sext.w	a4,a5
    80004bea:	fe843783          	ld	a5,-24(s0)
    80004bee:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004bf0:	00016517          	auipc	a0,0x16
    80004bf4:	f4850513          	addi	a0,a0,-184 # 8001ab38 <bcache>
    80004bf8:	ffffc097          	auipc	ra,0xffffc
    80004bfc:	6da080e7          	jalr	1754(ra) # 800012d2 <release>
}
    80004c00:	0001                	nop
    80004c02:	60e2                	ld	ra,24(sp)
    80004c04:	6442                	ld	s0,16(sp)
    80004c06:	6105                	addi	sp,sp,32
    80004c08:	8082                	ret

0000000080004c0a <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004c0a:	7179                	addi	sp,sp,-48
    80004c0c:	f406                	sd	ra,40(sp)
    80004c0e:	f022                	sd	s0,32(sp)
    80004c10:	1800                	addi	s0,sp,48
    80004c12:	87aa                	mv	a5,a0
    80004c14:	fcb43823          	sd	a1,-48(s0)
    80004c18:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004c1c:	fdc42783          	lw	a5,-36(s0)
    80004c20:	4585                	li	a1,1
    80004c22:	853e                	mv	a0,a5
    80004c24:	00000097          	auipc	ra,0x0
    80004c28:	dc6080e7          	jalr	-570(ra) # 800049ea <bread>
    80004c2c:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004c30:	fe843783          	ld	a5,-24(s0)
    80004c34:	05878793          	addi	a5,a5,88
    80004c38:	02000613          	li	a2,32
    80004c3c:	85be                	mv	a1,a5
    80004c3e:	fd043503          	ld	a0,-48(s0)
    80004c42:	ffffd097          	auipc	ra,0xffffd
    80004c46:	8e4080e7          	jalr	-1820(ra) # 80001526 <memmove>
  brelse(bp);
    80004c4a:	fe843503          	ld	a0,-24(s0)
    80004c4e:	00000097          	auipc	ra,0x0
    80004c52:	e3e080e7          	jalr	-450(ra) # 80004a8c <brelse>
}
    80004c56:	0001                	nop
    80004c58:	70a2                	ld	ra,40(sp)
    80004c5a:	7402                	ld	s0,32(sp)
    80004c5c:	6145                	addi	sp,sp,48
    80004c5e:	8082                	ret

0000000080004c60 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004c60:	1101                	addi	sp,sp,-32
    80004c62:	ec06                	sd	ra,24(sp)
    80004c64:	e822                	sd	s0,16(sp)
    80004c66:	1000                	addi	s0,sp,32
    80004c68:	87aa                	mv	a5,a0
    80004c6a:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004c6e:	fec42783          	lw	a5,-20(s0)
    80004c72:	0001e597          	auipc	a1,0x1e
    80004c76:	58658593          	addi	a1,a1,1414 # 800231f8 <sb>
    80004c7a:	853e                	mv	a0,a5
    80004c7c:	00000097          	auipc	ra,0x0
    80004c80:	f8e080e7          	jalr	-114(ra) # 80004c0a <readsb>
  if(sb.magic != FSMAGIC)
    80004c84:	0001e797          	auipc	a5,0x1e
    80004c88:	57478793          	addi	a5,a5,1396 # 800231f8 <sb>
    80004c8c:	439c                	lw	a5,0(a5)
    80004c8e:	873e                	mv	a4,a5
    80004c90:	102037b7          	lui	a5,0x10203
    80004c94:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004c98:	00f70a63          	beq	a4,a5,80004cac <fsinit+0x4c>
    panic("invalid file system");
    80004c9c:	00006517          	auipc	a0,0x6
    80004ca0:	7f450513          	addi	a0,a0,2036 # 8000b490 <etext+0x490>
    80004ca4:	ffffc097          	auipc	ra,0xffffc
    80004ca8:	fda080e7          	jalr	-38(ra) # 80000c7e <panic>
  initlog(dev, &sb);
    80004cac:	fec42783          	lw	a5,-20(s0)
    80004cb0:	0001e597          	auipc	a1,0x1e
    80004cb4:	54858593          	addi	a1,a1,1352 # 800231f8 <sb>
    80004cb8:	853e                	mv	a0,a5
    80004cba:	00001097          	auipc	ra,0x1
    80004cbe:	468080e7          	jalr	1128(ra) # 80006122 <initlog>
}
    80004cc2:	0001                	nop
    80004cc4:	60e2                	ld	ra,24(sp)
    80004cc6:	6442                	ld	s0,16(sp)
    80004cc8:	6105                	addi	sp,sp,32
    80004cca:	8082                	ret

0000000080004ccc <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004ccc:	7179                	addi	sp,sp,-48
    80004cce:	f406                	sd	ra,40(sp)
    80004cd0:	f022                	sd	s0,32(sp)
    80004cd2:	1800                	addi	s0,sp,48
    80004cd4:	87aa                	mv	a5,a0
    80004cd6:	872e                	mv	a4,a1
    80004cd8:	fcf42e23          	sw	a5,-36(s0)
    80004cdc:	87ba                	mv	a5,a4
    80004cde:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004ce2:	fdc42783          	lw	a5,-36(s0)
    80004ce6:	fd842703          	lw	a4,-40(s0)
    80004cea:	85ba                	mv	a1,a4
    80004cec:	853e                	mv	a0,a5
    80004cee:	00000097          	auipc	ra,0x0
    80004cf2:	cfc080e7          	jalr	-772(ra) # 800049ea <bread>
    80004cf6:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004cfa:	fe843783          	ld	a5,-24(s0)
    80004cfe:	05878793          	addi	a5,a5,88
    80004d02:	40000613          	li	a2,1024
    80004d06:	4581                	li	a1,0
    80004d08:	853e                	mv	a0,a5
    80004d0a:	ffffc097          	auipc	ra,0xffffc
    80004d0e:	738080e7          	jalr	1848(ra) # 80001442 <memset>
  log_write(bp);
    80004d12:	fe843503          	ld	a0,-24(s0)
    80004d16:	00002097          	auipc	ra,0x2
    80004d1a:	9f4080e7          	jalr	-1548(ra) # 8000670a <log_write>
  brelse(bp);
    80004d1e:	fe843503          	ld	a0,-24(s0)
    80004d22:	00000097          	auipc	ra,0x0
    80004d26:	d6a080e7          	jalr	-662(ra) # 80004a8c <brelse>
}
    80004d2a:	0001                	nop
    80004d2c:	70a2                	ld	ra,40(sp)
    80004d2e:	7402                	ld	s0,32(sp)
    80004d30:	6145                	addi	sp,sp,48
    80004d32:	8082                	ret

0000000080004d34 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    80004d34:	7139                	addi	sp,sp,-64
    80004d36:	fc06                	sd	ra,56(sp)
    80004d38:	f822                	sd	s0,48(sp)
    80004d3a:	0080                	addi	s0,sp,64
    80004d3c:	87aa                	mv	a5,a0
    80004d3e:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004d42:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004d46:	fe042623          	sw	zero,-20(s0)
    80004d4a:	a2b5                	j	80004eb6 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004d4c:	fec42783          	lw	a5,-20(s0)
    80004d50:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d54:	0137571b          	srliw	a4,a4,0x13
    80004d58:	9fb9                	addw	a5,a5,a4
    80004d5a:	40d7d79b          	sraiw	a5,a5,0xd
    80004d5e:	2781                	sext.w	a5,a5
    80004d60:	0007871b          	sext.w	a4,a5
    80004d64:	0001e797          	auipc	a5,0x1e
    80004d68:	49478793          	addi	a5,a5,1172 # 800231f8 <sb>
    80004d6c:	4fdc                	lw	a5,28(a5)
    80004d6e:	9fb9                	addw	a5,a5,a4
    80004d70:	0007871b          	sext.w	a4,a5
    80004d74:	fcc42783          	lw	a5,-52(s0)
    80004d78:	85ba                	mv	a1,a4
    80004d7a:	853e                	mv	a0,a5
    80004d7c:	00000097          	auipc	ra,0x0
    80004d80:	c6e080e7          	jalr	-914(ra) # 800049ea <bread>
    80004d84:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004d88:	fe042423          	sw	zero,-24(s0)
    80004d8c:	a0dd                	j	80004e72 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004d8e:	fe842703          	lw	a4,-24(s0)
    80004d92:	41f7579b          	sraiw	a5,a4,0x1f
    80004d96:	01d7d79b          	srliw	a5,a5,0x1d
    80004d9a:	9f3d                	addw	a4,a4,a5
    80004d9c:	8b1d                	andi	a4,a4,7
    80004d9e:	40f707bb          	subw	a5,a4,a5
    80004da2:	2781                	sext.w	a5,a5
    80004da4:	4705                	li	a4,1
    80004da6:	00f717bb          	sllw	a5,a4,a5
    80004daa:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004dae:	fe842783          	lw	a5,-24(s0)
    80004db2:	41f7d71b          	sraiw	a4,a5,0x1f
    80004db6:	01d7571b          	srliw	a4,a4,0x1d
    80004dba:	9fb9                	addw	a5,a5,a4
    80004dbc:	4037d79b          	sraiw	a5,a5,0x3
    80004dc0:	2781                	sext.w	a5,a5
    80004dc2:	fe043703          	ld	a4,-32(s0)
    80004dc6:	97ba                	add	a5,a5,a4
    80004dc8:	0587c783          	lbu	a5,88(a5)
    80004dcc:	0007871b          	sext.w	a4,a5
    80004dd0:	fdc42783          	lw	a5,-36(s0)
    80004dd4:	8ff9                	and	a5,a5,a4
    80004dd6:	2781                	sext.w	a5,a5
    80004dd8:	ebc1                	bnez	a5,80004e68 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004dda:	fe842783          	lw	a5,-24(s0)
    80004dde:	41f7d71b          	sraiw	a4,a5,0x1f
    80004de2:	01d7571b          	srliw	a4,a4,0x1d
    80004de6:	9fb9                	addw	a5,a5,a4
    80004de8:	4037d79b          	sraiw	a5,a5,0x3
    80004dec:	2781                	sext.w	a5,a5
    80004dee:	fe043703          	ld	a4,-32(s0)
    80004df2:	973e                	add	a4,a4,a5
    80004df4:	05874703          	lbu	a4,88(a4)
    80004df8:	0187169b          	slliw	a3,a4,0x18
    80004dfc:	4186d69b          	sraiw	a3,a3,0x18
    80004e00:	fdc42703          	lw	a4,-36(s0)
    80004e04:	0187171b          	slliw	a4,a4,0x18
    80004e08:	4187571b          	sraiw	a4,a4,0x18
    80004e0c:	8f55                	or	a4,a4,a3
    80004e0e:	0187171b          	slliw	a4,a4,0x18
    80004e12:	4187571b          	sraiw	a4,a4,0x18
    80004e16:	0ff77713          	andi	a4,a4,255
    80004e1a:	fe043683          	ld	a3,-32(s0)
    80004e1e:	97b6                	add	a5,a5,a3
    80004e20:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004e24:	fe043503          	ld	a0,-32(s0)
    80004e28:	00002097          	auipc	ra,0x2
    80004e2c:	8e2080e7          	jalr	-1822(ra) # 8000670a <log_write>
        brelse(bp);
    80004e30:	fe043503          	ld	a0,-32(s0)
    80004e34:	00000097          	auipc	ra,0x0
    80004e38:	c58080e7          	jalr	-936(ra) # 80004a8c <brelse>
        bzero(dev, b + bi);
    80004e3c:	fcc42683          	lw	a3,-52(s0)
    80004e40:	fec42703          	lw	a4,-20(s0)
    80004e44:	fe842783          	lw	a5,-24(s0)
    80004e48:	9fb9                	addw	a5,a5,a4
    80004e4a:	2781                	sext.w	a5,a5
    80004e4c:	85be                	mv	a1,a5
    80004e4e:	8536                	mv	a0,a3
    80004e50:	00000097          	auipc	ra,0x0
    80004e54:	e7c080e7          	jalr	-388(ra) # 80004ccc <bzero>
        return b + bi;
    80004e58:	fec42703          	lw	a4,-20(s0)
    80004e5c:	fe842783          	lw	a5,-24(s0)
    80004e60:	9fb9                	addw	a5,a5,a4
    80004e62:	2781                	sext.w	a5,a5
    80004e64:	2781                	sext.w	a5,a5
    80004e66:	a88d                	j	80004ed8 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004e68:	fe842783          	lw	a5,-24(s0)
    80004e6c:	2785                	addiw	a5,a5,1
    80004e6e:	fef42423          	sw	a5,-24(s0)
    80004e72:	fe842783          	lw	a5,-24(s0)
    80004e76:	0007871b          	sext.w	a4,a5
    80004e7a:	6789                	lui	a5,0x2
    80004e7c:	02f75163          	bge	a4,a5,80004e9e <balloc+0x16a>
    80004e80:	fec42703          	lw	a4,-20(s0)
    80004e84:	fe842783          	lw	a5,-24(s0)
    80004e88:	9fb9                	addw	a5,a5,a4
    80004e8a:	2781                	sext.w	a5,a5
    80004e8c:	0007871b          	sext.w	a4,a5
    80004e90:	0001e797          	auipc	a5,0x1e
    80004e94:	36878793          	addi	a5,a5,872 # 800231f8 <sb>
    80004e98:	43dc                	lw	a5,4(a5)
    80004e9a:	eef76ae3          	bltu	a4,a5,80004d8e <balloc+0x5a>
      }
    }
    brelse(bp);
    80004e9e:	fe043503          	ld	a0,-32(s0)
    80004ea2:	00000097          	auipc	ra,0x0
    80004ea6:	bea080e7          	jalr	-1046(ra) # 80004a8c <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004eaa:	fec42703          	lw	a4,-20(s0)
    80004eae:	6789                	lui	a5,0x2
    80004eb0:	9fb9                	addw	a5,a5,a4
    80004eb2:	fef42623          	sw	a5,-20(s0)
    80004eb6:	0001e797          	auipc	a5,0x1e
    80004eba:	34278793          	addi	a5,a5,834 # 800231f8 <sb>
    80004ebe:	43d8                	lw	a4,4(a5)
    80004ec0:	fec42783          	lw	a5,-20(s0)
    80004ec4:	e8e7e4e3          	bltu	a5,a4,80004d4c <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80004ec8:	00006517          	auipc	a0,0x6
    80004ecc:	5e050513          	addi	a0,a0,1504 # 8000b4a8 <etext+0x4a8>
    80004ed0:	ffffc097          	auipc	ra,0xffffc
    80004ed4:	dae080e7          	jalr	-594(ra) # 80000c7e <panic>
}
    80004ed8:	853e                	mv	a0,a5
    80004eda:	70e2                	ld	ra,56(sp)
    80004edc:	7442                	ld	s0,48(sp)
    80004ede:	6121                	addi	sp,sp,64
    80004ee0:	8082                	ret

0000000080004ee2 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004ee2:	7179                	addi	sp,sp,-48
    80004ee4:	f406                	sd	ra,40(sp)
    80004ee6:	f022                	sd	s0,32(sp)
    80004ee8:	1800                	addi	s0,sp,48
    80004eea:	87aa                	mv	a5,a0
    80004eec:	872e                	mv	a4,a1
    80004eee:	fcf42e23          	sw	a5,-36(s0)
    80004ef2:	87ba                	mv	a5,a4
    80004ef4:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004ef8:	fdc42683          	lw	a3,-36(s0)
    80004efc:	fd842783          	lw	a5,-40(s0)
    80004f00:	00d7d79b          	srliw	a5,a5,0xd
    80004f04:	0007871b          	sext.w	a4,a5
    80004f08:	0001e797          	auipc	a5,0x1e
    80004f0c:	2f078793          	addi	a5,a5,752 # 800231f8 <sb>
    80004f10:	4fdc                	lw	a5,28(a5)
    80004f12:	9fb9                	addw	a5,a5,a4
    80004f14:	2781                	sext.w	a5,a5
    80004f16:	85be                	mv	a1,a5
    80004f18:	8536                	mv	a0,a3
    80004f1a:	00000097          	auipc	ra,0x0
    80004f1e:	ad0080e7          	jalr	-1328(ra) # 800049ea <bread>
    80004f22:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004f26:	fd842703          	lw	a4,-40(s0)
    80004f2a:	6789                	lui	a5,0x2
    80004f2c:	17fd                	addi	a5,a5,-1
    80004f2e:	8ff9                	and	a5,a5,a4
    80004f30:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004f34:	fe442703          	lw	a4,-28(s0)
    80004f38:	41f7579b          	sraiw	a5,a4,0x1f
    80004f3c:	01d7d79b          	srliw	a5,a5,0x1d
    80004f40:	9f3d                	addw	a4,a4,a5
    80004f42:	8b1d                	andi	a4,a4,7
    80004f44:	40f707bb          	subw	a5,a4,a5
    80004f48:	2781                	sext.w	a5,a5
    80004f4a:	4705                	li	a4,1
    80004f4c:	00f717bb          	sllw	a5,a4,a5
    80004f50:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004f54:	fe442783          	lw	a5,-28(s0)
    80004f58:	41f7d71b          	sraiw	a4,a5,0x1f
    80004f5c:	01d7571b          	srliw	a4,a4,0x1d
    80004f60:	9fb9                	addw	a5,a5,a4
    80004f62:	4037d79b          	sraiw	a5,a5,0x3
    80004f66:	2781                	sext.w	a5,a5
    80004f68:	fe843703          	ld	a4,-24(s0)
    80004f6c:	97ba                	add	a5,a5,a4
    80004f6e:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004f72:	0007871b          	sext.w	a4,a5
    80004f76:	fe042783          	lw	a5,-32(s0)
    80004f7a:	8ff9                	and	a5,a5,a4
    80004f7c:	2781                	sext.w	a5,a5
    80004f7e:	eb89                	bnez	a5,80004f90 <bfree+0xae>
    panic("freeing free block");
    80004f80:	00006517          	auipc	a0,0x6
    80004f84:	54050513          	addi	a0,a0,1344 # 8000b4c0 <etext+0x4c0>
    80004f88:	ffffc097          	auipc	ra,0xffffc
    80004f8c:	cf6080e7          	jalr	-778(ra) # 80000c7e <panic>
  bp->data[bi/8] &= ~m;
    80004f90:	fe442783          	lw	a5,-28(s0)
    80004f94:	41f7d71b          	sraiw	a4,a5,0x1f
    80004f98:	01d7571b          	srliw	a4,a4,0x1d
    80004f9c:	9fb9                	addw	a5,a5,a4
    80004f9e:	4037d79b          	sraiw	a5,a5,0x3
    80004fa2:	2781                	sext.w	a5,a5
    80004fa4:	fe843703          	ld	a4,-24(s0)
    80004fa8:	973e                	add	a4,a4,a5
    80004faa:	05874703          	lbu	a4,88(a4)
    80004fae:	0187169b          	slliw	a3,a4,0x18
    80004fb2:	4186d69b          	sraiw	a3,a3,0x18
    80004fb6:	fe042703          	lw	a4,-32(s0)
    80004fba:	0187171b          	slliw	a4,a4,0x18
    80004fbe:	4187571b          	sraiw	a4,a4,0x18
    80004fc2:	fff74713          	not	a4,a4
    80004fc6:	0187171b          	slliw	a4,a4,0x18
    80004fca:	4187571b          	sraiw	a4,a4,0x18
    80004fce:	8f75                	and	a4,a4,a3
    80004fd0:	0187171b          	slliw	a4,a4,0x18
    80004fd4:	4187571b          	sraiw	a4,a4,0x18
    80004fd8:	0ff77713          	andi	a4,a4,255
    80004fdc:	fe843683          	ld	a3,-24(s0)
    80004fe0:	97b6                	add	a5,a5,a3
    80004fe2:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004fe6:	fe843503          	ld	a0,-24(s0)
    80004fea:	00001097          	auipc	ra,0x1
    80004fee:	720080e7          	jalr	1824(ra) # 8000670a <log_write>
  brelse(bp);
    80004ff2:	fe843503          	ld	a0,-24(s0)
    80004ff6:	00000097          	auipc	ra,0x0
    80004ffa:	a96080e7          	jalr	-1386(ra) # 80004a8c <brelse>
}
    80004ffe:	0001                	nop
    80005000:	70a2                	ld	ra,40(sp)
    80005002:	7402                	ld	s0,32(sp)
    80005004:	6145                	addi	sp,sp,48
    80005006:	8082                	ret

0000000080005008 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80005008:	1101                	addi	sp,sp,-32
    8000500a:	ec06                	sd	ra,24(sp)
    8000500c:	e822                	sd	s0,16(sp)
    8000500e:	1000                	addi	s0,sp,32
  int i = 0;
    80005010:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80005014:	00006597          	auipc	a1,0x6
    80005018:	4c458593          	addi	a1,a1,1220 # 8000b4d8 <etext+0x4d8>
    8000501c:	0001e517          	auipc	a0,0x1e
    80005020:	1fc50513          	addi	a0,a0,508 # 80023218 <itable>
    80005024:	ffffc097          	auipc	ra,0xffffc
    80005028:	21a080e7          	jalr	538(ra) # 8000123e <initlock>
  for(i = 0; i < NINODE; i++) {
    8000502c:	fe042623          	sw	zero,-20(s0)
    80005030:	a82d                	j	8000506a <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80005032:	fec42703          	lw	a4,-20(s0)
    80005036:	87ba                	mv	a5,a4
    80005038:	0792                	slli	a5,a5,0x4
    8000503a:	97ba                	add	a5,a5,a4
    8000503c:	078e                	slli	a5,a5,0x3
    8000503e:	02078713          	addi	a4,a5,32
    80005042:	0001e797          	auipc	a5,0x1e
    80005046:	1d678793          	addi	a5,a5,470 # 80023218 <itable>
    8000504a:	97ba                	add	a5,a5,a4
    8000504c:	07a1                	addi	a5,a5,8
    8000504e:	00006597          	auipc	a1,0x6
    80005052:	49258593          	addi	a1,a1,1170 # 8000b4e0 <etext+0x4e0>
    80005056:	853e                	mv	a0,a5
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	7e6080e7          	jalr	2022(ra) # 8000683e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80005060:	fec42783          	lw	a5,-20(s0)
    80005064:	2785                	addiw	a5,a5,1
    80005066:	fef42623          	sw	a5,-20(s0)
    8000506a:	fec42783          	lw	a5,-20(s0)
    8000506e:	0007871b          	sext.w	a4,a5
    80005072:	03100793          	li	a5,49
    80005076:	fae7dee3          	bge	a5,a4,80005032 <iinit+0x2a>
  }
}
    8000507a:	0001                	nop
    8000507c:	0001                	nop
    8000507e:	60e2                	ld	ra,24(sp)
    80005080:	6442                	ld	s0,16(sp)
    80005082:	6105                	addi	sp,sp,32
    80005084:	8082                	ret

0000000080005086 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    80005086:	7139                	addi	sp,sp,-64
    80005088:	fc06                	sd	ra,56(sp)
    8000508a:	f822                	sd	s0,48(sp)
    8000508c:	0080                	addi	s0,sp,64
    8000508e:	87aa                	mv	a5,a0
    80005090:	872e                	mv	a4,a1
    80005092:	fcf42623          	sw	a5,-52(s0)
    80005096:	87ba                	mv	a5,a4
    80005098:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    8000509c:	4785                	li	a5,1
    8000509e:	fef42623          	sw	a5,-20(s0)
    800050a2:	a855                	j	80005156 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800050a4:	fec42783          	lw	a5,-20(s0)
    800050a8:	8391                	srli	a5,a5,0x4
    800050aa:	0007871b          	sext.w	a4,a5
    800050ae:	0001e797          	auipc	a5,0x1e
    800050b2:	14a78793          	addi	a5,a5,330 # 800231f8 <sb>
    800050b6:	4f9c                	lw	a5,24(a5)
    800050b8:	9fb9                	addw	a5,a5,a4
    800050ba:	0007871b          	sext.w	a4,a5
    800050be:	fcc42783          	lw	a5,-52(s0)
    800050c2:	85ba                	mv	a1,a4
    800050c4:	853e                	mv	a0,a5
    800050c6:	00000097          	auipc	ra,0x0
    800050ca:	924080e7          	jalr	-1756(ra) # 800049ea <bread>
    800050ce:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    800050d2:	fe043783          	ld	a5,-32(s0)
    800050d6:	05878713          	addi	a4,a5,88
    800050da:	fec42783          	lw	a5,-20(s0)
    800050de:	8bbd                	andi	a5,a5,15
    800050e0:	079a                	slli	a5,a5,0x6
    800050e2:	97ba                	add	a5,a5,a4
    800050e4:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    800050e8:	fd843783          	ld	a5,-40(s0)
    800050ec:	00079783          	lh	a5,0(a5)
    800050f0:	eba1                	bnez	a5,80005140 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    800050f2:	04000613          	li	a2,64
    800050f6:	4581                	li	a1,0
    800050f8:	fd843503          	ld	a0,-40(s0)
    800050fc:	ffffc097          	auipc	ra,0xffffc
    80005100:	346080e7          	jalr	838(ra) # 80001442 <memset>
      dip->type = type;
    80005104:	fd843783          	ld	a5,-40(s0)
    80005108:	fca45703          	lhu	a4,-54(s0)
    8000510c:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005110:	fe043503          	ld	a0,-32(s0)
    80005114:	00001097          	auipc	ra,0x1
    80005118:	5f6080e7          	jalr	1526(ra) # 8000670a <log_write>
      brelse(bp);
    8000511c:	fe043503          	ld	a0,-32(s0)
    80005120:	00000097          	auipc	ra,0x0
    80005124:	96c080e7          	jalr	-1684(ra) # 80004a8c <brelse>
      return iget(dev, inum);
    80005128:	fec42703          	lw	a4,-20(s0)
    8000512c:	fcc42783          	lw	a5,-52(s0)
    80005130:	85ba                	mv	a1,a4
    80005132:	853e                	mv	a0,a5
    80005134:	00000097          	auipc	ra,0x0
    80005138:	136080e7          	jalr	310(ra) # 8000526a <iget>
    8000513c:	87aa                	mv	a5,a0
    8000513e:	a82d                	j	80005178 <ialloc+0xf2>
    }
    brelse(bp);
    80005140:	fe043503          	ld	a0,-32(s0)
    80005144:	00000097          	auipc	ra,0x0
    80005148:	948080e7          	jalr	-1720(ra) # 80004a8c <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000514c:	fec42783          	lw	a5,-20(s0)
    80005150:	2785                	addiw	a5,a5,1
    80005152:	fef42623          	sw	a5,-20(s0)
    80005156:	0001e797          	auipc	a5,0x1e
    8000515a:	0a278793          	addi	a5,a5,162 # 800231f8 <sb>
    8000515e:	47d8                	lw	a4,12(a5)
    80005160:	fec42783          	lw	a5,-20(s0)
    80005164:	f4e7e0e3          	bltu	a5,a4,800050a4 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    80005168:	00006517          	auipc	a0,0x6
    8000516c:	38050513          	addi	a0,a0,896 # 8000b4e8 <etext+0x4e8>
    80005170:	ffffc097          	auipc	ra,0xffffc
    80005174:	b0e080e7          	jalr	-1266(ra) # 80000c7e <panic>
}
    80005178:	853e                	mv	a0,a5
    8000517a:	70e2                	ld	ra,56(sp)
    8000517c:	7442                	ld	s0,48(sp)
    8000517e:	6121                	addi	sp,sp,64
    80005180:	8082                	ret

0000000080005182 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80005182:	7179                	addi	sp,sp,-48
    80005184:	f406                	sd	ra,40(sp)
    80005186:	f022                	sd	s0,32(sp)
    80005188:	1800                	addi	s0,sp,48
    8000518a:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000518e:	fd843783          	ld	a5,-40(s0)
    80005192:	4394                	lw	a3,0(a5)
    80005194:	fd843783          	ld	a5,-40(s0)
    80005198:	43dc                	lw	a5,4(a5)
    8000519a:	0047d79b          	srliw	a5,a5,0x4
    8000519e:	0007871b          	sext.w	a4,a5
    800051a2:	0001e797          	auipc	a5,0x1e
    800051a6:	05678793          	addi	a5,a5,86 # 800231f8 <sb>
    800051aa:	4f9c                	lw	a5,24(a5)
    800051ac:	9fb9                	addw	a5,a5,a4
    800051ae:	2781                	sext.w	a5,a5
    800051b0:	85be                	mv	a1,a5
    800051b2:	8536                	mv	a0,a3
    800051b4:	00000097          	auipc	ra,0x0
    800051b8:	836080e7          	jalr	-1994(ra) # 800049ea <bread>
    800051bc:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800051c0:	fe843783          	ld	a5,-24(s0)
    800051c4:	05878713          	addi	a4,a5,88
    800051c8:	fd843783          	ld	a5,-40(s0)
    800051cc:	43dc                	lw	a5,4(a5)
    800051ce:	1782                	slli	a5,a5,0x20
    800051d0:	9381                	srli	a5,a5,0x20
    800051d2:	8bbd                	andi	a5,a5,15
    800051d4:	079a                	slli	a5,a5,0x6
    800051d6:	97ba                	add	a5,a5,a4
    800051d8:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    800051dc:	fd843783          	ld	a5,-40(s0)
    800051e0:	04479703          	lh	a4,68(a5)
    800051e4:	fe043783          	ld	a5,-32(s0)
    800051e8:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    800051ec:	fd843783          	ld	a5,-40(s0)
    800051f0:	04679703          	lh	a4,70(a5)
    800051f4:	fe043783          	ld	a5,-32(s0)
    800051f8:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    800051fc:	fd843783          	ld	a5,-40(s0)
    80005200:	04879703          	lh	a4,72(a5)
    80005204:	fe043783          	ld	a5,-32(s0)
    80005208:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    8000520c:	fd843783          	ld	a5,-40(s0)
    80005210:	04a79703          	lh	a4,74(a5)
    80005214:	fe043783          	ld	a5,-32(s0)
    80005218:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000521c:	fd843783          	ld	a5,-40(s0)
    80005220:	47f8                	lw	a4,76(a5)
    80005222:	fe043783          	ld	a5,-32(s0)
    80005226:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005228:	fe043783          	ld	a5,-32(s0)
    8000522c:	00c78713          	addi	a4,a5,12
    80005230:	fd843783          	ld	a5,-40(s0)
    80005234:	05078793          	addi	a5,a5,80
    80005238:	03400613          	li	a2,52
    8000523c:	85be                	mv	a1,a5
    8000523e:	853a                	mv	a0,a4
    80005240:	ffffc097          	auipc	ra,0xffffc
    80005244:	2e6080e7          	jalr	742(ra) # 80001526 <memmove>
  log_write(bp);
    80005248:	fe843503          	ld	a0,-24(s0)
    8000524c:	00001097          	auipc	ra,0x1
    80005250:	4be080e7          	jalr	1214(ra) # 8000670a <log_write>
  brelse(bp);
    80005254:	fe843503          	ld	a0,-24(s0)
    80005258:	00000097          	auipc	ra,0x0
    8000525c:	834080e7          	jalr	-1996(ra) # 80004a8c <brelse>
}
    80005260:	0001                	nop
    80005262:	70a2                	ld	ra,40(sp)
    80005264:	7402                	ld	s0,32(sp)
    80005266:	6145                	addi	sp,sp,48
    80005268:	8082                	ret

000000008000526a <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    8000526a:	7179                	addi	sp,sp,-48
    8000526c:	f406                	sd	ra,40(sp)
    8000526e:	f022                	sd	s0,32(sp)
    80005270:	1800                	addi	s0,sp,48
    80005272:	87aa                	mv	a5,a0
    80005274:	872e                	mv	a4,a1
    80005276:	fcf42e23          	sw	a5,-36(s0)
    8000527a:	87ba                	mv	a5,a4
    8000527c:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80005280:	0001e517          	auipc	a0,0x1e
    80005284:	f9850513          	addi	a0,a0,-104 # 80023218 <itable>
    80005288:	ffffc097          	auipc	ra,0xffffc
    8000528c:	fe6080e7          	jalr	-26(ra) # 8000126e <acquire>

  // Is the inode already in the table?
  empty = 0;
    80005290:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005294:	0001e797          	auipc	a5,0x1e
    80005298:	f9c78793          	addi	a5,a5,-100 # 80023230 <itable+0x18>
    8000529c:	fef43423          	sd	a5,-24(s0)
    800052a0:	a89d                	j	80005316 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800052a2:	fe843783          	ld	a5,-24(s0)
    800052a6:	479c                	lw	a5,8(a5)
    800052a8:	04f05663          	blez	a5,800052f4 <iget+0x8a>
    800052ac:	fe843783          	ld	a5,-24(s0)
    800052b0:	4398                	lw	a4,0(a5)
    800052b2:	fdc42783          	lw	a5,-36(s0)
    800052b6:	2781                	sext.w	a5,a5
    800052b8:	02e79e63          	bne	a5,a4,800052f4 <iget+0x8a>
    800052bc:	fe843783          	ld	a5,-24(s0)
    800052c0:	43d8                	lw	a4,4(a5)
    800052c2:	fd842783          	lw	a5,-40(s0)
    800052c6:	2781                	sext.w	a5,a5
    800052c8:	02e79663          	bne	a5,a4,800052f4 <iget+0x8a>
      ip->ref++;
    800052cc:	fe843783          	ld	a5,-24(s0)
    800052d0:	479c                	lw	a5,8(a5)
    800052d2:	2785                	addiw	a5,a5,1
    800052d4:	0007871b          	sext.w	a4,a5
    800052d8:	fe843783          	ld	a5,-24(s0)
    800052dc:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    800052de:	0001e517          	auipc	a0,0x1e
    800052e2:	f3a50513          	addi	a0,a0,-198 # 80023218 <itable>
    800052e6:	ffffc097          	auipc	ra,0xffffc
    800052ea:	fec080e7          	jalr	-20(ra) # 800012d2 <release>
      return ip;
    800052ee:	fe843783          	ld	a5,-24(s0)
    800052f2:	a069                	j	8000537c <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    800052f4:	fe043783          	ld	a5,-32(s0)
    800052f8:	eb89                	bnez	a5,8000530a <iget+0xa0>
    800052fa:	fe843783          	ld	a5,-24(s0)
    800052fe:	479c                	lw	a5,8(a5)
    80005300:	e789                	bnez	a5,8000530a <iget+0xa0>
      empty = ip;
    80005302:	fe843783          	ld	a5,-24(s0)
    80005306:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000530a:	fe843783          	ld	a5,-24(s0)
    8000530e:	08878793          	addi	a5,a5,136
    80005312:	fef43423          	sd	a5,-24(s0)
    80005316:	fe843703          	ld	a4,-24(s0)
    8000531a:	00020797          	auipc	a5,0x20
    8000531e:	9a678793          	addi	a5,a5,-1626 # 80024cc0 <log>
    80005322:	f8f760e3          	bltu	a4,a5,800052a2 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005326:	fe043783          	ld	a5,-32(s0)
    8000532a:	eb89                	bnez	a5,8000533c <iget+0xd2>
    panic("iget: no inodes");
    8000532c:	00006517          	auipc	a0,0x6
    80005330:	1d450513          	addi	a0,a0,468 # 8000b500 <etext+0x500>
    80005334:	ffffc097          	auipc	ra,0xffffc
    80005338:	94a080e7          	jalr	-1718(ra) # 80000c7e <panic>

  ip = empty;
    8000533c:	fe043783          	ld	a5,-32(s0)
    80005340:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005344:	fe843783          	ld	a5,-24(s0)
    80005348:	fdc42703          	lw	a4,-36(s0)
    8000534c:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000534e:	fe843783          	ld	a5,-24(s0)
    80005352:	fd842703          	lw	a4,-40(s0)
    80005356:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005358:	fe843783          	ld	a5,-24(s0)
    8000535c:	4705                	li	a4,1
    8000535e:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005360:	fe843783          	ld	a5,-24(s0)
    80005364:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005368:	0001e517          	auipc	a0,0x1e
    8000536c:	eb050513          	addi	a0,a0,-336 # 80023218 <itable>
    80005370:	ffffc097          	auipc	ra,0xffffc
    80005374:	f62080e7          	jalr	-158(ra) # 800012d2 <release>

  return ip;
    80005378:	fe843783          	ld	a5,-24(s0)
}
    8000537c:	853e                	mv	a0,a5
    8000537e:	70a2                	ld	ra,40(sp)
    80005380:	7402                	ld	s0,32(sp)
    80005382:	6145                	addi	sp,sp,48
    80005384:	8082                	ret

0000000080005386 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005386:	1101                	addi	sp,sp,-32
    80005388:	ec06                	sd	ra,24(sp)
    8000538a:	e822                	sd	s0,16(sp)
    8000538c:	1000                	addi	s0,sp,32
    8000538e:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005392:	0001e517          	auipc	a0,0x1e
    80005396:	e8650513          	addi	a0,a0,-378 # 80023218 <itable>
    8000539a:	ffffc097          	auipc	ra,0xffffc
    8000539e:	ed4080e7          	jalr	-300(ra) # 8000126e <acquire>
  ip->ref++;
    800053a2:	fe843783          	ld	a5,-24(s0)
    800053a6:	479c                	lw	a5,8(a5)
    800053a8:	2785                	addiw	a5,a5,1
    800053aa:	0007871b          	sext.w	a4,a5
    800053ae:	fe843783          	ld	a5,-24(s0)
    800053b2:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800053b4:	0001e517          	auipc	a0,0x1e
    800053b8:	e6450513          	addi	a0,a0,-412 # 80023218 <itable>
    800053bc:	ffffc097          	auipc	ra,0xffffc
    800053c0:	f16080e7          	jalr	-234(ra) # 800012d2 <release>
  return ip;
    800053c4:	fe843783          	ld	a5,-24(s0)
}
    800053c8:	853e                	mv	a0,a5
    800053ca:	60e2                	ld	ra,24(sp)
    800053cc:	6442                	ld	s0,16(sp)
    800053ce:	6105                	addi	sp,sp,32
    800053d0:	8082                	ret

00000000800053d2 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    800053d2:	7179                	addi	sp,sp,-48
    800053d4:	f406                	sd	ra,40(sp)
    800053d6:	f022                	sd	s0,32(sp)
    800053d8:	1800                	addi	s0,sp,48
    800053da:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800053de:	fd843783          	ld	a5,-40(s0)
    800053e2:	c791                	beqz	a5,800053ee <ilock+0x1c>
    800053e4:	fd843783          	ld	a5,-40(s0)
    800053e8:	479c                	lw	a5,8(a5)
    800053ea:	00f04a63          	bgtz	a5,800053fe <ilock+0x2c>
    panic("ilock");
    800053ee:	00006517          	auipc	a0,0x6
    800053f2:	12250513          	addi	a0,a0,290 # 8000b510 <etext+0x510>
    800053f6:	ffffc097          	auipc	ra,0xffffc
    800053fa:	888080e7          	jalr	-1912(ra) # 80000c7e <panic>

  acquiresleep(&ip->lock);
    800053fe:	fd843783          	ld	a5,-40(s0)
    80005402:	07c1                	addi	a5,a5,16
    80005404:	853e                	mv	a0,a5
    80005406:	00001097          	auipc	ra,0x1
    8000540a:	484080e7          	jalr	1156(ra) # 8000688a <acquiresleep>

  if(ip->valid == 0){
    8000540e:	fd843783          	ld	a5,-40(s0)
    80005412:	43bc                	lw	a5,64(a5)
    80005414:	e7e5                	bnez	a5,800054fc <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005416:	fd843783          	ld	a5,-40(s0)
    8000541a:	4394                	lw	a3,0(a5)
    8000541c:	fd843783          	ld	a5,-40(s0)
    80005420:	43dc                	lw	a5,4(a5)
    80005422:	0047d79b          	srliw	a5,a5,0x4
    80005426:	0007871b          	sext.w	a4,a5
    8000542a:	0001e797          	auipc	a5,0x1e
    8000542e:	dce78793          	addi	a5,a5,-562 # 800231f8 <sb>
    80005432:	4f9c                	lw	a5,24(a5)
    80005434:	9fb9                	addw	a5,a5,a4
    80005436:	2781                	sext.w	a5,a5
    80005438:	85be                	mv	a1,a5
    8000543a:	8536                	mv	a0,a3
    8000543c:	fffff097          	auipc	ra,0xfffff
    80005440:	5ae080e7          	jalr	1454(ra) # 800049ea <bread>
    80005444:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005448:	fe843783          	ld	a5,-24(s0)
    8000544c:	05878713          	addi	a4,a5,88
    80005450:	fd843783          	ld	a5,-40(s0)
    80005454:	43dc                	lw	a5,4(a5)
    80005456:	1782                	slli	a5,a5,0x20
    80005458:	9381                	srli	a5,a5,0x20
    8000545a:	8bbd                	andi	a5,a5,15
    8000545c:	079a                	slli	a5,a5,0x6
    8000545e:	97ba                	add	a5,a5,a4
    80005460:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005464:	fe043783          	ld	a5,-32(s0)
    80005468:	00079703          	lh	a4,0(a5)
    8000546c:	fd843783          	ld	a5,-40(s0)
    80005470:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    80005474:	fe043783          	ld	a5,-32(s0)
    80005478:	00279703          	lh	a4,2(a5)
    8000547c:	fd843783          	ld	a5,-40(s0)
    80005480:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    80005484:	fe043783          	ld	a5,-32(s0)
    80005488:	00479703          	lh	a4,4(a5)
    8000548c:	fd843783          	ld	a5,-40(s0)
    80005490:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    80005494:	fe043783          	ld	a5,-32(s0)
    80005498:	00679703          	lh	a4,6(a5)
    8000549c:	fd843783          	ld	a5,-40(s0)
    800054a0:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800054a4:	fe043783          	ld	a5,-32(s0)
    800054a8:	4798                	lw	a4,8(a5)
    800054aa:	fd843783          	ld	a5,-40(s0)
    800054ae:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800054b0:	fd843783          	ld	a5,-40(s0)
    800054b4:	05078713          	addi	a4,a5,80
    800054b8:	fe043783          	ld	a5,-32(s0)
    800054bc:	07b1                	addi	a5,a5,12
    800054be:	03400613          	li	a2,52
    800054c2:	85be                	mv	a1,a5
    800054c4:	853a                	mv	a0,a4
    800054c6:	ffffc097          	auipc	ra,0xffffc
    800054ca:	060080e7          	jalr	96(ra) # 80001526 <memmove>
    brelse(bp);
    800054ce:	fe843503          	ld	a0,-24(s0)
    800054d2:	fffff097          	auipc	ra,0xfffff
    800054d6:	5ba080e7          	jalr	1466(ra) # 80004a8c <brelse>
    ip->valid = 1;
    800054da:	fd843783          	ld	a5,-40(s0)
    800054de:	4705                	li	a4,1
    800054e0:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800054e2:	fd843783          	ld	a5,-40(s0)
    800054e6:	04479783          	lh	a5,68(a5)
    800054ea:	eb89                	bnez	a5,800054fc <ilock+0x12a>
      panic("ilock: no type");
    800054ec:	00006517          	auipc	a0,0x6
    800054f0:	02c50513          	addi	a0,a0,44 # 8000b518 <etext+0x518>
    800054f4:	ffffb097          	auipc	ra,0xffffb
    800054f8:	78a080e7          	jalr	1930(ra) # 80000c7e <panic>
  }
}
    800054fc:	0001                	nop
    800054fe:	70a2                	ld	ra,40(sp)
    80005500:	7402                	ld	s0,32(sp)
    80005502:	6145                	addi	sp,sp,48
    80005504:	8082                	ret

0000000080005506 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005506:	1101                	addi	sp,sp,-32
    80005508:	ec06                	sd	ra,24(sp)
    8000550a:	e822                	sd	s0,16(sp)
    8000550c:	1000                	addi	s0,sp,32
    8000550e:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005512:	fe843783          	ld	a5,-24(s0)
    80005516:	c385                	beqz	a5,80005536 <iunlock+0x30>
    80005518:	fe843783          	ld	a5,-24(s0)
    8000551c:	07c1                	addi	a5,a5,16
    8000551e:	853e                	mv	a0,a5
    80005520:	00001097          	auipc	ra,0x1
    80005524:	42a080e7          	jalr	1066(ra) # 8000694a <holdingsleep>
    80005528:	87aa                	mv	a5,a0
    8000552a:	c791                	beqz	a5,80005536 <iunlock+0x30>
    8000552c:	fe843783          	ld	a5,-24(s0)
    80005530:	479c                	lw	a5,8(a5)
    80005532:	00f04a63          	bgtz	a5,80005546 <iunlock+0x40>
    panic("iunlock");
    80005536:	00006517          	auipc	a0,0x6
    8000553a:	ff250513          	addi	a0,a0,-14 # 8000b528 <etext+0x528>
    8000553e:	ffffb097          	auipc	ra,0xffffb
    80005542:	740080e7          	jalr	1856(ra) # 80000c7e <panic>

  releasesleep(&ip->lock);
    80005546:	fe843783          	ld	a5,-24(s0)
    8000554a:	07c1                	addi	a5,a5,16
    8000554c:	853e                	mv	a0,a5
    8000554e:	00001097          	auipc	ra,0x1
    80005552:	3aa080e7          	jalr	938(ra) # 800068f8 <releasesleep>
}
    80005556:	0001                	nop
    80005558:	60e2                	ld	ra,24(sp)
    8000555a:	6442                	ld	s0,16(sp)
    8000555c:	6105                	addi	sp,sp,32
    8000555e:	8082                	ret

0000000080005560 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005560:	1101                	addi	sp,sp,-32
    80005562:	ec06                	sd	ra,24(sp)
    80005564:	e822                	sd	s0,16(sp)
    80005566:	1000                	addi	s0,sp,32
    80005568:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000556c:	0001e517          	auipc	a0,0x1e
    80005570:	cac50513          	addi	a0,a0,-852 # 80023218 <itable>
    80005574:	ffffc097          	auipc	ra,0xffffc
    80005578:	cfa080e7          	jalr	-774(ra) # 8000126e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000557c:	fe843783          	ld	a5,-24(s0)
    80005580:	479c                	lw	a5,8(a5)
    80005582:	873e                	mv	a4,a5
    80005584:	4785                	li	a5,1
    80005586:	06f71f63          	bne	a4,a5,80005604 <iput+0xa4>
    8000558a:	fe843783          	ld	a5,-24(s0)
    8000558e:	43bc                	lw	a5,64(a5)
    80005590:	cbb5                	beqz	a5,80005604 <iput+0xa4>
    80005592:	fe843783          	ld	a5,-24(s0)
    80005596:	04a79783          	lh	a5,74(a5)
    8000559a:	e7ad                	bnez	a5,80005604 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    8000559c:	fe843783          	ld	a5,-24(s0)
    800055a0:	07c1                	addi	a5,a5,16
    800055a2:	853e                	mv	a0,a5
    800055a4:	00001097          	auipc	ra,0x1
    800055a8:	2e6080e7          	jalr	742(ra) # 8000688a <acquiresleep>

    release(&itable.lock);
    800055ac:	0001e517          	auipc	a0,0x1e
    800055b0:	c6c50513          	addi	a0,a0,-916 # 80023218 <itable>
    800055b4:	ffffc097          	auipc	ra,0xffffc
    800055b8:	d1e080e7          	jalr	-738(ra) # 800012d2 <release>

    itrunc(ip);
    800055bc:	fe843503          	ld	a0,-24(s0)
    800055c0:	00000097          	auipc	ra,0x0
    800055c4:	1fa080e7          	jalr	506(ra) # 800057ba <itrunc>
    ip->type = 0;
    800055c8:	fe843783          	ld	a5,-24(s0)
    800055cc:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800055d0:	fe843503          	ld	a0,-24(s0)
    800055d4:	00000097          	auipc	ra,0x0
    800055d8:	bae080e7          	jalr	-1106(ra) # 80005182 <iupdate>
    ip->valid = 0;
    800055dc:	fe843783          	ld	a5,-24(s0)
    800055e0:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800055e4:	fe843783          	ld	a5,-24(s0)
    800055e8:	07c1                	addi	a5,a5,16
    800055ea:	853e                	mv	a0,a5
    800055ec:	00001097          	auipc	ra,0x1
    800055f0:	30c080e7          	jalr	780(ra) # 800068f8 <releasesleep>

    acquire(&itable.lock);
    800055f4:	0001e517          	auipc	a0,0x1e
    800055f8:	c2450513          	addi	a0,a0,-988 # 80023218 <itable>
    800055fc:	ffffc097          	auipc	ra,0xffffc
    80005600:	c72080e7          	jalr	-910(ra) # 8000126e <acquire>
  }

  ip->ref--;
    80005604:	fe843783          	ld	a5,-24(s0)
    80005608:	479c                	lw	a5,8(a5)
    8000560a:	37fd                	addiw	a5,a5,-1
    8000560c:	0007871b          	sext.w	a4,a5
    80005610:	fe843783          	ld	a5,-24(s0)
    80005614:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005616:	0001e517          	auipc	a0,0x1e
    8000561a:	c0250513          	addi	a0,a0,-1022 # 80023218 <itable>
    8000561e:	ffffc097          	auipc	ra,0xffffc
    80005622:	cb4080e7          	jalr	-844(ra) # 800012d2 <release>
}
    80005626:	0001                	nop
    80005628:	60e2                	ld	ra,24(sp)
    8000562a:	6442                	ld	s0,16(sp)
    8000562c:	6105                	addi	sp,sp,32
    8000562e:	8082                	ret

0000000080005630 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005630:	1101                	addi	sp,sp,-32
    80005632:	ec06                	sd	ra,24(sp)
    80005634:	e822                	sd	s0,16(sp)
    80005636:	1000                	addi	s0,sp,32
    80005638:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000563c:	fe843503          	ld	a0,-24(s0)
    80005640:	00000097          	auipc	ra,0x0
    80005644:	ec6080e7          	jalr	-314(ra) # 80005506 <iunlock>
  iput(ip);
    80005648:	fe843503          	ld	a0,-24(s0)
    8000564c:	00000097          	auipc	ra,0x0
    80005650:	f14080e7          	jalr	-236(ra) # 80005560 <iput>
}
    80005654:	0001                	nop
    80005656:	60e2                	ld	ra,24(sp)
    80005658:	6442                	ld	s0,16(sp)
    8000565a:	6105                	addi	sp,sp,32
    8000565c:	8082                	ret

000000008000565e <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    8000565e:	7139                	addi	sp,sp,-64
    80005660:	fc06                	sd	ra,56(sp)
    80005662:	f822                	sd	s0,48(sp)
    80005664:	0080                	addi	s0,sp,64
    80005666:	fca43423          	sd	a0,-56(s0)
    8000566a:	87ae                	mv	a5,a1
    8000566c:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005670:	fc442783          	lw	a5,-60(s0)
    80005674:	0007871b          	sext.w	a4,a5
    80005678:	47ad                	li	a5,11
    8000567a:	04e7e863          	bltu	a5,a4,800056ca <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    8000567e:	fc843703          	ld	a4,-56(s0)
    80005682:	fc446783          	lwu	a5,-60(s0)
    80005686:	07d1                	addi	a5,a5,20
    80005688:	078a                	slli	a5,a5,0x2
    8000568a:	97ba                	add	a5,a5,a4
    8000568c:	439c                	lw	a5,0(a5)
    8000568e:	fef42623          	sw	a5,-20(s0)
    80005692:	fec42783          	lw	a5,-20(s0)
    80005696:	2781                	sext.w	a5,a5
    80005698:	e795                	bnez	a5,800056c4 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    8000569a:	fc843783          	ld	a5,-56(s0)
    8000569e:	439c                	lw	a5,0(a5)
    800056a0:	853e                	mv	a0,a5
    800056a2:	fffff097          	auipc	ra,0xfffff
    800056a6:	692080e7          	jalr	1682(ra) # 80004d34 <balloc>
    800056aa:	87aa                	mv	a5,a0
    800056ac:	fef42623          	sw	a5,-20(s0)
    800056b0:	fc843703          	ld	a4,-56(s0)
    800056b4:	fc446783          	lwu	a5,-60(s0)
    800056b8:	07d1                	addi	a5,a5,20
    800056ba:	078a                	slli	a5,a5,0x2
    800056bc:	97ba                	add	a5,a5,a4
    800056be:	fec42703          	lw	a4,-20(s0)
    800056c2:	c398                	sw	a4,0(a5)
    return addr;
    800056c4:	fec42783          	lw	a5,-20(s0)
    800056c8:	a0e5                	j	800057b0 <bmap+0x152>
  }
  bn -= NDIRECT;
    800056ca:	fc442783          	lw	a5,-60(s0)
    800056ce:	37d1                	addiw	a5,a5,-12
    800056d0:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800056d4:	fc442783          	lw	a5,-60(s0)
    800056d8:	0007871b          	sext.w	a4,a5
    800056dc:	0ff00793          	li	a5,255
    800056e0:	0ce7e063          	bltu	a5,a4,800057a0 <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    800056e4:	fc843783          	ld	a5,-56(s0)
    800056e8:	0807a783          	lw	a5,128(a5)
    800056ec:	fef42623          	sw	a5,-20(s0)
    800056f0:	fec42783          	lw	a5,-20(s0)
    800056f4:	2781                	sext.w	a5,a5
    800056f6:	e395                	bnez	a5,8000571a <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    800056f8:	fc843783          	ld	a5,-56(s0)
    800056fc:	439c                	lw	a5,0(a5)
    800056fe:	853e                	mv	a0,a5
    80005700:	fffff097          	auipc	ra,0xfffff
    80005704:	634080e7          	jalr	1588(ra) # 80004d34 <balloc>
    80005708:	87aa                	mv	a5,a0
    8000570a:	fef42623          	sw	a5,-20(s0)
    8000570e:	fc843783          	ld	a5,-56(s0)
    80005712:	fec42703          	lw	a4,-20(s0)
    80005716:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    8000571a:	fc843783          	ld	a5,-56(s0)
    8000571e:	439c                	lw	a5,0(a5)
    80005720:	fec42703          	lw	a4,-20(s0)
    80005724:	85ba                	mv	a1,a4
    80005726:	853e                	mv	a0,a5
    80005728:	fffff097          	auipc	ra,0xfffff
    8000572c:	2c2080e7          	jalr	706(ra) # 800049ea <bread>
    80005730:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005734:	fe043783          	ld	a5,-32(s0)
    80005738:	05878793          	addi	a5,a5,88
    8000573c:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005740:	fc446783          	lwu	a5,-60(s0)
    80005744:	078a                	slli	a5,a5,0x2
    80005746:	fd843703          	ld	a4,-40(s0)
    8000574a:	97ba                	add	a5,a5,a4
    8000574c:	439c                	lw	a5,0(a5)
    8000574e:	fef42623          	sw	a5,-20(s0)
    80005752:	fec42783          	lw	a5,-20(s0)
    80005756:	2781                	sext.w	a5,a5
    80005758:	eb9d                	bnez	a5,8000578e <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    8000575a:	fc843783          	ld	a5,-56(s0)
    8000575e:	439c                	lw	a5,0(a5)
    80005760:	853e                	mv	a0,a5
    80005762:	fffff097          	auipc	ra,0xfffff
    80005766:	5d2080e7          	jalr	1490(ra) # 80004d34 <balloc>
    8000576a:	87aa                	mv	a5,a0
    8000576c:	fef42623          	sw	a5,-20(s0)
    80005770:	fc446783          	lwu	a5,-60(s0)
    80005774:	078a                	slli	a5,a5,0x2
    80005776:	fd843703          	ld	a4,-40(s0)
    8000577a:	97ba                	add	a5,a5,a4
    8000577c:	fec42703          	lw	a4,-20(s0)
    80005780:	c398                	sw	a4,0(a5)
      log_write(bp);
    80005782:	fe043503          	ld	a0,-32(s0)
    80005786:	00001097          	auipc	ra,0x1
    8000578a:	f84080e7          	jalr	-124(ra) # 8000670a <log_write>
    }
    brelse(bp);
    8000578e:	fe043503          	ld	a0,-32(s0)
    80005792:	fffff097          	auipc	ra,0xfffff
    80005796:	2fa080e7          	jalr	762(ra) # 80004a8c <brelse>
    return addr;
    8000579a:	fec42783          	lw	a5,-20(s0)
    8000579e:	a809                	j	800057b0 <bmap+0x152>
  }

  panic("bmap: out of range");
    800057a0:	00006517          	auipc	a0,0x6
    800057a4:	d9050513          	addi	a0,a0,-624 # 8000b530 <etext+0x530>
    800057a8:	ffffb097          	auipc	ra,0xffffb
    800057ac:	4d6080e7          	jalr	1238(ra) # 80000c7e <panic>
}
    800057b0:	853e                	mv	a0,a5
    800057b2:	70e2                	ld	ra,56(sp)
    800057b4:	7442                	ld	s0,48(sp)
    800057b6:	6121                	addi	sp,sp,64
    800057b8:	8082                	ret

00000000800057ba <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800057ba:	7139                	addi	sp,sp,-64
    800057bc:	fc06                	sd	ra,56(sp)
    800057be:	f822                	sd	s0,48(sp)
    800057c0:	0080                	addi	s0,sp,64
    800057c2:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800057c6:	fe042623          	sw	zero,-20(s0)
    800057ca:	a899                	j	80005820 <itrunc+0x66>
    if(ip->addrs[i]){
    800057cc:	fc843703          	ld	a4,-56(s0)
    800057d0:	fec42783          	lw	a5,-20(s0)
    800057d4:	07d1                	addi	a5,a5,20
    800057d6:	078a                	slli	a5,a5,0x2
    800057d8:	97ba                	add	a5,a5,a4
    800057da:	439c                	lw	a5,0(a5)
    800057dc:	cf8d                	beqz	a5,80005816 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    800057de:	fc843783          	ld	a5,-56(s0)
    800057e2:	439c                	lw	a5,0(a5)
    800057e4:	0007869b          	sext.w	a3,a5
    800057e8:	fc843703          	ld	a4,-56(s0)
    800057ec:	fec42783          	lw	a5,-20(s0)
    800057f0:	07d1                	addi	a5,a5,20
    800057f2:	078a                	slli	a5,a5,0x2
    800057f4:	97ba                	add	a5,a5,a4
    800057f6:	439c                	lw	a5,0(a5)
    800057f8:	85be                	mv	a1,a5
    800057fa:	8536                	mv	a0,a3
    800057fc:	fffff097          	auipc	ra,0xfffff
    80005800:	6e6080e7          	jalr	1766(ra) # 80004ee2 <bfree>
      ip->addrs[i] = 0;
    80005804:	fc843703          	ld	a4,-56(s0)
    80005808:	fec42783          	lw	a5,-20(s0)
    8000580c:	07d1                	addi	a5,a5,20
    8000580e:	078a                	slli	a5,a5,0x2
    80005810:	97ba                	add	a5,a5,a4
    80005812:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005816:	fec42783          	lw	a5,-20(s0)
    8000581a:	2785                	addiw	a5,a5,1
    8000581c:	fef42623          	sw	a5,-20(s0)
    80005820:	fec42783          	lw	a5,-20(s0)
    80005824:	0007871b          	sext.w	a4,a5
    80005828:	47ad                	li	a5,11
    8000582a:	fae7d1e3          	bge	a5,a4,800057cc <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000582e:	fc843783          	ld	a5,-56(s0)
    80005832:	0807a783          	lw	a5,128(a5)
    80005836:	cbc5                	beqz	a5,800058e6 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005838:	fc843783          	ld	a5,-56(s0)
    8000583c:	4398                	lw	a4,0(a5)
    8000583e:	fc843783          	ld	a5,-56(s0)
    80005842:	0807a783          	lw	a5,128(a5)
    80005846:	85be                	mv	a1,a5
    80005848:	853a                	mv	a0,a4
    8000584a:	fffff097          	auipc	ra,0xfffff
    8000584e:	1a0080e7          	jalr	416(ra) # 800049ea <bread>
    80005852:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005856:	fe043783          	ld	a5,-32(s0)
    8000585a:	05878793          	addi	a5,a5,88
    8000585e:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005862:	fe042423          	sw	zero,-24(s0)
    80005866:	a081                	j	800058a6 <itrunc+0xec>
      if(a[j])
    80005868:	fe842783          	lw	a5,-24(s0)
    8000586c:	078a                	slli	a5,a5,0x2
    8000586e:	fd843703          	ld	a4,-40(s0)
    80005872:	97ba                	add	a5,a5,a4
    80005874:	439c                	lw	a5,0(a5)
    80005876:	c39d                	beqz	a5,8000589c <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005878:	fc843783          	ld	a5,-56(s0)
    8000587c:	439c                	lw	a5,0(a5)
    8000587e:	0007869b          	sext.w	a3,a5
    80005882:	fe842783          	lw	a5,-24(s0)
    80005886:	078a                	slli	a5,a5,0x2
    80005888:	fd843703          	ld	a4,-40(s0)
    8000588c:	97ba                	add	a5,a5,a4
    8000588e:	439c                	lw	a5,0(a5)
    80005890:	85be                	mv	a1,a5
    80005892:	8536                	mv	a0,a3
    80005894:	fffff097          	auipc	ra,0xfffff
    80005898:	64e080e7          	jalr	1614(ra) # 80004ee2 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    8000589c:	fe842783          	lw	a5,-24(s0)
    800058a0:	2785                	addiw	a5,a5,1
    800058a2:	fef42423          	sw	a5,-24(s0)
    800058a6:	fe842783          	lw	a5,-24(s0)
    800058aa:	873e                	mv	a4,a5
    800058ac:	0ff00793          	li	a5,255
    800058b0:	fae7fce3          	bgeu	a5,a4,80005868 <itrunc+0xae>
    }
    brelse(bp);
    800058b4:	fe043503          	ld	a0,-32(s0)
    800058b8:	fffff097          	auipc	ra,0xfffff
    800058bc:	1d4080e7          	jalr	468(ra) # 80004a8c <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800058c0:	fc843783          	ld	a5,-56(s0)
    800058c4:	439c                	lw	a5,0(a5)
    800058c6:	0007871b          	sext.w	a4,a5
    800058ca:	fc843783          	ld	a5,-56(s0)
    800058ce:	0807a783          	lw	a5,128(a5)
    800058d2:	85be                	mv	a1,a5
    800058d4:	853a                	mv	a0,a4
    800058d6:	fffff097          	auipc	ra,0xfffff
    800058da:	60c080e7          	jalr	1548(ra) # 80004ee2 <bfree>
    ip->addrs[NDIRECT] = 0;
    800058de:	fc843783          	ld	a5,-56(s0)
    800058e2:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    800058e6:	fc843783          	ld	a5,-56(s0)
    800058ea:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    800058ee:	fc843503          	ld	a0,-56(s0)
    800058f2:	00000097          	auipc	ra,0x0
    800058f6:	890080e7          	jalr	-1904(ra) # 80005182 <iupdate>
}
    800058fa:	0001                	nop
    800058fc:	70e2                	ld	ra,56(sp)
    800058fe:	7442                	ld	s0,48(sp)
    80005900:	6121                	addi	sp,sp,64
    80005902:	8082                	ret

0000000080005904 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005904:	1101                	addi	sp,sp,-32
    80005906:	ec22                	sd	s0,24(sp)
    80005908:	1000                	addi	s0,sp,32
    8000590a:	fea43423          	sd	a0,-24(s0)
    8000590e:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005912:	fe843783          	ld	a5,-24(s0)
    80005916:	439c                	lw	a5,0(a5)
    80005918:	0007871b          	sext.w	a4,a5
    8000591c:	fe043783          	ld	a5,-32(s0)
    80005920:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005922:	fe843783          	ld	a5,-24(s0)
    80005926:	43d8                	lw	a4,4(a5)
    80005928:	fe043783          	ld	a5,-32(s0)
    8000592c:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000592e:	fe843783          	ld	a5,-24(s0)
    80005932:	04479703          	lh	a4,68(a5)
    80005936:	fe043783          	ld	a5,-32(s0)
    8000593a:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000593e:	fe843783          	ld	a5,-24(s0)
    80005942:	04a79703          	lh	a4,74(a5)
    80005946:	fe043783          	ld	a5,-32(s0)
    8000594a:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000594e:	fe843783          	ld	a5,-24(s0)
    80005952:	47fc                	lw	a5,76(a5)
    80005954:	02079713          	slli	a4,a5,0x20
    80005958:	9301                	srli	a4,a4,0x20
    8000595a:	fe043783          	ld	a5,-32(s0)
    8000595e:	eb98                	sd	a4,16(a5)
}
    80005960:	0001                	nop
    80005962:	6462                	ld	s0,24(sp)
    80005964:	6105                	addi	sp,sp,32
    80005966:	8082                	ret

0000000080005968 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005968:	711d                	addi	sp,sp,-96
    8000596a:	ec86                	sd	ra,88(sp)
    8000596c:	e8a2                	sd	s0,80(sp)
    8000596e:	e4a6                	sd	s1,72(sp)
    80005970:	1080                	addi	s0,sp,96
    80005972:	faa43c23          	sd	a0,-72(s0)
    80005976:	87ae                	mv	a5,a1
    80005978:	fac43423          	sd	a2,-88(s0)
    8000597c:	faf42a23          	sw	a5,-76(s0)
    80005980:	87b6                	mv	a5,a3
    80005982:	faf42823          	sw	a5,-80(s0)
    80005986:	87ba                	mv	a5,a4
    80005988:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000598c:	fb843783          	ld	a5,-72(s0)
    80005990:	47f8                	lw	a4,76(a5)
    80005992:	fb042783          	lw	a5,-80(s0)
    80005996:	2781                	sext.w	a5,a5
    80005998:	00f76e63          	bltu	a4,a5,800059b4 <readi+0x4c>
    8000599c:	fb042703          	lw	a4,-80(s0)
    800059a0:	fa442783          	lw	a5,-92(s0)
    800059a4:	9fb9                	addw	a5,a5,a4
    800059a6:	0007871b          	sext.w	a4,a5
    800059aa:	fb042783          	lw	a5,-80(s0)
    800059ae:	2781                	sext.w	a5,a5
    800059b0:	00f77463          	bgeu	a4,a5,800059b8 <readi+0x50>
    return 0;
    800059b4:	4781                	li	a5,0
    800059b6:	aa05                	j	80005ae6 <readi+0x17e>
  if(off + n > ip->size)
    800059b8:	fb042703          	lw	a4,-80(s0)
    800059bc:	fa442783          	lw	a5,-92(s0)
    800059c0:	9fb9                	addw	a5,a5,a4
    800059c2:	0007871b          	sext.w	a4,a5
    800059c6:	fb843783          	ld	a5,-72(s0)
    800059ca:	47fc                	lw	a5,76(a5)
    800059cc:	00e7fb63          	bgeu	a5,a4,800059e2 <readi+0x7a>
    n = ip->size - off;
    800059d0:	fb843783          	ld	a5,-72(s0)
    800059d4:	47f8                	lw	a4,76(a5)
    800059d6:	fb042783          	lw	a5,-80(s0)
    800059da:	40f707bb          	subw	a5,a4,a5
    800059de:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800059e2:	fc042e23          	sw	zero,-36(s0)
    800059e6:	a0f5                	j	80005ad2 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    800059e8:	fb843783          	ld	a5,-72(s0)
    800059ec:	4384                	lw	s1,0(a5)
    800059ee:	fb042783          	lw	a5,-80(s0)
    800059f2:	00a7d79b          	srliw	a5,a5,0xa
    800059f6:	2781                	sext.w	a5,a5
    800059f8:	85be                	mv	a1,a5
    800059fa:	fb843503          	ld	a0,-72(s0)
    800059fe:	00000097          	auipc	ra,0x0
    80005a02:	c60080e7          	jalr	-928(ra) # 8000565e <bmap>
    80005a06:	87aa                	mv	a5,a0
    80005a08:	2781                	sext.w	a5,a5
    80005a0a:	85be                	mv	a1,a5
    80005a0c:	8526                	mv	a0,s1
    80005a0e:	fffff097          	auipc	ra,0xfffff
    80005a12:	fdc080e7          	jalr	-36(ra) # 800049ea <bread>
    80005a16:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005a1a:	fb042783          	lw	a5,-80(s0)
    80005a1e:	3ff7f793          	andi	a5,a5,1023
    80005a22:	2781                	sext.w	a5,a5
    80005a24:	40000713          	li	a4,1024
    80005a28:	40f707bb          	subw	a5,a4,a5
    80005a2c:	0007869b          	sext.w	a3,a5
    80005a30:	fa442703          	lw	a4,-92(s0)
    80005a34:	fdc42783          	lw	a5,-36(s0)
    80005a38:	40f707bb          	subw	a5,a4,a5
    80005a3c:	2781                	sext.w	a5,a5
    80005a3e:	863e                	mv	a2,a5
    80005a40:	87b6                	mv	a5,a3
    80005a42:	0007869b          	sext.w	a3,a5
    80005a46:	0006071b          	sext.w	a4,a2
    80005a4a:	00d77363          	bgeu	a4,a3,80005a50 <readi+0xe8>
    80005a4e:	87b2                	mv	a5,a2
    80005a50:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005a54:	fd043783          	ld	a5,-48(s0)
    80005a58:	05878713          	addi	a4,a5,88
    80005a5c:	fb046783          	lwu	a5,-80(s0)
    80005a60:	3ff7f793          	andi	a5,a5,1023
    80005a64:	973e                	add	a4,a4,a5
    80005a66:	fcc46683          	lwu	a3,-52(s0)
    80005a6a:	fb442783          	lw	a5,-76(s0)
    80005a6e:	863a                	mv	a2,a4
    80005a70:	fa843583          	ld	a1,-88(s0)
    80005a74:	853e                	mv	a0,a5
    80005a76:	ffffe097          	auipc	ra,0xffffe
    80005a7a:	e9e080e7          	jalr	-354(ra) # 80003914 <either_copyout>
    80005a7e:	87aa                	mv	a5,a0
    80005a80:	873e                	mv	a4,a5
    80005a82:	57fd                	li	a5,-1
    80005a84:	00f71c63          	bne	a4,a5,80005a9c <readi+0x134>
      brelse(bp);
    80005a88:	fd043503          	ld	a0,-48(s0)
    80005a8c:	fffff097          	auipc	ra,0xfffff
    80005a90:	000080e7          	jalr	ra # 80004a8c <brelse>
      tot = -1;
    80005a94:	57fd                	li	a5,-1
    80005a96:	fcf42e23          	sw	a5,-36(s0)
      break;
    80005a9a:	a0a1                	j	80005ae2 <readi+0x17a>
    }
    brelse(bp);
    80005a9c:	fd043503          	ld	a0,-48(s0)
    80005aa0:	fffff097          	auipc	ra,0xfffff
    80005aa4:	fec080e7          	jalr	-20(ra) # 80004a8c <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005aa8:	fdc42703          	lw	a4,-36(s0)
    80005aac:	fcc42783          	lw	a5,-52(s0)
    80005ab0:	9fb9                	addw	a5,a5,a4
    80005ab2:	fcf42e23          	sw	a5,-36(s0)
    80005ab6:	fb042703          	lw	a4,-80(s0)
    80005aba:	fcc42783          	lw	a5,-52(s0)
    80005abe:	9fb9                	addw	a5,a5,a4
    80005ac0:	faf42823          	sw	a5,-80(s0)
    80005ac4:	fcc46783          	lwu	a5,-52(s0)
    80005ac8:	fa843703          	ld	a4,-88(s0)
    80005acc:	97ba                	add	a5,a5,a4
    80005ace:	faf43423          	sd	a5,-88(s0)
    80005ad2:	fdc42703          	lw	a4,-36(s0)
    80005ad6:	fa442783          	lw	a5,-92(s0)
    80005ada:	2701                	sext.w	a4,a4
    80005adc:	2781                	sext.w	a5,a5
    80005ade:	f0f765e3          	bltu	a4,a5,800059e8 <readi+0x80>
  }
  return tot;
    80005ae2:	fdc42783          	lw	a5,-36(s0)
}
    80005ae6:	853e                	mv	a0,a5
    80005ae8:	60e6                	ld	ra,88(sp)
    80005aea:	6446                	ld	s0,80(sp)
    80005aec:	64a6                	ld	s1,72(sp)
    80005aee:	6125                	addi	sp,sp,96
    80005af0:	8082                	ret

0000000080005af2 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005af2:	711d                	addi	sp,sp,-96
    80005af4:	ec86                	sd	ra,88(sp)
    80005af6:	e8a2                	sd	s0,80(sp)
    80005af8:	e4a6                	sd	s1,72(sp)
    80005afa:	1080                	addi	s0,sp,96
    80005afc:	faa43c23          	sd	a0,-72(s0)
    80005b00:	87ae                	mv	a5,a1
    80005b02:	fac43423          	sd	a2,-88(s0)
    80005b06:	faf42a23          	sw	a5,-76(s0)
    80005b0a:	87b6                	mv	a5,a3
    80005b0c:	faf42823          	sw	a5,-80(s0)
    80005b10:	87ba                	mv	a5,a4
    80005b12:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005b16:	fb843783          	ld	a5,-72(s0)
    80005b1a:	47f8                	lw	a4,76(a5)
    80005b1c:	fb042783          	lw	a5,-80(s0)
    80005b20:	2781                	sext.w	a5,a5
    80005b22:	00f76e63          	bltu	a4,a5,80005b3e <writei+0x4c>
    80005b26:	fb042703          	lw	a4,-80(s0)
    80005b2a:	fa442783          	lw	a5,-92(s0)
    80005b2e:	9fb9                	addw	a5,a5,a4
    80005b30:	0007871b          	sext.w	a4,a5
    80005b34:	fb042783          	lw	a5,-80(s0)
    80005b38:	2781                	sext.w	a5,a5
    80005b3a:	00f77463          	bgeu	a4,a5,80005b42 <writei+0x50>
    return -1;
    80005b3e:	57fd                	li	a5,-1
    80005b40:	a2b1                	j	80005c8c <writei+0x19a>
  if(off + n > MAXFILE*BSIZE)
    80005b42:	fb042703          	lw	a4,-80(s0)
    80005b46:	fa442783          	lw	a5,-92(s0)
    80005b4a:	9fb9                	addw	a5,a5,a4
    80005b4c:	2781                	sext.w	a5,a5
    80005b4e:	873e                	mv	a4,a5
    80005b50:	000437b7          	lui	a5,0x43
    80005b54:	00e7f463          	bgeu	a5,a4,80005b5c <writei+0x6a>
    return -1;
    80005b58:	57fd                	li	a5,-1
    80005b5a:	aa0d                	j	80005c8c <writei+0x19a>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005b5c:	fc042e23          	sw	zero,-36(s0)
    80005b60:	a8cd                	j	80005c52 <writei+0x160>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005b62:	fb843783          	ld	a5,-72(s0)
    80005b66:	4384                	lw	s1,0(a5)
    80005b68:	fb042783          	lw	a5,-80(s0)
    80005b6c:	00a7d79b          	srliw	a5,a5,0xa
    80005b70:	2781                	sext.w	a5,a5
    80005b72:	85be                	mv	a1,a5
    80005b74:	fb843503          	ld	a0,-72(s0)
    80005b78:	00000097          	auipc	ra,0x0
    80005b7c:	ae6080e7          	jalr	-1306(ra) # 8000565e <bmap>
    80005b80:	87aa                	mv	a5,a0
    80005b82:	2781                	sext.w	a5,a5
    80005b84:	85be                	mv	a1,a5
    80005b86:	8526                	mv	a0,s1
    80005b88:	fffff097          	auipc	ra,0xfffff
    80005b8c:	e62080e7          	jalr	-414(ra) # 800049ea <bread>
    80005b90:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005b94:	fb042783          	lw	a5,-80(s0)
    80005b98:	3ff7f793          	andi	a5,a5,1023
    80005b9c:	2781                	sext.w	a5,a5
    80005b9e:	40000713          	li	a4,1024
    80005ba2:	40f707bb          	subw	a5,a4,a5
    80005ba6:	0007869b          	sext.w	a3,a5
    80005baa:	fa442703          	lw	a4,-92(s0)
    80005bae:	fdc42783          	lw	a5,-36(s0)
    80005bb2:	40f707bb          	subw	a5,a4,a5
    80005bb6:	2781                	sext.w	a5,a5
    80005bb8:	863e                	mv	a2,a5
    80005bba:	87b6                	mv	a5,a3
    80005bbc:	0007869b          	sext.w	a3,a5
    80005bc0:	0006071b          	sext.w	a4,a2
    80005bc4:	00d77363          	bgeu	a4,a3,80005bca <writei+0xd8>
    80005bc8:	87b2                	mv	a5,a2
    80005bca:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005bce:	fd043783          	ld	a5,-48(s0)
    80005bd2:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005bd6:	fb046783          	lwu	a5,-80(s0)
    80005bda:	3ff7f793          	andi	a5,a5,1023
    80005bde:	97ba                	add	a5,a5,a4
    80005be0:	fcc46683          	lwu	a3,-52(s0)
    80005be4:	fb442703          	lw	a4,-76(s0)
    80005be8:	fa843603          	ld	a2,-88(s0)
    80005bec:	85ba                	mv	a1,a4
    80005bee:	853e                	mv	a0,a5
    80005bf0:	ffffe097          	auipc	ra,0xffffe
    80005bf4:	d98080e7          	jalr	-616(ra) # 80003988 <either_copyin>
    80005bf8:	87aa                	mv	a5,a0
    80005bfa:	873e                	mv	a4,a5
    80005bfc:	57fd                	li	a5,-1
    80005bfe:	00f71963          	bne	a4,a5,80005c10 <writei+0x11e>
      brelse(bp);
    80005c02:	fd043503          	ld	a0,-48(s0)
    80005c06:	fffff097          	auipc	ra,0xfffff
    80005c0a:	e86080e7          	jalr	-378(ra) # 80004a8c <brelse>
      break;
    80005c0e:	a891                	j	80005c62 <writei+0x170>
    }
    log_write(bp);
    80005c10:	fd043503          	ld	a0,-48(s0)
    80005c14:	00001097          	auipc	ra,0x1
    80005c18:	af6080e7          	jalr	-1290(ra) # 8000670a <log_write>
    brelse(bp);
    80005c1c:	fd043503          	ld	a0,-48(s0)
    80005c20:	fffff097          	auipc	ra,0xfffff
    80005c24:	e6c080e7          	jalr	-404(ra) # 80004a8c <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005c28:	fdc42703          	lw	a4,-36(s0)
    80005c2c:	fcc42783          	lw	a5,-52(s0)
    80005c30:	9fb9                	addw	a5,a5,a4
    80005c32:	fcf42e23          	sw	a5,-36(s0)
    80005c36:	fb042703          	lw	a4,-80(s0)
    80005c3a:	fcc42783          	lw	a5,-52(s0)
    80005c3e:	9fb9                	addw	a5,a5,a4
    80005c40:	faf42823          	sw	a5,-80(s0)
    80005c44:	fcc46783          	lwu	a5,-52(s0)
    80005c48:	fa843703          	ld	a4,-88(s0)
    80005c4c:	97ba                	add	a5,a5,a4
    80005c4e:	faf43423          	sd	a5,-88(s0)
    80005c52:	fdc42703          	lw	a4,-36(s0)
    80005c56:	fa442783          	lw	a5,-92(s0)
    80005c5a:	2701                	sext.w	a4,a4
    80005c5c:	2781                	sext.w	a5,a5
    80005c5e:	f0f762e3          	bltu	a4,a5,80005b62 <writei+0x70>
  }

  if(off > ip->size)
    80005c62:	fb843783          	ld	a5,-72(s0)
    80005c66:	47f8                	lw	a4,76(a5)
    80005c68:	fb042783          	lw	a5,-80(s0)
    80005c6c:	2781                	sext.w	a5,a5
    80005c6e:	00f77763          	bgeu	a4,a5,80005c7c <writei+0x18a>
    ip->size = off;
    80005c72:	fb843783          	ld	a5,-72(s0)
    80005c76:	fb042703          	lw	a4,-80(s0)
    80005c7a:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005c7c:	fb843503          	ld	a0,-72(s0)
    80005c80:	fffff097          	auipc	ra,0xfffff
    80005c84:	502080e7          	jalr	1282(ra) # 80005182 <iupdate>

  return tot;
    80005c88:	fdc42783          	lw	a5,-36(s0)
}
    80005c8c:	853e                	mv	a0,a5
    80005c8e:	60e6                	ld	ra,88(sp)
    80005c90:	6446                	ld	s0,80(sp)
    80005c92:	64a6                	ld	s1,72(sp)
    80005c94:	6125                	addi	sp,sp,96
    80005c96:	8082                	ret

0000000080005c98 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005c98:	1101                	addi	sp,sp,-32
    80005c9a:	ec06                	sd	ra,24(sp)
    80005c9c:	e822                	sd	s0,16(sp)
    80005c9e:	1000                	addi	s0,sp,32
    80005ca0:	fea43423          	sd	a0,-24(s0)
    80005ca4:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005ca8:	4639                	li	a2,14
    80005caa:	fe043583          	ld	a1,-32(s0)
    80005cae:	fe843503          	ld	a0,-24(s0)
    80005cb2:	ffffc097          	auipc	ra,0xffffc
    80005cb6:	988080e7          	jalr	-1656(ra) # 8000163a <strncmp>
    80005cba:	87aa                	mv	a5,a0
}
    80005cbc:	853e                	mv	a0,a5
    80005cbe:	60e2                	ld	ra,24(sp)
    80005cc0:	6442                	ld	s0,16(sp)
    80005cc2:	6105                	addi	sp,sp,32
    80005cc4:	8082                	ret

0000000080005cc6 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005cc6:	715d                	addi	sp,sp,-80
    80005cc8:	e486                	sd	ra,72(sp)
    80005cca:	e0a2                	sd	s0,64(sp)
    80005ccc:	0880                	addi	s0,sp,80
    80005cce:	fca43423          	sd	a0,-56(s0)
    80005cd2:	fcb43023          	sd	a1,-64(s0)
    80005cd6:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005cda:	fc843783          	ld	a5,-56(s0)
    80005cde:	04479783          	lh	a5,68(a5)
    80005ce2:	0007871b          	sext.w	a4,a5
    80005ce6:	4785                	li	a5,1
    80005ce8:	00f70a63          	beq	a4,a5,80005cfc <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005cec:	00006517          	auipc	a0,0x6
    80005cf0:	85c50513          	addi	a0,a0,-1956 # 8000b548 <etext+0x548>
    80005cf4:	ffffb097          	auipc	ra,0xffffb
    80005cf8:	f8a080e7          	jalr	-118(ra) # 80000c7e <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005cfc:	fe042623          	sw	zero,-20(s0)
    80005d00:	a849                	j	80005d92 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d02:	fd840793          	addi	a5,s0,-40
    80005d06:	fec42683          	lw	a3,-20(s0)
    80005d0a:	4741                	li	a4,16
    80005d0c:	863e                	mv	a2,a5
    80005d0e:	4581                	li	a1,0
    80005d10:	fc843503          	ld	a0,-56(s0)
    80005d14:	00000097          	auipc	ra,0x0
    80005d18:	c54080e7          	jalr	-940(ra) # 80005968 <readi>
    80005d1c:	87aa                	mv	a5,a0
    80005d1e:	873e                	mv	a4,a5
    80005d20:	47c1                	li	a5,16
    80005d22:	00f70a63          	beq	a4,a5,80005d36 <dirlookup+0x70>
      panic("dirlookup read");
    80005d26:	00006517          	auipc	a0,0x6
    80005d2a:	83a50513          	addi	a0,a0,-1990 # 8000b560 <etext+0x560>
    80005d2e:	ffffb097          	auipc	ra,0xffffb
    80005d32:	f50080e7          	jalr	-176(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005d36:	fd845783          	lhu	a5,-40(s0)
    80005d3a:	c7b1                	beqz	a5,80005d86 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005d3c:	fd840793          	addi	a5,s0,-40
    80005d40:	0789                	addi	a5,a5,2
    80005d42:	85be                	mv	a1,a5
    80005d44:	fc043503          	ld	a0,-64(s0)
    80005d48:	00000097          	auipc	ra,0x0
    80005d4c:	f50080e7          	jalr	-176(ra) # 80005c98 <namecmp>
    80005d50:	87aa                	mv	a5,a0
    80005d52:	eb9d                	bnez	a5,80005d88 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005d54:	fb843783          	ld	a5,-72(s0)
    80005d58:	c791                	beqz	a5,80005d64 <dirlookup+0x9e>
        *poff = off;
    80005d5a:	fb843783          	ld	a5,-72(s0)
    80005d5e:	fec42703          	lw	a4,-20(s0)
    80005d62:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005d64:	fd845783          	lhu	a5,-40(s0)
    80005d68:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005d6c:	fc843783          	ld	a5,-56(s0)
    80005d70:	439c                	lw	a5,0(a5)
    80005d72:	fe842703          	lw	a4,-24(s0)
    80005d76:	85ba                	mv	a1,a4
    80005d78:	853e                	mv	a0,a5
    80005d7a:	fffff097          	auipc	ra,0xfffff
    80005d7e:	4f0080e7          	jalr	1264(ra) # 8000526a <iget>
    80005d82:	87aa                	mv	a5,a0
    80005d84:	a005                	j	80005da4 <dirlookup+0xde>
      continue;
    80005d86:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d88:	fec42783          	lw	a5,-20(s0)
    80005d8c:	27c1                	addiw	a5,a5,16
    80005d8e:	fef42623          	sw	a5,-20(s0)
    80005d92:	fc843783          	ld	a5,-56(s0)
    80005d96:	47f8                	lw	a4,76(a5)
    80005d98:	fec42783          	lw	a5,-20(s0)
    80005d9c:	2781                	sext.w	a5,a5
    80005d9e:	f6e7e2e3          	bltu	a5,a4,80005d02 <dirlookup+0x3c>
    }
  }

  return 0;
    80005da2:	4781                	li	a5,0
}
    80005da4:	853e                	mv	a0,a5
    80005da6:	60a6                	ld	ra,72(sp)
    80005da8:	6406                	ld	s0,64(sp)
    80005daa:	6161                	addi	sp,sp,80
    80005dac:	8082                	ret

0000000080005dae <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005dae:	715d                	addi	sp,sp,-80
    80005db0:	e486                	sd	ra,72(sp)
    80005db2:	e0a2                	sd	s0,64(sp)
    80005db4:	0880                	addi	s0,sp,80
    80005db6:	fca43423          	sd	a0,-56(s0)
    80005dba:	fcb43023          	sd	a1,-64(s0)
    80005dbe:	87b2                	mv	a5,a2
    80005dc0:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005dc4:	4601                	li	a2,0
    80005dc6:	fc043583          	ld	a1,-64(s0)
    80005dca:	fc843503          	ld	a0,-56(s0)
    80005dce:	00000097          	auipc	ra,0x0
    80005dd2:	ef8080e7          	jalr	-264(ra) # 80005cc6 <dirlookup>
    80005dd6:	fea43023          	sd	a0,-32(s0)
    80005dda:	fe043783          	ld	a5,-32(s0)
    80005dde:	cb89                	beqz	a5,80005df0 <dirlink+0x42>
    iput(ip);
    80005de0:	fe043503          	ld	a0,-32(s0)
    80005de4:	fffff097          	auipc	ra,0xfffff
    80005de8:	77c080e7          	jalr	1916(ra) # 80005560 <iput>
    return -1;
    80005dec:	57fd                	li	a5,-1
    80005dee:	a865                	j	80005ea6 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005df0:	fe042623          	sw	zero,-20(s0)
    80005df4:	a0a1                	j	80005e3c <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005df6:	fd040793          	addi	a5,s0,-48
    80005dfa:	fec42683          	lw	a3,-20(s0)
    80005dfe:	4741                	li	a4,16
    80005e00:	863e                	mv	a2,a5
    80005e02:	4581                	li	a1,0
    80005e04:	fc843503          	ld	a0,-56(s0)
    80005e08:	00000097          	auipc	ra,0x0
    80005e0c:	b60080e7          	jalr	-1184(ra) # 80005968 <readi>
    80005e10:	87aa                	mv	a5,a0
    80005e12:	873e                	mv	a4,a5
    80005e14:	47c1                	li	a5,16
    80005e16:	00f70a63          	beq	a4,a5,80005e2a <dirlink+0x7c>
      panic("dirlink read");
    80005e1a:	00005517          	auipc	a0,0x5
    80005e1e:	75650513          	addi	a0,a0,1878 # 8000b570 <etext+0x570>
    80005e22:	ffffb097          	auipc	ra,0xffffb
    80005e26:	e5c080e7          	jalr	-420(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005e2a:	fd045783          	lhu	a5,-48(s0)
    80005e2e:	cf99                	beqz	a5,80005e4c <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e30:	fec42783          	lw	a5,-20(s0)
    80005e34:	27c1                	addiw	a5,a5,16
    80005e36:	2781                	sext.w	a5,a5
    80005e38:	fef42623          	sw	a5,-20(s0)
    80005e3c:	fc843783          	ld	a5,-56(s0)
    80005e40:	47f8                	lw	a4,76(a5)
    80005e42:	fec42783          	lw	a5,-20(s0)
    80005e46:	fae7e8e3          	bltu	a5,a4,80005df6 <dirlink+0x48>
    80005e4a:	a011                	j	80005e4e <dirlink+0xa0>
      break;
    80005e4c:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005e4e:	fd040793          	addi	a5,s0,-48
    80005e52:	0789                	addi	a5,a5,2
    80005e54:	4639                	li	a2,14
    80005e56:	fc043583          	ld	a1,-64(s0)
    80005e5a:	853e                	mv	a0,a5
    80005e5c:	ffffc097          	auipc	ra,0xffffc
    80005e60:	868080e7          	jalr	-1944(ra) # 800016c4 <strncpy>
  de.inum = inum;
    80005e64:	fbc42783          	lw	a5,-68(s0)
    80005e68:	17c2                	slli	a5,a5,0x30
    80005e6a:	93c1                	srli	a5,a5,0x30
    80005e6c:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005e70:	fd040793          	addi	a5,s0,-48
    80005e74:	fec42683          	lw	a3,-20(s0)
    80005e78:	4741                	li	a4,16
    80005e7a:	863e                	mv	a2,a5
    80005e7c:	4581                	li	a1,0
    80005e7e:	fc843503          	ld	a0,-56(s0)
    80005e82:	00000097          	auipc	ra,0x0
    80005e86:	c70080e7          	jalr	-912(ra) # 80005af2 <writei>
    80005e8a:	87aa                	mv	a5,a0
    80005e8c:	873e                	mv	a4,a5
    80005e8e:	47c1                	li	a5,16
    80005e90:	00f70a63          	beq	a4,a5,80005ea4 <dirlink+0xf6>
    panic("dirlink");
    80005e94:	00005517          	auipc	a0,0x5
    80005e98:	6ec50513          	addi	a0,a0,1772 # 8000b580 <etext+0x580>
    80005e9c:	ffffb097          	auipc	ra,0xffffb
    80005ea0:	de2080e7          	jalr	-542(ra) # 80000c7e <panic>

  return 0;
    80005ea4:	4781                	li	a5,0
}
    80005ea6:	853e                	mv	a0,a5
    80005ea8:	60a6                	ld	ra,72(sp)
    80005eaa:	6406                	ld	s0,64(sp)
    80005eac:	6161                	addi	sp,sp,80
    80005eae:	8082                	ret

0000000080005eb0 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005eb0:	7179                	addi	sp,sp,-48
    80005eb2:	f406                	sd	ra,40(sp)
    80005eb4:	f022                	sd	s0,32(sp)
    80005eb6:	1800                	addi	s0,sp,48
    80005eb8:	fca43c23          	sd	a0,-40(s0)
    80005ebc:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005ec0:	a031                	j	80005ecc <skipelem+0x1c>
    path++;
    80005ec2:	fd843783          	ld	a5,-40(s0)
    80005ec6:	0785                	addi	a5,a5,1
    80005ec8:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005ecc:	fd843783          	ld	a5,-40(s0)
    80005ed0:	0007c783          	lbu	a5,0(a5)
    80005ed4:	873e                	mv	a4,a5
    80005ed6:	02f00793          	li	a5,47
    80005eda:	fef704e3          	beq	a4,a5,80005ec2 <skipelem+0x12>
  if(*path == 0)
    80005ede:	fd843783          	ld	a5,-40(s0)
    80005ee2:	0007c783          	lbu	a5,0(a5)
    80005ee6:	e399                	bnez	a5,80005eec <skipelem+0x3c>
    return 0;
    80005ee8:	4781                	li	a5,0
    80005eea:	a06d                	j	80005f94 <skipelem+0xe4>
  s = path;
    80005eec:	fd843783          	ld	a5,-40(s0)
    80005ef0:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005ef4:	a031                	j	80005f00 <skipelem+0x50>
    path++;
    80005ef6:	fd843783          	ld	a5,-40(s0)
    80005efa:	0785                	addi	a5,a5,1
    80005efc:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005f00:	fd843783          	ld	a5,-40(s0)
    80005f04:	0007c783          	lbu	a5,0(a5)
    80005f08:	873e                	mv	a4,a5
    80005f0a:	02f00793          	li	a5,47
    80005f0e:	00f70763          	beq	a4,a5,80005f1c <skipelem+0x6c>
    80005f12:	fd843783          	ld	a5,-40(s0)
    80005f16:	0007c783          	lbu	a5,0(a5)
    80005f1a:	fff1                	bnez	a5,80005ef6 <skipelem+0x46>
  len = path - s;
    80005f1c:	fd843703          	ld	a4,-40(s0)
    80005f20:	fe843783          	ld	a5,-24(s0)
    80005f24:	40f707b3          	sub	a5,a4,a5
    80005f28:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005f2c:	fe442783          	lw	a5,-28(s0)
    80005f30:	0007871b          	sext.w	a4,a5
    80005f34:	47b5                	li	a5,13
    80005f36:	00e7dc63          	bge	a5,a4,80005f4e <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005f3a:	4639                	li	a2,14
    80005f3c:	fe843583          	ld	a1,-24(s0)
    80005f40:	fd043503          	ld	a0,-48(s0)
    80005f44:	ffffb097          	auipc	ra,0xffffb
    80005f48:	5e2080e7          	jalr	1506(ra) # 80001526 <memmove>
    80005f4c:	a80d                	j	80005f7e <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005f4e:	fe442783          	lw	a5,-28(s0)
    80005f52:	863e                	mv	a2,a5
    80005f54:	fe843583          	ld	a1,-24(s0)
    80005f58:	fd043503          	ld	a0,-48(s0)
    80005f5c:	ffffb097          	auipc	ra,0xffffb
    80005f60:	5ca080e7          	jalr	1482(ra) # 80001526 <memmove>
    name[len] = 0;
    80005f64:	fe442783          	lw	a5,-28(s0)
    80005f68:	fd043703          	ld	a4,-48(s0)
    80005f6c:	97ba                	add	a5,a5,a4
    80005f6e:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005f72:	a031                	j	80005f7e <skipelem+0xce>
    path++;
    80005f74:	fd843783          	ld	a5,-40(s0)
    80005f78:	0785                	addi	a5,a5,1
    80005f7a:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005f7e:	fd843783          	ld	a5,-40(s0)
    80005f82:	0007c783          	lbu	a5,0(a5)
    80005f86:	873e                	mv	a4,a5
    80005f88:	02f00793          	li	a5,47
    80005f8c:	fef704e3          	beq	a4,a5,80005f74 <skipelem+0xc4>
  return path;
    80005f90:	fd843783          	ld	a5,-40(s0)
}
    80005f94:	853e                	mv	a0,a5
    80005f96:	70a2                	ld	ra,40(sp)
    80005f98:	7402                	ld	s0,32(sp)
    80005f9a:	6145                	addi	sp,sp,48
    80005f9c:	8082                	ret

0000000080005f9e <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005f9e:	7139                	addi	sp,sp,-64
    80005fa0:	fc06                	sd	ra,56(sp)
    80005fa2:	f822                	sd	s0,48(sp)
    80005fa4:	0080                	addi	s0,sp,64
    80005fa6:	fca43c23          	sd	a0,-40(s0)
    80005faa:	87ae                	mv	a5,a1
    80005fac:	fcc43423          	sd	a2,-56(s0)
    80005fb0:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005fb4:	fd843783          	ld	a5,-40(s0)
    80005fb8:	0007c783          	lbu	a5,0(a5)
    80005fbc:	873e                	mv	a4,a5
    80005fbe:	02f00793          	li	a5,47
    80005fc2:	00f71b63          	bne	a4,a5,80005fd8 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005fc6:	4585                	li	a1,1
    80005fc8:	4505                	li	a0,1
    80005fca:	fffff097          	auipc	ra,0xfffff
    80005fce:	2a0080e7          	jalr	672(ra) # 8000526a <iget>
    80005fd2:	fea43423          	sd	a0,-24(s0)
    80005fd6:	a84d                	j	80006088 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005fd8:	ffffd097          	auipc	ra,0xffffd
    80005fdc:	840080e7          	jalr	-1984(ra) # 80002818 <myproc>
    80005fe0:	87aa                	mv	a5,a0
    80005fe2:	1507b783          	ld	a5,336(a5)
    80005fe6:	853e                	mv	a0,a5
    80005fe8:	fffff097          	auipc	ra,0xfffff
    80005fec:	39e080e7          	jalr	926(ra) # 80005386 <idup>
    80005ff0:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005ff4:	a851                	j	80006088 <namex+0xea>
    ilock(ip);
    80005ff6:	fe843503          	ld	a0,-24(s0)
    80005ffa:	fffff097          	auipc	ra,0xfffff
    80005ffe:	3d8080e7          	jalr	984(ra) # 800053d2 <ilock>
    if(ip->type != T_DIR){
    80006002:	fe843783          	ld	a5,-24(s0)
    80006006:	04479783          	lh	a5,68(a5)
    8000600a:	0007871b          	sext.w	a4,a5
    8000600e:	4785                	li	a5,1
    80006010:	00f70a63          	beq	a4,a5,80006024 <namex+0x86>
      iunlockput(ip);
    80006014:	fe843503          	ld	a0,-24(s0)
    80006018:	fffff097          	auipc	ra,0xfffff
    8000601c:	618080e7          	jalr	1560(ra) # 80005630 <iunlockput>
      return 0;
    80006020:	4781                	li	a5,0
    80006022:	a871                	j	800060be <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80006024:	fd442783          	lw	a5,-44(s0)
    80006028:	2781                	sext.w	a5,a5
    8000602a:	cf99                	beqz	a5,80006048 <namex+0xaa>
    8000602c:	fd843783          	ld	a5,-40(s0)
    80006030:	0007c783          	lbu	a5,0(a5)
    80006034:	eb91                	bnez	a5,80006048 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80006036:	fe843503          	ld	a0,-24(s0)
    8000603a:	fffff097          	auipc	ra,0xfffff
    8000603e:	4cc080e7          	jalr	1228(ra) # 80005506 <iunlock>
      return ip;
    80006042:	fe843783          	ld	a5,-24(s0)
    80006046:	a8a5                	j	800060be <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80006048:	4601                	li	a2,0
    8000604a:	fc843583          	ld	a1,-56(s0)
    8000604e:	fe843503          	ld	a0,-24(s0)
    80006052:	00000097          	auipc	ra,0x0
    80006056:	c74080e7          	jalr	-908(ra) # 80005cc6 <dirlookup>
    8000605a:	fea43023          	sd	a0,-32(s0)
    8000605e:	fe043783          	ld	a5,-32(s0)
    80006062:	eb89                	bnez	a5,80006074 <namex+0xd6>
      iunlockput(ip);
    80006064:	fe843503          	ld	a0,-24(s0)
    80006068:	fffff097          	auipc	ra,0xfffff
    8000606c:	5c8080e7          	jalr	1480(ra) # 80005630 <iunlockput>
      return 0;
    80006070:	4781                	li	a5,0
    80006072:	a0b1                	j	800060be <namex+0x120>
    }
    iunlockput(ip);
    80006074:	fe843503          	ld	a0,-24(s0)
    80006078:	fffff097          	auipc	ra,0xfffff
    8000607c:	5b8080e7          	jalr	1464(ra) # 80005630 <iunlockput>
    ip = next;
    80006080:	fe043783          	ld	a5,-32(s0)
    80006084:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80006088:	fc843583          	ld	a1,-56(s0)
    8000608c:	fd843503          	ld	a0,-40(s0)
    80006090:	00000097          	auipc	ra,0x0
    80006094:	e20080e7          	jalr	-480(ra) # 80005eb0 <skipelem>
    80006098:	fca43c23          	sd	a0,-40(s0)
    8000609c:	fd843783          	ld	a5,-40(s0)
    800060a0:	fbb9                	bnez	a5,80005ff6 <namex+0x58>
  }
  if(nameiparent){
    800060a2:	fd442783          	lw	a5,-44(s0)
    800060a6:	2781                	sext.w	a5,a5
    800060a8:	cb89                	beqz	a5,800060ba <namex+0x11c>
    iput(ip);
    800060aa:	fe843503          	ld	a0,-24(s0)
    800060ae:	fffff097          	auipc	ra,0xfffff
    800060b2:	4b2080e7          	jalr	1202(ra) # 80005560 <iput>
    return 0;
    800060b6:	4781                	li	a5,0
    800060b8:	a019                	j	800060be <namex+0x120>
  }
  return ip;
    800060ba:	fe843783          	ld	a5,-24(s0)
}
    800060be:	853e                	mv	a0,a5
    800060c0:	70e2                	ld	ra,56(sp)
    800060c2:	7442                	ld	s0,48(sp)
    800060c4:	6121                	addi	sp,sp,64
    800060c6:	8082                	ret

00000000800060c8 <namei>:

struct inode*
namei(char *path)
{
    800060c8:	7179                	addi	sp,sp,-48
    800060ca:	f406                	sd	ra,40(sp)
    800060cc:	f022                	sd	s0,32(sp)
    800060ce:	1800                	addi	s0,sp,48
    800060d0:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    800060d4:	fe040793          	addi	a5,s0,-32
    800060d8:	863e                	mv	a2,a5
    800060da:	4581                	li	a1,0
    800060dc:	fd843503          	ld	a0,-40(s0)
    800060e0:	00000097          	auipc	ra,0x0
    800060e4:	ebe080e7          	jalr	-322(ra) # 80005f9e <namex>
    800060e8:	87aa                	mv	a5,a0
}
    800060ea:	853e                	mv	a0,a5
    800060ec:	70a2                	ld	ra,40(sp)
    800060ee:	7402                	ld	s0,32(sp)
    800060f0:	6145                	addi	sp,sp,48
    800060f2:	8082                	ret

00000000800060f4 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    800060f4:	1101                	addi	sp,sp,-32
    800060f6:	ec06                	sd	ra,24(sp)
    800060f8:	e822                	sd	s0,16(sp)
    800060fa:	1000                	addi	s0,sp,32
    800060fc:	fea43423          	sd	a0,-24(s0)
    80006100:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80006104:	fe043603          	ld	a2,-32(s0)
    80006108:	4585                	li	a1,1
    8000610a:	fe843503          	ld	a0,-24(s0)
    8000610e:	00000097          	auipc	ra,0x0
    80006112:	e90080e7          	jalr	-368(ra) # 80005f9e <namex>
    80006116:	87aa                	mv	a5,a0
}
    80006118:	853e                	mv	a0,a5
    8000611a:	60e2                	ld	ra,24(sp)
    8000611c:	6442                	ld	s0,16(sp)
    8000611e:	6105                	addi	sp,sp,32
    80006120:	8082                	ret

0000000080006122 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006122:	1101                	addi	sp,sp,-32
    80006124:	ec06                	sd	ra,24(sp)
    80006126:	e822                	sd	s0,16(sp)
    80006128:	1000                	addi	s0,sp,32
    8000612a:	87aa                	mv	a5,a0
    8000612c:	feb43023          	sd	a1,-32(s0)
    80006130:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80006134:	00005597          	auipc	a1,0x5
    80006138:	45458593          	addi	a1,a1,1108 # 8000b588 <etext+0x588>
    8000613c:	0001f517          	auipc	a0,0x1f
    80006140:	b8450513          	addi	a0,a0,-1148 # 80024cc0 <log>
    80006144:	ffffb097          	auipc	ra,0xffffb
    80006148:	0fa080e7          	jalr	250(ra) # 8000123e <initlock>
  log.start = sb->logstart;
    8000614c:	fe043783          	ld	a5,-32(s0)
    80006150:	4bdc                	lw	a5,20(a5)
    80006152:	0007871b          	sext.w	a4,a5
    80006156:	0001f797          	auipc	a5,0x1f
    8000615a:	b6a78793          	addi	a5,a5,-1174 # 80024cc0 <log>
    8000615e:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80006160:	fe043783          	ld	a5,-32(s0)
    80006164:	4b9c                	lw	a5,16(a5)
    80006166:	0007871b          	sext.w	a4,a5
    8000616a:	0001f797          	auipc	a5,0x1f
    8000616e:	b5678793          	addi	a5,a5,-1194 # 80024cc0 <log>
    80006172:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80006174:	0001f797          	auipc	a5,0x1f
    80006178:	b4c78793          	addi	a5,a5,-1204 # 80024cc0 <log>
    8000617c:	fec42703          	lw	a4,-20(s0)
    80006180:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006182:	00000097          	auipc	ra,0x0
    80006186:	272080e7          	jalr	626(ra) # 800063f4 <recover_from_log>
}
    8000618a:	0001                	nop
    8000618c:	60e2                	ld	ra,24(sp)
    8000618e:	6442                	ld	s0,16(sp)
    80006190:	6105                	addi	sp,sp,32
    80006192:	8082                	ret

0000000080006194 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80006194:	7139                	addi	sp,sp,-64
    80006196:	fc06                	sd	ra,56(sp)
    80006198:	f822                	sd	s0,48(sp)
    8000619a:	0080                	addi	s0,sp,64
    8000619c:	87aa                	mv	a5,a0
    8000619e:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800061a2:	fe042623          	sw	zero,-20(s0)
    800061a6:	a0f9                	j	80006274 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    800061a8:	0001f797          	auipc	a5,0x1f
    800061ac:	b1878793          	addi	a5,a5,-1256 # 80024cc0 <log>
    800061b0:	579c                	lw	a5,40(a5)
    800061b2:	0007869b          	sext.w	a3,a5
    800061b6:	0001f797          	auipc	a5,0x1f
    800061ba:	b0a78793          	addi	a5,a5,-1270 # 80024cc0 <log>
    800061be:	4f9c                	lw	a5,24(a5)
    800061c0:	fec42703          	lw	a4,-20(s0)
    800061c4:	9fb9                	addw	a5,a5,a4
    800061c6:	2781                	sext.w	a5,a5
    800061c8:	2785                	addiw	a5,a5,1
    800061ca:	2781                	sext.w	a5,a5
    800061cc:	2781                	sext.w	a5,a5
    800061ce:	85be                	mv	a1,a5
    800061d0:	8536                	mv	a0,a3
    800061d2:	fffff097          	auipc	ra,0xfffff
    800061d6:	818080e7          	jalr	-2024(ra) # 800049ea <bread>
    800061da:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    800061de:	0001f797          	auipc	a5,0x1f
    800061e2:	ae278793          	addi	a5,a5,-1310 # 80024cc0 <log>
    800061e6:	579c                	lw	a5,40(a5)
    800061e8:	0007869b          	sext.w	a3,a5
    800061ec:	0001f717          	auipc	a4,0x1f
    800061f0:	ad470713          	addi	a4,a4,-1324 # 80024cc0 <log>
    800061f4:	fec42783          	lw	a5,-20(s0)
    800061f8:	07a1                	addi	a5,a5,8
    800061fa:	078a                	slli	a5,a5,0x2
    800061fc:	97ba                	add	a5,a5,a4
    800061fe:	4b9c                	lw	a5,16(a5)
    80006200:	2781                	sext.w	a5,a5
    80006202:	85be                	mv	a1,a5
    80006204:	8536                	mv	a0,a3
    80006206:	ffffe097          	auipc	ra,0xffffe
    8000620a:	7e4080e7          	jalr	2020(ra) # 800049ea <bread>
    8000620e:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006212:	fd843783          	ld	a5,-40(s0)
    80006216:	05878713          	addi	a4,a5,88
    8000621a:	fe043783          	ld	a5,-32(s0)
    8000621e:	05878793          	addi	a5,a5,88
    80006222:	40000613          	li	a2,1024
    80006226:	85be                	mv	a1,a5
    80006228:	853a                	mv	a0,a4
    8000622a:	ffffb097          	auipc	ra,0xffffb
    8000622e:	2fc080e7          	jalr	764(ra) # 80001526 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006232:	fd843503          	ld	a0,-40(s0)
    80006236:	fffff097          	auipc	ra,0xfffff
    8000623a:	80e080e7          	jalr	-2034(ra) # 80004a44 <bwrite>
    if(recovering == 0)
    8000623e:	fcc42783          	lw	a5,-52(s0)
    80006242:	2781                	sext.w	a5,a5
    80006244:	e799                	bnez	a5,80006252 <install_trans+0xbe>
      bunpin(dbuf);
    80006246:	fd843503          	ld	a0,-40(s0)
    8000624a:	fffff097          	auipc	ra,0xfffff
    8000624e:	978080e7          	jalr	-1672(ra) # 80004bc2 <bunpin>
    brelse(lbuf);
    80006252:	fe043503          	ld	a0,-32(s0)
    80006256:	fffff097          	auipc	ra,0xfffff
    8000625a:	836080e7          	jalr	-1994(ra) # 80004a8c <brelse>
    brelse(dbuf);
    8000625e:	fd843503          	ld	a0,-40(s0)
    80006262:	fffff097          	auipc	ra,0xfffff
    80006266:	82a080e7          	jalr	-2006(ra) # 80004a8c <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    8000626a:	fec42783          	lw	a5,-20(s0)
    8000626e:	2785                	addiw	a5,a5,1
    80006270:	fef42623          	sw	a5,-20(s0)
    80006274:	0001f797          	auipc	a5,0x1f
    80006278:	a4c78793          	addi	a5,a5,-1460 # 80024cc0 <log>
    8000627c:	57d8                	lw	a4,44(a5)
    8000627e:	fec42783          	lw	a5,-20(s0)
    80006282:	2781                	sext.w	a5,a5
    80006284:	f2e7c2e3          	blt	a5,a4,800061a8 <install_trans+0x14>
  }
}
    80006288:	0001                	nop
    8000628a:	0001                	nop
    8000628c:	70e2                	ld	ra,56(sp)
    8000628e:	7442                	ld	s0,48(sp)
    80006290:	6121                	addi	sp,sp,64
    80006292:	8082                	ret

0000000080006294 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80006294:	7179                	addi	sp,sp,-48
    80006296:	f406                	sd	ra,40(sp)
    80006298:	f022                	sd	s0,32(sp)
    8000629a:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    8000629c:	0001f797          	auipc	a5,0x1f
    800062a0:	a2478793          	addi	a5,a5,-1500 # 80024cc0 <log>
    800062a4:	579c                	lw	a5,40(a5)
    800062a6:	0007871b          	sext.w	a4,a5
    800062aa:	0001f797          	auipc	a5,0x1f
    800062ae:	a1678793          	addi	a5,a5,-1514 # 80024cc0 <log>
    800062b2:	4f9c                	lw	a5,24(a5)
    800062b4:	2781                	sext.w	a5,a5
    800062b6:	85be                	mv	a1,a5
    800062b8:	853a                	mv	a0,a4
    800062ba:	ffffe097          	auipc	ra,0xffffe
    800062be:	730080e7          	jalr	1840(ra) # 800049ea <bread>
    800062c2:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    800062c6:	fe043783          	ld	a5,-32(s0)
    800062ca:	05878793          	addi	a5,a5,88
    800062ce:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    800062d2:	fd843783          	ld	a5,-40(s0)
    800062d6:	4398                	lw	a4,0(a5)
    800062d8:	0001f797          	auipc	a5,0x1f
    800062dc:	9e878793          	addi	a5,a5,-1560 # 80024cc0 <log>
    800062e0:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    800062e2:	fe042623          	sw	zero,-20(s0)
    800062e6:	a03d                	j	80006314 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    800062e8:	fd843703          	ld	a4,-40(s0)
    800062ec:	fec42783          	lw	a5,-20(s0)
    800062f0:	078a                	slli	a5,a5,0x2
    800062f2:	97ba                	add	a5,a5,a4
    800062f4:	43d8                	lw	a4,4(a5)
    800062f6:	0001f697          	auipc	a3,0x1f
    800062fa:	9ca68693          	addi	a3,a3,-1590 # 80024cc0 <log>
    800062fe:	fec42783          	lw	a5,-20(s0)
    80006302:	07a1                	addi	a5,a5,8
    80006304:	078a                	slli	a5,a5,0x2
    80006306:	97b6                	add	a5,a5,a3
    80006308:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000630a:	fec42783          	lw	a5,-20(s0)
    8000630e:	2785                	addiw	a5,a5,1
    80006310:	fef42623          	sw	a5,-20(s0)
    80006314:	0001f797          	auipc	a5,0x1f
    80006318:	9ac78793          	addi	a5,a5,-1620 # 80024cc0 <log>
    8000631c:	57d8                	lw	a4,44(a5)
    8000631e:	fec42783          	lw	a5,-20(s0)
    80006322:	2781                	sext.w	a5,a5
    80006324:	fce7c2e3          	blt	a5,a4,800062e8 <read_head+0x54>
  }
  brelse(buf);
    80006328:	fe043503          	ld	a0,-32(s0)
    8000632c:	ffffe097          	auipc	ra,0xffffe
    80006330:	760080e7          	jalr	1888(ra) # 80004a8c <brelse>
}
    80006334:	0001                	nop
    80006336:	70a2                	ld	ra,40(sp)
    80006338:	7402                	ld	s0,32(sp)
    8000633a:	6145                	addi	sp,sp,48
    8000633c:	8082                	ret

000000008000633e <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000633e:	7179                	addi	sp,sp,-48
    80006340:	f406                	sd	ra,40(sp)
    80006342:	f022                	sd	s0,32(sp)
    80006344:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006346:	0001f797          	auipc	a5,0x1f
    8000634a:	97a78793          	addi	a5,a5,-1670 # 80024cc0 <log>
    8000634e:	579c                	lw	a5,40(a5)
    80006350:	0007871b          	sext.w	a4,a5
    80006354:	0001f797          	auipc	a5,0x1f
    80006358:	96c78793          	addi	a5,a5,-1684 # 80024cc0 <log>
    8000635c:	4f9c                	lw	a5,24(a5)
    8000635e:	2781                	sext.w	a5,a5
    80006360:	85be                	mv	a1,a5
    80006362:	853a                	mv	a0,a4
    80006364:	ffffe097          	auipc	ra,0xffffe
    80006368:	686080e7          	jalr	1670(ra) # 800049ea <bread>
    8000636c:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80006370:	fe043783          	ld	a5,-32(s0)
    80006374:	05878793          	addi	a5,a5,88
    80006378:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000637c:	0001f797          	auipc	a5,0x1f
    80006380:	94478793          	addi	a5,a5,-1724 # 80024cc0 <log>
    80006384:	57d8                	lw	a4,44(a5)
    80006386:	fd843783          	ld	a5,-40(s0)
    8000638a:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000638c:	fe042623          	sw	zero,-20(s0)
    80006390:	a03d                	j	800063be <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006392:	0001f717          	auipc	a4,0x1f
    80006396:	92e70713          	addi	a4,a4,-1746 # 80024cc0 <log>
    8000639a:	fec42783          	lw	a5,-20(s0)
    8000639e:	07a1                	addi	a5,a5,8
    800063a0:	078a                	slli	a5,a5,0x2
    800063a2:	97ba                	add	a5,a5,a4
    800063a4:	4b98                	lw	a4,16(a5)
    800063a6:	fd843683          	ld	a3,-40(s0)
    800063aa:	fec42783          	lw	a5,-20(s0)
    800063ae:	078a                	slli	a5,a5,0x2
    800063b0:	97b6                	add	a5,a5,a3
    800063b2:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063b4:	fec42783          	lw	a5,-20(s0)
    800063b8:	2785                	addiw	a5,a5,1
    800063ba:	fef42623          	sw	a5,-20(s0)
    800063be:	0001f797          	auipc	a5,0x1f
    800063c2:	90278793          	addi	a5,a5,-1790 # 80024cc0 <log>
    800063c6:	57d8                	lw	a4,44(a5)
    800063c8:	fec42783          	lw	a5,-20(s0)
    800063cc:	2781                	sext.w	a5,a5
    800063ce:	fce7c2e3          	blt	a5,a4,80006392 <write_head+0x54>
  }
  bwrite(buf);
    800063d2:	fe043503          	ld	a0,-32(s0)
    800063d6:	ffffe097          	auipc	ra,0xffffe
    800063da:	66e080e7          	jalr	1646(ra) # 80004a44 <bwrite>
  brelse(buf);
    800063de:	fe043503          	ld	a0,-32(s0)
    800063e2:	ffffe097          	auipc	ra,0xffffe
    800063e6:	6aa080e7          	jalr	1706(ra) # 80004a8c <brelse>
}
    800063ea:	0001                	nop
    800063ec:	70a2                	ld	ra,40(sp)
    800063ee:	7402                	ld	s0,32(sp)
    800063f0:	6145                	addi	sp,sp,48
    800063f2:	8082                	ret

00000000800063f4 <recover_from_log>:

static void
recover_from_log(void)
{
    800063f4:	1141                	addi	sp,sp,-16
    800063f6:	e406                	sd	ra,8(sp)
    800063f8:	e022                	sd	s0,0(sp)
    800063fa:	0800                	addi	s0,sp,16
  read_head();
    800063fc:	00000097          	auipc	ra,0x0
    80006400:	e98080e7          	jalr	-360(ra) # 80006294 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006404:	4505                	li	a0,1
    80006406:	00000097          	auipc	ra,0x0
    8000640a:	d8e080e7          	jalr	-626(ra) # 80006194 <install_trans>
  log.lh.n = 0;
    8000640e:	0001f797          	auipc	a5,0x1f
    80006412:	8b278793          	addi	a5,a5,-1870 # 80024cc0 <log>
    80006416:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    8000641a:	00000097          	auipc	ra,0x0
    8000641e:	f24080e7          	jalr	-220(ra) # 8000633e <write_head>
}
    80006422:	0001                	nop
    80006424:	60a2                	ld	ra,8(sp)
    80006426:	6402                	ld	s0,0(sp)
    80006428:	0141                	addi	sp,sp,16
    8000642a:	8082                	ret

000000008000642c <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000642c:	1141                	addi	sp,sp,-16
    8000642e:	e406                	sd	ra,8(sp)
    80006430:	e022                	sd	s0,0(sp)
    80006432:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006434:	0001f517          	auipc	a0,0x1f
    80006438:	88c50513          	addi	a0,a0,-1908 # 80024cc0 <log>
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	e32080e7          	jalr	-462(ra) # 8000126e <acquire>
  while(1){
    if(log.committing){
    80006444:	0001f797          	auipc	a5,0x1f
    80006448:	87c78793          	addi	a5,a5,-1924 # 80024cc0 <log>
    8000644c:	53dc                	lw	a5,36(a5)
    8000644e:	cf91                	beqz	a5,8000646a <begin_op+0x3e>
      sleep(&log, &log.lock);
    80006450:	0001f597          	auipc	a1,0x1f
    80006454:	87058593          	addi	a1,a1,-1936 # 80024cc0 <log>
    80006458:	0001f517          	auipc	a0,0x1f
    8000645c:	86850513          	addi	a0,a0,-1944 # 80024cc0 <log>
    80006460:	ffffd097          	auipc	ra,0xffffd
    80006464:	2fc080e7          	jalr	764(ra) # 8000375c <sleep>
    80006468:	bff1                	j	80006444 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    8000646a:	0001f797          	auipc	a5,0x1f
    8000646e:	85678793          	addi	a5,a5,-1962 # 80024cc0 <log>
    80006472:	57d8                	lw	a4,44(a5)
    80006474:	0001f797          	auipc	a5,0x1f
    80006478:	84c78793          	addi	a5,a5,-1972 # 80024cc0 <log>
    8000647c:	539c                	lw	a5,32(a5)
    8000647e:	2785                	addiw	a5,a5,1
    80006480:	2781                	sext.w	a5,a5
    80006482:	86be                	mv	a3,a5
    80006484:	87b6                	mv	a5,a3
    80006486:	0027979b          	slliw	a5,a5,0x2
    8000648a:	9fb5                	addw	a5,a5,a3
    8000648c:	0017979b          	slliw	a5,a5,0x1
    80006490:	2781                	sext.w	a5,a5
    80006492:	9fb9                	addw	a5,a5,a4
    80006494:	2781                	sext.w	a5,a5
    80006496:	873e                	mv	a4,a5
    80006498:	47f9                	li	a5,30
    8000649a:	00e7df63          	bge	a5,a4,800064b8 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    8000649e:	0001f597          	auipc	a1,0x1f
    800064a2:	82258593          	addi	a1,a1,-2014 # 80024cc0 <log>
    800064a6:	0001f517          	auipc	a0,0x1f
    800064aa:	81a50513          	addi	a0,a0,-2022 # 80024cc0 <log>
    800064ae:	ffffd097          	auipc	ra,0xffffd
    800064b2:	2ae080e7          	jalr	686(ra) # 8000375c <sleep>
    800064b6:	b779                	j	80006444 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800064b8:	0001f797          	auipc	a5,0x1f
    800064bc:	80878793          	addi	a5,a5,-2040 # 80024cc0 <log>
    800064c0:	539c                	lw	a5,32(a5)
    800064c2:	2785                	addiw	a5,a5,1
    800064c4:	0007871b          	sext.w	a4,a5
    800064c8:	0001e797          	auipc	a5,0x1e
    800064cc:	7f878793          	addi	a5,a5,2040 # 80024cc0 <log>
    800064d0:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800064d2:	0001e517          	auipc	a0,0x1e
    800064d6:	7ee50513          	addi	a0,a0,2030 # 80024cc0 <log>
    800064da:	ffffb097          	auipc	ra,0xffffb
    800064de:	df8080e7          	jalr	-520(ra) # 800012d2 <release>
      break;
    800064e2:	0001                	nop
    }
  }
}
    800064e4:	0001                	nop
    800064e6:	60a2                	ld	ra,8(sp)
    800064e8:	6402                	ld	s0,0(sp)
    800064ea:	0141                	addi	sp,sp,16
    800064ec:	8082                	ret

00000000800064ee <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    800064ee:	1101                	addi	sp,sp,-32
    800064f0:	ec06                	sd	ra,24(sp)
    800064f2:	e822                	sd	s0,16(sp)
    800064f4:	1000                	addi	s0,sp,32
  int do_commit = 0;
    800064f6:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    800064fa:	0001e517          	auipc	a0,0x1e
    800064fe:	7c650513          	addi	a0,a0,1990 # 80024cc0 <log>
    80006502:	ffffb097          	auipc	ra,0xffffb
    80006506:	d6c080e7          	jalr	-660(ra) # 8000126e <acquire>
  log.outstanding -= 1;
    8000650a:	0001e797          	auipc	a5,0x1e
    8000650e:	7b678793          	addi	a5,a5,1974 # 80024cc0 <log>
    80006512:	539c                	lw	a5,32(a5)
    80006514:	37fd                	addiw	a5,a5,-1
    80006516:	0007871b          	sext.w	a4,a5
    8000651a:	0001e797          	auipc	a5,0x1e
    8000651e:	7a678793          	addi	a5,a5,1958 # 80024cc0 <log>
    80006522:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006524:	0001e797          	auipc	a5,0x1e
    80006528:	79c78793          	addi	a5,a5,1948 # 80024cc0 <log>
    8000652c:	53dc                	lw	a5,36(a5)
    8000652e:	cb89                	beqz	a5,80006540 <end_op+0x52>
    panic("log.committing");
    80006530:	00005517          	auipc	a0,0x5
    80006534:	06050513          	addi	a0,a0,96 # 8000b590 <etext+0x590>
    80006538:	ffffa097          	auipc	ra,0xffffa
    8000653c:	746080e7          	jalr	1862(ra) # 80000c7e <panic>
  if(log.outstanding == 0){
    80006540:	0001e797          	auipc	a5,0x1e
    80006544:	78078793          	addi	a5,a5,1920 # 80024cc0 <log>
    80006548:	539c                	lw	a5,32(a5)
    8000654a:	eb99                	bnez	a5,80006560 <end_op+0x72>
    do_commit = 1;
    8000654c:	4785                	li	a5,1
    8000654e:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006552:	0001e797          	auipc	a5,0x1e
    80006556:	76e78793          	addi	a5,a5,1902 # 80024cc0 <log>
    8000655a:	4705                	li	a4,1
    8000655c:	d3d8                	sw	a4,36(a5)
    8000655e:	a809                	j	80006570 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    80006560:	0001e517          	auipc	a0,0x1e
    80006564:	76050513          	addi	a0,a0,1888 # 80024cc0 <log>
    80006568:	ffffd097          	auipc	ra,0xffffd
    8000656c:	270080e7          	jalr	624(ra) # 800037d8 <wakeup>
  }
  release(&log.lock);
    80006570:	0001e517          	auipc	a0,0x1e
    80006574:	75050513          	addi	a0,a0,1872 # 80024cc0 <log>
    80006578:	ffffb097          	auipc	ra,0xffffb
    8000657c:	d5a080e7          	jalr	-678(ra) # 800012d2 <release>

  if(do_commit){
    80006580:	fec42783          	lw	a5,-20(s0)
    80006584:	2781                	sext.w	a5,a5
    80006586:	c3b9                	beqz	a5,800065cc <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006588:	00000097          	auipc	ra,0x0
    8000658c:	134080e7          	jalr	308(ra) # 800066bc <commit>
    acquire(&log.lock);
    80006590:	0001e517          	auipc	a0,0x1e
    80006594:	73050513          	addi	a0,a0,1840 # 80024cc0 <log>
    80006598:	ffffb097          	auipc	ra,0xffffb
    8000659c:	cd6080e7          	jalr	-810(ra) # 8000126e <acquire>
    log.committing = 0;
    800065a0:	0001e797          	auipc	a5,0x1e
    800065a4:	72078793          	addi	a5,a5,1824 # 80024cc0 <log>
    800065a8:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800065ac:	0001e517          	auipc	a0,0x1e
    800065b0:	71450513          	addi	a0,a0,1812 # 80024cc0 <log>
    800065b4:	ffffd097          	auipc	ra,0xffffd
    800065b8:	224080e7          	jalr	548(ra) # 800037d8 <wakeup>
    release(&log.lock);
    800065bc:	0001e517          	auipc	a0,0x1e
    800065c0:	70450513          	addi	a0,a0,1796 # 80024cc0 <log>
    800065c4:	ffffb097          	auipc	ra,0xffffb
    800065c8:	d0e080e7          	jalr	-754(ra) # 800012d2 <release>
  }
}
    800065cc:	0001                	nop
    800065ce:	60e2                	ld	ra,24(sp)
    800065d0:	6442                	ld	s0,16(sp)
    800065d2:	6105                	addi	sp,sp,32
    800065d4:	8082                	ret

00000000800065d6 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800065d6:	7179                	addi	sp,sp,-48
    800065d8:	f406                	sd	ra,40(sp)
    800065da:	f022                	sd	s0,32(sp)
    800065dc:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800065de:	fe042623          	sw	zero,-20(s0)
    800065e2:	a86d                	j	8000669c <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    800065e4:	0001e797          	auipc	a5,0x1e
    800065e8:	6dc78793          	addi	a5,a5,1756 # 80024cc0 <log>
    800065ec:	579c                	lw	a5,40(a5)
    800065ee:	0007869b          	sext.w	a3,a5
    800065f2:	0001e797          	auipc	a5,0x1e
    800065f6:	6ce78793          	addi	a5,a5,1742 # 80024cc0 <log>
    800065fa:	4f9c                	lw	a5,24(a5)
    800065fc:	fec42703          	lw	a4,-20(s0)
    80006600:	9fb9                	addw	a5,a5,a4
    80006602:	2781                	sext.w	a5,a5
    80006604:	2785                	addiw	a5,a5,1
    80006606:	2781                	sext.w	a5,a5
    80006608:	2781                	sext.w	a5,a5
    8000660a:	85be                	mv	a1,a5
    8000660c:	8536                	mv	a0,a3
    8000660e:	ffffe097          	auipc	ra,0xffffe
    80006612:	3dc080e7          	jalr	988(ra) # 800049ea <bread>
    80006616:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    8000661a:	0001e797          	auipc	a5,0x1e
    8000661e:	6a678793          	addi	a5,a5,1702 # 80024cc0 <log>
    80006622:	579c                	lw	a5,40(a5)
    80006624:	0007869b          	sext.w	a3,a5
    80006628:	0001e717          	auipc	a4,0x1e
    8000662c:	69870713          	addi	a4,a4,1688 # 80024cc0 <log>
    80006630:	fec42783          	lw	a5,-20(s0)
    80006634:	07a1                	addi	a5,a5,8
    80006636:	078a                	slli	a5,a5,0x2
    80006638:	97ba                	add	a5,a5,a4
    8000663a:	4b9c                	lw	a5,16(a5)
    8000663c:	2781                	sext.w	a5,a5
    8000663e:	85be                	mv	a1,a5
    80006640:	8536                	mv	a0,a3
    80006642:	ffffe097          	auipc	ra,0xffffe
    80006646:	3a8080e7          	jalr	936(ra) # 800049ea <bread>
    8000664a:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    8000664e:	fe043783          	ld	a5,-32(s0)
    80006652:	05878713          	addi	a4,a5,88
    80006656:	fd843783          	ld	a5,-40(s0)
    8000665a:	05878793          	addi	a5,a5,88
    8000665e:	40000613          	li	a2,1024
    80006662:	85be                	mv	a1,a5
    80006664:	853a                	mv	a0,a4
    80006666:	ffffb097          	auipc	ra,0xffffb
    8000666a:	ec0080e7          	jalr	-320(ra) # 80001526 <memmove>
    bwrite(to);  // write the log
    8000666e:	fe043503          	ld	a0,-32(s0)
    80006672:	ffffe097          	auipc	ra,0xffffe
    80006676:	3d2080e7          	jalr	978(ra) # 80004a44 <bwrite>
    brelse(from);
    8000667a:	fd843503          	ld	a0,-40(s0)
    8000667e:	ffffe097          	auipc	ra,0xffffe
    80006682:	40e080e7          	jalr	1038(ra) # 80004a8c <brelse>
    brelse(to);
    80006686:	fe043503          	ld	a0,-32(s0)
    8000668a:	ffffe097          	auipc	ra,0xffffe
    8000668e:	402080e7          	jalr	1026(ra) # 80004a8c <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006692:	fec42783          	lw	a5,-20(s0)
    80006696:	2785                	addiw	a5,a5,1
    80006698:	fef42623          	sw	a5,-20(s0)
    8000669c:	0001e797          	auipc	a5,0x1e
    800066a0:	62478793          	addi	a5,a5,1572 # 80024cc0 <log>
    800066a4:	57d8                	lw	a4,44(a5)
    800066a6:	fec42783          	lw	a5,-20(s0)
    800066aa:	2781                	sext.w	a5,a5
    800066ac:	f2e7cce3          	blt	a5,a4,800065e4 <write_log+0xe>
  }
}
    800066b0:	0001                	nop
    800066b2:	0001                	nop
    800066b4:	70a2                	ld	ra,40(sp)
    800066b6:	7402                	ld	s0,32(sp)
    800066b8:	6145                	addi	sp,sp,48
    800066ba:	8082                	ret

00000000800066bc <commit>:

static void
commit()
{
    800066bc:	1141                	addi	sp,sp,-16
    800066be:	e406                	sd	ra,8(sp)
    800066c0:	e022                	sd	s0,0(sp)
    800066c2:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    800066c4:	0001e797          	auipc	a5,0x1e
    800066c8:	5fc78793          	addi	a5,a5,1532 # 80024cc0 <log>
    800066cc:	57dc                	lw	a5,44(a5)
    800066ce:	02f05963          	blez	a5,80006700 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800066d2:	00000097          	auipc	ra,0x0
    800066d6:	f04080e7          	jalr	-252(ra) # 800065d6 <write_log>
    write_head();    // Write header to disk -- the real commit
    800066da:	00000097          	auipc	ra,0x0
    800066de:	c64080e7          	jalr	-924(ra) # 8000633e <write_head>
    install_trans(0); // Now install writes to home locations
    800066e2:	4501                	li	a0,0
    800066e4:	00000097          	auipc	ra,0x0
    800066e8:	ab0080e7          	jalr	-1360(ra) # 80006194 <install_trans>
    log.lh.n = 0;
    800066ec:	0001e797          	auipc	a5,0x1e
    800066f0:	5d478793          	addi	a5,a5,1492 # 80024cc0 <log>
    800066f4:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    800066f8:	00000097          	auipc	ra,0x0
    800066fc:	c46080e7          	jalr	-954(ra) # 8000633e <write_head>
  }
}
    80006700:	0001                	nop
    80006702:	60a2                	ld	ra,8(sp)
    80006704:	6402                	ld	s0,0(sp)
    80006706:	0141                	addi	sp,sp,16
    80006708:	8082                	ret

000000008000670a <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    8000670a:	7179                	addi	sp,sp,-48
    8000670c:	f406                	sd	ra,40(sp)
    8000670e:	f022                	sd	s0,32(sp)
    80006710:	1800                	addi	s0,sp,48
    80006712:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006716:	0001e517          	auipc	a0,0x1e
    8000671a:	5aa50513          	addi	a0,a0,1450 # 80024cc0 <log>
    8000671e:	ffffb097          	auipc	ra,0xffffb
    80006722:	b50080e7          	jalr	-1200(ra) # 8000126e <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006726:	0001e797          	auipc	a5,0x1e
    8000672a:	59a78793          	addi	a5,a5,1434 # 80024cc0 <log>
    8000672e:	57dc                	lw	a5,44(a5)
    80006730:	873e                	mv	a4,a5
    80006732:	47f5                	li	a5,29
    80006734:	02e7c063          	blt	a5,a4,80006754 <log_write+0x4a>
    80006738:	0001e797          	auipc	a5,0x1e
    8000673c:	58878793          	addi	a5,a5,1416 # 80024cc0 <log>
    80006740:	57d8                	lw	a4,44(a5)
    80006742:	0001e797          	auipc	a5,0x1e
    80006746:	57e78793          	addi	a5,a5,1406 # 80024cc0 <log>
    8000674a:	4fdc                	lw	a5,28(a5)
    8000674c:	37fd                	addiw	a5,a5,-1
    8000674e:	2781                	sext.w	a5,a5
    80006750:	00f74a63          	blt	a4,a5,80006764 <log_write+0x5a>
    panic("too big a transaction");
    80006754:	00005517          	auipc	a0,0x5
    80006758:	e4c50513          	addi	a0,a0,-436 # 8000b5a0 <etext+0x5a0>
    8000675c:	ffffa097          	auipc	ra,0xffffa
    80006760:	522080e7          	jalr	1314(ra) # 80000c7e <panic>
  if (log.outstanding < 1)
    80006764:	0001e797          	auipc	a5,0x1e
    80006768:	55c78793          	addi	a5,a5,1372 # 80024cc0 <log>
    8000676c:	539c                	lw	a5,32(a5)
    8000676e:	00f04a63          	bgtz	a5,80006782 <log_write+0x78>
    panic("log_write outside of trans");
    80006772:	00005517          	auipc	a0,0x5
    80006776:	e4650513          	addi	a0,a0,-442 # 8000b5b8 <etext+0x5b8>
    8000677a:	ffffa097          	auipc	ra,0xffffa
    8000677e:	504080e7          	jalr	1284(ra) # 80000c7e <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006782:	fe042623          	sw	zero,-20(s0)
    80006786:	a03d                	j	800067b4 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006788:	0001e717          	auipc	a4,0x1e
    8000678c:	53870713          	addi	a4,a4,1336 # 80024cc0 <log>
    80006790:	fec42783          	lw	a5,-20(s0)
    80006794:	07a1                	addi	a5,a5,8
    80006796:	078a                	slli	a5,a5,0x2
    80006798:	97ba                	add	a5,a5,a4
    8000679a:	4b9c                	lw	a5,16(a5)
    8000679c:	0007871b          	sext.w	a4,a5
    800067a0:	fd843783          	ld	a5,-40(s0)
    800067a4:	47dc                	lw	a5,12(a5)
    800067a6:	02f70263          	beq	a4,a5,800067ca <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800067aa:	fec42783          	lw	a5,-20(s0)
    800067ae:	2785                	addiw	a5,a5,1
    800067b0:	fef42623          	sw	a5,-20(s0)
    800067b4:	0001e797          	auipc	a5,0x1e
    800067b8:	50c78793          	addi	a5,a5,1292 # 80024cc0 <log>
    800067bc:	57d8                	lw	a4,44(a5)
    800067be:	fec42783          	lw	a5,-20(s0)
    800067c2:	2781                	sext.w	a5,a5
    800067c4:	fce7c2e3          	blt	a5,a4,80006788 <log_write+0x7e>
    800067c8:	a011                	j	800067cc <log_write+0xc2>
      break;
    800067ca:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    800067cc:	fd843783          	ld	a5,-40(s0)
    800067d0:	47dc                	lw	a5,12(a5)
    800067d2:	0007871b          	sext.w	a4,a5
    800067d6:	0001e697          	auipc	a3,0x1e
    800067da:	4ea68693          	addi	a3,a3,1258 # 80024cc0 <log>
    800067de:	fec42783          	lw	a5,-20(s0)
    800067e2:	07a1                	addi	a5,a5,8
    800067e4:	078a                	slli	a5,a5,0x2
    800067e6:	97b6                	add	a5,a5,a3
    800067e8:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    800067ea:	0001e797          	auipc	a5,0x1e
    800067ee:	4d678793          	addi	a5,a5,1238 # 80024cc0 <log>
    800067f2:	57d8                	lw	a4,44(a5)
    800067f4:	fec42783          	lw	a5,-20(s0)
    800067f8:	2781                	sext.w	a5,a5
    800067fa:	02e79563          	bne	a5,a4,80006824 <log_write+0x11a>
    bpin(b);
    800067fe:	fd843503          	ld	a0,-40(s0)
    80006802:	ffffe097          	auipc	ra,0xffffe
    80006806:	378080e7          	jalr	888(ra) # 80004b7a <bpin>
    log.lh.n++;
    8000680a:	0001e797          	auipc	a5,0x1e
    8000680e:	4b678793          	addi	a5,a5,1206 # 80024cc0 <log>
    80006812:	57dc                	lw	a5,44(a5)
    80006814:	2785                	addiw	a5,a5,1
    80006816:	0007871b          	sext.w	a4,a5
    8000681a:	0001e797          	auipc	a5,0x1e
    8000681e:	4a678793          	addi	a5,a5,1190 # 80024cc0 <log>
    80006822:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006824:	0001e517          	auipc	a0,0x1e
    80006828:	49c50513          	addi	a0,a0,1180 # 80024cc0 <log>
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	aa6080e7          	jalr	-1370(ra) # 800012d2 <release>
}
    80006834:	0001                	nop
    80006836:	70a2                	ld	ra,40(sp)
    80006838:	7402                	ld	s0,32(sp)
    8000683a:	6145                	addi	sp,sp,48
    8000683c:	8082                	ret

000000008000683e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000683e:	1101                	addi	sp,sp,-32
    80006840:	ec06                	sd	ra,24(sp)
    80006842:	e822                	sd	s0,16(sp)
    80006844:	1000                	addi	s0,sp,32
    80006846:	fea43423          	sd	a0,-24(s0)
    8000684a:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    8000684e:	fe843783          	ld	a5,-24(s0)
    80006852:	07a1                	addi	a5,a5,8
    80006854:	00005597          	auipc	a1,0x5
    80006858:	d8458593          	addi	a1,a1,-636 # 8000b5d8 <etext+0x5d8>
    8000685c:	853e                	mv	a0,a5
    8000685e:	ffffb097          	auipc	ra,0xffffb
    80006862:	9e0080e7          	jalr	-1568(ra) # 8000123e <initlock>
  lk->name = name;
    80006866:	fe843783          	ld	a5,-24(s0)
    8000686a:	fe043703          	ld	a4,-32(s0)
    8000686e:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006870:	fe843783          	ld	a5,-24(s0)
    80006874:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006878:	fe843783          	ld	a5,-24(s0)
    8000687c:	0207a423          	sw	zero,40(a5)
}
    80006880:	0001                	nop
    80006882:	60e2                	ld	ra,24(sp)
    80006884:	6442                	ld	s0,16(sp)
    80006886:	6105                	addi	sp,sp,32
    80006888:	8082                	ret

000000008000688a <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8000688a:	1101                	addi	sp,sp,-32
    8000688c:	ec06                	sd	ra,24(sp)
    8000688e:	e822                	sd	s0,16(sp)
    80006890:	1000                	addi	s0,sp,32
    80006892:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006896:	fe843783          	ld	a5,-24(s0)
    8000689a:	07a1                	addi	a5,a5,8
    8000689c:	853e                	mv	a0,a5
    8000689e:	ffffb097          	auipc	ra,0xffffb
    800068a2:	9d0080e7          	jalr	-1584(ra) # 8000126e <acquire>
  while (lk->locked) {
    800068a6:	a819                	j	800068bc <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    800068a8:	fe843783          	ld	a5,-24(s0)
    800068ac:	07a1                	addi	a5,a5,8
    800068ae:	85be                	mv	a1,a5
    800068b0:	fe843503          	ld	a0,-24(s0)
    800068b4:	ffffd097          	auipc	ra,0xffffd
    800068b8:	ea8080e7          	jalr	-344(ra) # 8000375c <sleep>
  while (lk->locked) {
    800068bc:	fe843783          	ld	a5,-24(s0)
    800068c0:	439c                	lw	a5,0(a5)
    800068c2:	f3fd                	bnez	a5,800068a8 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    800068c4:	fe843783          	ld	a5,-24(s0)
    800068c8:	4705                	li	a4,1
    800068ca:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    800068cc:	ffffc097          	auipc	ra,0xffffc
    800068d0:	f4c080e7          	jalr	-180(ra) # 80002818 <myproc>
    800068d4:	87aa                	mv	a5,a0
    800068d6:	5b98                	lw	a4,48(a5)
    800068d8:	fe843783          	ld	a5,-24(s0)
    800068dc:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800068de:	fe843783          	ld	a5,-24(s0)
    800068e2:	07a1                	addi	a5,a5,8
    800068e4:	853e                	mv	a0,a5
    800068e6:	ffffb097          	auipc	ra,0xffffb
    800068ea:	9ec080e7          	jalr	-1556(ra) # 800012d2 <release>
}
    800068ee:	0001                	nop
    800068f0:	60e2                	ld	ra,24(sp)
    800068f2:	6442                	ld	s0,16(sp)
    800068f4:	6105                	addi	sp,sp,32
    800068f6:	8082                	ret

00000000800068f8 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    800068f8:	1101                	addi	sp,sp,-32
    800068fa:	ec06                	sd	ra,24(sp)
    800068fc:	e822                	sd	s0,16(sp)
    800068fe:	1000                	addi	s0,sp,32
    80006900:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006904:	fe843783          	ld	a5,-24(s0)
    80006908:	07a1                	addi	a5,a5,8
    8000690a:	853e                	mv	a0,a5
    8000690c:	ffffb097          	auipc	ra,0xffffb
    80006910:	962080e7          	jalr	-1694(ra) # 8000126e <acquire>
  lk->locked = 0;
    80006914:	fe843783          	ld	a5,-24(s0)
    80006918:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000691c:	fe843783          	ld	a5,-24(s0)
    80006920:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006924:	fe843503          	ld	a0,-24(s0)
    80006928:	ffffd097          	auipc	ra,0xffffd
    8000692c:	eb0080e7          	jalr	-336(ra) # 800037d8 <wakeup>
  release(&lk->lk);
    80006930:	fe843783          	ld	a5,-24(s0)
    80006934:	07a1                	addi	a5,a5,8
    80006936:	853e                	mv	a0,a5
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	99a080e7          	jalr	-1638(ra) # 800012d2 <release>
}
    80006940:	0001                	nop
    80006942:	60e2                	ld	ra,24(sp)
    80006944:	6442                	ld	s0,16(sp)
    80006946:	6105                	addi	sp,sp,32
    80006948:	8082                	ret

000000008000694a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    8000694a:	7139                	addi	sp,sp,-64
    8000694c:	fc06                	sd	ra,56(sp)
    8000694e:	f822                	sd	s0,48(sp)
    80006950:	f426                	sd	s1,40(sp)
    80006952:	0080                	addi	s0,sp,64
    80006954:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006958:	fc843783          	ld	a5,-56(s0)
    8000695c:	07a1                	addi	a5,a5,8
    8000695e:	853e                	mv	a0,a5
    80006960:	ffffb097          	auipc	ra,0xffffb
    80006964:	90e080e7          	jalr	-1778(ra) # 8000126e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006968:	fc843783          	ld	a5,-56(s0)
    8000696c:	439c                	lw	a5,0(a5)
    8000696e:	cf99                	beqz	a5,8000698c <holdingsleep+0x42>
    80006970:	fc843783          	ld	a5,-56(s0)
    80006974:	5784                	lw	s1,40(a5)
    80006976:	ffffc097          	auipc	ra,0xffffc
    8000697a:	ea2080e7          	jalr	-350(ra) # 80002818 <myproc>
    8000697e:	87aa                	mv	a5,a0
    80006980:	5b9c                	lw	a5,48(a5)
    80006982:	8726                	mv	a4,s1
    80006984:	00f71463          	bne	a4,a5,8000698c <holdingsleep+0x42>
    80006988:	4785                	li	a5,1
    8000698a:	a011                	j	8000698e <holdingsleep+0x44>
    8000698c:	4781                	li	a5,0
    8000698e:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006992:	fc843783          	ld	a5,-56(s0)
    80006996:	07a1                	addi	a5,a5,8
    80006998:	853e                	mv	a0,a5
    8000699a:	ffffb097          	auipc	ra,0xffffb
    8000699e:	938080e7          	jalr	-1736(ra) # 800012d2 <release>
  return r;
    800069a2:	fdc42783          	lw	a5,-36(s0)
}
    800069a6:	853e                	mv	a0,a5
    800069a8:	70e2                	ld	ra,56(sp)
    800069aa:	7442                	ld	s0,48(sp)
    800069ac:	74a2                	ld	s1,40(sp)
    800069ae:	6121                	addi	sp,sp,64
    800069b0:	8082                	ret

00000000800069b2 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    800069b2:	1141                	addi	sp,sp,-16
    800069b4:	e406                	sd	ra,8(sp)
    800069b6:	e022                	sd	s0,0(sp)
    800069b8:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    800069ba:	00005597          	auipc	a1,0x5
    800069be:	c2e58593          	addi	a1,a1,-978 # 8000b5e8 <etext+0x5e8>
    800069c2:	0001e517          	auipc	a0,0x1e
    800069c6:	44650513          	addi	a0,a0,1094 # 80024e08 <ftable>
    800069ca:	ffffb097          	auipc	ra,0xffffb
    800069ce:	874080e7          	jalr	-1932(ra) # 8000123e <initlock>
}
    800069d2:	0001                	nop
    800069d4:	60a2                	ld	ra,8(sp)
    800069d6:	6402                	ld	s0,0(sp)
    800069d8:	0141                	addi	sp,sp,16
    800069da:	8082                	ret

00000000800069dc <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    800069dc:	1101                	addi	sp,sp,-32
    800069de:	ec06                	sd	ra,24(sp)
    800069e0:	e822                	sd	s0,16(sp)
    800069e2:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    800069e4:	0001e517          	auipc	a0,0x1e
    800069e8:	42450513          	addi	a0,a0,1060 # 80024e08 <ftable>
    800069ec:	ffffb097          	auipc	ra,0xffffb
    800069f0:	882080e7          	jalr	-1918(ra) # 8000126e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800069f4:	0001e797          	auipc	a5,0x1e
    800069f8:	42c78793          	addi	a5,a5,1068 # 80024e20 <ftable+0x18>
    800069fc:	fef43423          	sd	a5,-24(s0)
    80006a00:	a815                	j	80006a34 <filealloc+0x58>
    if(f->ref == 0){
    80006a02:	fe843783          	ld	a5,-24(s0)
    80006a06:	43dc                	lw	a5,4(a5)
    80006a08:	e385                	bnez	a5,80006a28 <filealloc+0x4c>
      f->ref = 1;
    80006a0a:	fe843783          	ld	a5,-24(s0)
    80006a0e:	4705                	li	a4,1
    80006a10:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006a12:	0001e517          	auipc	a0,0x1e
    80006a16:	3f650513          	addi	a0,a0,1014 # 80024e08 <ftable>
    80006a1a:	ffffb097          	auipc	ra,0xffffb
    80006a1e:	8b8080e7          	jalr	-1864(ra) # 800012d2 <release>
      return f;
    80006a22:	fe843783          	ld	a5,-24(s0)
    80006a26:	a805                	j	80006a56 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006a28:	fe843783          	ld	a5,-24(s0)
    80006a2c:	02878793          	addi	a5,a5,40
    80006a30:	fef43423          	sd	a5,-24(s0)
    80006a34:	0001f797          	auipc	a5,0x1f
    80006a38:	38c78793          	addi	a5,a5,908 # 80025dc0 <ftable+0xfb8>
    80006a3c:	fe843703          	ld	a4,-24(s0)
    80006a40:	fcf761e3          	bltu	a4,a5,80006a02 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006a44:	0001e517          	auipc	a0,0x1e
    80006a48:	3c450513          	addi	a0,a0,964 # 80024e08 <ftable>
    80006a4c:	ffffb097          	auipc	ra,0xffffb
    80006a50:	886080e7          	jalr	-1914(ra) # 800012d2 <release>
  return 0;
    80006a54:	4781                	li	a5,0
}
    80006a56:	853e                	mv	a0,a5
    80006a58:	60e2                	ld	ra,24(sp)
    80006a5a:	6442                	ld	s0,16(sp)
    80006a5c:	6105                	addi	sp,sp,32
    80006a5e:	8082                	ret

0000000080006a60 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006a60:	1101                	addi	sp,sp,-32
    80006a62:	ec06                	sd	ra,24(sp)
    80006a64:	e822                	sd	s0,16(sp)
    80006a66:	1000                	addi	s0,sp,32
    80006a68:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006a6c:	0001e517          	auipc	a0,0x1e
    80006a70:	39c50513          	addi	a0,a0,924 # 80024e08 <ftable>
    80006a74:	ffffa097          	auipc	ra,0xffffa
    80006a78:	7fa080e7          	jalr	2042(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006a7c:	fe843783          	ld	a5,-24(s0)
    80006a80:	43dc                	lw	a5,4(a5)
    80006a82:	00f04a63          	bgtz	a5,80006a96 <filedup+0x36>
    panic("filedup");
    80006a86:	00005517          	auipc	a0,0x5
    80006a8a:	b6a50513          	addi	a0,a0,-1174 # 8000b5f0 <etext+0x5f0>
    80006a8e:	ffffa097          	auipc	ra,0xffffa
    80006a92:	1f0080e7          	jalr	496(ra) # 80000c7e <panic>
  f->ref++;
    80006a96:	fe843783          	ld	a5,-24(s0)
    80006a9a:	43dc                	lw	a5,4(a5)
    80006a9c:	2785                	addiw	a5,a5,1
    80006a9e:	0007871b          	sext.w	a4,a5
    80006aa2:	fe843783          	ld	a5,-24(s0)
    80006aa6:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006aa8:	0001e517          	auipc	a0,0x1e
    80006aac:	36050513          	addi	a0,a0,864 # 80024e08 <ftable>
    80006ab0:	ffffb097          	auipc	ra,0xffffb
    80006ab4:	822080e7          	jalr	-2014(ra) # 800012d2 <release>
  return f;
    80006ab8:	fe843783          	ld	a5,-24(s0)
}
    80006abc:	853e                	mv	a0,a5
    80006abe:	60e2                	ld	ra,24(sp)
    80006ac0:	6442                	ld	s0,16(sp)
    80006ac2:	6105                	addi	sp,sp,32
    80006ac4:	8082                	ret

0000000080006ac6 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006ac6:	715d                	addi	sp,sp,-80
    80006ac8:	e486                	sd	ra,72(sp)
    80006aca:	e0a2                	sd	s0,64(sp)
    80006acc:	0880                	addi	s0,sp,80
    80006ace:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006ad2:	0001e517          	auipc	a0,0x1e
    80006ad6:	33650513          	addi	a0,a0,822 # 80024e08 <ftable>
    80006ada:	ffffa097          	auipc	ra,0xffffa
    80006ade:	794080e7          	jalr	1940(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006ae2:	fb843783          	ld	a5,-72(s0)
    80006ae6:	43dc                	lw	a5,4(a5)
    80006ae8:	00f04a63          	bgtz	a5,80006afc <fileclose+0x36>
    panic("fileclose");
    80006aec:	00005517          	auipc	a0,0x5
    80006af0:	b0c50513          	addi	a0,a0,-1268 # 8000b5f8 <etext+0x5f8>
    80006af4:	ffffa097          	auipc	ra,0xffffa
    80006af8:	18a080e7          	jalr	394(ra) # 80000c7e <panic>
  if(--f->ref > 0){
    80006afc:	fb843783          	ld	a5,-72(s0)
    80006b00:	43dc                	lw	a5,4(a5)
    80006b02:	37fd                	addiw	a5,a5,-1
    80006b04:	0007871b          	sext.w	a4,a5
    80006b08:	fb843783          	ld	a5,-72(s0)
    80006b0c:	c3d8                	sw	a4,4(a5)
    80006b0e:	fb843783          	ld	a5,-72(s0)
    80006b12:	43dc                	lw	a5,4(a5)
    80006b14:	00f05b63          	blez	a5,80006b2a <fileclose+0x64>
    release(&ftable.lock);
    80006b18:	0001e517          	auipc	a0,0x1e
    80006b1c:	2f050513          	addi	a0,a0,752 # 80024e08 <ftable>
    80006b20:	ffffa097          	auipc	ra,0xffffa
    80006b24:	7b2080e7          	jalr	1970(ra) # 800012d2 <release>
    80006b28:	a879                	j	80006bc6 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006b2a:	fb843783          	ld	a5,-72(s0)
    80006b2e:	638c                	ld	a1,0(a5)
    80006b30:	6790                	ld	a2,8(a5)
    80006b32:	6b94                	ld	a3,16(a5)
    80006b34:	6f98                	ld	a4,24(a5)
    80006b36:	739c                	ld	a5,32(a5)
    80006b38:	fcb43423          	sd	a1,-56(s0)
    80006b3c:	fcc43823          	sd	a2,-48(s0)
    80006b40:	fcd43c23          	sd	a3,-40(s0)
    80006b44:	fee43023          	sd	a4,-32(s0)
    80006b48:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006b4c:	fb843783          	ld	a5,-72(s0)
    80006b50:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006b54:	fb843783          	ld	a5,-72(s0)
    80006b58:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006b5c:	0001e517          	auipc	a0,0x1e
    80006b60:	2ac50513          	addi	a0,a0,684 # 80024e08 <ftable>
    80006b64:	ffffa097          	auipc	ra,0xffffa
    80006b68:	76e080e7          	jalr	1902(ra) # 800012d2 <release>

  if(ff.type == FD_PIPE){
    80006b6c:	fc842783          	lw	a5,-56(s0)
    80006b70:	873e                	mv	a4,a5
    80006b72:	4785                	li	a5,1
    80006b74:	00f71e63          	bne	a4,a5,80006b90 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006b78:	fd843783          	ld	a5,-40(s0)
    80006b7c:	fd144703          	lbu	a4,-47(s0)
    80006b80:	2701                	sext.w	a4,a4
    80006b82:	85ba                	mv	a1,a4
    80006b84:	853e                	mv	a0,a5
    80006b86:	00000097          	auipc	ra,0x0
    80006b8a:	5aa080e7          	jalr	1450(ra) # 80007130 <pipeclose>
    80006b8e:	a825                	j	80006bc6 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006b90:	fc842783          	lw	a5,-56(s0)
    80006b94:	873e                	mv	a4,a5
    80006b96:	4789                	li	a5,2
    80006b98:	00f70863          	beq	a4,a5,80006ba8 <fileclose+0xe2>
    80006b9c:	fc842783          	lw	a5,-56(s0)
    80006ba0:	873e                	mv	a4,a5
    80006ba2:	478d                	li	a5,3
    80006ba4:	02f71163          	bne	a4,a5,80006bc6 <fileclose+0x100>
    begin_op();
    80006ba8:	00000097          	auipc	ra,0x0
    80006bac:	884080e7          	jalr	-1916(ra) # 8000642c <begin_op>
    iput(ff.ip);
    80006bb0:	fe043783          	ld	a5,-32(s0)
    80006bb4:	853e                	mv	a0,a5
    80006bb6:	fffff097          	auipc	ra,0xfffff
    80006bba:	9aa080e7          	jalr	-1622(ra) # 80005560 <iput>
    end_op();
    80006bbe:	00000097          	auipc	ra,0x0
    80006bc2:	930080e7          	jalr	-1744(ra) # 800064ee <end_op>
  }
}
    80006bc6:	60a6                	ld	ra,72(sp)
    80006bc8:	6406                	ld	s0,64(sp)
    80006bca:	6161                	addi	sp,sp,80
    80006bcc:	8082                	ret

0000000080006bce <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006bce:	7139                	addi	sp,sp,-64
    80006bd0:	fc06                	sd	ra,56(sp)
    80006bd2:	f822                	sd	s0,48(sp)
    80006bd4:	0080                	addi	s0,sp,64
    80006bd6:	fca43423          	sd	a0,-56(s0)
    80006bda:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006bde:	ffffc097          	auipc	ra,0xffffc
    80006be2:	c3a080e7          	jalr	-966(ra) # 80002818 <myproc>
    80006be6:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006bea:	fc843783          	ld	a5,-56(s0)
    80006bee:	439c                	lw	a5,0(a5)
    80006bf0:	873e                	mv	a4,a5
    80006bf2:	4789                	li	a5,2
    80006bf4:	00f70963          	beq	a4,a5,80006c06 <filestat+0x38>
    80006bf8:	fc843783          	ld	a5,-56(s0)
    80006bfc:	439c                	lw	a5,0(a5)
    80006bfe:	873e                	mv	a4,a5
    80006c00:	478d                	li	a5,3
    80006c02:	06f71263          	bne	a4,a5,80006c66 <filestat+0x98>
    ilock(f->ip);
    80006c06:	fc843783          	ld	a5,-56(s0)
    80006c0a:	6f9c                	ld	a5,24(a5)
    80006c0c:	853e                	mv	a0,a5
    80006c0e:	ffffe097          	auipc	ra,0xffffe
    80006c12:	7c4080e7          	jalr	1988(ra) # 800053d2 <ilock>
    stati(f->ip, &st);
    80006c16:	fc843783          	ld	a5,-56(s0)
    80006c1a:	6f9c                	ld	a5,24(a5)
    80006c1c:	fd040713          	addi	a4,s0,-48
    80006c20:	85ba                	mv	a1,a4
    80006c22:	853e                	mv	a0,a5
    80006c24:	fffff097          	auipc	ra,0xfffff
    80006c28:	ce0080e7          	jalr	-800(ra) # 80005904 <stati>
    iunlock(f->ip);
    80006c2c:	fc843783          	ld	a5,-56(s0)
    80006c30:	6f9c                	ld	a5,24(a5)
    80006c32:	853e                	mv	a0,a5
    80006c34:	fffff097          	auipc	ra,0xfffff
    80006c38:	8d2080e7          	jalr	-1838(ra) # 80005506 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006c3c:	fe843783          	ld	a5,-24(s0)
    80006c40:	6bbc                	ld	a5,80(a5)
    80006c42:	fd040713          	addi	a4,s0,-48
    80006c46:	46e1                	li	a3,24
    80006c48:	863a                	mv	a2,a4
    80006c4a:	fc043583          	ld	a1,-64(s0)
    80006c4e:	853e                	mv	a0,a5
    80006c50:	ffffb097          	auipc	ra,0xffffb
    80006c54:	696080e7          	jalr	1686(ra) # 800022e6 <copyout>
    80006c58:	87aa                	mv	a5,a0
    80006c5a:	0007d463          	bgez	a5,80006c62 <filestat+0x94>
      return -1;
    80006c5e:	57fd                	li	a5,-1
    80006c60:	a021                	j	80006c68 <filestat+0x9a>
    return 0;
    80006c62:	4781                	li	a5,0
    80006c64:	a011                	j	80006c68 <filestat+0x9a>
  }
  return -1;
    80006c66:	57fd                	li	a5,-1
}
    80006c68:	853e                	mv	a0,a5
    80006c6a:	70e2                	ld	ra,56(sp)
    80006c6c:	7442                	ld	s0,48(sp)
    80006c6e:	6121                	addi	sp,sp,64
    80006c70:	8082                	ret

0000000080006c72 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006c72:	7139                	addi	sp,sp,-64
    80006c74:	fc06                	sd	ra,56(sp)
    80006c76:	f822                	sd	s0,48(sp)
    80006c78:	0080                	addi	s0,sp,64
    80006c7a:	fca43c23          	sd	a0,-40(s0)
    80006c7e:	fcb43823          	sd	a1,-48(s0)
    80006c82:	87b2                	mv	a5,a2
    80006c84:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006c88:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006c8c:	fd843783          	ld	a5,-40(s0)
    80006c90:	0087c783          	lbu	a5,8(a5)
    80006c94:	e399                	bnez	a5,80006c9a <fileread+0x28>
    return -1;
    80006c96:	57fd                	li	a5,-1
    80006c98:	aa1d                	j	80006dce <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006c9a:	fd843783          	ld	a5,-40(s0)
    80006c9e:	439c                	lw	a5,0(a5)
    80006ca0:	873e                	mv	a4,a5
    80006ca2:	4785                	li	a5,1
    80006ca4:	02f71363          	bne	a4,a5,80006cca <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006ca8:	fd843783          	ld	a5,-40(s0)
    80006cac:	6b9c                	ld	a5,16(a5)
    80006cae:	fcc42703          	lw	a4,-52(s0)
    80006cb2:	863a                	mv	a2,a4
    80006cb4:	fd043583          	ld	a1,-48(s0)
    80006cb8:	853e                	mv	a0,a5
    80006cba:	00000097          	auipc	ra,0x0
    80006cbe:	668080e7          	jalr	1640(ra) # 80007322 <piperead>
    80006cc2:	87aa                	mv	a5,a0
    80006cc4:	fef42623          	sw	a5,-20(s0)
    80006cc8:	a209                	j	80006dca <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006cca:	fd843783          	ld	a5,-40(s0)
    80006cce:	439c                	lw	a5,0(a5)
    80006cd0:	873e                	mv	a4,a5
    80006cd2:	478d                	li	a5,3
    80006cd4:	06f71863          	bne	a4,a5,80006d44 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006cd8:	fd843783          	ld	a5,-40(s0)
    80006cdc:	02479783          	lh	a5,36(a5)
    80006ce0:	2781                	sext.w	a5,a5
    80006ce2:	0207c863          	bltz	a5,80006d12 <fileread+0xa0>
    80006ce6:	fd843783          	ld	a5,-40(s0)
    80006cea:	02479783          	lh	a5,36(a5)
    80006cee:	0007871b          	sext.w	a4,a5
    80006cf2:	47a5                	li	a5,9
    80006cf4:	00e7cf63          	blt	a5,a4,80006d12 <fileread+0xa0>
    80006cf8:	fd843783          	ld	a5,-40(s0)
    80006cfc:	02479783          	lh	a5,36(a5)
    80006d00:	2781                	sext.w	a5,a5
    80006d02:	0001e717          	auipc	a4,0x1e
    80006d06:	06670713          	addi	a4,a4,102 # 80024d68 <devsw>
    80006d0a:	0792                	slli	a5,a5,0x4
    80006d0c:	97ba                	add	a5,a5,a4
    80006d0e:	639c                	ld	a5,0(a5)
    80006d10:	e399                	bnez	a5,80006d16 <fileread+0xa4>
      return -1;
    80006d12:	57fd                	li	a5,-1
    80006d14:	a86d                	j	80006dce <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006d16:	fd843783          	ld	a5,-40(s0)
    80006d1a:	02479783          	lh	a5,36(a5)
    80006d1e:	2781                	sext.w	a5,a5
    80006d20:	0001e717          	auipc	a4,0x1e
    80006d24:	04870713          	addi	a4,a4,72 # 80024d68 <devsw>
    80006d28:	0792                	slli	a5,a5,0x4
    80006d2a:	97ba                	add	a5,a5,a4
    80006d2c:	6398                	ld	a4,0(a5)
    80006d2e:	fcc42783          	lw	a5,-52(s0)
    80006d32:	863e                	mv	a2,a5
    80006d34:	fd043583          	ld	a1,-48(s0)
    80006d38:	4505                	li	a0,1
    80006d3a:	9702                	jalr	a4
    80006d3c:	87aa                	mv	a5,a0
    80006d3e:	fef42623          	sw	a5,-20(s0)
    80006d42:	a061                	j	80006dca <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006d44:	fd843783          	ld	a5,-40(s0)
    80006d48:	439c                	lw	a5,0(a5)
    80006d4a:	873e                	mv	a4,a5
    80006d4c:	4789                	li	a5,2
    80006d4e:	06f71663          	bne	a4,a5,80006dba <fileread+0x148>
    ilock(f->ip);
    80006d52:	fd843783          	ld	a5,-40(s0)
    80006d56:	6f9c                	ld	a5,24(a5)
    80006d58:	853e                	mv	a0,a5
    80006d5a:	ffffe097          	auipc	ra,0xffffe
    80006d5e:	678080e7          	jalr	1656(ra) # 800053d2 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006d62:	fd843783          	ld	a5,-40(s0)
    80006d66:	6f88                	ld	a0,24(a5)
    80006d68:	fd843783          	ld	a5,-40(s0)
    80006d6c:	539c                	lw	a5,32(a5)
    80006d6e:	fcc42703          	lw	a4,-52(s0)
    80006d72:	86be                	mv	a3,a5
    80006d74:	fd043603          	ld	a2,-48(s0)
    80006d78:	4585                	li	a1,1
    80006d7a:	fffff097          	auipc	ra,0xfffff
    80006d7e:	bee080e7          	jalr	-1042(ra) # 80005968 <readi>
    80006d82:	87aa                	mv	a5,a0
    80006d84:	fef42623          	sw	a5,-20(s0)
    80006d88:	fec42783          	lw	a5,-20(s0)
    80006d8c:	2781                	sext.w	a5,a5
    80006d8e:	00f05d63          	blez	a5,80006da8 <fileread+0x136>
      f->off += r;
    80006d92:	fd843783          	ld	a5,-40(s0)
    80006d96:	5398                	lw	a4,32(a5)
    80006d98:	fec42783          	lw	a5,-20(s0)
    80006d9c:	9fb9                	addw	a5,a5,a4
    80006d9e:	0007871b          	sext.w	a4,a5
    80006da2:	fd843783          	ld	a5,-40(s0)
    80006da6:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006da8:	fd843783          	ld	a5,-40(s0)
    80006dac:	6f9c                	ld	a5,24(a5)
    80006dae:	853e                	mv	a0,a5
    80006db0:	ffffe097          	auipc	ra,0xffffe
    80006db4:	756080e7          	jalr	1878(ra) # 80005506 <iunlock>
    80006db8:	a809                	j	80006dca <fileread+0x158>
  } else {
    panic("fileread");
    80006dba:	00005517          	auipc	a0,0x5
    80006dbe:	84e50513          	addi	a0,a0,-1970 # 8000b608 <etext+0x608>
    80006dc2:	ffffa097          	auipc	ra,0xffffa
    80006dc6:	ebc080e7          	jalr	-324(ra) # 80000c7e <panic>
  }

  return r;
    80006dca:	fec42783          	lw	a5,-20(s0)
}
    80006dce:	853e                	mv	a0,a5
    80006dd0:	70e2                	ld	ra,56(sp)
    80006dd2:	7442                	ld	s0,48(sp)
    80006dd4:	6121                	addi	sp,sp,64
    80006dd6:	8082                	ret

0000000080006dd8 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006dd8:	715d                	addi	sp,sp,-80
    80006dda:	e486                	sd	ra,72(sp)
    80006ddc:	e0a2                	sd	s0,64(sp)
    80006dde:	0880                	addi	s0,sp,80
    80006de0:	fca43423          	sd	a0,-56(s0)
    80006de4:	fcb43023          	sd	a1,-64(s0)
    80006de8:	87b2                	mv	a5,a2
    80006dea:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006dee:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006df2:	fc843783          	ld	a5,-56(s0)
    80006df6:	0097c783          	lbu	a5,9(a5)
    80006dfa:	e399                	bnez	a5,80006e00 <filewrite+0x28>
    return -1;
    80006dfc:	57fd                	li	a5,-1
    80006dfe:	aad1                	j	80006fd2 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006e00:	fc843783          	ld	a5,-56(s0)
    80006e04:	439c                	lw	a5,0(a5)
    80006e06:	873e                	mv	a4,a5
    80006e08:	4785                	li	a5,1
    80006e0a:	02f71363          	bne	a4,a5,80006e30 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006e0e:	fc843783          	ld	a5,-56(s0)
    80006e12:	6b9c                	ld	a5,16(a5)
    80006e14:	fbc42703          	lw	a4,-68(s0)
    80006e18:	863a                	mv	a2,a4
    80006e1a:	fc043583          	ld	a1,-64(s0)
    80006e1e:	853e                	mv	a0,a5
    80006e20:	00000097          	auipc	ra,0x0
    80006e24:	3b8080e7          	jalr	952(ra) # 800071d8 <pipewrite>
    80006e28:	87aa                	mv	a5,a0
    80006e2a:	fef42623          	sw	a5,-20(s0)
    80006e2e:	a245                	j	80006fce <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006e30:	fc843783          	ld	a5,-56(s0)
    80006e34:	439c                	lw	a5,0(a5)
    80006e36:	873e                	mv	a4,a5
    80006e38:	478d                	li	a5,3
    80006e3a:	06f71863          	bne	a4,a5,80006eaa <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006e3e:	fc843783          	ld	a5,-56(s0)
    80006e42:	02479783          	lh	a5,36(a5)
    80006e46:	2781                	sext.w	a5,a5
    80006e48:	0207c863          	bltz	a5,80006e78 <filewrite+0xa0>
    80006e4c:	fc843783          	ld	a5,-56(s0)
    80006e50:	02479783          	lh	a5,36(a5)
    80006e54:	0007871b          	sext.w	a4,a5
    80006e58:	47a5                	li	a5,9
    80006e5a:	00e7cf63          	blt	a5,a4,80006e78 <filewrite+0xa0>
    80006e5e:	fc843783          	ld	a5,-56(s0)
    80006e62:	02479783          	lh	a5,36(a5)
    80006e66:	2781                	sext.w	a5,a5
    80006e68:	0001e717          	auipc	a4,0x1e
    80006e6c:	f0070713          	addi	a4,a4,-256 # 80024d68 <devsw>
    80006e70:	0792                	slli	a5,a5,0x4
    80006e72:	97ba                	add	a5,a5,a4
    80006e74:	679c                	ld	a5,8(a5)
    80006e76:	e399                	bnez	a5,80006e7c <filewrite+0xa4>
      return -1;
    80006e78:	57fd                	li	a5,-1
    80006e7a:	aaa1                	j	80006fd2 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006e7c:	fc843783          	ld	a5,-56(s0)
    80006e80:	02479783          	lh	a5,36(a5)
    80006e84:	2781                	sext.w	a5,a5
    80006e86:	0001e717          	auipc	a4,0x1e
    80006e8a:	ee270713          	addi	a4,a4,-286 # 80024d68 <devsw>
    80006e8e:	0792                	slli	a5,a5,0x4
    80006e90:	97ba                	add	a5,a5,a4
    80006e92:	6798                	ld	a4,8(a5)
    80006e94:	fbc42783          	lw	a5,-68(s0)
    80006e98:	863e                	mv	a2,a5
    80006e9a:	fc043583          	ld	a1,-64(s0)
    80006e9e:	4505                	li	a0,1
    80006ea0:	9702                	jalr	a4
    80006ea2:	87aa                	mv	a5,a0
    80006ea4:	fef42623          	sw	a5,-20(s0)
    80006ea8:	a21d                	j	80006fce <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006eaa:	fc843783          	ld	a5,-56(s0)
    80006eae:	439c                	lw	a5,0(a5)
    80006eb0:	873e                	mv	a4,a5
    80006eb2:	4789                	li	a5,2
    80006eb4:	10f71563          	bne	a4,a5,80006fbe <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006eb8:	6785                	lui	a5,0x1
    80006eba:	c007879b          	addiw	a5,a5,-1024
    80006ebe:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006ec2:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006ec6:	a0d9                	j	80006f8c <filewrite+0x1b4>
      int n1 = n - i;
    80006ec8:	fbc42703          	lw	a4,-68(s0)
    80006ecc:	fe842783          	lw	a5,-24(s0)
    80006ed0:	40f707bb          	subw	a5,a4,a5
    80006ed4:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006ed8:	fe442703          	lw	a4,-28(s0)
    80006edc:	fe042783          	lw	a5,-32(s0)
    80006ee0:	2701                	sext.w	a4,a4
    80006ee2:	2781                	sext.w	a5,a5
    80006ee4:	00e7d663          	bge	a5,a4,80006ef0 <filewrite+0x118>
        n1 = max;
    80006ee8:	fe042783          	lw	a5,-32(s0)
    80006eec:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006ef0:	fffff097          	auipc	ra,0xfffff
    80006ef4:	53c080e7          	jalr	1340(ra) # 8000642c <begin_op>
      ilock(f->ip);
    80006ef8:	fc843783          	ld	a5,-56(s0)
    80006efc:	6f9c                	ld	a5,24(a5)
    80006efe:	853e                	mv	a0,a5
    80006f00:	ffffe097          	auipc	ra,0xffffe
    80006f04:	4d2080e7          	jalr	1234(ra) # 800053d2 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006f08:	fc843783          	ld	a5,-56(s0)
    80006f0c:	6f88                	ld	a0,24(a5)
    80006f0e:	fe842703          	lw	a4,-24(s0)
    80006f12:	fc043783          	ld	a5,-64(s0)
    80006f16:	00f70633          	add	a2,a4,a5
    80006f1a:	fc843783          	ld	a5,-56(s0)
    80006f1e:	539c                	lw	a5,32(a5)
    80006f20:	fe442703          	lw	a4,-28(s0)
    80006f24:	86be                	mv	a3,a5
    80006f26:	4585                	li	a1,1
    80006f28:	fffff097          	auipc	ra,0xfffff
    80006f2c:	bca080e7          	jalr	-1078(ra) # 80005af2 <writei>
    80006f30:	87aa                	mv	a5,a0
    80006f32:	fcf42e23          	sw	a5,-36(s0)
    80006f36:	fdc42783          	lw	a5,-36(s0)
    80006f3a:	2781                	sext.w	a5,a5
    80006f3c:	00f05d63          	blez	a5,80006f56 <filewrite+0x17e>
        f->off += r;
    80006f40:	fc843783          	ld	a5,-56(s0)
    80006f44:	5398                	lw	a4,32(a5)
    80006f46:	fdc42783          	lw	a5,-36(s0)
    80006f4a:	9fb9                	addw	a5,a5,a4
    80006f4c:	0007871b          	sext.w	a4,a5
    80006f50:	fc843783          	ld	a5,-56(s0)
    80006f54:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006f56:	fc843783          	ld	a5,-56(s0)
    80006f5a:	6f9c                	ld	a5,24(a5)
    80006f5c:	853e                	mv	a0,a5
    80006f5e:	ffffe097          	auipc	ra,0xffffe
    80006f62:	5a8080e7          	jalr	1448(ra) # 80005506 <iunlock>
      end_op();
    80006f66:	fffff097          	auipc	ra,0xfffff
    80006f6a:	588080e7          	jalr	1416(ra) # 800064ee <end_op>

      if(r != n1){
    80006f6e:	fdc42703          	lw	a4,-36(s0)
    80006f72:	fe442783          	lw	a5,-28(s0)
    80006f76:	2701                	sext.w	a4,a4
    80006f78:	2781                	sext.w	a5,a5
    80006f7a:	02f71263          	bne	a4,a5,80006f9e <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006f7e:	fe842703          	lw	a4,-24(s0)
    80006f82:	fdc42783          	lw	a5,-36(s0)
    80006f86:	9fb9                	addw	a5,a5,a4
    80006f88:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006f8c:	fe842703          	lw	a4,-24(s0)
    80006f90:	fbc42783          	lw	a5,-68(s0)
    80006f94:	2701                	sext.w	a4,a4
    80006f96:	2781                	sext.w	a5,a5
    80006f98:	f2f748e3          	blt	a4,a5,80006ec8 <filewrite+0xf0>
    80006f9c:	a011                	j	80006fa0 <filewrite+0x1c8>
        break;
    80006f9e:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006fa0:	fe842703          	lw	a4,-24(s0)
    80006fa4:	fbc42783          	lw	a5,-68(s0)
    80006fa8:	2701                	sext.w	a4,a4
    80006faa:	2781                	sext.w	a5,a5
    80006fac:	00f71563          	bne	a4,a5,80006fb6 <filewrite+0x1de>
    80006fb0:	fbc42783          	lw	a5,-68(s0)
    80006fb4:	a011                	j	80006fb8 <filewrite+0x1e0>
    80006fb6:	57fd                	li	a5,-1
    80006fb8:	fef42623          	sw	a5,-20(s0)
    80006fbc:	a809                	j	80006fce <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006fbe:	00004517          	auipc	a0,0x4
    80006fc2:	65a50513          	addi	a0,a0,1626 # 8000b618 <etext+0x618>
    80006fc6:	ffffa097          	auipc	ra,0xffffa
    80006fca:	cb8080e7          	jalr	-840(ra) # 80000c7e <panic>
  }

  return ret;
    80006fce:	fec42783          	lw	a5,-20(s0)
}
    80006fd2:	853e                	mv	a0,a5
    80006fd4:	60a6                	ld	ra,72(sp)
    80006fd6:	6406                	ld	s0,64(sp)
    80006fd8:	6161                	addi	sp,sp,80
    80006fda:	8082                	ret

0000000080006fdc <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006fdc:	7179                	addi	sp,sp,-48
    80006fde:	f406                	sd	ra,40(sp)
    80006fe0:	f022                	sd	s0,32(sp)
    80006fe2:	1800                	addi	s0,sp,48
    80006fe4:	fca43c23          	sd	a0,-40(s0)
    80006fe8:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006fec:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006ff0:	fd043783          	ld	a5,-48(s0)
    80006ff4:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006ff8:	fd043783          	ld	a5,-48(s0)
    80006ffc:	6398                	ld	a4,0(a5)
    80006ffe:	fd843783          	ld	a5,-40(s0)
    80007002:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80007004:	00000097          	auipc	ra,0x0
    80007008:	9d8080e7          	jalr	-1576(ra) # 800069dc <filealloc>
    8000700c:	872a                	mv	a4,a0
    8000700e:	fd843783          	ld	a5,-40(s0)
    80007012:	e398                	sd	a4,0(a5)
    80007014:	fd843783          	ld	a5,-40(s0)
    80007018:	639c                	ld	a5,0(a5)
    8000701a:	c3e9                	beqz	a5,800070dc <pipealloc+0x100>
    8000701c:	00000097          	auipc	ra,0x0
    80007020:	9c0080e7          	jalr	-1600(ra) # 800069dc <filealloc>
    80007024:	872a                	mv	a4,a0
    80007026:	fd043783          	ld	a5,-48(s0)
    8000702a:	e398                	sd	a4,0(a5)
    8000702c:	fd043783          	ld	a5,-48(s0)
    80007030:	639c                	ld	a5,0(a5)
    80007032:	c7cd                	beqz	a5,800070dc <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80007034:	ffffa097          	auipc	ra,0xffffa
    80007038:	0e6080e7          	jalr	230(ra) # 8000111a <kalloc>
    8000703c:	fea43423          	sd	a0,-24(s0)
    80007040:	fe843783          	ld	a5,-24(s0)
    80007044:	cfd1                	beqz	a5,800070e0 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80007046:	fe843783          	ld	a5,-24(s0)
    8000704a:	4705                	li	a4,1
    8000704c:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80007050:	fe843783          	ld	a5,-24(s0)
    80007054:	4705                	li	a4,1
    80007056:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    8000705a:	fe843783          	ld	a5,-24(s0)
    8000705e:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80007062:	fe843783          	ld	a5,-24(s0)
    80007066:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    8000706a:	fe843783          	ld	a5,-24(s0)
    8000706e:	00004597          	auipc	a1,0x4
    80007072:	5ba58593          	addi	a1,a1,1466 # 8000b628 <etext+0x628>
    80007076:	853e                	mv	a0,a5
    80007078:	ffffa097          	auipc	ra,0xffffa
    8000707c:	1c6080e7          	jalr	454(ra) # 8000123e <initlock>
  (*f0)->type = FD_PIPE;
    80007080:	fd843783          	ld	a5,-40(s0)
    80007084:	639c                	ld	a5,0(a5)
    80007086:	4705                	li	a4,1
    80007088:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    8000708a:	fd843783          	ld	a5,-40(s0)
    8000708e:	639c                	ld	a5,0(a5)
    80007090:	4705                	li	a4,1
    80007092:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80007096:	fd843783          	ld	a5,-40(s0)
    8000709a:	639c                	ld	a5,0(a5)
    8000709c:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    800070a0:	fd843783          	ld	a5,-40(s0)
    800070a4:	639c                	ld	a5,0(a5)
    800070a6:	fe843703          	ld	a4,-24(s0)
    800070aa:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    800070ac:	fd043783          	ld	a5,-48(s0)
    800070b0:	639c                	ld	a5,0(a5)
    800070b2:	4705                	li	a4,1
    800070b4:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    800070b6:	fd043783          	ld	a5,-48(s0)
    800070ba:	639c                	ld	a5,0(a5)
    800070bc:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    800070c0:	fd043783          	ld	a5,-48(s0)
    800070c4:	639c                	ld	a5,0(a5)
    800070c6:	4705                	li	a4,1
    800070c8:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    800070cc:	fd043783          	ld	a5,-48(s0)
    800070d0:	639c                	ld	a5,0(a5)
    800070d2:	fe843703          	ld	a4,-24(s0)
    800070d6:	eb98                	sd	a4,16(a5)
  return 0;
    800070d8:	4781                	li	a5,0
    800070da:	a0b1                	j	80007126 <pipealloc+0x14a>
    goto bad;
    800070dc:	0001                	nop
    800070de:	a011                	j	800070e2 <pipealloc+0x106>
    goto bad;
    800070e0:	0001                	nop

 bad:
  if(pi)
    800070e2:	fe843783          	ld	a5,-24(s0)
    800070e6:	c799                	beqz	a5,800070f4 <pipealloc+0x118>
    kfree((char*)pi);
    800070e8:	fe843503          	ld	a0,-24(s0)
    800070ec:	ffffa097          	auipc	ra,0xffffa
    800070f0:	f8a080e7          	jalr	-118(ra) # 80001076 <kfree>
  if(*f0)
    800070f4:	fd843783          	ld	a5,-40(s0)
    800070f8:	639c                	ld	a5,0(a5)
    800070fa:	cb89                	beqz	a5,8000710c <pipealloc+0x130>
    fileclose(*f0);
    800070fc:	fd843783          	ld	a5,-40(s0)
    80007100:	639c                	ld	a5,0(a5)
    80007102:	853e                	mv	a0,a5
    80007104:	00000097          	auipc	ra,0x0
    80007108:	9c2080e7          	jalr	-1598(ra) # 80006ac6 <fileclose>
  if(*f1)
    8000710c:	fd043783          	ld	a5,-48(s0)
    80007110:	639c                	ld	a5,0(a5)
    80007112:	cb89                	beqz	a5,80007124 <pipealloc+0x148>
    fileclose(*f1);
    80007114:	fd043783          	ld	a5,-48(s0)
    80007118:	639c                	ld	a5,0(a5)
    8000711a:	853e                	mv	a0,a5
    8000711c:	00000097          	auipc	ra,0x0
    80007120:	9aa080e7          	jalr	-1622(ra) # 80006ac6 <fileclose>
  return -1;
    80007124:	57fd                	li	a5,-1
}
    80007126:	853e                	mv	a0,a5
    80007128:	70a2                	ld	ra,40(sp)
    8000712a:	7402                	ld	s0,32(sp)
    8000712c:	6145                	addi	sp,sp,48
    8000712e:	8082                	ret

0000000080007130 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80007130:	1101                	addi	sp,sp,-32
    80007132:	ec06                	sd	ra,24(sp)
    80007134:	e822                	sd	s0,16(sp)
    80007136:	1000                	addi	s0,sp,32
    80007138:	fea43423          	sd	a0,-24(s0)
    8000713c:	87ae                	mv	a5,a1
    8000713e:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80007142:	fe843783          	ld	a5,-24(s0)
    80007146:	853e                	mv	a0,a5
    80007148:	ffffa097          	auipc	ra,0xffffa
    8000714c:	126080e7          	jalr	294(ra) # 8000126e <acquire>
  if(writable){
    80007150:	fe442783          	lw	a5,-28(s0)
    80007154:	2781                	sext.w	a5,a5
    80007156:	cf99                	beqz	a5,80007174 <pipeclose+0x44>
    pi->writeopen = 0;
    80007158:	fe843783          	ld	a5,-24(s0)
    8000715c:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80007160:	fe843783          	ld	a5,-24(s0)
    80007164:	21878793          	addi	a5,a5,536
    80007168:	853e                	mv	a0,a5
    8000716a:	ffffc097          	auipc	ra,0xffffc
    8000716e:	66e080e7          	jalr	1646(ra) # 800037d8 <wakeup>
    80007172:	a831                	j	8000718e <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80007174:	fe843783          	ld	a5,-24(s0)
    80007178:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    8000717c:	fe843783          	ld	a5,-24(s0)
    80007180:	21c78793          	addi	a5,a5,540
    80007184:	853e                	mv	a0,a5
    80007186:	ffffc097          	auipc	ra,0xffffc
    8000718a:	652080e7          	jalr	1618(ra) # 800037d8 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    8000718e:	fe843783          	ld	a5,-24(s0)
    80007192:	2207a783          	lw	a5,544(a5)
    80007196:	e785                	bnez	a5,800071be <pipeclose+0x8e>
    80007198:	fe843783          	ld	a5,-24(s0)
    8000719c:	2247a783          	lw	a5,548(a5)
    800071a0:	ef99                	bnez	a5,800071be <pipeclose+0x8e>
    release(&pi->lock);
    800071a2:	fe843783          	ld	a5,-24(s0)
    800071a6:	853e                	mv	a0,a5
    800071a8:	ffffa097          	auipc	ra,0xffffa
    800071ac:	12a080e7          	jalr	298(ra) # 800012d2 <release>
    kfree((char*)pi);
    800071b0:	fe843503          	ld	a0,-24(s0)
    800071b4:	ffffa097          	auipc	ra,0xffffa
    800071b8:	ec2080e7          	jalr	-318(ra) # 80001076 <kfree>
    800071bc:	a809                	j	800071ce <pipeclose+0x9e>
  } else
    release(&pi->lock);
    800071be:	fe843783          	ld	a5,-24(s0)
    800071c2:	853e                	mv	a0,a5
    800071c4:	ffffa097          	auipc	ra,0xffffa
    800071c8:	10e080e7          	jalr	270(ra) # 800012d2 <release>
}
    800071cc:	0001                	nop
    800071ce:	0001                	nop
    800071d0:	60e2                	ld	ra,24(sp)
    800071d2:	6442                	ld	s0,16(sp)
    800071d4:	6105                	addi	sp,sp,32
    800071d6:	8082                	ret

00000000800071d8 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    800071d8:	715d                	addi	sp,sp,-80
    800071da:	e486                	sd	ra,72(sp)
    800071dc:	e0a2                	sd	s0,64(sp)
    800071de:	0880                	addi	s0,sp,80
    800071e0:	fca43423          	sd	a0,-56(s0)
    800071e4:	fcb43023          	sd	a1,-64(s0)
    800071e8:	87b2                	mv	a5,a2
    800071ea:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    800071ee:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    800071f2:	ffffb097          	auipc	ra,0xffffb
    800071f6:	626080e7          	jalr	1574(ra) # 80002818 <myproc>
    800071fa:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    800071fe:	fc843783          	ld	a5,-56(s0)
    80007202:	853e                	mv	a0,a5
    80007204:	ffffa097          	auipc	ra,0xffffa
    80007208:	06a080e7          	jalr	106(ra) # 8000126e <acquire>
  while(i < n){
    8000720c:	a8d1                	j	800072e0 <pipewrite+0x108>
    if(pi->readopen == 0 || pr->killed){
    8000720e:	fc843783          	ld	a5,-56(s0)
    80007212:	2207a783          	lw	a5,544(a5)
    80007216:	c789                	beqz	a5,80007220 <pipewrite+0x48>
    80007218:	fe043783          	ld	a5,-32(s0)
    8000721c:	579c                	lw	a5,40(a5)
    8000721e:	cb91                	beqz	a5,80007232 <pipewrite+0x5a>
      release(&pi->lock);
    80007220:	fc843783          	ld	a5,-56(s0)
    80007224:	853e                	mv	a0,a5
    80007226:	ffffa097          	auipc	ra,0xffffa
    8000722a:	0ac080e7          	jalr	172(ra) # 800012d2 <release>
      return -1;
    8000722e:	57fd                	li	a5,-1
    80007230:	a0e5                	j	80007318 <pipewrite+0x140>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80007232:	fc843783          	ld	a5,-56(s0)
    80007236:	21c7a703          	lw	a4,540(a5)
    8000723a:	fc843783          	ld	a5,-56(s0)
    8000723e:	2187a783          	lw	a5,536(a5)
    80007242:	2007879b          	addiw	a5,a5,512
    80007246:	2781                	sext.w	a5,a5
    80007248:	02f71863          	bne	a4,a5,80007278 <pipewrite+0xa0>
      wakeup(&pi->nread);
    8000724c:	fc843783          	ld	a5,-56(s0)
    80007250:	21878793          	addi	a5,a5,536
    80007254:	853e                	mv	a0,a5
    80007256:	ffffc097          	auipc	ra,0xffffc
    8000725a:	582080e7          	jalr	1410(ra) # 800037d8 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8000725e:	fc843783          	ld	a5,-56(s0)
    80007262:	21c78793          	addi	a5,a5,540
    80007266:	fc843703          	ld	a4,-56(s0)
    8000726a:	85ba                	mv	a1,a4
    8000726c:	853e                	mv	a0,a5
    8000726e:	ffffc097          	auipc	ra,0xffffc
    80007272:	4ee080e7          	jalr	1262(ra) # 8000375c <sleep>
    80007276:	a0ad                	j	800072e0 <pipewrite+0x108>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007278:	fe043783          	ld	a5,-32(s0)
    8000727c:	6ba8                	ld	a0,80(a5)
    8000727e:	fec42703          	lw	a4,-20(s0)
    80007282:	fc043783          	ld	a5,-64(s0)
    80007286:	973e                	add	a4,a4,a5
    80007288:	fdf40793          	addi	a5,s0,-33
    8000728c:	4685                	li	a3,1
    8000728e:	863a                	mv	a2,a4
    80007290:	85be                	mv	a1,a5
    80007292:	ffffb097          	auipc	ra,0xffffb
    80007296:	122080e7          	jalr	290(ra) # 800023b4 <copyin>
    8000729a:	87aa                	mv	a5,a0
    8000729c:	873e                	mv	a4,a5
    8000729e:	57fd                	li	a5,-1
    800072a0:	04f70963          	beq	a4,a5,800072f2 <pipewrite+0x11a>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    800072a4:	fc843783          	ld	a5,-56(s0)
    800072a8:	21c7a783          	lw	a5,540(a5)
    800072ac:	2781                	sext.w	a5,a5
    800072ae:	0017871b          	addiw	a4,a5,1
    800072b2:	0007069b          	sext.w	a3,a4
    800072b6:	fc843703          	ld	a4,-56(s0)
    800072ba:	20d72e23          	sw	a3,540(a4)
    800072be:	1ff7f793          	andi	a5,a5,511
    800072c2:	2781                	sext.w	a5,a5
    800072c4:	fdf44703          	lbu	a4,-33(s0)
    800072c8:	fc843683          	ld	a3,-56(s0)
    800072cc:	1782                	slli	a5,a5,0x20
    800072ce:	9381                	srli	a5,a5,0x20
    800072d0:	97b6                	add	a5,a5,a3
    800072d2:	00e78c23          	sb	a4,24(a5)
      i++;
    800072d6:	fec42783          	lw	a5,-20(s0)
    800072da:	2785                	addiw	a5,a5,1
    800072dc:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    800072e0:	fec42703          	lw	a4,-20(s0)
    800072e4:	fbc42783          	lw	a5,-68(s0)
    800072e8:	2701                	sext.w	a4,a4
    800072ea:	2781                	sext.w	a5,a5
    800072ec:	f2f741e3          	blt	a4,a5,8000720e <pipewrite+0x36>
    800072f0:	a011                	j	800072f4 <pipewrite+0x11c>
        break;
    800072f2:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    800072f4:	fc843783          	ld	a5,-56(s0)
    800072f8:	21878793          	addi	a5,a5,536
    800072fc:	853e                	mv	a0,a5
    800072fe:	ffffc097          	auipc	ra,0xffffc
    80007302:	4da080e7          	jalr	1242(ra) # 800037d8 <wakeup>
  release(&pi->lock);
    80007306:	fc843783          	ld	a5,-56(s0)
    8000730a:	853e                	mv	a0,a5
    8000730c:	ffffa097          	auipc	ra,0xffffa
    80007310:	fc6080e7          	jalr	-58(ra) # 800012d2 <release>

  return i;
    80007314:	fec42783          	lw	a5,-20(s0)
}
    80007318:	853e                	mv	a0,a5
    8000731a:	60a6                	ld	ra,72(sp)
    8000731c:	6406                	ld	s0,64(sp)
    8000731e:	6161                	addi	sp,sp,80
    80007320:	8082                	ret

0000000080007322 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80007322:	715d                	addi	sp,sp,-80
    80007324:	e486                	sd	ra,72(sp)
    80007326:	e0a2                	sd	s0,64(sp)
    80007328:	0880                	addi	s0,sp,80
    8000732a:	fca43423          	sd	a0,-56(s0)
    8000732e:	fcb43023          	sd	a1,-64(s0)
    80007332:	87b2                	mv	a5,a2
    80007334:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007338:	ffffb097          	auipc	ra,0xffffb
    8000733c:	4e0080e7          	jalr	1248(ra) # 80002818 <myproc>
    80007340:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80007344:	fc843783          	ld	a5,-56(s0)
    80007348:	853e                	mv	a0,a5
    8000734a:	ffffa097          	auipc	ra,0xffffa
    8000734e:	f24080e7          	jalr	-220(ra) # 8000126e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007352:	a815                	j	80007386 <piperead+0x64>
    if(pr->killed){
    80007354:	fe043783          	ld	a5,-32(s0)
    80007358:	579c                	lw	a5,40(a5)
    8000735a:	cb91                	beqz	a5,8000736e <piperead+0x4c>
      release(&pi->lock);
    8000735c:	fc843783          	ld	a5,-56(s0)
    80007360:	853e                	mv	a0,a5
    80007362:	ffffa097          	auipc	ra,0xffffa
    80007366:	f70080e7          	jalr	-144(ra) # 800012d2 <release>
      return -1;
    8000736a:	57fd                	li	a5,-1
    8000736c:	a8dd                	j	80007462 <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000736e:	fc843783          	ld	a5,-56(s0)
    80007372:	21878793          	addi	a5,a5,536
    80007376:	fc843703          	ld	a4,-56(s0)
    8000737a:	85ba                	mv	a1,a4
    8000737c:	853e                	mv	a0,a5
    8000737e:	ffffc097          	auipc	ra,0xffffc
    80007382:	3de080e7          	jalr	990(ra) # 8000375c <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007386:	fc843783          	ld	a5,-56(s0)
    8000738a:	2187a703          	lw	a4,536(a5)
    8000738e:	fc843783          	ld	a5,-56(s0)
    80007392:	21c7a783          	lw	a5,540(a5)
    80007396:	00f71763          	bne	a4,a5,800073a4 <piperead+0x82>
    8000739a:	fc843783          	ld	a5,-56(s0)
    8000739e:	2247a783          	lw	a5,548(a5)
    800073a2:	fbcd                	bnez	a5,80007354 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800073a4:	fe042623          	sw	zero,-20(s0)
    800073a8:	a8bd                	j	80007426 <piperead+0x104>
    if(pi->nread == pi->nwrite)
    800073aa:	fc843783          	ld	a5,-56(s0)
    800073ae:	2187a703          	lw	a4,536(a5)
    800073b2:	fc843783          	ld	a5,-56(s0)
    800073b6:	21c7a783          	lw	a5,540(a5)
    800073ba:	06f70f63          	beq	a4,a5,80007438 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800073be:	fc843783          	ld	a5,-56(s0)
    800073c2:	2187a783          	lw	a5,536(a5)
    800073c6:	2781                	sext.w	a5,a5
    800073c8:	0017871b          	addiw	a4,a5,1
    800073cc:	0007069b          	sext.w	a3,a4
    800073d0:	fc843703          	ld	a4,-56(s0)
    800073d4:	20d72c23          	sw	a3,536(a4)
    800073d8:	1ff7f793          	andi	a5,a5,511
    800073dc:	2781                	sext.w	a5,a5
    800073de:	fc843703          	ld	a4,-56(s0)
    800073e2:	1782                	slli	a5,a5,0x20
    800073e4:	9381                	srli	a5,a5,0x20
    800073e6:	97ba                	add	a5,a5,a4
    800073e8:	0187c783          	lbu	a5,24(a5)
    800073ec:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    800073f0:	fe043783          	ld	a5,-32(s0)
    800073f4:	6ba8                	ld	a0,80(a5)
    800073f6:	fec42703          	lw	a4,-20(s0)
    800073fa:	fc043783          	ld	a5,-64(s0)
    800073fe:	97ba                	add	a5,a5,a4
    80007400:	fdf40713          	addi	a4,s0,-33
    80007404:	4685                	li	a3,1
    80007406:	863a                	mv	a2,a4
    80007408:	85be                	mv	a1,a5
    8000740a:	ffffb097          	auipc	ra,0xffffb
    8000740e:	edc080e7          	jalr	-292(ra) # 800022e6 <copyout>
    80007412:	87aa                	mv	a5,a0
    80007414:	873e                	mv	a4,a5
    80007416:	57fd                	li	a5,-1
    80007418:	02f70263          	beq	a4,a5,8000743c <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000741c:	fec42783          	lw	a5,-20(s0)
    80007420:	2785                	addiw	a5,a5,1
    80007422:	fef42623          	sw	a5,-20(s0)
    80007426:	fec42703          	lw	a4,-20(s0)
    8000742a:	fbc42783          	lw	a5,-68(s0)
    8000742e:	2701                	sext.w	a4,a4
    80007430:	2781                	sext.w	a5,a5
    80007432:	f6f74ce3          	blt	a4,a5,800073aa <piperead+0x88>
    80007436:	a021                	j	8000743e <piperead+0x11c>
      break;
    80007438:	0001                	nop
    8000743a:	a011                	j	8000743e <piperead+0x11c>
      break;
    8000743c:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8000743e:	fc843783          	ld	a5,-56(s0)
    80007442:	21c78793          	addi	a5,a5,540
    80007446:	853e                	mv	a0,a5
    80007448:	ffffc097          	auipc	ra,0xffffc
    8000744c:	390080e7          	jalr	912(ra) # 800037d8 <wakeup>
  release(&pi->lock);
    80007450:	fc843783          	ld	a5,-56(s0)
    80007454:	853e                	mv	a0,a5
    80007456:	ffffa097          	auipc	ra,0xffffa
    8000745a:	e7c080e7          	jalr	-388(ra) # 800012d2 <release>
  return i;
    8000745e:	fec42783          	lw	a5,-20(s0)
}
    80007462:	853e                	mv	a0,a5
    80007464:	60a6                	ld	ra,72(sp)
    80007466:	6406                	ld	s0,64(sp)
    80007468:	6161                	addi	sp,sp,80
    8000746a:	8082                	ret

000000008000746c <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    8000746c:	de010113          	addi	sp,sp,-544
    80007470:	20113c23          	sd	ra,536(sp)
    80007474:	20813823          	sd	s0,528(sp)
    80007478:	20913423          	sd	s1,520(sp)
    8000747c:	1400                	addi	s0,sp,544
    8000747e:	dea43423          	sd	a0,-536(s0)
    80007482:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007486:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    8000748a:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000748e:	ffffb097          	auipc	ra,0xffffb
    80007492:	38a080e7          	jalr	906(ra) # 80002818 <myproc>
    80007496:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    8000749a:	fffff097          	auipc	ra,0xfffff
    8000749e:	f92080e7          	jalr	-110(ra) # 8000642c <begin_op>

  if((ip = namei(path)) == 0){
    800074a2:	de843503          	ld	a0,-536(s0)
    800074a6:	fffff097          	auipc	ra,0xfffff
    800074aa:	c22080e7          	jalr	-990(ra) # 800060c8 <namei>
    800074ae:	faa43423          	sd	a0,-88(s0)
    800074b2:	fa843783          	ld	a5,-88(s0)
    800074b6:	e799                	bnez	a5,800074c4 <exec+0x58>
    end_op();
    800074b8:	fffff097          	auipc	ra,0xfffff
    800074bc:	036080e7          	jalr	54(ra) # 800064ee <end_op>
    return -1;
    800074c0:	57fd                	li	a5,-1
    800074c2:	a90d                	j	800078f4 <exec+0x488>
  }
  ilock(ip);
    800074c4:	fa843503          	ld	a0,-88(s0)
    800074c8:	ffffe097          	auipc	ra,0xffffe
    800074cc:	f0a080e7          	jalr	-246(ra) # 800053d2 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800074d0:	e3040793          	addi	a5,s0,-464
    800074d4:	04000713          	li	a4,64
    800074d8:	4681                	li	a3,0
    800074da:	863e                	mv	a2,a5
    800074dc:	4581                	li	a1,0
    800074de:	fa843503          	ld	a0,-88(s0)
    800074e2:	ffffe097          	auipc	ra,0xffffe
    800074e6:	486080e7          	jalr	1158(ra) # 80005968 <readi>
    800074ea:	87aa                	mv	a5,a0
    800074ec:	873e                	mv	a4,a5
    800074ee:	04000793          	li	a5,64
    800074f2:	38f71b63          	bne	a4,a5,80007888 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    800074f6:	e3042783          	lw	a5,-464(s0)
    800074fa:	873e                	mv	a4,a5
    800074fc:	464c47b7          	lui	a5,0x464c4
    80007500:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007504:	38f71463          	bne	a4,a5,8000788c <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80007508:	f9843503          	ld	a0,-104(s0)
    8000750c:	ffffb097          	auipc	ra,0xffffb
    80007510:	56e080e7          	jalr	1390(ra) # 80002a7a <proc_pagetable>
    80007514:	faa43023          	sd	a0,-96(s0)
    80007518:	fa043783          	ld	a5,-96(s0)
    8000751c:	36078a63          	beqz	a5,80007890 <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007520:	fc042623          	sw	zero,-52(s0)
    80007524:	e5043783          	ld	a5,-432(s0)
    80007528:	fcf42423          	sw	a5,-56(s0)
    8000752c:	a8e1                	j	80007604 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8000752e:	df840793          	addi	a5,s0,-520
    80007532:	fc842683          	lw	a3,-56(s0)
    80007536:	03800713          	li	a4,56
    8000753a:	863e                	mv	a2,a5
    8000753c:	4581                	li	a1,0
    8000753e:	fa843503          	ld	a0,-88(s0)
    80007542:	ffffe097          	auipc	ra,0xffffe
    80007546:	426080e7          	jalr	1062(ra) # 80005968 <readi>
    8000754a:	87aa                	mv	a5,a0
    8000754c:	873e                	mv	a4,a5
    8000754e:	03800793          	li	a5,56
    80007552:	34f71163          	bne	a4,a5,80007894 <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007556:	df842783          	lw	a5,-520(s0)
    8000755a:	873e                	mv	a4,a5
    8000755c:	4785                	li	a5,1
    8000755e:	08f71663          	bne	a4,a5,800075ea <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    80007562:	e2043703          	ld	a4,-480(s0)
    80007566:	e1843783          	ld	a5,-488(s0)
    8000756a:	32f76763          	bltu	a4,a5,80007898 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8000756e:	e0843703          	ld	a4,-504(s0)
    80007572:	e2043783          	ld	a5,-480(s0)
    80007576:	973e                	add	a4,a4,a5
    80007578:	e0843783          	ld	a5,-504(s0)
    8000757c:	32f76063          	bltu	a4,a5,8000789c <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80007580:	e0843703          	ld	a4,-504(s0)
    80007584:	e2043783          	ld	a5,-480(s0)
    80007588:	97ba                	add	a5,a5,a4
    8000758a:	863e                	mv	a2,a5
    8000758c:	fb843583          	ld	a1,-72(s0)
    80007590:	fa043503          	ld	a0,-96(s0)
    80007594:	ffffb097          	auipc	ra,0xffffb
    80007598:	974080e7          	jalr	-1676(ra) # 80001f08 <uvmalloc>
    8000759c:	f6a43823          	sd	a0,-144(s0)
    800075a0:	f7043783          	ld	a5,-144(s0)
    800075a4:	2e078e63          	beqz	a5,800078a0 <exec+0x434>
      goto bad;
    sz = sz1;
    800075a8:	f7043783          	ld	a5,-144(s0)
    800075ac:	faf43c23          	sd	a5,-72(s0)
    if((ph.vaddr % PGSIZE) != 0)
    800075b0:	e0843703          	ld	a4,-504(s0)
    800075b4:	6785                	lui	a5,0x1
    800075b6:	17fd                	addi	a5,a5,-1
    800075b8:	8ff9                	and	a5,a5,a4
    800075ba:	2e079563          	bnez	a5,800078a4 <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800075be:	e0843783          	ld	a5,-504(s0)
    800075c2:	e0043703          	ld	a4,-512(s0)
    800075c6:	0007069b          	sext.w	a3,a4
    800075ca:	e1843703          	ld	a4,-488(s0)
    800075ce:	2701                	sext.w	a4,a4
    800075d0:	fa843603          	ld	a2,-88(s0)
    800075d4:	85be                	mv	a1,a5
    800075d6:	fa043503          	ld	a0,-96(s0)
    800075da:	00000097          	auipc	ra,0x0
    800075de:	32e080e7          	jalr	814(ra) # 80007908 <loadseg>
    800075e2:	87aa                	mv	a5,a0
    800075e4:	2c07c263          	bltz	a5,800078a8 <exec+0x43c>
    800075e8:	a011                	j	800075ec <exec+0x180>
      continue;
    800075ea:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800075ec:	fcc42783          	lw	a5,-52(s0)
    800075f0:	2785                	addiw	a5,a5,1
    800075f2:	fcf42623          	sw	a5,-52(s0)
    800075f6:	fc842783          	lw	a5,-56(s0)
    800075fa:	0387879b          	addiw	a5,a5,56
    800075fe:	2781                	sext.w	a5,a5
    80007600:	fcf42423          	sw	a5,-56(s0)
    80007604:	e6845783          	lhu	a5,-408(s0)
    80007608:	0007871b          	sext.w	a4,a5
    8000760c:	fcc42783          	lw	a5,-52(s0)
    80007610:	2781                	sext.w	a5,a5
    80007612:	f0e7cee3          	blt	a5,a4,8000752e <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007616:	fa843503          	ld	a0,-88(s0)
    8000761a:	ffffe097          	auipc	ra,0xffffe
    8000761e:	016080e7          	jalr	22(ra) # 80005630 <iunlockput>
  end_op();
    80007622:	fffff097          	auipc	ra,0xfffff
    80007626:	ecc080e7          	jalr	-308(ra) # 800064ee <end_op>
  ip = 0;
    8000762a:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    8000762e:	ffffb097          	auipc	ra,0xffffb
    80007632:	1ea080e7          	jalr	490(ra) # 80002818 <myproc>
    80007636:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    8000763a:	f9843783          	ld	a5,-104(s0)
    8000763e:	67bc                	ld	a5,72(a5)
    80007640:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007644:	fb843703          	ld	a4,-72(s0)
    80007648:	6785                	lui	a5,0x1
    8000764a:	17fd                	addi	a5,a5,-1
    8000764c:	973e                	add	a4,a4,a5
    8000764e:	77fd                	lui	a5,0xfffff
    80007650:	8ff9                	and	a5,a5,a4
    80007652:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    80007656:	fb843703          	ld	a4,-72(s0)
    8000765a:	6789                	lui	a5,0x2
    8000765c:	97ba                	add	a5,a5,a4
    8000765e:	863e                	mv	a2,a5
    80007660:	fb843583          	ld	a1,-72(s0)
    80007664:	fa043503          	ld	a0,-96(s0)
    80007668:	ffffb097          	auipc	ra,0xffffb
    8000766c:	8a0080e7          	jalr	-1888(ra) # 80001f08 <uvmalloc>
    80007670:	f8a43423          	sd	a0,-120(s0)
    80007674:	f8843783          	ld	a5,-120(s0)
    80007678:	22078a63          	beqz	a5,800078ac <exec+0x440>
    goto bad;
  sz = sz1;
    8000767c:	f8843783          	ld	a5,-120(s0)
    80007680:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007684:	fb843703          	ld	a4,-72(s0)
    80007688:	77f9                	lui	a5,0xffffe
    8000768a:	97ba                	add	a5,a5,a4
    8000768c:	85be                	mv	a1,a5
    8000768e:	fa043503          	ld	a0,-96(s0)
    80007692:	ffffb097          	auipc	ra,0xffffb
    80007696:	bfe080e7          	jalr	-1026(ra) # 80002290 <uvmclear>
  sp = sz;
    8000769a:	fb843783          	ld	a5,-72(s0)
    8000769e:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800076a2:	fb043703          	ld	a4,-80(s0)
    800076a6:	77fd                	lui	a5,0xfffff
    800076a8:	97ba                	add	a5,a5,a4
    800076aa:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800076ae:	fc043023          	sd	zero,-64(s0)
    800076b2:	a845                	j	80007762 <exec+0x2f6>
    if(argc >= MAXARG)
    800076b4:	fc043703          	ld	a4,-64(s0)
    800076b8:	47fd                	li	a5,31
    800076ba:	1ee7eb63          	bltu	a5,a4,800078b0 <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800076be:	fc043783          	ld	a5,-64(s0)
    800076c2:	078e                	slli	a5,a5,0x3
    800076c4:	de043703          	ld	a4,-544(s0)
    800076c8:	97ba                	add	a5,a5,a4
    800076ca:	639c                	ld	a5,0(a5)
    800076cc:	853e                	mv	a0,a5
    800076ce:	ffffa097          	auipc	ra,0xffffa
    800076d2:	0f2080e7          	jalr	242(ra) # 800017c0 <strlen>
    800076d6:	87aa                	mv	a5,a0
    800076d8:	2785                	addiw	a5,a5,1
    800076da:	2781                	sext.w	a5,a5
    800076dc:	873e                	mv	a4,a5
    800076de:	fb043783          	ld	a5,-80(s0)
    800076e2:	8f99                	sub	a5,a5,a4
    800076e4:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800076e8:	fb043783          	ld	a5,-80(s0)
    800076ec:	9bc1                	andi	a5,a5,-16
    800076ee:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800076f2:	fb043703          	ld	a4,-80(s0)
    800076f6:	f8043783          	ld	a5,-128(s0)
    800076fa:	1af76d63          	bltu	a4,a5,800078b4 <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800076fe:	fc043783          	ld	a5,-64(s0)
    80007702:	078e                	slli	a5,a5,0x3
    80007704:	de043703          	ld	a4,-544(s0)
    80007708:	97ba                	add	a5,a5,a4
    8000770a:	6384                	ld	s1,0(a5)
    8000770c:	fc043783          	ld	a5,-64(s0)
    80007710:	078e                	slli	a5,a5,0x3
    80007712:	de043703          	ld	a4,-544(s0)
    80007716:	97ba                	add	a5,a5,a4
    80007718:	639c                	ld	a5,0(a5)
    8000771a:	853e                	mv	a0,a5
    8000771c:	ffffa097          	auipc	ra,0xffffa
    80007720:	0a4080e7          	jalr	164(ra) # 800017c0 <strlen>
    80007724:	87aa                	mv	a5,a0
    80007726:	2785                	addiw	a5,a5,1
    80007728:	2781                	sext.w	a5,a5
    8000772a:	86be                	mv	a3,a5
    8000772c:	8626                	mv	a2,s1
    8000772e:	fb043583          	ld	a1,-80(s0)
    80007732:	fa043503          	ld	a0,-96(s0)
    80007736:	ffffb097          	auipc	ra,0xffffb
    8000773a:	bb0080e7          	jalr	-1104(ra) # 800022e6 <copyout>
    8000773e:	87aa                	mv	a5,a0
    80007740:	1607cc63          	bltz	a5,800078b8 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    80007744:	fc043783          	ld	a5,-64(s0)
    80007748:	078e                	slli	a5,a5,0x3
    8000774a:	fe040713          	addi	a4,s0,-32
    8000774e:	97ba                	add	a5,a5,a4
    80007750:	fb043703          	ld	a4,-80(s0)
    80007754:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd5e90>
  for(argc = 0; argv[argc]; argc++) {
    80007758:	fc043783          	ld	a5,-64(s0)
    8000775c:	0785                	addi	a5,a5,1
    8000775e:	fcf43023          	sd	a5,-64(s0)
    80007762:	fc043783          	ld	a5,-64(s0)
    80007766:	078e                	slli	a5,a5,0x3
    80007768:	de043703          	ld	a4,-544(s0)
    8000776c:	97ba                	add	a5,a5,a4
    8000776e:	639c                	ld	a5,0(a5)
    80007770:	f3b1                	bnez	a5,800076b4 <exec+0x248>
  }
  ustack[argc] = 0;
    80007772:	fc043783          	ld	a5,-64(s0)
    80007776:	078e                	slli	a5,a5,0x3
    80007778:	fe040713          	addi	a4,s0,-32
    8000777c:	97ba                	add	a5,a5,a4
    8000777e:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007782:	fc043783          	ld	a5,-64(s0)
    80007786:	0785                	addi	a5,a5,1
    80007788:	078e                	slli	a5,a5,0x3
    8000778a:	fb043703          	ld	a4,-80(s0)
    8000778e:	40f707b3          	sub	a5,a4,a5
    80007792:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007796:	fb043783          	ld	a5,-80(s0)
    8000779a:	9bc1                	andi	a5,a5,-16
    8000779c:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800077a0:	fb043703          	ld	a4,-80(s0)
    800077a4:	f8043783          	ld	a5,-128(s0)
    800077a8:	10f76a63          	bltu	a4,a5,800078bc <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800077ac:	fc043783          	ld	a5,-64(s0)
    800077b0:	0785                	addi	a5,a5,1
    800077b2:	00379713          	slli	a4,a5,0x3
    800077b6:	e7040793          	addi	a5,s0,-400
    800077ba:	86ba                	mv	a3,a4
    800077bc:	863e                	mv	a2,a5
    800077be:	fb043583          	ld	a1,-80(s0)
    800077c2:	fa043503          	ld	a0,-96(s0)
    800077c6:	ffffb097          	auipc	ra,0xffffb
    800077ca:	b20080e7          	jalr	-1248(ra) # 800022e6 <copyout>
    800077ce:	87aa                	mv	a5,a0
    800077d0:	0e07c863          	bltz	a5,800078c0 <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800077d4:	f9843783          	ld	a5,-104(s0)
    800077d8:	6fbc                	ld	a5,88(a5)
    800077da:	fb043703          	ld	a4,-80(s0)
    800077de:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800077e0:	de843783          	ld	a5,-536(s0)
    800077e4:	fcf43c23          	sd	a5,-40(s0)
    800077e8:	fd843783          	ld	a5,-40(s0)
    800077ec:	fcf43823          	sd	a5,-48(s0)
    800077f0:	a025                	j	80007818 <exec+0x3ac>
    if(*s == '/')
    800077f2:	fd843783          	ld	a5,-40(s0)
    800077f6:	0007c783          	lbu	a5,0(a5)
    800077fa:	873e                	mv	a4,a5
    800077fc:	02f00793          	li	a5,47
    80007800:	00f71763          	bne	a4,a5,8000780e <exec+0x3a2>
      last = s+1;
    80007804:	fd843783          	ld	a5,-40(s0)
    80007808:	0785                	addi	a5,a5,1
    8000780a:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    8000780e:	fd843783          	ld	a5,-40(s0)
    80007812:	0785                	addi	a5,a5,1
    80007814:	fcf43c23          	sd	a5,-40(s0)
    80007818:	fd843783          	ld	a5,-40(s0)
    8000781c:	0007c783          	lbu	a5,0(a5)
    80007820:	fbe9                	bnez	a5,800077f2 <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    80007822:	f9843783          	ld	a5,-104(s0)
    80007826:	15878793          	addi	a5,a5,344
    8000782a:	4641                	li	a2,16
    8000782c:	fd043583          	ld	a1,-48(s0)
    80007830:	853e                	mv	a0,a5
    80007832:	ffffa097          	auipc	ra,0xffffa
    80007836:	f14080e7          	jalr	-236(ra) # 80001746 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    8000783a:	f9843783          	ld	a5,-104(s0)
    8000783e:	6bbc                	ld	a5,80(a5)
    80007840:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007844:	f9843783          	ld	a5,-104(s0)
    80007848:	fa043703          	ld	a4,-96(s0)
    8000784c:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    8000784e:	f9843783          	ld	a5,-104(s0)
    80007852:	fb843703          	ld	a4,-72(s0)
    80007856:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007858:	f9843783          	ld	a5,-104(s0)
    8000785c:	6fbc                	ld	a5,88(a5)
    8000785e:	e4843703          	ld	a4,-440(s0)
    80007862:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007864:	f9843783          	ld	a5,-104(s0)
    80007868:	6fbc                	ld	a5,88(a5)
    8000786a:	fb043703          	ld	a4,-80(s0)
    8000786e:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007870:	f9043583          	ld	a1,-112(s0)
    80007874:	f7843503          	ld	a0,-136(s0)
    80007878:	ffffb097          	auipc	ra,0xffffb
    8000787c:	2c2080e7          	jalr	706(ra) # 80002b3a <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007880:	fc043783          	ld	a5,-64(s0)
    80007884:	2781                	sext.w	a5,a5
    80007886:	a0bd                	j	800078f4 <exec+0x488>
    goto bad;
    80007888:	0001                	nop
    8000788a:	a825                	j	800078c2 <exec+0x456>
    goto bad;
    8000788c:	0001                	nop
    8000788e:	a815                	j	800078c2 <exec+0x456>
    goto bad;
    80007890:	0001                	nop
    80007892:	a805                	j	800078c2 <exec+0x456>
      goto bad;
    80007894:	0001                	nop
    80007896:	a035                	j	800078c2 <exec+0x456>
      goto bad;
    80007898:	0001                	nop
    8000789a:	a025                	j	800078c2 <exec+0x456>
      goto bad;
    8000789c:	0001                	nop
    8000789e:	a015                	j	800078c2 <exec+0x456>
      goto bad;
    800078a0:	0001                	nop
    800078a2:	a005                	j	800078c2 <exec+0x456>
      goto bad;
    800078a4:	0001                	nop
    800078a6:	a831                	j	800078c2 <exec+0x456>
      goto bad;
    800078a8:	0001                	nop
    800078aa:	a821                	j	800078c2 <exec+0x456>
    goto bad;
    800078ac:	0001                	nop
    800078ae:	a811                	j	800078c2 <exec+0x456>
      goto bad;
    800078b0:	0001                	nop
    800078b2:	a801                	j	800078c2 <exec+0x456>
      goto bad;
    800078b4:	0001                	nop
    800078b6:	a031                	j	800078c2 <exec+0x456>
      goto bad;
    800078b8:	0001                	nop
    800078ba:	a021                	j	800078c2 <exec+0x456>
    goto bad;
    800078bc:	0001                	nop
    800078be:	a011                	j	800078c2 <exec+0x456>
    goto bad;
    800078c0:	0001                	nop

 bad:
  if(pagetable)
    800078c2:	fa043783          	ld	a5,-96(s0)
    800078c6:	cb89                	beqz	a5,800078d8 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    800078c8:	fb843583          	ld	a1,-72(s0)
    800078cc:	fa043503          	ld	a0,-96(s0)
    800078d0:	ffffb097          	auipc	ra,0xffffb
    800078d4:	26a080e7          	jalr	618(ra) # 80002b3a <proc_freepagetable>
  if(ip){
    800078d8:	fa843783          	ld	a5,-88(s0)
    800078dc:	cb99                	beqz	a5,800078f2 <exec+0x486>
    iunlockput(ip);
    800078de:	fa843503          	ld	a0,-88(s0)
    800078e2:	ffffe097          	auipc	ra,0xffffe
    800078e6:	d4e080e7          	jalr	-690(ra) # 80005630 <iunlockput>
    end_op();
    800078ea:	fffff097          	auipc	ra,0xfffff
    800078ee:	c04080e7          	jalr	-1020(ra) # 800064ee <end_op>
  }
  return -1;
    800078f2:	57fd                	li	a5,-1
}
    800078f4:	853e                	mv	a0,a5
    800078f6:	21813083          	ld	ra,536(sp)
    800078fa:	21013403          	ld	s0,528(sp)
    800078fe:	20813483          	ld	s1,520(sp)
    80007902:	22010113          	addi	sp,sp,544
    80007906:	8082                	ret

0000000080007908 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007908:	7139                	addi	sp,sp,-64
    8000790a:	fc06                	sd	ra,56(sp)
    8000790c:	f822                	sd	s0,48(sp)
    8000790e:	0080                	addi	s0,sp,64
    80007910:	fca43c23          	sd	a0,-40(s0)
    80007914:	fcb43823          	sd	a1,-48(s0)
    80007918:	fcc43423          	sd	a2,-56(s0)
    8000791c:	87b6                	mv	a5,a3
    8000791e:	fcf42223          	sw	a5,-60(s0)
    80007922:	87ba                	mv	a5,a4
    80007924:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007928:	fe042623          	sw	zero,-20(s0)
    8000792c:	a05d                	j	800079d2 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    8000792e:	fec46703          	lwu	a4,-20(s0)
    80007932:	fd043783          	ld	a5,-48(s0)
    80007936:	97ba                	add	a5,a5,a4
    80007938:	85be                	mv	a1,a5
    8000793a:	fd843503          	ld	a0,-40(s0)
    8000793e:	ffffa097          	auipc	ra,0xffffa
    80007942:	256080e7          	jalr	598(ra) # 80001b94 <walkaddr>
    80007946:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000794a:	fe043783          	ld	a5,-32(s0)
    8000794e:	eb89                	bnez	a5,80007960 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007950:	00004517          	auipc	a0,0x4
    80007954:	ce050513          	addi	a0,a0,-800 # 8000b630 <etext+0x630>
    80007958:	ffff9097          	auipc	ra,0xffff9
    8000795c:	326080e7          	jalr	806(ra) # 80000c7e <panic>
    if(sz - i < PGSIZE)
    80007960:	fc042703          	lw	a4,-64(s0)
    80007964:	fec42783          	lw	a5,-20(s0)
    80007968:	40f707bb          	subw	a5,a4,a5
    8000796c:	2781                	sext.w	a5,a5
    8000796e:	873e                	mv	a4,a5
    80007970:	6785                	lui	a5,0x1
    80007972:	00f77b63          	bgeu	a4,a5,80007988 <loadseg+0x80>
      n = sz - i;
    80007976:	fc042703          	lw	a4,-64(s0)
    8000797a:	fec42783          	lw	a5,-20(s0)
    8000797e:	40f707bb          	subw	a5,a4,a5
    80007982:	fef42423          	sw	a5,-24(s0)
    80007986:	a021                	j	8000798e <loadseg+0x86>
    else
      n = PGSIZE;
    80007988:	6785                	lui	a5,0x1
    8000798a:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    8000798e:	fc442703          	lw	a4,-60(s0)
    80007992:	fec42783          	lw	a5,-20(s0)
    80007996:	9fb9                	addw	a5,a5,a4
    80007998:	2781                	sext.w	a5,a5
    8000799a:	fe842703          	lw	a4,-24(s0)
    8000799e:	86be                	mv	a3,a5
    800079a0:	fe043603          	ld	a2,-32(s0)
    800079a4:	4581                	li	a1,0
    800079a6:	fc843503          	ld	a0,-56(s0)
    800079aa:	ffffe097          	auipc	ra,0xffffe
    800079ae:	fbe080e7          	jalr	-66(ra) # 80005968 <readi>
    800079b2:	87aa                	mv	a5,a0
    800079b4:	0007871b          	sext.w	a4,a5
    800079b8:	fe842783          	lw	a5,-24(s0)
    800079bc:	2781                	sext.w	a5,a5
    800079be:	00e78463          	beq	a5,a4,800079c6 <loadseg+0xbe>
      return -1;
    800079c2:	57fd                	li	a5,-1
    800079c4:	a005                	j	800079e4 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    800079c6:	fec42703          	lw	a4,-20(s0)
    800079ca:	6785                	lui	a5,0x1
    800079cc:	9fb9                	addw	a5,a5,a4
    800079ce:	fef42623          	sw	a5,-20(s0)
    800079d2:	fec42703          	lw	a4,-20(s0)
    800079d6:	fc042783          	lw	a5,-64(s0)
    800079da:	2701                	sext.w	a4,a4
    800079dc:	2781                	sext.w	a5,a5
    800079de:	f4f768e3          	bltu	a4,a5,8000792e <loadseg+0x26>
  }
  
  return 0;
    800079e2:	4781                	li	a5,0
}
    800079e4:	853e                	mv	a0,a5
    800079e6:	70e2                	ld	ra,56(sp)
    800079e8:	7442                	ld	s0,48(sp)
    800079ea:	6121                	addi	sp,sp,64
    800079ec:	8082                	ret

00000000800079ee <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800079ee:	7139                	addi	sp,sp,-64
    800079f0:	fc06                	sd	ra,56(sp)
    800079f2:	f822                	sd	s0,48(sp)
    800079f4:	0080                	addi	s0,sp,64
    800079f6:	87aa                	mv	a5,a0
    800079f8:	fcb43823          	sd	a1,-48(s0)
    800079fc:	fcc43423          	sd	a2,-56(s0)
    80007a00:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007a04:	fe440713          	addi	a4,s0,-28
    80007a08:	fdc42783          	lw	a5,-36(s0)
    80007a0c:	85ba                	mv	a1,a4
    80007a0e:	853e                	mv	a0,a5
    80007a10:	ffffd097          	auipc	ra,0xffffd
    80007a14:	972080e7          	jalr	-1678(ra) # 80004382 <argint>
    80007a18:	87aa                	mv	a5,a0
    80007a1a:	0007d463          	bgez	a5,80007a22 <argfd+0x34>
    return -1;
    80007a1e:	57fd                	li	a5,-1
    80007a20:	a8b1                	j	80007a7c <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007a22:	fe442783          	lw	a5,-28(s0)
    80007a26:	0207c863          	bltz	a5,80007a56 <argfd+0x68>
    80007a2a:	fe442783          	lw	a5,-28(s0)
    80007a2e:	873e                	mv	a4,a5
    80007a30:	47bd                	li	a5,15
    80007a32:	02e7c263          	blt	a5,a4,80007a56 <argfd+0x68>
    80007a36:	ffffb097          	auipc	ra,0xffffb
    80007a3a:	de2080e7          	jalr	-542(ra) # 80002818 <myproc>
    80007a3e:	872a                	mv	a4,a0
    80007a40:	fe442783          	lw	a5,-28(s0)
    80007a44:	07e9                	addi	a5,a5,26
    80007a46:	078e                	slli	a5,a5,0x3
    80007a48:	97ba                	add	a5,a5,a4
    80007a4a:	639c                	ld	a5,0(a5)
    80007a4c:	fef43423          	sd	a5,-24(s0)
    80007a50:	fe843783          	ld	a5,-24(s0)
    80007a54:	e399                	bnez	a5,80007a5a <argfd+0x6c>
    return -1;
    80007a56:	57fd                	li	a5,-1
    80007a58:	a015                	j	80007a7c <argfd+0x8e>
  if(pfd)
    80007a5a:	fd043783          	ld	a5,-48(s0)
    80007a5e:	c791                	beqz	a5,80007a6a <argfd+0x7c>
    *pfd = fd;
    80007a60:	fe442703          	lw	a4,-28(s0)
    80007a64:	fd043783          	ld	a5,-48(s0)
    80007a68:	c398                	sw	a4,0(a5)
  if(pf)
    80007a6a:	fc843783          	ld	a5,-56(s0)
    80007a6e:	c791                	beqz	a5,80007a7a <argfd+0x8c>
    *pf = f;
    80007a70:	fc843783          	ld	a5,-56(s0)
    80007a74:	fe843703          	ld	a4,-24(s0)
    80007a78:	e398                	sd	a4,0(a5)
  return 0;
    80007a7a:	4781                	li	a5,0
}
    80007a7c:	853e                	mv	a0,a5
    80007a7e:	70e2                	ld	ra,56(sp)
    80007a80:	7442                	ld	s0,48(sp)
    80007a82:	6121                	addi	sp,sp,64
    80007a84:	8082                	ret

0000000080007a86 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007a86:	7179                	addi	sp,sp,-48
    80007a88:	f406                	sd	ra,40(sp)
    80007a8a:	f022                	sd	s0,32(sp)
    80007a8c:	1800                	addi	s0,sp,48
    80007a8e:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007a92:	ffffb097          	auipc	ra,0xffffb
    80007a96:	d86080e7          	jalr	-634(ra) # 80002818 <myproc>
    80007a9a:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007a9e:	fe042623          	sw	zero,-20(s0)
    80007aa2:	a825                	j	80007ada <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007aa4:	fe043703          	ld	a4,-32(s0)
    80007aa8:	fec42783          	lw	a5,-20(s0)
    80007aac:	07e9                	addi	a5,a5,26
    80007aae:	078e                	slli	a5,a5,0x3
    80007ab0:	97ba                	add	a5,a5,a4
    80007ab2:	639c                	ld	a5,0(a5)
    80007ab4:	ef91                	bnez	a5,80007ad0 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007ab6:	fe043703          	ld	a4,-32(s0)
    80007aba:	fec42783          	lw	a5,-20(s0)
    80007abe:	07e9                	addi	a5,a5,26
    80007ac0:	078e                	slli	a5,a5,0x3
    80007ac2:	97ba                	add	a5,a5,a4
    80007ac4:	fd843703          	ld	a4,-40(s0)
    80007ac8:	e398                	sd	a4,0(a5)
      return fd;
    80007aca:	fec42783          	lw	a5,-20(s0)
    80007ace:	a831                	j	80007aea <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007ad0:	fec42783          	lw	a5,-20(s0)
    80007ad4:	2785                	addiw	a5,a5,1
    80007ad6:	fef42623          	sw	a5,-20(s0)
    80007ada:	fec42783          	lw	a5,-20(s0)
    80007ade:	0007871b          	sext.w	a4,a5
    80007ae2:	47bd                	li	a5,15
    80007ae4:	fce7d0e3          	bge	a5,a4,80007aa4 <fdalloc+0x1e>
    }
  }
  return -1;
    80007ae8:	57fd                	li	a5,-1
}
    80007aea:	853e                	mv	a0,a5
    80007aec:	70a2                	ld	ra,40(sp)
    80007aee:	7402                	ld	s0,32(sp)
    80007af0:	6145                	addi	sp,sp,48
    80007af2:	8082                	ret

0000000080007af4 <sys_dup>:

uint64
sys_dup(void)
{
    80007af4:	1101                	addi	sp,sp,-32
    80007af6:	ec06                	sd	ra,24(sp)
    80007af8:	e822                	sd	s0,16(sp)
    80007afa:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007afc:	fe040793          	addi	a5,s0,-32
    80007b00:	863e                	mv	a2,a5
    80007b02:	4581                	li	a1,0
    80007b04:	4501                	li	a0,0
    80007b06:	00000097          	auipc	ra,0x0
    80007b0a:	ee8080e7          	jalr	-280(ra) # 800079ee <argfd>
    80007b0e:	87aa                	mv	a5,a0
    80007b10:	0007d463          	bgez	a5,80007b18 <sys_dup+0x24>
    return -1;
    80007b14:	57fd                	li	a5,-1
    80007b16:	a81d                	j	80007b4c <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007b18:	fe043783          	ld	a5,-32(s0)
    80007b1c:	853e                	mv	a0,a5
    80007b1e:	00000097          	auipc	ra,0x0
    80007b22:	f68080e7          	jalr	-152(ra) # 80007a86 <fdalloc>
    80007b26:	87aa                	mv	a5,a0
    80007b28:	fef42623          	sw	a5,-20(s0)
    80007b2c:	fec42783          	lw	a5,-20(s0)
    80007b30:	2781                	sext.w	a5,a5
    80007b32:	0007d463          	bgez	a5,80007b3a <sys_dup+0x46>
    return -1;
    80007b36:	57fd                	li	a5,-1
    80007b38:	a811                	j	80007b4c <sys_dup+0x58>
  filedup(f);
    80007b3a:	fe043783          	ld	a5,-32(s0)
    80007b3e:	853e                	mv	a0,a5
    80007b40:	fffff097          	auipc	ra,0xfffff
    80007b44:	f20080e7          	jalr	-224(ra) # 80006a60 <filedup>
  return fd;
    80007b48:	fec42783          	lw	a5,-20(s0)
}
    80007b4c:	853e                	mv	a0,a5
    80007b4e:	60e2                	ld	ra,24(sp)
    80007b50:	6442                	ld	s0,16(sp)
    80007b52:	6105                	addi	sp,sp,32
    80007b54:	8082                	ret

0000000080007b56 <sys_read>:

uint64
sys_read(void)
{
    80007b56:	7179                	addi	sp,sp,-48
    80007b58:	f406                	sd	ra,40(sp)
    80007b5a:	f022                	sd	s0,32(sp)
    80007b5c:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007b5e:	fe840793          	addi	a5,s0,-24
    80007b62:	863e                	mv	a2,a5
    80007b64:	4581                	li	a1,0
    80007b66:	4501                	li	a0,0
    80007b68:	00000097          	auipc	ra,0x0
    80007b6c:	e86080e7          	jalr	-378(ra) # 800079ee <argfd>
    80007b70:	87aa                	mv	a5,a0
    80007b72:	0207c863          	bltz	a5,80007ba2 <sys_read+0x4c>
    80007b76:	fe440793          	addi	a5,s0,-28
    80007b7a:	85be                	mv	a1,a5
    80007b7c:	4509                	li	a0,2
    80007b7e:	ffffd097          	auipc	ra,0xffffd
    80007b82:	804080e7          	jalr	-2044(ra) # 80004382 <argint>
    80007b86:	87aa                	mv	a5,a0
    80007b88:	0007cd63          	bltz	a5,80007ba2 <sys_read+0x4c>
    80007b8c:	fd840793          	addi	a5,s0,-40
    80007b90:	85be                	mv	a1,a5
    80007b92:	4505                	li	a0,1
    80007b94:	ffffd097          	auipc	ra,0xffffd
    80007b98:	826080e7          	jalr	-2010(ra) # 800043ba <argaddr>
    80007b9c:	87aa                	mv	a5,a0
    80007b9e:	0007d463          	bgez	a5,80007ba6 <sys_read+0x50>
    return -1;
    80007ba2:	57fd                	li	a5,-1
    80007ba4:	a839                	j	80007bc2 <sys_read+0x6c>
  return fileread(f, p, n);
    80007ba6:	fe843783          	ld	a5,-24(s0)
    80007baa:	fd843703          	ld	a4,-40(s0)
    80007bae:	fe442683          	lw	a3,-28(s0)
    80007bb2:	8636                	mv	a2,a3
    80007bb4:	85ba                	mv	a1,a4
    80007bb6:	853e                	mv	a0,a5
    80007bb8:	fffff097          	auipc	ra,0xfffff
    80007bbc:	0ba080e7          	jalr	186(ra) # 80006c72 <fileread>
    80007bc0:	87aa                	mv	a5,a0
}
    80007bc2:	853e                	mv	a0,a5
    80007bc4:	70a2                	ld	ra,40(sp)
    80007bc6:	7402                	ld	s0,32(sp)
    80007bc8:	6145                	addi	sp,sp,48
    80007bca:	8082                	ret

0000000080007bcc <sys_write>:

uint64
sys_write(void)
{
    80007bcc:	7179                	addi	sp,sp,-48
    80007bce:	f406                	sd	ra,40(sp)
    80007bd0:	f022                	sd	s0,32(sp)
    80007bd2:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007bd4:	fe840793          	addi	a5,s0,-24
    80007bd8:	863e                	mv	a2,a5
    80007bda:	4581                	li	a1,0
    80007bdc:	4501                	li	a0,0
    80007bde:	00000097          	auipc	ra,0x0
    80007be2:	e10080e7          	jalr	-496(ra) # 800079ee <argfd>
    80007be6:	87aa                	mv	a5,a0
    80007be8:	0207c863          	bltz	a5,80007c18 <sys_write+0x4c>
    80007bec:	fe440793          	addi	a5,s0,-28
    80007bf0:	85be                	mv	a1,a5
    80007bf2:	4509                	li	a0,2
    80007bf4:	ffffc097          	auipc	ra,0xffffc
    80007bf8:	78e080e7          	jalr	1934(ra) # 80004382 <argint>
    80007bfc:	87aa                	mv	a5,a0
    80007bfe:	0007cd63          	bltz	a5,80007c18 <sys_write+0x4c>
    80007c02:	fd840793          	addi	a5,s0,-40
    80007c06:	85be                	mv	a1,a5
    80007c08:	4505                	li	a0,1
    80007c0a:	ffffc097          	auipc	ra,0xffffc
    80007c0e:	7b0080e7          	jalr	1968(ra) # 800043ba <argaddr>
    80007c12:	87aa                	mv	a5,a0
    80007c14:	0007d463          	bgez	a5,80007c1c <sys_write+0x50>
    return -1;
    80007c18:	57fd                	li	a5,-1
    80007c1a:	a839                	j	80007c38 <sys_write+0x6c>

  return filewrite(f, p, n);
    80007c1c:	fe843783          	ld	a5,-24(s0)
    80007c20:	fd843703          	ld	a4,-40(s0)
    80007c24:	fe442683          	lw	a3,-28(s0)
    80007c28:	8636                	mv	a2,a3
    80007c2a:	85ba                	mv	a1,a4
    80007c2c:	853e                	mv	a0,a5
    80007c2e:	fffff097          	auipc	ra,0xfffff
    80007c32:	1aa080e7          	jalr	426(ra) # 80006dd8 <filewrite>
    80007c36:	87aa                	mv	a5,a0
}
    80007c38:	853e                	mv	a0,a5
    80007c3a:	70a2                	ld	ra,40(sp)
    80007c3c:	7402                	ld	s0,32(sp)
    80007c3e:	6145                	addi	sp,sp,48
    80007c40:	8082                	ret

0000000080007c42 <sys_close>:

uint64
sys_close(void)
{
    80007c42:	1101                	addi	sp,sp,-32
    80007c44:	ec06                	sd	ra,24(sp)
    80007c46:	e822                	sd	s0,16(sp)
    80007c48:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007c4a:	fe040713          	addi	a4,s0,-32
    80007c4e:	fec40793          	addi	a5,s0,-20
    80007c52:	863a                	mv	a2,a4
    80007c54:	85be                	mv	a1,a5
    80007c56:	4501                	li	a0,0
    80007c58:	00000097          	auipc	ra,0x0
    80007c5c:	d96080e7          	jalr	-618(ra) # 800079ee <argfd>
    80007c60:	87aa                	mv	a5,a0
    80007c62:	0007d463          	bgez	a5,80007c6a <sys_close+0x28>
    return -1;
    80007c66:	57fd                	li	a5,-1
    80007c68:	a02d                	j	80007c92 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007c6a:	ffffb097          	auipc	ra,0xffffb
    80007c6e:	bae080e7          	jalr	-1106(ra) # 80002818 <myproc>
    80007c72:	872a                	mv	a4,a0
    80007c74:	fec42783          	lw	a5,-20(s0)
    80007c78:	07e9                	addi	a5,a5,26
    80007c7a:	078e                	slli	a5,a5,0x3
    80007c7c:	97ba                	add	a5,a5,a4
    80007c7e:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007c82:	fe043783          	ld	a5,-32(s0)
    80007c86:	853e                	mv	a0,a5
    80007c88:	fffff097          	auipc	ra,0xfffff
    80007c8c:	e3e080e7          	jalr	-450(ra) # 80006ac6 <fileclose>
  return 0;
    80007c90:	4781                	li	a5,0
}
    80007c92:	853e                	mv	a0,a5
    80007c94:	60e2                	ld	ra,24(sp)
    80007c96:	6442                	ld	s0,16(sp)
    80007c98:	6105                	addi	sp,sp,32
    80007c9a:	8082                	ret

0000000080007c9c <sys_fstat>:

uint64
sys_fstat(void)
{
    80007c9c:	1101                	addi	sp,sp,-32
    80007c9e:	ec06                	sd	ra,24(sp)
    80007ca0:	e822                	sd	s0,16(sp)
    80007ca2:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80007ca4:	fe840793          	addi	a5,s0,-24
    80007ca8:	863e                	mv	a2,a5
    80007caa:	4581                	li	a1,0
    80007cac:	4501                	li	a0,0
    80007cae:	00000097          	auipc	ra,0x0
    80007cb2:	d40080e7          	jalr	-704(ra) # 800079ee <argfd>
    80007cb6:	87aa                	mv	a5,a0
    80007cb8:	0007cd63          	bltz	a5,80007cd2 <sys_fstat+0x36>
    80007cbc:	fe040793          	addi	a5,s0,-32
    80007cc0:	85be                	mv	a1,a5
    80007cc2:	4505                	li	a0,1
    80007cc4:	ffffc097          	auipc	ra,0xffffc
    80007cc8:	6f6080e7          	jalr	1782(ra) # 800043ba <argaddr>
    80007ccc:	87aa                	mv	a5,a0
    80007cce:	0007d463          	bgez	a5,80007cd6 <sys_fstat+0x3a>
    return -1;
    80007cd2:	57fd                	li	a5,-1
    80007cd4:	a821                	j	80007cec <sys_fstat+0x50>
  return filestat(f, st);
    80007cd6:	fe843783          	ld	a5,-24(s0)
    80007cda:	fe043703          	ld	a4,-32(s0)
    80007cde:	85ba                	mv	a1,a4
    80007ce0:	853e                	mv	a0,a5
    80007ce2:	fffff097          	auipc	ra,0xfffff
    80007ce6:	eec080e7          	jalr	-276(ra) # 80006bce <filestat>
    80007cea:	87aa                	mv	a5,a0
}
    80007cec:	853e                	mv	a0,a5
    80007cee:	60e2                	ld	ra,24(sp)
    80007cf0:	6442                	ld	s0,16(sp)
    80007cf2:	6105                	addi	sp,sp,32
    80007cf4:	8082                	ret

0000000080007cf6 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007cf6:	7169                	addi	sp,sp,-304
    80007cf8:	f606                	sd	ra,296(sp)
    80007cfa:	f222                	sd	s0,288(sp)
    80007cfc:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007cfe:	ed040793          	addi	a5,s0,-304
    80007d02:	08000613          	li	a2,128
    80007d06:	85be                	mv	a1,a5
    80007d08:	4501                	li	a0,0
    80007d0a:	ffffc097          	auipc	ra,0xffffc
    80007d0e:	6e4080e7          	jalr	1764(ra) # 800043ee <argstr>
    80007d12:	87aa                	mv	a5,a0
    80007d14:	0007cf63          	bltz	a5,80007d32 <sys_link+0x3c>
    80007d18:	f5040793          	addi	a5,s0,-176
    80007d1c:	08000613          	li	a2,128
    80007d20:	85be                	mv	a1,a5
    80007d22:	4505                	li	a0,1
    80007d24:	ffffc097          	auipc	ra,0xffffc
    80007d28:	6ca080e7          	jalr	1738(ra) # 800043ee <argstr>
    80007d2c:	87aa                	mv	a5,a0
    80007d2e:	0007d463          	bgez	a5,80007d36 <sys_link+0x40>
    return -1;
    80007d32:	57fd                	li	a5,-1
    80007d34:	aab5                	j	80007eb0 <sys_link+0x1ba>

  begin_op();
    80007d36:	ffffe097          	auipc	ra,0xffffe
    80007d3a:	6f6080e7          	jalr	1782(ra) # 8000642c <begin_op>
  if((ip = namei(old)) == 0){
    80007d3e:	ed040793          	addi	a5,s0,-304
    80007d42:	853e                	mv	a0,a5
    80007d44:	ffffe097          	auipc	ra,0xffffe
    80007d48:	384080e7          	jalr	900(ra) # 800060c8 <namei>
    80007d4c:	fea43423          	sd	a0,-24(s0)
    80007d50:	fe843783          	ld	a5,-24(s0)
    80007d54:	e799                	bnez	a5,80007d62 <sys_link+0x6c>
    end_op();
    80007d56:	ffffe097          	auipc	ra,0xffffe
    80007d5a:	798080e7          	jalr	1944(ra) # 800064ee <end_op>
    return -1;
    80007d5e:	57fd                	li	a5,-1
    80007d60:	aa81                	j	80007eb0 <sys_link+0x1ba>
  }

  ilock(ip);
    80007d62:	fe843503          	ld	a0,-24(s0)
    80007d66:	ffffd097          	auipc	ra,0xffffd
    80007d6a:	66c080e7          	jalr	1644(ra) # 800053d2 <ilock>
  if(ip->type == T_DIR){
    80007d6e:	fe843783          	ld	a5,-24(s0)
    80007d72:	04479783          	lh	a5,68(a5)
    80007d76:	0007871b          	sext.w	a4,a5
    80007d7a:	4785                	li	a5,1
    80007d7c:	00f71e63          	bne	a4,a5,80007d98 <sys_link+0xa2>
    iunlockput(ip);
    80007d80:	fe843503          	ld	a0,-24(s0)
    80007d84:	ffffe097          	auipc	ra,0xffffe
    80007d88:	8ac080e7          	jalr	-1876(ra) # 80005630 <iunlockput>
    end_op();
    80007d8c:	ffffe097          	auipc	ra,0xffffe
    80007d90:	762080e7          	jalr	1890(ra) # 800064ee <end_op>
    return -1;
    80007d94:	57fd                	li	a5,-1
    80007d96:	aa29                	j	80007eb0 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007d98:	fe843783          	ld	a5,-24(s0)
    80007d9c:	04a79783          	lh	a5,74(a5)
    80007da0:	17c2                	slli	a5,a5,0x30
    80007da2:	93c1                	srli	a5,a5,0x30
    80007da4:	2785                	addiw	a5,a5,1
    80007da6:	17c2                	slli	a5,a5,0x30
    80007da8:	93c1                	srli	a5,a5,0x30
    80007daa:	0107971b          	slliw	a4,a5,0x10
    80007dae:	4107571b          	sraiw	a4,a4,0x10
    80007db2:	fe843783          	ld	a5,-24(s0)
    80007db6:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007dba:	fe843503          	ld	a0,-24(s0)
    80007dbe:	ffffd097          	auipc	ra,0xffffd
    80007dc2:	3c4080e7          	jalr	964(ra) # 80005182 <iupdate>
  iunlock(ip);
    80007dc6:	fe843503          	ld	a0,-24(s0)
    80007dca:	ffffd097          	auipc	ra,0xffffd
    80007dce:	73c080e7          	jalr	1852(ra) # 80005506 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007dd2:	fd040713          	addi	a4,s0,-48
    80007dd6:	f5040793          	addi	a5,s0,-176
    80007dda:	85ba                	mv	a1,a4
    80007ddc:	853e                	mv	a0,a5
    80007dde:	ffffe097          	auipc	ra,0xffffe
    80007de2:	316080e7          	jalr	790(ra) # 800060f4 <nameiparent>
    80007de6:	fea43023          	sd	a0,-32(s0)
    80007dea:	fe043783          	ld	a5,-32(s0)
    80007dee:	cba5                	beqz	a5,80007e5e <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007df0:	fe043503          	ld	a0,-32(s0)
    80007df4:	ffffd097          	auipc	ra,0xffffd
    80007df8:	5de080e7          	jalr	1502(ra) # 800053d2 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007dfc:	fe043783          	ld	a5,-32(s0)
    80007e00:	4398                	lw	a4,0(a5)
    80007e02:	fe843783          	ld	a5,-24(s0)
    80007e06:	439c                	lw	a5,0(a5)
    80007e08:	02f71263          	bne	a4,a5,80007e2c <sys_link+0x136>
    80007e0c:	fe843783          	ld	a5,-24(s0)
    80007e10:	43d8                	lw	a4,4(a5)
    80007e12:	fd040793          	addi	a5,s0,-48
    80007e16:	863a                	mv	a2,a4
    80007e18:	85be                	mv	a1,a5
    80007e1a:	fe043503          	ld	a0,-32(s0)
    80007e1e:	ffffe097          	auipc	ra,0xffffe
    80007e22:	f90080e7          	jalr	-112(ra) # 80005dae <dirlink>
    80007e26:	87aa                	mv	a5,a0
    80007e28:	0007d963          	bgez	a5,80007e3a <sys_link+0x144>
    iunlockput(dp);
    80007e2c:	fe043503          	ld	a0,-32(s0)
    80007e30:	ffffe097          	auipc	ra,0xffffe
    80007e34:	800080e7          	jalr	-2048(ra) # 80005630 <iunlockput>
    goto bad;
    80007e38:	a025                	j	80007e60 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007e3a:	fe043503          	ld	a0,-32(s0)
    80007e3e:	ffffd097          	auipc	ra,0xffffd
    80007e42:	7f2080e7          	jalr	2034(ra) # 80005630 <iunlockput>
  iput(ip);
    80007e46:	fe843503          	ld	a0,-24(s0)
    80007e4a:	ffffd097          	auipc	ra,0xffffd
    80007e4e:	716080e7          	jalr	1814(ra) # 80005560 <iput>

  end_op();
    80007e52:	ffffe097          	auipc	ra,0xffffe
    80007e56:	69c080e7          	jalr	1692(ra) # 800064ee <end_op>

  return 0;
    80007e5a:	4781                	li	a5,0
    80007e5c:	a891                	j	80007eb0 <sys_link+0x1ba>
    goto bad;
    80007e5e:	0001                	nop

bad:
  ilock(ip);
    80007e60:	fe843503          	ld	a0,-24(s0)
    80007e64:	ffffd097          	auipc	ra,0xffffd
    80007e68:	56e080e7          	jalr	1390(ra) # 800053d2 <ilock>
  ip->nlink--;
    80007e6c:	fe843783          	ld	a5,-24(s0)
    80007e70:	04a79783          	lh	a5,74(a5)
    80007e74:	17c2                	slli	a5,a5,0x30
    80007e76:	93c1                	srli	a5,a5,0x30
    80007e78:	37fd                	addiw	a5,a5,-1
    80007e7a:	17c2                	slli	a5,a5,0x30
    80007e7c:	93c1                	srli	a5,a5,0x30
    80007e7e:	0107971b          	slliw	a4,a5,0x10
    80007e82:	4107571b          	sraiw	a4,a4,0x10
    80007e86:	fe843783          	ld	a5,-24(s0)
    80007e8a:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e8e:	fe843503          	ld	a0,-24(s0)
    80007e92:	ffffd097          	auipc	ra,0xffffd
    80007e96:	2f0080e7          	jalr	752(ra) # 80005182 <iupdate>
  iunlockput(ip);
    80007e9a:	fe843503          	ld	a0,-24(s0)
    80007e9e:	ffffd097          	auipc	ra,0xffffd
    80007ea2:	792080e7          	jalr	1938(ra) # 80005630 <iunlockput>
  end_op();
    80007ea6:	ffffe097          	auipc	ra,0xffffe
    80007eaa:	648080e7          	jalr	1608(ra) # 800064ee <end_op>
  return -1;
    80007eae:	57fd                	li	a5,-1
}
    80007eb0:	853e                	mv	a0,a5
    80007eb2:	70b2                	ld	ra,296(sp)
    80007eb4:	7412                	ld	s0,288(sp)
    80007eb6:	6155                	addi	sp,sp,304
    80007eb8:	8082                	ret

0000000080007eba <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007eba:	7139                	addi	sp,sp,-64
    80007ebc:	fc06                	sd	ra,56(sp)
    80007ebe:	f822                	sd	s0,48(sp)
    80007ec0:	0080                	addi	s0,sp,64
    80007ec2:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007ec6:	02000793          	li	a5,32
    80007eca:	fef42623          	sw	a5,-20(s0)
    80007ece:	a0b1                	j	80007f1a <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007ed0:	fd840793          	addi	a5,s0,-40
    80007ed4:	fec42683          	lw	a3,-20(s0)
    80007ed8:	4741                	li	a4,16
    80007eda:	863e                	mv	a2,a5
    80007edc:	4581                	li	a1,0
    80007ede:	fc843503          	ld	a0,-56(s0)
    80007ee2:	ffffe097          	auipc	ra,0xffffe
    80007ee6:	a86080e7          	jalr	-1402(ra) # 80005968 <readi>
    80007eea:	87aa                	mv	a5,a0
    80007eec:	873e                	mv	a4,a5
    80007eee:	47c1                	li	a5,16
    80007ef0:	00f70a63          	beq	a4,a5,80007f04 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007ef4:	00003517          	auipc	a0,0x3
    80007ef8:	75c50513          	addi	a0,a0,1884 # 8000b650 <etext+0x650>
    80007efc:	ffff9097          	auipc	ra,0xffff9
    80007f00:	d82080e7          	jalr	-638(ra) # 80000c7e <panic>
    if(de.inum != 0)
    80007f04:	fd845783          	lhu	a5,-40(s0)
    80007f08:	c399                	beqz	a5,80007f0e <isdirempty+0x54>
      return 0;
    80007f0a:	4781                	li	a5,0
    80007f0c:	a839                	j	80007f2a <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007f0e:	fec42783          	lw	a5,-20(s0)
    80007f12:	27c1                	addiw	a5,a5,16
    80007f14:	2781                	sext.w	a5,a5
    80007f16:	fef42623          	sw	a5,-20(s0)
    80007f1a:	fc843783          	ld	a5,-56(s0)
    80007f1e:	47f8                	lw	a4,76(a5)
    80007f20:	fec42783          	lw	a5,-20(s0)
    80007f24:	fae7e6e3          	bltu	a5,a4,80007ed0 <isdirempty+0x16>
  }
  return 1;
    80007f28:	4785                	li	a5,1
}
    80007f2a:	853e                	mv	a0,a5
    80007f2c:	70e2                	ld	ra,56(sp)
    80007f2e:	7442                	ld	s0,48(sp)
    80007f30:	6121                	addi	sp,sp,64
    80007f32:	8082                	ret

0000000080007f34 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007f34:	7155                	addi	sp,sp,-208
    80007f36:	e586                	sd	ra,200(sp)
    80007f38:	e1a2                	sd	s0,192(sp)
    80007f3a:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007f3c:	f4040793          	addi	a5,s0,-192
    80007f40:	08000613          	li	a2,128
    80007f44:	85be                	mv	a1,a5
    80007f46:	4501                	li	a0,0
    80007f48:	ffffc097          	auipc	ra,0xffffc
    80007f4c:	4a6080e7          	jalr	1190(ra) # 800043ee <argstr>
    80007f50:	87aa                	mv	a5,a0
    80007f52:	0007d463          	bgez	a5,80007f5a <sys_unlink+0x26>
    return -1;
    80007f56:	57fd                	li	a5,-1
    80007f58:	a2ed                	j	80008142 <sys_unlink+0x20e>

  begin_op();
    80007f5a:	ffffe097          	auipc	ra,0xffffe
    80007f5e:	4d2080e7          	jalr	1234(ra) # 8000642c <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007f62:	fc040713          	addi	a4,s0,-64
    80007f66:	f4040793          	addi	a5,s0,-192
    80007f6a:	85ba                	mv	a1,a4
    80007f6c:	853e                	mv	a0,a5
    80007f6e:	ffffe097          	auipc	ra,0xffffe
    80007f72:	186080e7          	jalr	390(ra) # 800060f4 <nameiparent>
    80007f76:	fea43423          	sd	a0,-24(s0)
    80007f7a:	fe843783          	ld	a5,-24(s0)
    80007f7e:	e799                	bnez	a5,80007f8c <sys_unlink+0x58>
    end_op();
    80007f80:	ffffe097          	auipc	ra,0xffffe
    80007f84:	56e080e7          	jalr	1390(ra) # 800064ee <end_op>
    return -1;
    80007f88:	57fd                	li	a5,-1
    80007f8a:	aa65                	j	80008142 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007f8c:	fe843503          	ld	a0,-24(s0)
    80007f90:	ffffd097          	auipc	ra,0xffffd
    80007f94:	442080e7          	jalr	1090(ra) # 800053d2 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007f98:	fc040793          	addi	a5,s0,-64
    80007f9c:	00003597          	auipc	a1,0x3
    80007fa0:	6cc58593          	addi	a1,a1,1740 # 8000b668 <etext+0x668>
    80007fa4:	853e                	mv	a0,a5
    80007fa6:	ffffe097          	auipc	ra,0xffffe
    80007faa:	cf2080e7          	jalr	-782(ra) # 80005c98 <namecmp>
    80007fae:	87aa                	mv	a5,a0
    80007fb0:	16078b63          	beqz	a5,80008126 <sys_unlink+0x1f2>
    80007fb4:	fc040793          	addi	a5,s0,-64
    80007fb8:	00003597          	auipc	a1,0x3
    80007fbc:	6b858593          	addi	a1,a1,1720 # 8000b670 <etext+0x670>
    80007fc0:	853e                	mv	a0,a5
    80007fc2:	ffffe097          	auipc	ra,0xffffe
    80007fc6:	cd6080e7          	jalr	-810(ra) # 80005c98 <namecmp>
    80007fca:	87aa                	mv	a5,a0
    80007fcc:	14078d63          	beqz	a5,80008126 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007fd0:	f3c40713          	addi	a4,s0,-196
    80007fd4:	fc040793          	addi	a5,s0,-64
    80007fd8:	863a                	mv	a2,a4
    80007fda:	85be                	mv	a1,a5
    80007fdc:	fe843503          	ld	a0,-24(s0)
    80007fe0:	ffffe097          	auipc	ra,0xffffe
    80007fe4:	ce6080e7          	jalr	-794(ra) # 80005cc6 <dirlookup>
    80007fe8:	fea43023          	sd	a0,-32(s0)
    80007fec:	fe043783          	ld	a5,-32(s0)
    80007ff0:	12078d63          	beqz	a5,8000812a <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007ff4:	fe043503          	ld	a0,-32(s0)
    80007ff8:	ffffd097          	auipc	ra,0xffffd
    80007ffc:	3da080e7          	jalr	986(ra) # 800053d2 <ilock>

  if(ip->nlink < 1)
    80008000:	fe043783          	ld	a5,-32(s0)
    80008004:	04a79783          	lh	a5,74(a5)
    80008008:	2781                	sext.w	a5,a5
    8000800a:	00f04a63          	bgtz	a5,8000801e <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    8000800e:	00003517          	auipc	a0,0x3
    80008012:	66a50513          	addi	a0,a0,1642 # 8000b678 <etext+0x678>
    80008016:	ffff9097          	auipc	ra,0xffff9
    8000801a:	c68080e7          	jalr	-920(ra) # 80000c7e <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    8000801e:	fe043783          	ld	a5,-32(s0)
    80008022:	04479783          	lh	a5,68(a5)
    80008026:	0007871b          	sext.w	a4,a5
    8000802a:	4785                	li	a5,1
    8000802c:	02f71163          	bne	a4,a5,8000804e <sys_unlink+0x11a>
    80008030:	fe043503          	ld	a0,-32(s0)
    80008034:	00000097          	auipc	ra,0x0
    80008038:	e86080e7          	jalr	-378(ra) # 80007eba <isdirempty>
    8000803c:	87aa                	mv	a5,a0
    8000803e:	eb81                	bnez	a5,8000804e <sys_unlink+0x11a>
    iunlockput(ip);
    80008040:	fe043503          	ld	a0,-32(s0)
    80008044:	ffffd097          	auipc	ra,0xffffd
    80008048:	5ec080e7          	jalr	1516(ra) # 80005630 <iunlockput>
    goto bad;
    8000804c:	a0c5                	j	8000812c <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    8000804e:	fd040793          	addi	a5,s0,-48
    80008052:	4641                	li	a2,16
    80008054:	4581                	li	a1,0
    80008056:	853e                	mv	a0,a5
    80008058:	ffff9097          	auipc	ra,0xffff9
    8000805c:	3ea080e7          	jalr	1002(ra) # 80001442 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008060:	fd040793          	addi	a5,s0,-48
    80008064:	f3c42683          	lw	a3,-196(s0)
    80008068:	4741                	li	a4,16
    8000806a:	863e                	mv	a2,a5
    8000806c:	4581                	li	a1,0
    8000806e:	fe843503          	ld	a0,-24(s0)
    80008072:	ffffe097          	auipc	ra,0xffffe
    80008076:	a80080e7          	jalr	-1408(ra) # 80005af2 <writei>
    8000807a:	87aa                	mv	a5,a0
    8000807c:	873e                	mv	a4,a5
    8000807e:	47c1                	li	a5,16
    80008080:	00f70a63          	beq	a4,a5,80008094 <sys_unlink+0x160>
    panic("unlink: writei");
    80008084:	00003517          	auipc	a0,0x3
    80008088:	60c50513          	addi	a0,a0,1548 # 8000b690 <etext+0x690>
    8000808c:	ffff9097          	auipc	ra,0xffff9
    80008090:	bf2080e7          	jalr	-1038(ra) # 80000c7e <panic>
  if(ip->type == T_DIR){
    80008094:	fe043783          	ld	a5,-32(s0)
    80008098:	04479783          	lh	a5,68(a5)
    8000809c:	0007871b          	sext.w	a4,a5
    800080a0:	4785                	li	a5,1
    800080a2:	02f71963          	bne	a4,a5,800080d4 <sys_unlink+0x1a0>
    dp->nlink--;
    800080a6:	fe843783          	ld	a5,-24(s0)
    800080aa:	04a79783          	lh	a5,74(a5)
    800080ae:	17c2                	slli	a5,a5,0x30
    800080b0:	93c1                	srli	a5,a5,0x30
    800080b2:	37fd                	addiw	a5,a5,-1
    800080b4:	17c2                	slli	a5,a5,0x30
    800080b6:	93c1                	srli	a5,a5,0x30
    800080b8:	0107971b          	slliw	a4,a5,0x10
    800080bc:	4107571b          	sraiw	a4,a4,0x10
    800080c0:	fe843783          	ld	a5,-24(s0)
    800080c4:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800080c8:	fe843503          	ld	a0,-24(s0)
    800080cc:	ffffd097          	auipc	ra,0xffffd
    800080d0:	0b6080e7          	jalr	182(ra) # 80005182 <iupdate>
  }
  iunlockput(dp);
    800080d4:	fe843503          	ld	a0,-24(s0)
    800080d8:	ffffd097          	auipc	ra,0xffffd
    800080dc:	558080e7          	jalr	1368(ra) # 80005630 <iunlockput>

  ip->nlink--;
    800080e0:	fe043783          	ld	a5,-32(s0)
    800080e4:	04a79783          	lh	a5,74(a5)
    800080e8:	17c2                	slli	a5,a5,0x30
    800080ea:	93c1                	srli	a5,a5,0x30
    800080ec:	37fd                	addiw	a5,a5,-1
    800080ee:	17c2                	slli	a5,a5,0x30
    800080f0:	93c1                	srli	a5,a5,0x30
    800080f2:	0107971b          	slliw	a4,a5,0x10
    800080f6:	4107571b          	sraiw	a4,a4,0x10
    800080fa:	fe043783          	ld	a5,-32(s0)
    800080fe:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008102:	fe043503          	ld	a0,-32(s0)
    80008106:	ffffd097          	auipc	ra,0xffffd
    8000810a:	07c080e7          	jalr	124(ra) # 80005182 <iupdate>
  iunlockput(ip);
    8000810e:	fe043503          	ld	a0,-32(s0)
    80008112:	ffffd097          	auipc	ra,0xffffd
    80008116:	51e080e7          	jalr	1310(ra) # 80005630 <iunlockput>

  end_op();
    8000811a:	ffffe097          	auipc	ra,0xffffe
    8000811e:	3d4080e7          	jalr	980(ra) # 800064ee <end_op>

  return 0;
    80008122:	4781                	li	a5,0
    80008124:	a839                	j	80008142 <sys_unlink+0x20e>
    goto bad;
    80008126:	0001                	nop
    80008128:	a011                	j	8000812c <sys_unlink+0x1f8>
    goto bad;
    8000812a:	0001                	nop

bad:
  iunlockput(dp);
    8000812c:	fe843503          	ld	a0,-24(s0)
    80008130:	ffffd097          	auipc	ra,0xffffd
    80008134:	500080e7          	jalr	1280(ra) # 80005630 <iunlockput>
  end_op();
    80008138:	ffffe097          	auipc	ra,0xffffe
    8000813c:	3b6080e7          	jalr	950(ra) # 800064ee <end_op>
  return -1;
    80008140:	57fd                	li	a5,-1
}
    80008142:	853e                	mv	a0,a5
    80008144:	60ae                	ld	ra,200(sp)
    80008146:	640e                	ld	s0,192(sp)
    80008148:	6169                	addi	sp,sp,208
    8000814a:	8082                	ret

000000008000814c <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    8000814c:	7139                	addi	sp,sp,-64
    8000814e:	fc06                	sd	ra,56(sp)
    80008150:	f822                	sd	s0,48(sp)
    80008152:	0080                	addi	s0,sp,64
    80008154:	fca43423          	sd	a0,-56(s0)
    80008158:	87ae                	mv	a5,a1
    8000815a:	8736                	mv	a4,a3
    8000815c:	fcf41323          	sh	a5,-58(s0)
    80008160:	87b2                	mv	a5,a2
    80008162:	fcf41223          	sh	a5,-60(s0)
    80008166:	87ba                	mv	a5,a4
    80008168:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    8000816c:	fd040793          	addi	a5,s0,-48
    80008170:	85be                	mv	a1,a5
    80008172:	fc843503          	ld	a0,-56(s0)
    80008176:	ffffe097          	auipc	ra,0xffffe
    8000817a:	f7e080e7          	jalr	-130(ra) # 800060f4 <nameiparent>
    8000817e:	fea43423          	sd	a0,-24(s0)
    80008182:	fe843783          	ld	a5,-24(s0)
    80008186:	e399                	bnez	a5,8000818c <create+0x40>
    return 0;
    80008188:	4781                	li	a5,0
    8000818a:	a2d9                	j	80008350 <create+0x204>

  ilock(dp);
    8000818c:	fe843503          	ld	a0,-24(s0)
    80008190:	ffffd097          	auipc	ra,0xffffd
    80008194:	242080e7          	jalr	578(ra) # 800053d2 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008198:	fd040793          	addi	a5,s0,-48
    8000819c:	4601                	li	a2,0
    8000819e:	85be                	mv	a1,a5
    800081a0:	fe843503          	ld	a0,-24(s0)
    800081a4:	ffffe097          	auipc	ra,0xffffe
    800081a8:	b22080e7          	jalr	-1246(ra) # 80005cc6 <dirlookup>
    800081ac:	fea43023          	sd	a0,-32(s0)
    800081b0:	fe043783          	ld	a5,-32(s0)
    800081b4:	c3ad                	beqz	a5,80008216 <create+0xca>
    iunlockput(dp);
    800081b6:	fe843503          	ld	a0,-24(s0)
    800081ba:	ffffd097          	auipc	ra,0xffffd
    800081be:	476080e7          	jalr	1142(ra) # 80005630 <iunlockput>
    ilock(ip);
    800081c2:	fe043503          	ld	a0,-32(s0)
    800081c6:	ffffd097          	auipc	ra,0xffffd
    800081ca:	20c080e7          	jalr	524(ra) # 800053d2 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    800081ce:	fc641783          	lh	a5,-58(s0)
    800081d2:	0007871b          	sext.w	a4,a5
    800081d6:	4789                	li	a5,2
    800081d8:	02f71763          	bne	a4,a5,80008206 <create+0xba>
    800081dc:	fe043783          	ld	a5,-32(s0)
    800081e0:	04479783          	lh	a5,68(a5)
    800081e4:	0007871b          	sext.w	a4,a5
    800081e8:	4789                	li	a5,2
    800081ea:	00f70b63          	beq	a4,a5,80008200 <create+0xb4>
    800081ee:	fe043783          	ld	a5,-32(s0)
    800081f2:	04479783          	lh	a5,68(a5)
    800081f6:	0007871b          	sext.w	a4,a5
    800081fa:	478d                	li	a5,3
    800081fc:	00f71563          	bne	a4,a5,80008206 <create+0xba>
      return ip;
    80008200:	fe043783          	ld	a5,-32(s0)
    80008204:	a2b1                	j	80008350 <create+0x204>
    iunlockput(ip);
    80008206:	fe043503          	ld	a0,-32(s0)
    8000820a:	ffffd097          	auipc	ra,0xffffd
    8000820e:	426080e7          	jalr	1062(ra) # 80005630 <iunlockput>
    return 0;
    80008212:	4781                	li	a5,0
    80008214:	aa35                	j	80008350 <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    80008216:	fe843783          	ld	a5,-24(s0)
    8000821a:	439c                	lw	a5,0(a5)
    8000821c:	fc641703          	lh	a4,-58(s0)
    80008220:	85ba                	mv	a1,a4
    80008222:	853e                	mv	a0,a5
    80008224:	ffffd097          	auipc	ra,0xffffd
    80008228:	e62080e7          	jalr	-414(ra) # 80005086 <ialloc>
    8000822c:	fea43023          	sd	a0,-32(s0)
    80008230:	fe043783          	ld	a5,-32(s0)
    80008234:	eb89                	bnez	a5,80008246 <create+0xfa>
    panic("create: ialloc");
    80008236:	00003517          	auipc	a0,0x3
    8000823a:	46a50513          	addi	a0,a0,1130 # 8000b6a0 <etext+0x6a0>
    8000823e:	ffff9097          	auipc	ra,0xffff9
    80008242:	a40080e7          	jalr	-1472(ra) # 80000c7e <panic>

  ilock(ip);
    80008246:	fe043503          	ld	a0,-32(s0)
    8000824a:	ffffd097          	auipc	ra,0xffffd
    8000824e:	188080e7          	jalr	392(ra) # 800053d2 <ilock>
  ip->major = major;
    80008252:	fe043783          	ld	a5,-32(s0)
    80008256:	fc445703          	lhu	a4,-60(s0)
    8000825a:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000825e:	fe043783          	ld	a5,-32(s0)
    80008262:	fc245703          	lhu	a4,-62(s0)
    80008266:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    8000826a:	fe043783          	ld	a5,-32(s0)
    8000826e:	4705                	li	a4,1
    80008270:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008274:	fe043503          	ld	a0,-32(s0)
    80008278:	ffffd097          	auipc	ra,0xffffd
    8000827c:	f0a080e7          	jalr	-246(ra) # 80005182 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008280:	fc641783          	lh	a5,-58(s0)
    80008284:	0007871b          	sext.w	a4,a5
    80008288:	4785                	li	a5,1
    8000828a:	08f71363          	bne	a4,a5,80008310 <create+0x1c4>
    dp->nlink++;  // for ".."
    8000828e:	fe843783          	ld	a5,-24(s0)
    80008292:	04a79783          	lh	a5,74(a5)
    80008296:	17c2                	slli	a5,a5,0x30
    80008298:	93c1                	srli	a5,a5,0x30
    8000829a:	2785                	addiw	a5,a5,1
    8000829c:	17c2                	slli	a5,a5,0x30
    8000829e:	93c1                	srli	a5,a5,0x30
    800082a0:	0107971b          	slliw	a4,a5,0x10
    800082a4:	4107571b          	sraiw	a4,a4,0x10
    800082a8:	fe843783          	ld	a5,-24(s0)
    800082ac:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800082b0:	fe843503          	ld	a0,-24(s0)
    800082b4:	ffffd097          	auipc	ra,0xffffd
    800082b8:	ece080e7          	jalr	-306(ra) # 80005182 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    800082bc:	fe043783          	ld	a5,-32(s0)
    800082c0:	43dc                	lw	a5,4(a5)
    800082c2:	863e                	mv	a2,a5
    800082c4:	00003597          	auipc	a1,0x3
    800082c8:	3a458593          	addi	a1,a1,932 # 8000b668 <etext+0x668>
    800082cc:	fe043503          	ld	a0,-32(s0)
    800082d0:	ffffe097          	auipc	ra,0xffffe
    800082d4:	ade080e7          	jalr	-1314(ra) # 80005dae <dirlink>
    800082d8:	87aa                	mv	a5,a0
    800082da:	0207c363          	bltz	a5,80008300 <create+0x1b4>
    800082de:	fe843783          	ld	a5,-24(s0)
    800082e2:	43dc                	lw	a5,4(a5)
    800082e4:	863e                	mv	a2,a5
    800082e6:	00003597          	auipc	a1,0x3
    800082ea:	38a58593          	addi	a1,a1,906 # 8000b670 <etext+0x670>
    800082ee:	fe043503          	ld	a0,-32(s0)
    800082f2:	ffffe097          	auipc	ra,0xffffe
    800082f6:	abc080e7          	jalr	-1348(ra) # 80005dae <dirlink>
    800082fa:	87aa                	mv	a5,a0
    800082fc:	0007da63          	bgez	a5,80008310 <create+0x1c4>
      panic("create dots");
    80008300:	00003517          	auipc	a0,0x3
    80008304:	3b050513          	addi	a0,a0,944 # 8000b6b0 <etext+0x6b0>
    80008308:	ffff9097          	auipc	ra,0xffff9
    8000830c:	976080e7          	jalr	-1674(ra) # 80000c7e <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80008310:	fe043783          	ld	a5,-32(s0)
    80008314:	43d8                	lw	a4,4(a5)
    80008316:	fd040793          	addi	a5,s0,-48
    8000831a:	863a                	mv	a2,a4
    8000831c:	85be                	mv	a1,a5
    8000831e:	fe843503          	ld	a0,-24(s0)
    80008322:	ffffe097          	auipc	ra,0xffffe
    80008326:	a8c080e7          	jalr	-1396(ra) # 80005dae <dirlink>
    8000832a:	87aa                	mv	a5,a0
    8000832c:	0007da63          	bgez	a5,80008340 <create+0x1f4>
    panic("create: dirlink");
    80008330:	00003517          	auipc	a0,0x3
    80008334:	39050513          	addi	a0,a0,912 # 8000b6c0 <etext+0x6c0>
    80008338:	ffff9097          	auipc	ra,0xffff9
    8000833c:	946080e7          	jalr	-1722(ra) # 80000c7e <panic>

  iunlockput(dp);
    80008340:	fe843503          	ld	a0,-24(s0)
    80008344:	ffffd097          	auipc	ra,0xffffd
    80008348:	2ec080e7          	jalr	748(ra) # 80005630 <iunlockput>

  return ip;
    8000834c:	fe043783          	ld	a5,-32(s0)
}
    80008350:	853e                	mv	a0,a5
    80008352:	70e2                	ld	ra,56(sp)
    80008354:	7442                	ld	s0,48(sp)
    80008356:	6121                	addi	sp,sp,64
    80008358:	8082                	ret

000000008000835a <sys_open>:

uint64
sys_open(void)
{
    8000835a:	7131                	addi	sp,sp,-192
    8000835c:	fd06                	sd	ra,184(sp)
    8000835e:	f922                	sd	s0,176(sp)
    80008360:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80008362:	f5040793          	addi	a5,s0,-176
    80008366:	08000613          	li	a2,128
    8000836a:	85be                	mv	a1,a5
    8000836c:	4501                	li	a0,0
    8000836e:	ffffc097          	auipc	ra,0xffffc
    80008372:	080080e7          	jalr	128(ra) # 800043ee <argstr>
    80008376:	87aa                	mv	a5,a0
    80008378:	fef42223          	sw	a5,-28(s0)
    8000837c:	fe442783          	lw	a5,-28(s0)
    80008380:	2781                	sext.w	a5,a5
    80008382:	0007cd63          	bltz	a5,8000839c <sys_open+0x42>
    80008386:	f4c40793          	addi	a5,s0,-180
    8000838a:	85be                	mv	a1,a5
    8000838c:	4505                	li	a0,1
    8000838e:	ffffc097          	auipc	ra,0xffffc
    80008392:	ff4080e7          	jalr	-12(ra) # 80004382 <argint>
    80008396:	87aa                	mv	a5,a0
    80008398:	0007d463          	bgez	a5,800083a0 <sys_open+0x46>
    return -1;
    8000839c:	57fd                	li	a5,-1
    8000839e:	a429                	j	800085a8 <sys_open+0x24e>

  begin_op();
    800083a0:	ffffe097          	auipc	ra,0xffffe
    800083a4:	08c080e7          	jalr	140(ra) # 8000642c <begin_op>

  if(omode & O_CREATE){
    800083a8:	f4c42783          	lw	a5,-180(s0)
    800083ac:	2007f793          	andi	a5,a5,512
    800083b0:	2781                	sext.w	a5,a5
    800083b2:	c795                	beqz	a5,800083de <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    800083b4:	f5040793          	addi	a5,s0,-176
    800083b8:	4681                	li	a3,0
    800083ba:	4601                	li	a2,0
    800083bc:	4589                	li	a1,2
    800083be:	853e                	mv	a0,a5
    800083c0:	00000097          	auipc	ra,0x0
    800083c4:	d8c080e7          	jalr	-628(ra) # 8000814c <create>
    800083c8:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800083cc:	fe843783          	ld	a5,-24(s0)
    800083d0:	e7bd                	bnez	a5,8000843e <sys_open+0xe4>
      end_op();
    800083d2:	ffffe097          	auipc	ra,0xffffe
    800083d6:	11c080e7          	jalr	284(ra) # 800064ee <end_op>
      return -1;
    800083da:	57fd                	li	a5,-1
    800083dc:	a2f1                	j	800085a8 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    800083de:	f5040793          	addi	a5,s0,-176
    800083e2:	853e                	mv	a0,a5
    800083e4:	ffffe097          	auipc	ra,0xffffe
    800083e8:	ce4080e7          	jalr	-796(ra) # 800060c8 <namei>
    800083ec:	fea43423          	sd	a0,-24(s0)
    800083f0:	fe843783          	ld	a5,-24(s0)
    800083f4:	e799                	bnez	a5,80008402 <sys_open+0xa8>
      end_op();
    800083f6:	ffffe097          	auipc	ra,0xffffe
    800083fa:	0f8080e7          	jalr	248(ra) # 800064ee <end_op>
      return -1;
    800083fe:	57fd                	li	a5,-1
    80008400:	a265                	j	800085a8 <sys_open+0x24e>
    }
    ilock(ip);
    80008402:	fe843503          	ld	a0,-24(s0)
    80008406:	ffffd097          	auipc	ra,0xffffd
    8000840a:	fcc080e7          	jalr	-52(ra) # 800053d2 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000840e:	fe843783          	ld	a5,-24(s0)
    80008412:	04479783          	lh	a5,68(a5)
    80008416:	0007871b          	sext.w	a4,a5
    8000841a:	4785                	li	a5,1
    8000841c:	02f71163          	bne	a4,a5,8000843e <sys_open+0xe4>
    80008420:	f4c42783          	lw	a5,-180(s0)
    80008424:	cf89                	beqz	a5,8000843e <sys_open+0xe4>
      iunlockput(ip);
    80008426:	fe843503          	ld	a0,-24(s0)
    8000842a:	ffffd097          	auipc	ra,0xffffd
    8000842e:	206080e7          	jalr	518(ra) # 80005630 <iunlockput>
      end_op();
    80008432:	ffffe097          	auipc	ra,0xffffe
    80008436:	0bc080e7          	jalr	188(ra) # 800064ee <end_op>
      return -1;
    8000843a:	57fd                	li	a5,-1
    8000843c:	a2b5                	j	800085a8 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    8000843e:	fe843783          	ld	a5,-24(s0)
    80008442:	04479783          	lh	a5,68(a5)
    80008446:	0007871b          	sext.w	a4,a5
    8000844a:	478d                	li	a5,3
    8000844c:	02f71e63          	bne	a4,a5,80008488 <sys_open+0x12e>
    80008450:	fe843783          	ld	a5,-24(s0)
    80008454:	04679783          	lh	a5,70(a5)
    80008458:	2781                	sext.w	a5,a5
    8000845a:	0007cb63          	bltz	a5,80008470 <sys_open+0x116>
    8000845e:	fe843783          	ld	a5,-24(s0)
    80008462:	04679783          	lh	a5,70(a5)
    80008466:	0007871b          	sext.w	a4,a5
    8000846a:	47a5                	li	a5,9
    8000846c:	00e7de63          	bge	a5,a4,80008488 <sys_open+0x12e>
    iunlockput(ip);
    80008470:	fe843503          	ld	a0,-24(s0)
    80008474:	ffffd097          	auipc	ra,0xffffd
    80008478:	1bc080e7          	jalr	444(ra) # 80005630 <iunlockput>
    end_op();
    8000847c:	ffffe097          	auipc	ra,0xffffe
    80008480:	072080e7          	jalr	114(ra) # 800064ee <end_op>
    return -1;
    80008484:	57fd                	li	a5,-1
    80008486:	a20d                	j	800085a8 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008488:	ffffe097          	auipc	ra,0xffffe
    8000848c:	554080e7          	jalr	1364(ra) # 800069dc <filealloc>
    80008490:	fca43c23          	sd	a0,-40(s0)
    80008494:	fd843783          	ld	a5,-40(s0)
    80008498:	cf99                	beqz	a5,800084b6 <sys_open+0x15c>
    8000849a:	fd843503          	ld	a0,-40(s0)
    8000849e:	fffff097          	auipc	ra,0xfffff
    800084a2:	5e8080e7          	jalr	1512(ra) # 80007a86 <fdalloc>
    800084a6:	87aa                	mv	a5,a0
    800084a8:	fcf42a23          	sw	a5,-44(s0)
    800084ac:	fd442783          	lw	a5,-44(s0)
    800084b0:	2781                	sext.w	a5,a5
    800084b2:	0207d763          	bgez	a5,800084e0 <sys_open+0x186>
    if(f)
    800084b6:	fd843783          	ld	a5,-40(s0)
    800084ba:	c799                	beqz	a5,800084c8 <sys_open+0x16e>
      fileclose(f);
    800084bc:	fd843503          	ld	a0,-40(s0)
    800084c0:	ffffe097          	auipc	ra,0xffffe
    800084c4:	606080e7          	jalr	1542(ra) # 80006ac6 <fileclose>
    iunlockput(ip);
    800084c8:	fe843503          	ld	a0,-24(s0)
    800084cc:	ffffd097          	auipc	ra,0xffffd
    800084d0:	164080e7          	jalr	356(ra) # 80005630 <iunlockput>
    end_op();
    800084d4:	ffffe097          	auipc	ra,0xffffe
    800084d8:	01a080e7          	jalr	26(ra) # 800064ee <end_op>
    return -1;
    800084dc:	57fd                	li	a5,-1
    800084de:	a0e9                	j	800085a8 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    800084e0:	fe843783          	ld	a5,-24(s0)
    800084e4:	04479783          	lh	a5,68(a5)
    800084e8:	0007871b          	sext.w	a4,a5
    800084ec:	478d                	li	a5,3
    800084ee:	00f71f63          	bne	a4,a5,8000850c <sys_open+0x1b2>
    f->type = FD_DEVICE;
    800084f2:	fd843783          	ld	a5,-40(s0)
    800084f6:	470d                	li	a4,3
    800084f8:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800084fa:	fe843783          	ld	a5,-24(s0)
    800084fe:	04679703          	lh	a4,70(a5)
    80008502:	fd843783          	ld	a5,-40(s0)
    80008506:	02e79223          	sh	a4,36(a5)
    8000850a:	a809                	j	8000851c <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    8000850c:	fd843783          	ld	a5,-40(s0)
    80008510:	4709                	li	a4,2
    80008512:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008514:	fd843783          	ld	a5,-40(s0)
    80008518:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    8000851c:	fd843783          	ld	a5,-40(s0)
    80008520:	fe843703          	ld	a4,-24(s0)
    80008524:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    80008526:	f4c42783          	lw	a5,-180(s0)
    8000852a:	8b85                	andi	a5,a5,1
    8000852c:	2781                	sext.w	a5,a5
    8000852e:	0017b793          	seqz	a5,a5
    80008532:	0ff7f793          	andi	a5,a5,255
    80008536:	873e                	mv	a4,a5
    80008538:	fd843783          	ld	a5,-40(s0)
    8000853c:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008540:	f4c42783          	lw	a5,-180(s0)
    80008544:	8b85                	andi	a5,a5,1
    80008546:	2781                	sext.w	a5,a5
    80008548:	e791                	bnez	a5,80008554 <sys_open+0x1fa>
    8000854a:	f4c42783          	lw	a5,-180(s0)
    8000854e:	8b89                	andi	a5,a5,2
    80008550:	2781                	sext.w	a5,a5
    80008552:	c399                	beqz	a5,80008558 <sys_open+0x1fe>
    80008554:	4785                	li	a5,1
    80008556:	a011                	j	8000855a <sys_open+0x200>
    80008558:	4781                	li	a5,0
    8000855a:	0ff7f713          	andi	a4,a5,255
    8000855e:	fd843783          	ld	a5,-40(s0)
    80008562:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008566:	f4c42783          	lw	a5,-180(s0)
    8000856a:	4007f793          	andi	a5,a5,1024
    8000856e:	2781                	sext.w	a5,a5
    80008570:	c385                	beqz	a5,80008590 <sys_open+0x236>
    80008572:	fe843783          	ld	a5,-24(s0)
    80008576:	04479783          	lh	a5,68(a5)
    8000857a:	0007871b          	sext.w	a4,a5
    8000857e:	4789                	li	a5,2
    80008580:	00f71863          	bne	a4,a5,80008590 <sys_open+0x236>
    itrunc(ip);
    80008584:	fe843503          	ld	a0,-24(s0)
    80008588:	ffffd097          	auipc	ra,0xffffd
    8000858c:	232080e7          	jalr	562(ra) # 800057ba <itrunc>
  }

  iunlock(ip);
    80008590:	fe843503          	ld	a0,-24(s0)
    80008594:	ffffd097          	auipc	ra,0xffffd
    80008598:	f72080e7          	jalr	-142(ra) # 80005506 <iunlock>
  end_op();
    8000859c:	ffffe097          	auipc	ra,0xffffe
    800085a0:	f52080e7          	jalr	-174(ra) # 800064ee <end_op>

  return fd;
    800085a4:	fd442783          	lw	a5,-44(s0)
}
    800085a8:	853e                	mv	a0,a5
    800085aa:	70ea                	ld	ra,184(sp)
    800085ac:	744a                	ld	s0,176(sp)
    800085ae:	6129                	addi	sp,sp,192
    800085b0:	8082                	ret

00000000800085b2 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800085b2:	7135                	addi	sp,sp,-160
    800085b4:	ed06                	sd	ra,152(sp)
    800085b6:	e922                	sd	s0,144(sp)
    800085b8:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800085ba:	ffffe097          	auipc	ra,0xffffe
    800085be:	e72080e7          	jalr	-398(ra) # 8000642c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800085c2:	f6840793          	addi	a5,s0,-152
    800085c6:	08000613          	li	a2,128
    800085ca:	85be                	mv	a1,a5
    800085cc:	4501                	li	a0,0
    800085ce:	ffffc097          	auipc	ra,0xffffc
    800085d2:	e20080e7          	jalr	-480(ra) # 800043ee <argstr>
    800085d6:	87aa                	mv	a5,a0
    800085d8:	0207c163          	bltz	a5,800085fa <sys_mkdir+0x48>
    800085dc:	f6840793          	addi	a5,s0,-152
    800085e0:	4681                	li	a3,0
    800085e2:	4601                	li	a2,0
    800085e4:	4585                	li	a1,1
    800085e6:	853e                	mv	a0,a5
    800085e8:	00000097          	auipc	ra,0x0
    800085ec:	b64080e7          	jalr	-1180(ra) # 8000814c <create>
    800085f0:	fea43423          	sd	a0,-24(s0)
    800085f4:	fe843783          	ld	a5,-24(s0)
    800085f8:	e799                	bnez	a5,80008606 <sys_mkdir+0x54>
    end_op();
    800085fa:	ffffe097          	auipc	ra,0xffffe
    800085fe:	ef4080e7          	jalr	-268(ra) # 800064ee <end_op>
    return -1;
    80008602:	57fd                	li	a5,-1
    80008604:	a821                	j	8000861c <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80008606:	fe843503          	ld	a0,-24(s0)
    8000860a:	ffffd097          	auipc	ra,0xffffd
    8000860e:	026080e7          	jalr	38(ra) # 80005630 <iunlockput>
  end_op();
    80008612:	ffffe097          	auipc	ra,0xffffe
    80008616:	edc080e7          	jalr	-292(ra) # 800064ee <end_op>
  return 0;
    8000861a:	4781                	li	a5,0
}
    8000861c:	853e                	mv	a0,a5
    8000861e:	60ea                	ld	ra,152(sp)
    80008620:	644a                	ld	s0,144(sp)
    80008622:	610d                	addi	sp,sp,160
    80008624:	8082                	ret

0000000080008626 <sys_mknod>:

uint64
sys_mknod(void)
{
    80008626:	7135                	addi	sp,sp,-160
    80008628:	ed06                	sd	ra,152(sp)
    8000862a:	e922                	sd	s0,144(sp)
    8000862c:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    8000862e:	ffffe097          	auipc	ra,0xffffe
    80008632:	dfe080e7          	jalr	-514(ra) # 8000642c <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008636:	f6840793          	addi	a5,s0,-152
    8000863a:	08000613          	li	a2,128
    8000863e:	85be                	mv	a1,a5
    80008640:	4501                	li	a0,0
    80008642:	ffffc097          	auipc	ra,0xffffc
    80008646:	dac080e7          	jalr	-596(ra) # 800043ee <argstr>
    8000864a:	87aa                	mv	a5,a0
    8000864c:	0607c263          	bltz	a5,800086b0 <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    80008650:	f6440793          	addi	a5,s0,-156
    80008654:	85be                	mv	a1,a5
    80008656:	4505                	li	a0,1
    80008658:	ffffc097          	auipc	ra,0xffffc
    8000865c:	d2a080e7          	jalr	-726(ra) # 80004382 <argint>
    80008660:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008662:	0407c763          	bltz	a5,800086b0 <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    80008666:	f6040793          	addi	a5,s0,-160
    8000866a:	85be                	mv	a1,a5
    8000866c:	4509                	li	a0,2
    8000866e:	ffffc097          	auipc	ra,0xffffc
    80008672:	d14080e7          	jalr	-748(ra) # 80004382 <argint>
    80008676:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    80008678:	0207cc63          	bltz	a5,800086b0 <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000867c:	f6442783          	lw	a5,-156(s0)
    80008680:	0107971b          	slliw	a4,a5,0x10
    80008684:	4107571b          	sraiw	a4,a4,0x10
    80008688:	f6042783          	lw	a5,-160(s0)
    8000868c:	0107969b          	slliw	a3,a5,0x10
    80008690:	4106d69b          	sraiw	a3,a3,0x10
    80008694:	f6840793          	addi	a5,s0,-152
    80008698:	863a                	mv	a2,a4
    8000869a:	458d                	li	a1,3
    8000869c:	853e                	mv	a0,a5
    8000869e:	00000097          	auipc	ra,0x0
    800086a2:	aae080e7          	jalr	-1362(ra) # 8000814c <create>
    800086a6:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    800086aa:	fe843783          	ld	a5,-24(s0)
    800086ae:	e799                	bnez	a5,800086bc <sys_mknod+0x96>
    end_op();
    800086b0:	ffffe097          	auipc	ra,0xffffe
    800086b4:	e3e080e7          	jalr	-450(ra) # 800064ee <end_op>
    return -1;
    800086b8:	57fd                	li	a5,-1
    800086ba:	a821                	j	800086d2 <sys_mknod+0xac>
  }
  iunlockput(ip);
    800086bc:	fe843503          	ld	a0,-24(s0)
    800086c0:	ffffd097          	auipc	ra,0xffffd
    800086c4:	f70080e7          	jalr	-144(ra) # 80005630 <iunlockput>
  end_op();
    800086c8:	ffffe097          	auipc	ra,0xffffe
    800086cc:	e26080e7          	jalr	-474(ra) # 800064ee <end_op>
  return 0;
    800086d0:	4781                	li	a5,0
}
    800086d2:	853e                	mv	a0,a5
    800086d4:	60ea                	ld	ra,152(sp)
    800086d6:	644a                	ld	s0,144(sp)
    800086d8:	610d                	addi	sp,sp,160
    800086da:	8082                	ret

00000000800086dc <sys_chdir>:

uint64
sys_chdir(void)
{
    800086dc:	7135                	addi	sp,sp,-160
    800086de:	ed06                	sd	ra,152(sp)
    800086e0:	e922                	sd	s0,144(sp)
    800086e2:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800086e4:	ffffa097          	auipc	ra,0xffffa
    800086e8:	134080e7          	jalr	308(ra) # 80002818 <myproc>
    800086ec:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800086f0:	ffffe097          	auipc	ra,0xffffe
    800086f4:	d3c080e7          	jalr	-708(ra) # 8000642c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800086f8:	f6040793          	addi	a5,s0,-160
    800086fc:	08000613          	li	a2,128
    80008700:	85be                	mv	a1,a5
    80008702:	4501                	li	a0,0
    80008704:	ffffc097          	auipc	ra,0xffffc
    80008708:	cea080e7          	jalr	-790(ra) # 800043ee <argstr>
    8000870c:	87aa                	mv	a5,a0
    8000870e:	0007ce63          	bltz	a5,8000872a <sys_chdir+0x4e>
    80008712:	f6040793          	addi	a5,s0,-160
    80008716:	853e                	mv	a0,a5
    80008718:	ffffe097          	auipc	ra,0xffffe
    8000871c:	9b0080e7          	jalr	-1616(ra) # 800060c8 <namei>
    80008720:	fea43023          	sd	a0,-32(s0)
    80008724:	fe043783          	ld	a5,-32(s0)
    80008728:	e799                	bnez	a5,80008736 <sys_chdir+0x5a>
    end_op();
    8000872a:	ffffe097          	auipc	ra,0xffffe
    8000872e:	dc4080e7          	jalr	-572(ra) # 800064ee <end_op>
    return -1;
    80008732:	57fd                	li	a5,-1
    80008734:	a0b5                	j	800087a0 <sys_chdir+0xc4>
  }
  ilock(ip);
    80008736:	fe043503          	ld	a0,-32(s0)
    8000873a:	ffffd097          	auipc	ra,0xffffd
    8000873e:	c98080e7          	jalr	-872(ra) # 800053d2 <ilock>
  if(ip->type != T_DIR){
    80008742:	fe043783          	ld	a5,-32(s0)
    80008746:	04479783          	lh	a5,68(a5)
    8000874a:	0007871b          	sext.w	a4,a5
    8000874e:	4785                	li	a5,1
    80008750:	00f70e63          	beq	a4,a5,8000876c <sys_chdir+0x90>
    iunlockput(ip);
    80008754:	fe043503          	ld	a0,-32(s0)
    80008758:	ffffd097          	auipc	ra,0xffffd
    8000875c:	ed8080e7          	jalr	-296(ra) # 80005630 <iunlockput>
    end_op();
    80008760:	ffffe097          	auipc	ra,0xffffe
    80008764:	d8e080e7          	jalr	-626(ra) # 800064ee <end_op>
    return -1;
    80008768:	57fd                	li	a5,-1
    8000876a:	a81d                	j	800087a0 <sys_chdir+0xc4>
  }
  iunlock(ip);
    8000876c:	fe043503          	ld	a0,-32(s0)
    80008770:	ffffd097          	auipc	ra,0xffffd
    80008774:	d96080e7          	jalr	-618(ra) # 80005506 <iunlock>
  iput(p->cwd);
    80008778:	fe843783          	ld	a5,-24(s0)
    8000877c:	1507b783          	ld	a5,336(a5)
    80008780:	853e                	mv	a0,a5
    80008782:	ffffd097          	auipc	ra,0xffffd
    80008786:	dde080e7          	jalr	-546(ra) # 80005560 <iput>
  end_op();
    8000878a:	ffffe097          	auipc	ra,0xffffe
    8000878e:	d64080e7          	jalr	-668(ra) # 800064ee <end_op>
  p->cwd = ip;
    80008792:	fe843783          	ld	a5,-24(s0)
    80008796:	fe043703          	ld	a4,-32(s0)
    8000879a:	14e7b823          	sd	a4,336(a5)
  return 0;
    8000879e:	4781                	li	a5,0
}
    800087a0:	853e                	mv	a0,a5
    800087a2:	60ea                	ld	ra,152(sp)
    800087a4:	644a                	ld	s0,144(sp)
    800087a6:	610d                	addi	sp,sp,160
    800087a8:	8082                	ret

00000000800087aa <sys_exec>:

uint64
sys_exec(void)
{
    800087aa:	7161                	addi	sp,sp,-432
    800087ac:	f706                	sd	ra,424(sp)
    800087ae:	f322                	sd	s0,416(sp)
    800087b0:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    800087b2:	f6840793          	addi	a5,s0,-152
    800087b6:	08000613          	li	a2,128
    800087ba:	85be                	mv	a1,a5
    800087bc:	4501                	li	a0,0
    800087be:	ffffc097          	auipc	ra,0xffffc
    800087c2:	c30080e7          	jalr	-976(ra) # 800043ee <argstr>
    800087c6:	87aa                	mv	a5,a0
    800087c8:	0007cd63          	bltz	a5,800087e2 <sys_exec+0x38>
    800087cc:	e6040793          	addi	a5,s0,-416
    800087d0:	85be                	mv	a1,a5
    800087d2:	4505                	li	a0,1
    800087d4:	ffffc097          	auipc	ra,0xffffc
    800087d8:	be6080e7          	jalr	-1050(ra) # 800043ba <argaddr>
    800087dc:	87aa                	mv	a5,a0
    800087de:	0007d463          	bgez	a5,800087e6 <sys_exec+0x3c>
    return -1;
    800087e2:	57fd                	li	a5,-1
    800087e4:	a249                	j	80008966 <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    800087e6:	e6840793          	addi	a5,s0,-408
    800087ea:	10000613          	li	a2,256
    800087ee:	4581                	li	a1,0
    800087f0:	853e                	mv	a0,a5
    800087f2:	ffff9097          	auipc	ra,0xffff9
    800087f6:	c50080e7          	jalr	-944(ra) # 80001442 <memset>
  for(i=0;; i++){
    800087fa:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800087fe:	fec42783          	lw	a5,-20(s0)
    80008802:	873e                	mv	a4,a5
    80008804:	47fd                	li	a5,31
    80008806:	10e7e463          	bltu	a5,a4,8000890e <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8000880a:	fec42783          	lw	a5,-20(s0)
    8000880e:	00379713          	slli	a4,a5,0x3
    80008812:	e6043783          	ld	a5,-416(s0)
    80008816:	97ba                	add	a5,a5,a4
    80008818:	e5840713          	addi	a4,s0,-424
    8000881c:	85ba                	mv	a1,a4
    8000881e:	853e                	mv	a0,a5
    80008820:	ffffc097          	auipc	ra,0xffffc
    80008824:	9e4080e7          	jalr	-1564(ra) # 80004204 <fetchaddr>
    80008828:	87aa                	mv	a5,a0
    8000882a:	0e07c463          	bltz	a5,80008912 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    8000882e:	e5843783          	ld	a5,-424(s0)
    80008832:	eb95                	bnez	a5,80008866 <sys_exec+0xbc>
      argv[i] = 0;
    80008834:	fec42783          	lw	a5,-20(s0)
    80008838:	078e                	slli	a5,a5,0x3
    8000883a:	ff040713          	addi	a4,s0,-16
    8000883e:	97ba                	add	a5,a5,a4
    80008840:	e607bc23          	sd	zero,-392(a5)
      break;
    80008844:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008846:	e6840713          	addi	a4,s0,-408
    8000884a:	f6840793          	addi	a5,s0,-152
    8000884e:	85ba                	mv	a1,a4
    80008850:	853e                	mv	a0,a5
    80008852:	fffff097          	auipc	ra,0xfffff
    80008856:	c1a080e7          	jalr	-998(ra) # 8000746c <exec>
    8000885a:	87aa                	mv	a5,a0
    8000885c:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008860:	fe042623          	sw	zero,-20(s0)
    80008864:	a059                	j	800088ea <sys_exec+0x140>
    argv[i] = kalloc();
    80008866:	ffff9097          	auipc	ra,0xffff9
    8000886a:	8b4080e7          	jalr	-1868(ra) # 8000111a <kalloc>
    8000886e:	872a                	mv	a4,a0
    80008870:	fec42783          	lw	a5,-20(s0)
    80008874:	078e                	slli	a5,a5,0x3
    80008876:	ff040693          	addi	a3,s0,-16
    8000887a:	97b6                	add	a5,a5,a3
    8000887c:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008880:	fec42783          	lw	a5,-20(s0)
    80008884:	078e                	slli	a5,a5,0x3
    80008886:	ff040713          	addi	a4,s0,-16
    8000888a:	97ba                	add	a5,a5,a4
    8000888c:	e787b783          	ld	a5,-392(a5)
    80008890:	c3d9                	beqz	a5,80008916 <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008892:	e5843703          	ld	a4,-424(s0)
    80008896:	fec42783          	lw	a5,-20(s0)
    8000889a:	078e                	slli	a5,a5,0x3
    8000889c:	ff040693          	addi	a3,s0,-16
    800088a0:	97b6                	add	a5,a5,a3
    800088a2:	e787b783          	ld	a5,-392(a5)
    800088a6:	6605                	lui	a2,0x1
    800088a8:	85be                	mv	a1,a5
    800088aa:	853a                	mv	a0,a4
    800088ac:	ffffc097          	auipc	ra,0xffffc
    800088b0:	9c6080e7          	jalr	-1594(ra) # 80004272 <fetchstr>
    800088b4:	87aa                	mv	a5,a0
    800088b6:	0607c263          	bltz	a5,8000891a <sys_exec+0x170>
  for(i=0;; i++){
    800088ba:	fec42783          	lw	a5,-20(s0)
    800088be:	2785                	addiw	a5,a5,1
    800088c0:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800088c4:	bf2d                	j	800087fe <sys_exec+0x54>
    kfree(argv[i]);
    800088c6:	fec42783          	lw	a5,-20(s0)
    800088ca:	078e                	slli	a5,a5,0x3
    800088cc:	ff040713          	addi	a4,s0,-16
    800088d0:	97ba                	add	a5,a5,a4
    800088d2:	e787b783          	ld	a5,-392(a5)
    800088d6:	853e                	mv	a0,a5
    800088d8:	ffff8097          	auipc	ra,0xffff8
    800088dc:	79e080e7          	jalr	1950(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088e0:	fec42783          	lw	a5,-20(s0)
    800088e4:	2785                	addiw	a5,a5,1
    800088e6:	fef42623          	sw	a5,-20(s0)
    800088ea:	fec42783          	lw	a5,-20(s0)
    800088ee:	873e                	mv	a4,a5
    800088f0:	47fd                	li	a5,31
    800088f2:	00e7eb63          	bltu	a5,a4,80008908 <sys_exec+0x15e>
    800088f6:	fec42783          	lw	a5,-20(s0)
    800088fa:	078e                	slli	a5,a5,0x3
    800088fc:	ff040713          	addi	a4,s0,-16
    80008900:	97ba                	add	a5,a5,a4
    80008902:	e787b783          	ld	a5,-392(a5)
    80008906:	f3e1                	bnez	a5,800088c6 <sys_exec+0x11c>

  return ret;
    80008908:	fe842783          	lw	a5,-24(s0)
    8000890c:	a8a9                	j	80008966 <sys_exec+0x1bc>
      goto bad;
    8000890e:	0001                	nop
    80008910:	a031                	j	8000891c <sys_exec+0x172>
      goto bad;
    80008912:	0001                	nop
    80008914:	a021                	j	8000891c <sys_exec+0x172>
      goto bad;
    80008916:	0001                	nop
    80008918:	a011                	j	8000891c <sys_exec+0x172>
      goto bad;
    8000891a:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000891c:	fe042623          	sw	zero,-20(s0)
    80008920:	a01d                	j	80008946 <sys_exec+0x19c>
    kfree(argv[i]);
    80008922:	fec42783          	lw	a5,-20(s0)
    80008926:	078e                	slli	a5,a5,0x3
    80008928:	ff040713          	addi	a4,s0,-16
    8000892c:	97ba                	add	a5,a5,a4
    8000892e:	e787b783          	ld	a5,-392(a5)
    80008932:	853e                	mv	a0,a5
    80008934:	ffff8097          	auipc	ra,0xffff8
    80008938:	742080e7          	jalr	1858(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000893c:	fec42783          	lw	a5,-20(s0)
    80008940:	2785                	addiw	a5,a5,1
    80008942:	fef42623          	sw	a5,-20(s0)
    80008946:	fec42783          	lw	a5,-20(s0)
    8000894a:	873e                	mv	a4,a5
    8000894c:	47fd                	li	a5,31
    8000894e:	00e7eb63          	bltu	a5,a4,80008964 <sys_exec+0x1ba>
    80008952:	fec42783          	lw	a5,-20(s0)
    80008956:	078e                	slli	a5,a5,0x3
    80008958:	ff040713          	addi	a4,s0,-16
    8000895c:	97ba                	add	a5,a5,a4
    8000895e:	e787b783          	ld	a5,-392(a5)
    80008962:	f3e1                	bnez	a5,80008922 <sys_exec+0x178>
  return -1;
    80008964:	57fd                	li	a5,-1
}
    80008966:	853e                	mv	a0,a5
    80008968:	70ba                	ld	ra,424(sp)
    8000896a:	741a                	ld	s0,416(sp)
    8000896c:	615d                	addi	sp,sp,432
    8000896e:	8082                	ret

0000000080008970 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008970:	7139                	addi	sp,sp,-64
    80008972:	fc06                	sd	ra,56(sp)
    80008974:	f822                	sd	s0,48(sp)
    80008976:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008978:	ffffa097          	auipc	ra,0xffffa
    8000897c:	ea0080e7          	jalr	-352(ra) # 80002818 <myproc>
    80008980:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80008984:	fe040793          	addi	a5,s0,-32
    80008988:	85be                	mv	a1,a5
    8000898a:	4501                	li	a0,0
    8000898c:	ffffc097          	auipc	ra,0xffffc
    80008990:	a2e080e7          	jalr	-1490(ra) # 800043ba <argaddr>
    80008994:	87aa                	mv	a5,a0
    80008996:	0007d463          	bgez	a5,8000899e <sys_pipe+0x2e>
    return -1;
    8000899a:	57fd                	li	a5,-1
    8000899c:	a215                	j	80008ac0 <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    8000899e:	fd040713          	addi	a4,s0,-48
    800089a2:	fd840793          	addi	a5,s0,-40
    800089a6:	85ba                	mv	a1,a4
    800089a8:	853e                	mv	a0,a5
    800089aa:	ffffe097          	auipc	ra,0xffffe
    800089ae:	632080e7          	jalr	1586(ra) # 80006fdc <pipealloc>
    800089b2:	87aa                	mv	a5,a0
    800089b4:	0007d463          	bgez	a5,800089bc <sys_pipe+0x4c>
    return -1;
    800089b8:	57fd                	li	a5,-1
    800089ba:	a219                	j	80008ac0 <sys_pipe+0x150>
  fd0 = -1;
    800089bc:	57fd                	li	a5,-1
    800089be:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    800089c2:	fd843783          	ld	a5,-40(s0)
    800089c6:	853e                	mv	a0,a5
    800089c8:	fffff097          	auipc	ra,0xfffff
    800089cc:	0be080e7          	jalr	190(ra) # 80007a86 <fdalloc>
    800089d0:	87aa                	mv	a5,a0
    800089d2:	fcf42623          	sw	a5,-52(s0)
    800089d6:	fcc42783          	lw	a5,-52(s0)
    800089da:	0207c063          	bltz	a5,800089fa <sys_pipe+0x8a>
    800089de:	fd043783          	ld	a5,-48(s0)
    800089e2:	853e                	mv	a0,a5
    800089e4:	fffff097          	auipc	ra,0xfffff
    800089e8:	0a2080e7          	jalr	162(ra) # 80007a86 <fdalloc>
    800089ec:	87aa                	mv	a5,a0
    800089ee:	fcf42423          	sw	a5,-56(s0)
    800089f2:	fc842783          	lw	a5,-56(s0)
    800089f6:	0207df63          	bgez	a5,80008a34 <sys_pipe+0xc4>
    if(fd0 >= 0)
    800089fa:	fcc42783          	lw	a5,-52(s0)
    800089fe:	0007cb63          	bltz	a5,80008a14 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80008a02:	fcc42783          	lw	a5,-52(s0)
    80008a06:	fe843703          	ld	a4,-24(s0)
    80008a0a:	07e9                	addi	a5,a5,26
    80008a0c:	078e                	slli	a5,a5,0x3
    80008a0e:	97ba                	add	a5,a5,a4
    80008a10:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a14:	fd843783          	ld	a5,-40(s0)
    80008a18:	853e                	mv	a0,a5
    80008a1a:	ffffe097          	auipc	ra,0xffffe
    80008a1e:	0ac080e7          	jalr	172(ra) # 80006ac6 <fileclose>
    fileclose(wf);
    80008a22:	fd043783          	ld	a5,-48(s0)
    80008a26:	853e                	mv	a0,a5
    80008a28:	ffffe097          	auipc	ra,0xffffe
    80008a2c:	09e080e7          	jalr	158(ra) # 80006ac6 <fileclose>
    return -1;
    80008a30:	57fd                	li	a5,-1
    80008a32:	a079                	j	80008ac0 <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008a34:	fe843783          	ld	a5,-24(s0)
    80008a38:	6bbc                	ld	a5,80(a5)
    80008a3a:	fe043703          	ld	a4,-32(s0)
    80008a3e:	fcc40613          	addi	a2,s0,-52
    80008a42:	4691                	li	a3,4
    80008a44:	85ba                	mv	a1,a4
    80008a46:	853e                	mv	a0,a5
    80008a48:	ffffa097          	auipc	ra,0xffffa
    80008a4c:	89e080e7          	jalr	-1890(ra) # 800022e6 <copyout>
    80008a50:	87aa                	mv	a5,a0
    80008a52:	0207c463          	bltz	a5,80008a7a <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008a56:	fe843783          	ld	a5,-24(s0)
    80008a5a:	6bb8                	ld	a4,80(a5)
    80008a5c:	fe043783          	ld	a5,-32(s0)
    80008a60:	0791                	addi	a5,a5,4
    80008a62:	fc840613          	addi	a2,s0,-56
    80008a66:	4691                	li	a3,4
    80008a68:	85be                	mv	a1,a5
    80008a6a:	853a                	mv	a0,a4
    80008a6c:	ffffa097          	auipc	ra,0xffffa
    80008a70:	87a080e7          	jalr	-1926(ra) # 800022e6 <copyout>
    80008a74:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008a76:	0407d463          	bgez	a5,80008abe <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    80008a7a:	fcc42783          	lw	a5,-52(s0)
    80008a7e:	fe843703          	ld	a4,-24(s0)
    80008a82:	07e9                	addi	a5,a5,26
    80008a84:	078e                	slli	a5,a5,0x3
    80008a86:	97ba                	add	a5,a5,a4
    80008a88:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008a8c:	fc842783          	lw	a5,-56(s0)
    80008a90:	fe843703          	ld	a4,-24(s0)
    80008a94:	07e9                	addi	a5,a5,26
    80008a96:	078e                	slli	a5,a5,0x3
    80008a98:	97ba                	add	a5,a5,a4
    80008a9a:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a9e:	fd843783          	ld	a5,-40(s0)
    80008aa2:	853e                	mv	a0,a5
    80008aa4:	ffffe097          	auipc	ra,0xffffe
    80008aa8:	022080e7          	jalr	34(ra) # 80006ac6 <fileclose>
    fileclose(wf);
    80008aac:	fd043783          	ld	a5,-48(s0)
    80008ab0:	853e                	mv	a0,a5
    80008ab2:	ffffe097          	auipc	ra,0xffffe
    80008ab6:	014080e7          	jalr	20(ra) # 80006ac6 <fileclose>
    return -1;
    80008aba:	57fd                	li	a5,-1
    80008abc:	a011                	j	80008ac0 <sys_pipe+0x150>
  }
  return 0;
    80008abe:	4781                	li	a5,0
}
    80008ac0:	853e                	mv	a0,a5
    80008ac2:	70e2                	ld	ra,56(sp)
    80008ac4:	7442                	ld	s0,48(sp)
    80008ac6:	6121                	addi	sp,sp,64
    80008ac8:	8082                	ret
    80008aca:	0000                	unimp
    80008acc:	0000                	unimp
	...

0000000080008ad0 <kernelvec>:
    80008ad0:	7111                	addi	sp,sp,-256
    80008ad2:	e006                	sd	ra,0(sp)
    80008ad4:	e40a                	sd	sp,8(sp)
    80008ad6:	e80e                	sd	gp,16(sp)
    80008ad8:	ec12                	sd	tp,24(sp)
    80008ada:	f016                	sd	t0,32(sp)
    80008adc:	f41a                	sd	t1,40(sp)
    80008ade:	f81e                	sd	t2,48(sp)
    80008ae0:	fc22                	sd	s0,56(sp)
    80008ae2:	e0a6                	sd	s1,64(sp)
    80008ae4:	e4aa                	sd	a0,72(sp)
    80008ae6:	e8ae                	sd	a1,80(sp)
    80008ae8:	ecb2                	sd	a2,88(sp)
    80008aea:	f0b6                	sd	a3,96(sp)
    80008aec:	f4ba                	sd	a4,104(sp)
    80008aee:	f8be                	sd	a5,112(sp)
    80008af0:	fcc2                	sd	a6,120(sp)
    80008af2:	e146                	sd	a7,128(sp)
    80008af4:	e54a                	sd	s2,136(sp)
    80008af6:	e94e                	sd	s3,144(sp)
    80008af8:	ed52                	sd	s4,152(sp)
    80008afa:	f156                	sd	s5,160(sp)
    80008afc:	f55a                	sd	s6,168(sp)
    80008afe:	f95e                	sd	s7,176(sp)
    80008b00:	fd62                	sd	s8,184(sp)
    80008b02:	e1e6                	sd	s9,192(sp)
    80008b04:	e5ea                	sd	s10,200(sp)
    80008b06:	e9ee                	sd	s11,208(sp)
    80008b08:	edf2                	sd	t3,216(sp)
    80008b0a:	f1f6                	sd	t4,224(sp)
    80008b0c:	f5fa                	sd	t5,232(sp)
    80008b0e:	f9fe                	sd	t6,240(sp)
    80008b10:	c8cfb0ef          	jal	ra,80003f9c <kerneltrap>
    80008b14:	6082                	ld	ra,0(sp)
    80008b16:	6122                	ld	sp,8(sp)
    80008b18:	61c2                	ld	gp,16(sp)
    80008b1a:	7282                	ld	t0,32(sp)
    80008b1c:	7322                	ld	t1,40(sp)
    80008b1e:	73c2                	ld	t2,48(sp)
    80008b20:	7462                	ld	s0,56(sp)
    80008b22:	6486                	ld	s1,64(sp)
    80008b24:	6526                	ld	a0,72(sp)
    80008b26:	65c6                	ld	a1,80(sp)
    80008b28:	6666                	ld	a2,88(sp)
    80008b2a:	7686                	ld	a3,96(sp)
    80008b2c:	7726                	ld	a4,104(sp)
    80008b2e:	77c6                	ld	a5,112(sp)
    80008b30:	7866                	ld	a6,120(sp)
    80008b32:	688a                	ld	a7,128(sp)
    80008b34:	692a                	ld	s2,136(sp)
    80008b36:	69ca                	ld	s3,144(sp)
    80008b38:	6a6a                	ld	s4,152(sp)
    80008b3a:	7a8a                	ld	s5,160(sp)
    80008b3c:	7b2a                	ld	s6,168(sp)
    80008b3e:	7bca                	ld	s7,176(sp)
    80008b40:	7c6a                	ld	s8,184(sp)
    80008b42:	6c8e                	ld	s9,192(sp)
    80008b44:	6d2e                	ld	s10,200(sp)
    80008b46:	6dce                	ld	s11,208(sp)
    80008b48:	6e6e                	ld	t3,216(sp)
    80008b4a:	7e8e                	ld	t4,224(sp)
    80008b4c:	7f2e                	ld	t5,232(sp)
    80008b4e:	7fce                	ld	t6,240(sp)
    80008b50:	6111                	addi	sp,sp,256
    80008b52:	10200073          	sret
    80008b56:	00000013          	nop
    80008b5a:	00000013          	nop
    80008b5e:	0001                	nop

0000000080008b60 <timervec>:
    80008b60:	34051573          	csrrw	a0,mscratch,a0
    80008b64:	e10c                	sd	a1,0(a0)
    80008b66:	e510                	sd	a2,8(a0)
    80008b68:	e914                	sd	a3,16(a0)
    80008b6a:	6d0c                	ld	a1,24(a0)
    80008b6c:	7110                	ld	a2,32(a0)
    80008b6e:	6194                	ld	a3,0(a1)
    80008b70:	96b2                	add	a3,a3,a2
    80008b72:	e194                	sd	a3,0(a1)
    80008b74:	4589                	li	a1,2
    80008b76:	14459073          	csrw	sip,a1
    80008b7a:	6914                	ld	a3,16(a0)
    80008b7c:	6510                	ld	a2,8(a0)
    80008b7e:	610c                	ld	a1,0(a0)
    80008b80:	34051573          	csrrw	a0,mscratch,a0
    80008b84:	30200073          	mret
	...

0000000080008b8a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008b8a:	1141                	addi	sp,sp,-16
    80008b8c:	e422                	sd	s0,8(sp)
    80008b8e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008b90:	0c0007b7          	lui	a5,0xc000
    80008b94:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008b98:	4705                	li	a4,1
    80008b9a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008b9c:	0c0007b7          	lui	a5,0xc000
    80008ba0:	0791                	addi	a5,a5,4
    80008ba2:	4705                	li	a4,1
    80008ba4:	c398                	sw	a4,0(a5)
}
    80008ba6:	0001                	nop
    80008ba8:	6422                	ld	s0,8(sp)
    80008baa:	0141                	addi	sp,sp,16
    80008bac:	8082                	ret

0000000080008bae <plicinithart>:

void
plicinithart(void)
{
    80008bae:	1101                	addi	sp,sp,-32
    80008bb0:	ec06                	sd	ra,24(sp)
    80008bb2:	e822                	sd	s0,16(sp)
    80008bb4:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008bb6:	ffffa097          	auipc	ra,0xffffa
    80008bba:	c00080e7          	jalr	-1024(ra) # 800027b6 <cpuid>
    80008bbe:	87aa                	mv	a5,a0
    80008bc0:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008bc4:	fec42783          	lw	a5,-20(s0)
    80008bc8:	0087979b          	slliw	a5,a5,0x8
    80008bcc:	2781                	sext.w	a5,a5
    80008bce:	873e                	mv	a4,a5
    80008bd0:	0c0027b7          	lui	a5,0xc002
    80008bd4:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008bd8:	97ba                	add	a5,a5,a4
    80008bda:	873e                	mv	a4,a5
    80008bdc:	40200793          	li	a5,1026
    80008be0:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008be2:	fec42783          	lw	a5,-20(s0)
    80008be6:	00d7979b          	slliw	a5,a5,0xd
    80008bea:	2781                	sext.w	a5,a5
    80008bec:	873e                	mv	a4,a5
    80008bee:	0c2017b7          	lui	a5,0xc201
    80008bf2:	97ba                	add	a5,a5,a4
    80008bf4:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008bf8:	0001                	nop
    80008bfa:	60e2                	ld	ra,24(sp)
    80008bfc:	6442                	ld	s0,16(sp)
    80008bfe:	6105                	addi	sp,sp,32
    80008c00:	8082                	ret

0000000080008c02 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008c02:	1101                	addi	sp,sp,-32
    80008c04:	ec06                	sd	ra,24(sp)
    80008c06:	e822                	sd	s0,16(sp)
    80008c08:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008c0a:	ffffa097          	auipc	ra,0xffffa
    80008c0e:	bac080e7          	jalr	-1108(ra) # 800027b6 <cpuid>
    80008c12:	87aa                	mv	a5,a0
    80008c14:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008c18:	fec42783          	lw	a5,-20(s0)
    80008c1c:	00d7979b          	slliw	a5,a5,0xd
    80008c20:	2781                	sext.w	a5,a5
    80008c22:	873e                	mv	a4,a5
    80008c24:	0c2017b7          	lui	a5,0xc201
    80008c28:	0791                	addi	a5,a5,4
    80008c2a:	97ba                	add	a5,a5,a4
    80008c2c:	439c                	lw	a5,0(a5)
    80008c2e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008c32:	fe842783          	lw	a5,-24(s0)
}
    80008c36:	853e                	mv	a0,a5
    80008c38:	60e2                	ld	ra,24(sp)
    80008c3a:	6442                	ld	s0,16(sp)
    80008c3c:	6105                	addi	sp,sp,32
    80008c3e:	8082                	ret

0000000080008c40 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008c40:	7179                	addi	sp,sp,-48
    80008c42:	f406                	sd	ra,40(sp)
    80008c44:	f022                	sd	s0,32(sp)
    80008c46:	1800                	addi	s0,sp,48
    80008c48:	87aa                	mv	a5,a0
    80008c4a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008c4e:	ffffa097          	auipc	ra,0xffffa
    80008c52:	b68080e7          	jalr	-1176(ra) # 800027b6 <cpuid>
    80008c56:	87aa                	mv	a5,a0
    80008c58:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008c5c:	fec42783          	lw	a5,-20(s0)
    80008c60:	00d7979b          	slliw	a5,a5,0xd
    80008c64:	2781                	sext.w	a5,a5
    80008c66:	873e                	mv	a4,a5
    80008c68:	0c2017b7          	lui	a5,0xc201
    80008c6c:	0791                	addi	a5,a5,4
    80008c6e:	97ba                	add	a5,a5,a4
    80008c70:	873e                	mv	a4,a5
    80008c72:	fdc42783          	lw	a5,-36(s0)
    80008c76:	c31c                	sw	a5,0(a4)
}
    80008c78:	0001                	nop
    80008c7a:	70a2                	ld	ra,40(sp)
    80008c7c:	7402                	ld	s0,32(sp)
    80008c7e:	6145                	addi	sp,sp,48
    80008c80:	8082                	ret

0000000080008c82 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80008c82:	7179                	addi	sp,sp,-48
    80008c84:	f406                	sd	ra,40(sp)
    80008c86:	f022                	sd	s0,32(sp)
    80008c88:	1800                	addi	s0,sp,48
  uint32 status = 0;
    80008c8a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    80008c8e:	00003597          	auipc	a1,0x3
    80008c92:	a4258593          	addi	a1,a1,-1470 # 8000b6d0 <etext+0x6d0>
    80008c96:	0001f517          	auipc	a0,0x1f
    80008c9a:	49250513          	addi	a0,a0,1170 # 80028128 <disk+0x2128>
    80008c9e:	ffff8097          	auipc	ra,0xffff8
    80008ca2:	5a0080e7          	jalr	1440(ra) # 8000123e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008ca6:	100017b7          	lui	a5,0x10001
    80008caa:	439c                	lw	a5,0(a5)
    80008cac:	2781                	sext.w	a5,a5
    80008cae:	873e                	mv	a4,a5
    80008cb0:	747277b7          	lui	a5,0x74727
    80008cb4:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008cb8:	04f71063          	bne	a4,a5,80008cf8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008cbc:	100017b7          	lui	a5,0x10001
    80008cc0:	0791                	addi	a5,a5,4
    80008cc2:	439c                	lw	a5,0(a5)
    80008cc4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008cc6:	873e                	mv	a4,a5
    80008cc8:	4785                	li	a5,1
    80008cca:	02f71763          	bne	a4,a5,80008cf8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008cce:	100017b7          	lui	a5,0x10001
    80008cd2:	07a1                	addi	a5,a5,8
    80008cd4:	439c                	lw	a5,0(a5)
    80008cd6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008cd8:	873e                	mv	a4,a5
    80008cda:	4789                	li	a5,2
    80008cdc:	00f71e63          	bne	a4,a5,80008cf8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008ce0:	100017b7          	lui	a5,0x10001
    80008ce4:	07b1                	addi	a5,a5,12
    80008ce6:	439c                	lw	a5,0(a5)
    80008ce8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008cea:	873e                	mv	a4,a5
    80008cec:	554d47b7          	lui	a5,0x554d4
    80008cf0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008cf4:	00f70a63          	beq	a4,a5,80008d08 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008cf8:	00003517          	auipc	a0,0x3
    80008cfc:	9e850513          	addi	a0,a0,-1560 # 8000b6e0 <etext+0x6e0>
    80008d00:	ffff8097          	auipc	ra,0xffff8
    80008d04:	f7e080e7          	jalr	-130(ra) # 80000c7e <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008d08:	fe842783          	lw	a5,-24(s0)
    80008d0c:	0017e793          	ori	a5,a5,1
    80008d10:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008d14:	100017b7          	lui	a5,0x10001
    80008d18:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008d1c:	fe842703          	lw	a4,-24(s0)
    80008d20:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    80008d22:	fe842783          	lw	a5,-24(s0)
    80008d26:	0027e793          	ori	a5,a5,2
    80008d2a:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008d2e:	100017b7          	lui	a5,0x10001
    80008d32:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008d36:	fe842703          	lw	a4,-24(s0)
    80008d3a:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008d3c:	100017b7          	lui	a5,0x10001
    80008d40:	07c1                	addi	a5,a5,16
    80008d42:	439c                	lw	a5,0(a5)
    80008d44:	2781                	sext.w	a5,a5
    80008d46:	1782                	slli	a5,a5,0x20
    80008d48:	9381                	srli	a5,a5,0x20
    80008d4a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008d4e:	fe043783          	ld	a5,-32(s0)
    80008d52:	fdf7f793          	andi	a5,a5,-33
    80008d56:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008d5a:	fe043783          	ld	a5,-32(s0)
    80008d5e:	f7f7f793          	andi	a5,a5,-129
    80008d62:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008d66:	fe043703          	ld	a4,-32(s0)
    80008d6a:	77fd                	lui	a5,0xfffff
    80008d6c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd67ff>
    80008d70:	8ff9                	and	a5,a5,a4
    80008d72:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008d76:	fe043703          	ld	a4,-32(s0)
    80008d7a:	77fd                	lui	a5,0xfffff
    80008d7c:	17fd                	addi	a5,a5,-1
    80008d7e:	8ff9                	and	a5,a5,a4
    80008d80:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008d84:	fe043703          	ld	a4,-32(s0)
    80008d88:	f80007b7          	lui	a5,0xf8000
    80008d8c:	17fd                	addi	a5,a5,-1
    80008d8e:	8ff9                	and	a5,a5,a4
    80008d90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008d94:	fe043703          	ld	a4,-32(s0)
    80008d98:	e00007b7          	lui	a5,0xe0000
    80008d9c:	17fd                	addi	a5,a5,-1
    80008d9e:	8ff9                	and	a5,a5,a4
    80008da0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008da4:	fe043703          	ld	a4,-32(s0)
    80008da8:	f00007b7          	lui	a5,0xf0000
    80008dac:	17fd                	addi	a5,a5,-1
    80008dae:	8ff9                	and	a5,a5,a4
    80008db0:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008db4:	100017b7          	lui	a5,0x10001
    80008db8:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008dbc:	fe043703          	ld	a4,-32(s0)
    80008dc0:	2701                	sext.w	a4,a4
    80008dc2:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008dc4:	fe842783          	lw	a5,-24(s0)
    80008dc8:	0087e793          	ori	a5,a5,8
    80008dcc:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008dd0:	100017b7          	lui	a5,0x10001
    80008dd4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008dd8:	fe842703          	lw	a4,-24(s0)
    80008ddc:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008dde:	fe842783          	lw	a5,-24(s0)
    80008de2:	0047e793          	ori	a5,a5,4
    80008de6:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008dea:	100017b7          	lui	a5,0x10001
    80008dee:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008df2:	fe842703          	lw	a4,-24(s0)
    80008df6:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80008df8:	100017b7          	lui	a5,0x10001
    80008dfc:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    80008e00:	6705                	lui	a4,0x1
    80008e02:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008e04:	100017b7          	lui	a5,0x10001
    80008e08:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008e0c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008e10:	100017b7          	lui	a5,0x10001
    80008e14:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008e18:	439c                	lw	a5,0(a5)
    80008e1a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008e1e:	fdc42783          	lw	a5,-36(s0)
    80008e22:	2781                	sext.w	a5,a5
    80008e24:	eb89                	bnez	a5,80008e36 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    80008e26:	00003517          	auipc	a0,0x3
    80008e2a:	8da50513          	addi	a0,a0,-1830 # 8000b700 <etext+0x700>
    80008e2e:	ffff8097          	auipc	ra,0xffff8
    80008e32:	e50080e7          	jalr	-432(ra) # 80000c7e <panic>
  if(max < NUM)
    80008e36:	fdc42783          	lw	a5,-36(s0)
    80008e3a:	0007871b          	sext.w	a4,a5
    80008e3e:	479d                	li	a5,7
    80008e40:	00e7ea63          	bltu	a5,a4,80008e54 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    80008e44:	00003517          	auipc	a0,0x3
    80008e48:	8dc50513          	addi	a0,a0,-1828 # 8000b720 <etext+0x720>
    80008e4c:	ffff8097          	auipc	ra,0xffff8
    80008e50:	e32080e7          	jalr	-462(ra) # 80000c7e <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008e54:	100017b7          	lui	a5,0x10001
    80008e58:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008e5c:	4721                	li	a4,8
    80008e5e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80008e60:	6609                	lui	a2,0x2
    80008e62:	4581                	li	a1,0
    80008e64:	0001d517          	auipc	a0,0x1d
    80008e68:	19c50513          	addi	a0,a0,412 # 80026000 <disk>
    80008e6c:	ffff8097          	auipc	ra,0xffff8
    80008e70:	5d6080e7          	jalr	1494(ra) # 80001442 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80008e74:	0001d797          	auipc	a5,0x1d
    80008e78:	18c78793          	addi	a5,a5,396 # 80026000 <disk>
    80008e7c:	00c7d713          	srli	a4,a5,0xc
    80008e80:	100017b7          	lui	a5,0x10001
    80008e84:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80008e88:	2701                	sext.w	a4,a4
    80008e8a:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    80008e8c:	0001d717          	auipc	a4,0x1d
    80008e90:	17470713          	addi	a4,a4,372 # 80026000 <disk>
    80008e94:	6789                	lui	a5,0x2
    80008e96:	97ba                	add	a5,a5,a4
    80008e98:	0001d717          	auipc	a4,0x1d
    80008e9c:	16870713          	addi	a4,a4,360 # 80026000 <disk>
    80008ea0:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80008ea2:	0001d717          	auipc	a4,0x1d
    80008ea6:	1de70713          	addi	a4,a4,478 # 80026080 <disk+0x80>
    80008eaa:	0001d697          	auipc	a3,0x1d
    80008eae:	15668693          	addi	a3,a3,342 # 80026000 <disk>
    80008eb2:	6789                	lui	a5,0x2
    80008eb4:	97b6                	add	a5,a5,a3
    80008eb6:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80008eb8:	0001e717          	auipc	a4,0x1e
    80008ebc:	14870713          	addi	a4,a4,328 # 80027000 <disk+0x1000>
    80008ec0:	0001d697          	auipc	a3,0x1d
    80008ec4:	14068693          	addi	a3,a3,320 # 80026000 <disk>
    80008ec8:	6789                	lui	a5,0x2
    80008eca:	97b6                	add	a5,a5,a3
    80008ecc:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008ece:	fe042623          	sw	zero,-20(s0)
    80008ed2:	a015                	j	80008ef6 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80008ed4:	0001d717          	auipc	a4,0x1d
    80008ed8:	12c70713          	addi	a4,a4,300 # 80026000 <disk>
    80008edc:	fec42783          	lw	a5,-20(s0)
    80008ee0:	97ba                	add	a5,a5,a4
    80008ee2:	6709                	lui	a4,0x2
    80008ee4:	97ba                	add	a5,a5,a4
    80008ee6:	4705                	li	a4,1
    80008ee8:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    80008eec:	fec42783          	lw	a5,-20(s0)
    80008ef0:	2785                	addiw	a5,a5,1
    80008ef2:	fef42623          	sw	a5,-20(s0)
    80008ef6:	fec42783          	lw	a5,-20(s0)
    80008efa:	0007871b          	sext.w	a4,a5
    80008efe:	479d                	li	a5,7
    80008f00:	fce7dae3          	bge	a5,a4,80008ed4 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80008f04:	0001                	nop
    80008f06:	0001                	nop
    80008f08:	70a2                	ld	ra,40(sp)
    80008f0a:	7402                	ld	s0,32(sp)
    80008f0c:	6145                	addi	sp,sp,48
    80008f0e:	8082                	ret

0000000080008f10 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80008f10:	1101                	addi	sp,sp,-32
    80008f12:	ec22                	sd	s0,24(sp)
    80008f14:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80008f16:	fe042623          	sw	zero,-20(s0)
    80008f1a:	a081                	j	80008f5a <alloc_desc+0x4a>
    if(disk.free[i]){
    80008f1c:	0001d717          	auipc	a4,0x1d
    80008f20:	0e470713          	addi	a4,a4,228 # 80026000 <disk>
    80008f24:	fec42783          	lw	a5,-20(s0)
    80008f28:	97ba                	add	a5,a5,a4
    80008f2a:	6709                	lui	a4,0x2
    80008f2c:	97ba                	add	a5,a5,a4
    80008f2e:	0187c783          	lbu	a5,24(a5)
    80008f32:	cf99                	beqz	a5,80008f50 <alloc_desc+0x40>
      disk.free[i] = 0;
    80008f34:	0001d717          	auipc	a4,0x1d
    80008f38:	0cc70713          	addi	a4,a4,204 # 80026000 <disk>
    80008f3c:	fec42783          	lw	a5,-20(s0)
    80008f40:	97ba                	add	a5,a5,a4
    80008f42:	6709                	lui	a4,0x2
    80008f44:	97ba                	add	a5,a5,a4
    80008f46:	00078c23          	sb	zero,24(a5)
      return i;
    80008f4a:	fec42783          	lw	a5,-20(s0)
    80008f4e:	a831                	j	80008f6a <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    80008f50:	fec42783          	lw	a5,-20(s0)
    80008f54:	2785                	addiw	a5,a5,1
    80008f56:	fef42623          	sw	a5,-20(s0)
    80008f5a:	fec42783          	lw	a5,-20(s0)
    80008f5e:	0007871b          	sext.w	a4,a5
    80008f62:	479d                	li	a5,7
    80008f64:	fae7dce3          	bge	a5,a4,80008f1c <alloc_desc+0xc>
    }
  }
  return -1;
    80008f68:	57fd                	li	a5,-1
}
    80008f6a:	853e                	mv	a0,a5
    80008f6c:	6462                	ld	s0,24(sp)
    80008f6e:	6105                	addi	sp,sp,32
    80008f70:	8082                	ret

0000000080008f72 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80008f72:	1101                	addi	sp,sp,-32
    80008f74:	ec06                	sd	ra,24(sp)
    80008f76:	e822                	sd	s0,16(sp)
    80008f78:	1000                	addi	s0,sp,32
    80008f7a:	87aa                	mv	a5,a0
    80008f7c:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80008f80:	fec42783          	lw	a5,-20(s0)
    80008f84:	0007871b          	sext.w	a4,a5
    80008f88:	479d                	li	a5,7
    80008f8a:	00e7da63          	bge	a5,a4,80008f9e <free_desc+0x2c>
    panic("free_desc 1");
    80008f8e:	00002517          	auipc	a0,0x2
    80008f92:	7b250513          	addi	a0,a0,1970 # 8000b740 <etext+0x740>
    80008f96:	ffff8097          	auipc	ra,0xffff8
    80008f9a:	ce8080e7          	jalr	-792(ra) # 80000c7e <panic>
  if(disk.free[i])
    80008f9e:	0001d717          	auipc	a4,0x1d
    80008fa2:	06270713          	addi	a4,a4,98 # 80026000 <disk>
    80008fa6:	fec42783          	lw	a5,-20(s0)
    80008faa:	97ba                	add	a5,a5,a4
    80008fac:	6709                	lui	a4,0x2
    80008fae:	97ba                	add	a5,a5,a4
    80008fb0:	0187c783          	lbu	a5,24(a5)
    80008fb4:	cb89                	beqz	a5,80008fc6 <free_desc+0x54>
    panic("free_desc 2");
    80008fb6:	00002517          	auipc	a0,0x2
    80008fba:	79a50513          	addi	a0,a0,1946 # 8000b750 <etext+0x750>
    80008fbe:	ffff8097          	auipc	ra,0xffff8
    80008fc2:	cc0080e7          	jalr	-832(ra) # 80000c7e <panic>
  disk.desc[i].addr = 0;
    80008fc6:	0001d717          	auipc	a4,0x1d
    80008fca:	03a70713          	addi	a4,a4,58 # 80026000 <disk>
    80008fce:	6789                	lui	a5,0x2
    80008fd0:	97ba                	add	a5,a5,a4
    80008fd2:	6398                	ld	a4,0(a5)
    80008fd4:	fec42783          	lw	a5,-20(s0)
    80008fd8:	0792                	slli	a5,a5,0x4
    80008fda:	97ba                	add	a5,a5,a4
    80008fdc:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    80008fe0:	0001d717          	auipc	a4,0x1d
    80008fe4:	02070713          	addi	a4,a4,32 # 80026000 <disk>
    80008fe8:	6789                	lui	a5,0x2
    80008fea:	97ba                	add	a5,a5,a4
    80008fec:	6398                	ld	a4,0(a5)
    80008fee:	fec42783          	lw	a5,-20(s0)
    80008ff2:	0792                	slli	a5,a5,0x4
    80008ff4:	97ba                	add	a5,a5,a4
    80008ff6:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    80008ffa:	0001d717          	auipc	a4,0x1d
    80008ffe:	00670713          	addi	a4,a4,6 # 80026000 <disk>
    80009002:	6789                	lui	a5,0x2
    80009004:	97ba                	add	a5,a5,a4
    80009006:	6398                	ld	a4,0(a5)
    80009008:	fec42783          	lw	a5,-20(s0)
    8000900c:	0792                	slli	a5,a5,0x4
    8000900e:	97ba                	add	a5,a5,a4
    80009010:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    80009014:	0001d717          	auipc	a4,0x1d
    80009018:	fec70713          	addi	a4,a4,-20 # 80026000 <disk>
    8000901c:	6789                	lui	a5,0x2
    8000901e:	97ba                	add	a5,a5,a4
    80009020:	6398                	ld	a4,0(a5)
    80009022:	fec42783          	lw	a5,-20(s0)
    80009026:	0792                	slli	a5,a5,0x4
    80009028:	97ba                	add	a5,a5,a4
    8000902a:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    8000902e:	0001d717          	auipc	a4,0x1d
    80009032:	fd270713          	addi	a4,a4,-46 # 80026000 <disk>
    80009036:	fec42783          	lw	a5,-20(s0)
    8000903a:	97ba                	add	a5,a5,a4
    8000903c:	6709                	lui	a4,0x2
    8000903e:	97ba                	add	a5,a5,a4
    80009040:	4705                	li	a4,1
    80009042:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80009046:	0001f517          	auipc	a0,0x1f
    8000904a:	fd250513          	addi	a0,a0,-46 # 80028018 <disk+0x2018>
    8000904e:	ffffa097          	auipc	ra,0xffffa
    80009052:	78a080e7          	jalr	1930(ra) # 800037d8 <wakeup>
}
    80009056:	0001                	nop
    80009058:	60e2                	ld	ra,24(sp)
    8000905a:	6442                	ld	s0,16(sp)
    8000905c:	6105                	addi	sp,sp,32
    8000905e:	8082                	ret

0000000080009060 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80009060:	7179                	addi	sp,sp,-48
    80009062:	f406                	sd	ra,40(sp)
    80009064:	f022                	sd	s0,32(sp)
    80009066:	1800                	addi	s0,sp,48
    80009068:	87aa                	mv	a5,a0
    8000906a:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    8000906e:	0001d717          	auipc	a4,0x1d
    80009072:	f9270713          	addi	a4,a4,-110 # 80026000 <disk>
    80009076:	6789                	lui	a5,0x2
    80009078:	97ba                	add	a5,a5,a4
    8000907a:	6398                	ld	a4,0(a5)
    8000907c:	fdc42783          	lw	a5,-36(s0)
    80009080:	0792                	slli	a5,a5,0x4
    80009082:	97ba                	add	a5,a5,a4
    80009084:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80009088:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    8000908c:	0001d717          	auipc	a4,0x1d
    80009090:	f7470713          	addi	a4,a4,-140 # 80026000 <disk>
    80009094:	6789                	lui	a5,0x2
    80009096:	97ba                	add	a5,a5,a4
    80009098:	6398                	ld	a4,0(a5)
    8000909a:	fdc42783          	lw	a5,-36(s0)
    8000909e:	0792                	slli	a5,a5,0x4
    800090a0:	97ba                	add	a5,a5,a4
    800090a2:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    800090a6:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    800090aa:	fdc42783          	lw	a5,-36(s0)
    800090ae:	853e                	mv	a0,a5
    800090b0:	00000097          	auipc	ra,0x0
    800090b4:	ec2080e7          	jalr	-318(ra) # 80008f72 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800090b8:	fec42783          	lw	a5,-20(s0)
    800090bc:	8b85                	andi	a5,a5,1
    800090be:	2781                	sext.w	a5,a5
    800090c0:	c791                	beqz	a5,800090cc <free_chain+0x6c>
      i = nxt;
    800090c2:	fe842783          	lw	a5,-24(s0)
    800090c6:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    800090ca:	b755                	j	8000906e <free_chain+0xe>
    else
      break;
    800090cc:	0001                	nop
  }
}
    800090ce:	0001                	nop
    800090d0:	70a2                	ld	ra,40(sp)
    800090d2:	7402                	ld	s0,32(sp)
    800090d4:	6145                	addi	sp,sp,48
    800090d6:	8082                	ret

00000000800090d8 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    800090d8:	7139                	addi	sp,sp,-64
    800090da:	fc06                	sd	ra,56(sp)
    800090dc:	f822                	sd	s0,48(sp)
    800090de:	f426                	sd	s1,40(sp)
    800090e0:	0080                	addi	s0,sp,64
    800090e2:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    800090e6:	fc042e23          	sw	zero,-36(s0)
    800090ea:	a895                	j	8000915e <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    800090ec:	fdc42783          	lw	a5,-36(s0)
    800090f0:	078a                	slli	a5,a5,0x2
    800090f2:	fc843703          	ld	a4,-56(s0)
    800090f6:	00f704b3          	add	s1,a4,a5
    800090fa:	00000097          	auipc	ra,0x0
    800090fe:	e16080e7          	jalr	-490(ra) # 80008f10 <alloc_desc>
    80009102:	87aa                	mv	a5,a0
    80009104:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009106:	fdc42783          	lw	a5,-36(s0)
    8000910a:	078a                	slli	a5,a5,0x2
    8000910c:	fc843703          	ld	a4,-56(s0)
    80009110:	97ba                	add	a5,a5,a4
    80009112:	439c                	lw	a5,0(a5)
    80009114:	0407d063          	bgez	a5,80009154 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    80009118:	fc042c23          	sw	zero,-40(s0)
    8000911c:	a015                	j	80009140 <alloc3_desc+0x68>
        free_desc(idx[j]);
    8000911e:	fd842783          	lw	a5,-40(s0)
    80009122:	078a                	slli	a5,a5,0x2
    80009124:	fc843703          	ld	a4,-56(s0)
    80009128:	97ba                	add	a5,a5,a4
    8000912a:	439c                	lw	a5,0(a5)
    8000912c:	853e                	mv	a0,a5
    8000912e:	00000097          	auipc	ra,0x0
    80009132:	e44080e7          	jalr	-444(ra) # 80008f72 <free_desc>
      for(int j = 0; j < i; j++)
    80009136:	fd842783          	lw	a5,-40(s0)
    8000913a:	2785                	addiw	a5,a5,1
    8000913c:	fcf42c23          	sw	a5,-40(s0)
    80009140:	fd842703          	lw	a4,-40(s0)
    80009144:	fdc42783          	lw	a5,-36(s0)
    80009148:	2701                	sext.w	a4,a4
    8000914a:	2781                	sext.w	a5,a5
    8000914c:	fcf749e3          	blt	a4,a5,8000911e <alloc3_desc+0x46>
      return -1;
    80009150:	57fd                	li	a5,-1
    80009152:	a831                	j	8000916e <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    80009154:	fdc42783          	lw	a5,-36(s0)
    80009158:	2785                	addiw	a5,a5,1
    8000915a:	fcf42e23          	sw	a5,-36(s0)
    8000915e:	fdc42783          	lw	a5,-36(s0)
    80009162:	0007871b          	sext.w	a4,a5
    80009166:	4789                	li	a5,2
    80009168:	f8e7d2e3          	bge	a5,a4,800090ec <alloc3_desc+0x14>
    }
  }
  return 0;
    8000916c:	4781                	li	a5,0
}
    8000916e:	853e                	mv	a0,a5
    80009170:	70e2                	ld	ra,56(sp)
    80009172:	7442                	ld	s0,48(sp)
    80009174:	74a2                	ld	s1,40(sp)
    80009176:	6121                	addi	sp,sp,64
    80009178:	8082                	ret

000000008000917a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000917a:	7139                	addi	sp,sp,-64
    8000917c:	fc06                	sd	ra,56(sp)
    8000917e:	f822                	sd	s0,48(sp)
    80009180:	0080                	addi	s0,sp,64
    80009182:	fca43423          	sd	a0,-56(s0)
    80009186:	87ae                	mv	a5,a1
    80009188:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000918c:	fc843783          	ld	a5,-56(s0)
    80009190:	47dc                	lw	a5,12(a5)
    80009192:	0017979b          	slliw	a5,a5,0x1
    80009196:	2781                	sext.w	a5,a5
    80009198:	1782                	slli	a5,a5,0x20
    8000919a:	9381                	srli	a5,a5,0x20
    8000919c:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    800091a0:	0001f517          	auipc	a0,0x1f
    800091a4:	f8850513          	addi	a0,a0,-120 # 80028128 <disk+0x2128>
    800091a8:	ffff8097          	auipc	ra,0xffff8
    800091ac:	0c6080e7          	jalr	198(ra) # 8000126e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    800091b0:	fd040793          	addi	a5,s0,-48
    800091b4:	853e                	mv	a0,a5
    800091b6:	00000097          	auipc	ra,0x0
    800091ba:	f22080e7          	jalr	-222(ra) # 800090d8 <alloc3_desc>
    800091be:	87aa                	mv	a5,a0
    800091c0:	cf91                	beqz	a5,800091dc <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    800091c2:	0001f597          	auipc	a1,0x1f
    800091c6:	f6658593          	addi	a1,a1,-154 # 80028128 <disk+0x2128>
    800091ca:	0001f517          	auipc	a0,0x1f
    800091ce:	e4e50513          	addi	a0,a0,-434 # 80028018 <disk+0x2018>
    800091d2:	ffffa097          	auipc	ra,0xffffa
    800091d6:	58a080e7          	jalr	1418(ra) # 8000375c <sleep>
    if(alloc3_desc(idx) == 0) {
    800091da:	bfd9                	j	800091b0 <virtio_disk_rw+0x36>
      break;
    800091dc:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    800091de:	fd042783          	lw	a5,-48(s0)
    800091e2:	20078793          	addi	a5,a5,512
    800091e6:	00479713          	slli	a4,a5,0x4
    800091ea:	0001d797          	auipc	a5,0x1d
    800091ee:	e1678793          	addi	a5,a5,-490 # 80026000 <disk>
    800091f2:	97ba                	add	a5,a5,a4
    800091f4:	0a878793          	addi	a5,a5,168
    800091f8:	fef43023          	sd	a5,-32(s0)

  if(write)
    800091fc:	fc442783          	lw	a5,-60(s0)
    80009200:	2781                	sext.w	a5,a5
    80009202:	c791                	beqz	a5,8000920e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009204:	fe043783          	ld	a5,-32(s0)
    80009208:	4705                	li	a4,1
    8000920a:	c398                	sw	a4,0(a5)
    8000920c:	a029                	j	80009216 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000920e:	fe043783          	ld	a5,-32(s0)
    80009212:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009216:	fe043783          	ld	a5,-32(s0)
    8000921a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000921e:	fe043783          	ld	a5,-32(s0)
    80009222:	fe843703          	ld	a4,-24(s0)
    80009226:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80009228:	0001d717          	auipc	a4,0x1d
    8000922c:	dd870713          	addi	a4,a4,-552 # 80026000 <disk>
    80009230:	6789                	lui	a5,0x2
    80009232:	97ba                	add	a5,a5,a4
    80009234:	6398                	ld	a4,0(a5)
    80009236:	fd042783          	lw	a5,-48(s0)
    8000923a:	0792                	slli	a5,a5,0x4
    8000923c:	97ba                	add	a5,a5,a4
    8000923e:	fe043703          	ld	a4,-32(s0)
    80009242:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009244:	0001d717          	auipc	a4,0x1d
    80009248:	dbc70713          	addi	a4,a4,-580 # 80026000 <disk>
    8000924c:	6789                	lui	a5,0x2
    8000924e:	97ba                	add	a5,a5,a4
    80009250:	6398                	ld	a4,0(a5)
    80009252:	fd042783          	lw	a5,-48(s0)
    80009256:	0792                	slli	a5,a5,0x4
    80009258:	97ba                	add	a5,a5,a4
    8000925a:	4741                	li	a4,16
    8000925c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8000925e:	0001d717          	auipc	a4,0x1d
    80009262:	da270713          	addi	a4,a4,-606 # 80026000 <disk>
    80009266:	6789                	lui	a5,0x2
    80009268:	97ba                	add	a5,a5,a4
    8000926a:	6398                	ld	a4,0(a5)
    8000926c:	fd042783          	lw	a5,-48(s0)
    80009270:	0792                	slli	a5,a5,0x4
    80009272:	97ba                	add	a5,a5,a4
    80009274:	4705                	li	a4,1
    80009276:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    8000927a:	fd442683          	lw	a3,-44(s0)
    8000927e:	0001d717          	auipc	a4,0x1d
    80009282:	d8270713          	addi	a4,a4,-638 # 80026000 <disk>
    80009286:	6789                	lui	a5,0x2
    80009288:	97ba                	add	a5,a5,a4
    8000928a:	6398                	ld	a4,0(a5)
    8000928c:	fd042783          	lw	a5,-48(s0)
    80009290:	0792                	slli	a5,a5,0x4
    80009292:	97ba                	add	a5,a5,a4
    80009294:	03069713          	slli	a4,a3,0x30
    80009298:	9341                	srli	a4,a4,0x30
    8000929a:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    8000929e:	fc843783          	ld	a5,-56(s0)
    800092a2:	05878693          	addi	a3,a5,88
    800092a6:	0001d717          	auipc	a4,0x1d
    800092aa:	d5a70713          	addi	a4,a4,-678 # 80026000 <disk>
    800092ae:	6789                	lui	a5,0x2
    800092b0:	97ba                	add	a5,a5,a4
    800092b2:	6398                	ld	a4,0(a5)
    800092b4:	fd442783          	lw	a5,-44(s0)
    800092b8:	0792                	slli	a5,a5,0x4
    800092ba:	97ba                	add	a5,a5,a4
    800092bc:	8736                	mv	a4,a3
    800092be:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    800092c0:	0001d717          	auipc	a4,0x1d
    800092c4:	d4070713          	addi	a4,a4,-704 # 80026000 <disk>
    800092c8:	6789                	lui	a5,0x2
    800092ca:	97ba                	add	a5,a5,a4
    800092cc:	6398                	ld	a4,0(a5)
    800092ce:	fd442783          	lw	a5,-44(s0)
    800092d2:	0792                	slli	a5,a5,0x4
    800092d4:	97ba                	add	a5,a5,a4
    800092d6:	40000713          	li	a4,1024
    800092da:	c798                	sw	a4,8(a5)
  if(write)
    800092dc:	fc442783          	lw	a5,-60(s0)
    800092e0:	2781                	sext.w	a5,a5
    800092e2:	cf99                	beqz	a5,80009300 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    800092e4:	0001d717          	auipc	a4,0x1d
    800092e8:	d1c70713          	addi	a4,a4,-740 # 80026000 <disk>
    800092ec:	6789                	lui	a5,0x2
    800092ee:	97ba                	add	a5,a5,a4
    800092f0:	6398                	ld	a4,0(a5)
    800092f2:	fd442783          	lw	a5,-44(s0)
    800092f6:	0792                	slli	a5,a5,0x4
    800092f8:	97ba                	add	a5,a5,a4
    800092fa:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    800092fe:	a839                	j	8000931c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009300:	0001d717          	auipc	a4,0x1d
    80009304:	d0070713          	addi	a4,a4,-768 # 80026000 <disk>
    80009308:	6789                	lui	a5,0x2
    8000930a:	97ba                	add	a5,a5,a4
    8000930c:	6398                	ld	a4,0(a5)
    8000930e:	fd442783          	lw	a5,-44(s0)
    80009312:	0792                	slli	a5,a5,0x4
    80009314:	97ba                	add	a5,a5,a4
    80009316:	4709                	li	a4,2
    80009318:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000931c:	0001d717          	auipc	a4,0x1d
    80009320:	ce470713          	addi	a4,a4,-796 # 80026000 <disk>
    80009324:	6789                	lui	a5,0x2
    80009326:	97ba                	add	a5,a5,a4
    80009328:	6398                	ld	a4,0(a5)
    8000932a:	fd442783          	lw	a5,-44(s0)
    8000932e:	0792                	slli	a5,a5,0x4
    80009330:	97ba                	add	a5,a5,a4
    80009332:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    80009336:	0001d697          	auipc	a3,0x1d
    8000933a:	cca68693          	addi	a3,a3,-822 # 80026000 <disk>
    8000933e:	6789                	lui	a5,0x2
    80009340:	97b6                	add	a5,a5,a3
    80009342:	6394                	ld	a3,0(a5)
    80009344:	fd442783          	lw	a5,-44(s0)
    80009348:	0792                	slli	a5,a5,0x4
    8000934a:	97b6                	add	a5,a5,a3
    8000934c:	00176713          	ori	a4,a4,1
    80009350:	1742                	slli	a4,a4,0x30
    80009352:	9341                	srli	a4,a4,0x30
    80009354:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    80009358:	fd842683          	lw	a3,-40(s0)
    8000935c:	0001d717          	auipc	a4,0x1d
    80009360:	ca470713          	addi	a4,a4,-860 # 80026000 <disk>
    80009364:	6789                	lui	a5,0x2
    80009366:	97ba                	add	a5,a5,a4
    80009368:	6398                	ld	a4,0(a5)
    8000936a:	fd442783          	lw	a5,-44(s0)
    8000936e:	0792                	slli	a5,a5,0x4
    80009370:	97ba                	add	a5,a5,a4
    80009372:	03069713          	slli	a4,a3,0x30
    80009376:	9341                	srli	a4,a4,0x30
    80009378:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000937c:	fd042783          	lw	a5,-48(s0)
    80009380:	0001d717          	auipc	a4,0x1d
    80009384:	c8070713          	addi	a4,a4,-896 # 80026000 <disk>
    80009388:	20078793          	addi	a5,a5,512
    8000938c:	0792                	slli	a5,a5,0x4
    8000938e:	97ba                	add	a5,a5,a4
    80009390:	577d                	li	a4,-1
    80009392:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80009396:	fd042783          	lw	a5,-48(s0)
    8000939a:	20078793          	addi	a5,a5,512
    8000939e:	00479713          	slli	a4,a5,0x4
    800093a2:	0001d797          	auipc	a5,0x1d
    800093a6:	c5e78793          	addi	a5,a5,-930 # 80026000 <disk>
    800093aa:	97ba                	add	a5,a5,a4
    800093ac:	03078693          	addi	a3,a5,48
    800093b0:	0001d717          	auipc	a4,0x1d
    800093b4:	c5070713          	addi	a4,a4,-944 # 80026000 <disk>
    800093b8:	6789                	lui	a5,0x2
    800093ba:	97ba                	add	a5,a5,a4
    800093bc:	6398                	ld	a4,0(a5)
    800093be:	fd842783          	lw	a5,-40(s0)
    800093c2:	0792                	slli	a5,a5,0x4
    800093c4:	97ba                	add	a5,a5,a4
    800093c6:	8736                	mv	a4,a3
    800093c8:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    800093ca:	0001d717          	auipc	a4,0x1d
    800093ce:	c3670713          	addi	a4,a4,-970 # 80026000 <disk>
    800093d2:	6789                	lui	a5,0x2
    800093d4:	97ba                	add	a5,a5,a4
    800093d6:	6398                	ld	a4,0(a5)
    800093d8:	fd842783          	lw	a5,-40(s0)
    800093dc:	0792                	slli	a5,a5,0x4
    800093de:	97ba                	add	a5,a5,a4
    800093e0:	4705                	li	a4,1
    800093e2:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    800093e4:	0001d717          	auipc	a4,0x1d
    800093e8:	c1c70713          	addi	a4,a4,-996 # 80026000 <disk>
    800093ec:	6789                	lui	a5,0x2
    800093ee:	97ba                	add	a5,a5,a4
    800093f0:	6398                	ld	a4,0(a5)
    800093f2:	fd842783          	lw	a5,-40(s0)
    800093f6:	0792                	slli	a5,a5,0x4
    800093f8:	97ba                	add	a5,a5,a4
    800093fa:	4709                	li	a4,2
    800093fc:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    80009400:	0001d717          	auipc	a4,0x1d
    80009404:	c0070713          	addi	a4,a4,-1024 # 80026000 <disk>
    80009408:	6789                	lui	a5,0x2
    8000940a:	97ba                	add	a5,a5,a4
    8000940c:	6398                	ld	a4,0(a5)
    8000940e:	fd842783          	lw	a5,-40(s0)
    80009412:	0792                	slli	a5,a5,0x4
    80009414:	97ba                	add	a5,a5,a4
    80009416:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000941a:	fc843783          	ld	a5,-56(s0)
    8000941e:	4705                	li	a4,1
    80009420:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    80009422:	fd042783          	lw	a5,-48(s0)
    80009426:	0001d717          	auipc	a4,0x1d
    8000942a:	bda70713          	addi	a4,a4,-1062 # 80026000 <disk>
    8000942e:	20078793          	addi	a5,a5,512
    80009432:	0792                	slli	a5,a5,0x4
    80009434:	97ba                	add	a5,a5,a4
    80009436:	fc843703          	ld	a4,-56(s0)
    8000943a:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    8000943c:	fd042603          	lw	a2,-48(s0)
    80009440:	0001d717          	auipc	a4,0x1d
    80009444:	bc070713          	addi	a4,a4,-1088 # 80026000 <disk>
    80009448:	6789                	lui	a5,0x2
    8000944a:	97ba                	add	a5,a5,a4
    8000944c:	6794                	ld	a3,8(a5)
    8000944e:	0001d717          	auipc	a4,0x1d
    80009452:	bb270713          	addi	a4,a4,-1102 # 80026000 <disk>
    80009456:	6789                	lui	a5,0x2
    80009458:	97ba                	add	a5,a5,a4
    8000945a:	679c                	ld	a5,8(a5)
    8000945c:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009460:	2781                	sext.w	a5,a5
    80009462:	8b9d                	andi	a5,a5,7
    80009464:	2781                	sext.w	a5,a5
    80009466:	03061713          	slli	a4,a2,0x30
    8000946a:	9341                	srli	a4,a4,0x30
    8000946c:	0786                	slli	a5,a5,0x1
    8000946e:	97b6                	add	a5,a5,a3
    80009470:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009474:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009478:	0001d717          	auipc	a4,0x1d
    8000947c:	b8870713          	addi	a4,a4,-1144 # 80026000 <disk>
    80009480:	6789                	lui	a5,0x2
    80009482:	97ba                	add	a5,a5,a4
    80009484:	679c                	ld	a5,8(a5)
    80009486:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000948a:	0001d697          	auipc	a3,0x1d
    8000948e:	b7668693          	addi	a3,a3,-1162 # 80026000 <disk>
    80009492:	6789                	lui	a5,0x2
    80009494:	97b6                	add	a5,a5,a3
    80009496:	679c                	ld	a5,8(a5)
    80009498:	2705                	addiw	a4,a4,1
    8000949a:	1742                	slli	a4,a4,0x30
    8000949c:	9341                	srli	a4,a4,0x30
    8000949e:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    800094a2:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    800094a6:	100017b7          	lui	a5,0x10001
    800094aa:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    800094ae:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    800094b2:	a819                	j	800094c8 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    800094b4:	0001f597          	auipc	a1,0x1f
    800094b8:	c7458593          	addi	a1,a1,-908 # 80028128 <disk+0x2128>
    800094bc:	fc843503          	ld	a0,-56(s0)
    800094c0:	ffffa097          	auipc	ra,0xffffa
    800094c4:	29c080e7          	jalr	668(ra) # 8000375c <sleep>
  while(b->disk == 1) {
    800094c8:	fc843783          	ld	a5,-56(s0)
    800094cc:	43dc                	lw	a5,4(a5)
    800094ce:	873e                	mv	a4,a5
    800094d0:	4785                	li	a5,1
    800094d2:	fef701e3          	beq	a4,a5,800094b4 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    800094d6:	fd042783          	lw	a5,-48(s0)
    800094da:	0001d717          	auipc	a4,0x1d
    800094de:	b2670713          	addi	a4,a4,-1242 # 80026000 <disk>
    800094e2:	20078793          	addi	a5,a5,512
    800094e6:	0792                	slli	a5,a5,0x4
    800094e8:	97ba                	add	a5,a5,a4
    800094ea:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    800094ee:	fd042783          	lw	a5,-48(s0)
    800094f2:	853e                	mv	a0,a5
    800094f4:	00000097          	auipc	ra,0x0
    800094f8:	b6c080e7          	jalr	-1172(ra) # 80009060 <free_chain>

  release(&disk.vdisk_lock);
    800094fc:	0001f517          	auipc	a0,0x1f
    80009500:	c2c50513          	addi	a0,a0,-980 # 80028128 <disk+0x2128>
    80009504:	ffff8097          	auipc	ra,0xffff8
    80009508:	dce080e7          	jalr	-562(ra) # 800012d2 <release>
}
    8000950c:	0001                	nop
    8000950e:	70e2                	ld	ra,56(sp)
    80009510:	7442                	ld	s0,48(sp)
    80009512:	6121                	addi	sp,sp,64
    80009514:	8082                	ret

0000000080009516 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80009516:	1101                	addi	sp,sp,-32
    80009518:	ec06                	sd	ra,24(sp)
    8000951a:	e822                	sd	s0,16(sp)
    8000951c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000951e:	0001f517          	auipc	a0,0x1f
    80009522:	c0a50513          	addi	a0,a0,-1014 # 80028128 <disk+0x2128>
    80009526:	ffff8097          	auipc	ra,0xffff8
    8000952a:	d48080e7          	jalr	-696(ra) # 8000126e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000952e:	100017b7          	lui	a5,0x10001
    80009532:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    80009536:	439c                	lw	a5,0(a5)
    80009538:	0007871b          	sext.w	a4,a5
    8000953c:	100017b7          	lui	a5,0x10001
    80009540:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    80009544:	8b0d                	andi	a4,a4,3
    80009546:	2701                	sext.w	a4,a4
    80009548:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    8000954a:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    8000954e:	a855                	j	80009602 <virtio_disk_intr+0xec>
    __sync_synchronize();
    80009550:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80009554:	0001d717          	auipc	a4,0x1d
    80009558:	aac70713          	addi	a4,a4,-1364 # 80026000 <disk>
    8000955c:	6789                	lui	a5,0x2
    8000955e:	97ba                	add	a5,a5,a4
    80009560:	6b98                	ld	a4,16(a5)
    80009562:	0001d697          	auipc	a3,0x1d
    80009566:	a9e68693          	addi	a3,a3,-1378 # 80026000 <disk>
    8000956a:	6789                	lui	a5,0x2
    8000956c:	97b6                	add	a5,a5,a3
    8000956e:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009572:	2781                	sext.w	a5,a5
    80009574:	8b9d                	andi	a5,a5,7
    80009576:	2781                	sext.w	a5,a5
    80009578:	078e                	slli	a5,a5,0x3
    8000957a:	97ba                	add	a5,a5,a4
    8000957c:	43dc                	lw	a5,4(a5)
    8000957e:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009582:	0001d717          	auipc	a4,0x1d
    80009586:	a7e70713          	addi	a4,a4,-1410 # 80026000 <disk>
    8000958a:	fec42783          	lw	a5,-20(s0)
    8000958e:	20078793          	addi	a5,a5,512
    80009592:	0792                	slli	a5,a5,0x4
    80009594:	97ba                	add	a5,a5,a4
    80009596:	0307c783          	lbu	a5,48(a5)
    8000959a:	cb89                	beqz	a5,800095ac <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    8000959c:	00002517          	auipc	a0,0x2
    800095a0:	1c450513          	addi	a0,a0,452 # 8000b760 <etext+0x760>
    800095a4:	ffff7097          	auipc	ra,0xffff7
    800095a8:	6da080e7          	jalr	1754(ra) # 80000c7e <panic>

    struct buf *b = disk.info[id].b;
    800095ac:	0001d717          	auipc	a4,0x1d
    800095b0:	a5470713          	addi	a4,a4,-1452 # 80026000 <disk>
    800095b4:	fec42783          	lw	a5,-20(s0)
    800095b8:	20078793          	addi	a5,a5,512
    800095bc:	0792                	slli	a5,a5,0x4
    800095be:	97ba                	add	a5,a5,a4
    800095c0:	779c                	ld	a5,40(a5)
    800095c2:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    800095c6:	fe043783          	ld	a5,-32(s0)
    800095ca:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    800095ce:	fe043503          	ld	a0,-32(s0)
    800095d2:	ffffa097          	auipc	ra,0xffffa
    800095d6:	206080e7          	jalr	518(ra) # 800037d8 <wakeup>

    disk.used_idx += 1;
    800095da:	0001d717          	auipc	a4,0x1d
    800095de:	a2670713          	addi	a4,a4,-1498 # 80026000 <disk>
    800095e2:	6789                	lui	a5,0x2
    800095e4:	97ba                	add	a5,a5,a4
    800095e6:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    800095ea:	2785                	addiw	a5,a5,1
    800095ec:	03079713          	slli	a4,a5,0x30
    800095f0:	9341                	srli	a4,a4,0x30
    800095f2:	0001d697          	auipc	a3,0x1d
    800095f6:	a0e68693          	addi	a3,a3,-1522 # 80026000 <disk>
    800095fa:	6789                	lui	a5,0x2
    800095fc:	97b6                	add	a5,a5,a3
    800095fe:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    80009602:	0001d717          	auipc	a4,0x1d
    80009606:	9fe70713          	addi	a4,a4,-1538 # 80026000 <disk>
    8000960a:	6789                	lui	a5,0x2
    8000960c:	97ba                	add	a5,a5,a4
    8000960e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009612:	0001d717          	auipc	a4,0x1d
    80009616:	9ee70713          	addi	a4,a4,-1554 # 80026000 <disk>
    8000961a:	6789                	lui	a5,0x2
    8000961c:	97ba                	add	a5,a5,a4
    8000961e:	6b9c                	ld	a5,16(a5)
    80009620:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009624:	0006871b          	sext.w	a4,a3
    80009628:	2781                	sext.w	a5,a5
    8000962a:	f2f713e3          	bne	a4,a5,80009550 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000962e:	0001f517          	auipc	a0,0x1f
    80009632:	afa50513          	addi	a0,a0,-1286 # 80028128 <disk+0x2128>
    80009636:	ffff8097          	auipc	ra,0xffff8
    8000963a:	c9c080e7          	jalr	-868(ra) # 800012d2 <release>
}
    8000963e:	0001                	nop
    80009640:	60e2                	ld	ra,24(sp)
    80009642:	6442                	ld	s0,16(sp)
    80009644:	6105                	addi	sp,sp,32
    80009646:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051573          	csrrw	a0,sscratch,a0
    8000a004:	02153423          	sd	ra,40(a0)
    8000a008:	02253823          	sd	sp,48(a0)
    8000a00c:	02353c23          	sd	gp,56(a0)
    8000a010:	04453023          	sd	tp,64(a0)
    8000a014:	04553423          	sd	t0,72(a0)
    8000a018:	04653823          	sd	t1,80(a0)
    8000a01c:	04753c23          	sd	t2,88(a0)
    8000a020:	f120                	sd	s0,96(a0)
    8000a022:	f524                	sd	s1,104(a0)
    8000a024:	fd2c                	sd	a1,120(a0)
    8000a026:	e150                	sd	a2,128(a0)
    8000a028:	e554                	sd	a3,136(a0)
    8000a02a:	e958                	sd	a4,144(a0)
    8000a02c:	ed5c                	sd	a5,152(a0)
    8000a02e:	0b053023          	sd	a6,160(a0)
    8000a032:	0b153423          	sd	a7,168(a0)
    8000a036:	0b253823          	sd	s2,176(a0)
    8000a03a:	0b353c23          	sd	s3,184(a0)
    8000a03e:	0d453023          	sd	s4,192(a0)
    8000a042:	0d553423          	sd	s5,200(a0)
    8000a046:	0d653823          	sd	s6,208(a0)
    8000a04a:	0d753c23          	sd	s7,216(a0)
    8000a04e:	0f853023          	sd	s8,224(a0)
    8000a052:	0f953423          	sd	s9,232(a0)
    8000a056:	0fa53823          	sd	s10,240(a0)
    8000a05a:	0fb53c23          	sd	s11,248(a0)
    8000a05e:	11c53023          	sd	t3,256(a0)
    8000a062:	11d53423          	sd	t4,264(a0)
    8000a066:	11e53823          	sd	t5,272(a0)
    8000a06a:	11f53c23          	sd	t6,280(a0)
    8000a06e:	140022f3          	csrr	t0,sscratch
    8000a072:	06553823          	sd	t0,112(a0)
    8000a076:	00853103          	ld	sp,8(a0)
    8000a07a:	02053203          	ld	tp,32(a0)
    8000a07e:	01053283          	ld	t0,16(a0)
    8000a082:	00053303          	ld	t1,0(a0)
    8000a086:	18031073          	csrw	satp,t1
    8000a08a:	12000073          	sfence.vma
    8000a08e:	8282                	jr	t0

000000008000a090 <userret>:
    8000a090:	18059073          	csrw	satp,a1
    8000a094:	12000073          	sfence.vma
    8000a098:	07053283          	ld	t0,112(a0)
    8000a09c:	14029073          	csrw	sscratch,t0
    8000a0a0:	02853083          	ld	ra,40(a0)
    8000a0a4:	03053103          	ld	sp,48(a0)
    8000a0a8:	03853183          	ld	gp,56(a0)
    8000a0ac:	04053203          	ld	tp,64(a0)
    8000a0b0:	04853283          	ld	t0,72(a0)
    8000a0b4:	05053303          	ld	t1,80(a0)
    8000a0b8:	05853383          	ld	t2,88(a0)
    8000a0bc:	7120                	ld	s0,96(a0)
    8000a0be:	7524                	ld	s1,104(a0)
    8000a0c0:	7d2c                	ld	a1,120(a0)
    8000a0c2:	6150                	ld	a2,128(a0)
    8000a0c4:	6554                	ld	a3,136(a0)
    8000a0c6:	6958                	ld	a4,144(a0)
    8000a0c8:	6d5c                	ld	a5,152(a0)
    8000a0ca:	0a053803          	ld	a6,160(a0)
    8000a0ce:	0a853883          	ld	a7,168(a0)
    8000a0d2:	0b053903          	ld	s2,176(a0)
    8000a0d6:	0b853983          	ld	s3,184(a0)
    8000a0da:	0c053a03          	ld	s4,192(a0)
    8000a0de:	0c853a83          	ld	s5,200(a0)
    8000a0e2:	0d053b03          	ld	s6,208(a0)
    8000a0e6:	0d853b83          	ld	s7,216(a0)
    8000a0ea:	0e053c03          	ld	s8,224(a0)
    8000a0ee:	0e853c83          	ld	s9,232(a0)
    8000a0f2:	0f053d03          	ld	s10,240(a0)
    8000a0f6:	0f853d83          	ld	s11,248(a0)
    8000a0fa:	10053e03          	ld	t3,256(a0)
    8000a0fe:	10853e83          	ld	t4,264(a0)
    8000a102:	11053f03          	ld	t5,272(a0)
    8000a106:	11853f83          	ld	t6,280(a0)
    8000a10a:	14051573          	csrrw	a0,sscratch,a0
    8000a10e:	10200073          	sret
	...
