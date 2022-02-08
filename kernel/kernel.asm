
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
    800002e8:	d5c70713          	addi	a4,a4,-676 # 80014040 <timer_scratch>
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
    8000032c:	94878793          	addi	a5,a5,-1720 # 80008c70 <timervec>
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
    8000040a:	5f8080e7          	jalr	1528(ra) # 800039fe <either_copyin>
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
    8000047a:	d0a50513          	addi	a0,a0,-758 # 80014180 <cons>
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
    8000049a:	cea50513          	addi	a0,a0,-790 # 80014180 <cons>
    8000049e:	00001097          	auipc	ra,0x1
    800004a2:	e34080e7          	jalr	-460(ra) # 800012d2 <release>
        return -1;
    800004a6:	57fd                	li	a5,-1
    800004a8:	aa25                	j	800005e0 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    800004aa:	00014597          	auipc	a1,0x14
    800004ae:	cd658593          	addi	a1,a1,-810 # 80014180 <cons>
    800004b2:	00014517          	auipc	a0,0x14
    800004b6:	d6650513          	addi	a0,a0,-666 # 80014218 <cons+0x98>
    800004ba:	00003097          	auipc	ra,0x3
    800004be:	318080e7          	jalr	792(ra) # 800037d2 <sleep>
    while(cons.r == cons.w){
    800004c2:	00014797          	auipc	a5,0x14
    800004c6:	cbe78793          	addi	a5,a5,-834 # 80014180 <cons>
    800004ca:	0987a703          	lw	a4,152(a5)
    800004ce:	00014797          	auipc	a5,0x14
    800004d2:	cb278793          	addi	a5,a5,-846 # 80014180 <cons>
    800004d6:	09c7a783          	lw	a5,156(a5)
    800004da:	faf707e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004de:	00014797          	auipc	a5,0x14
    800004e2:	ca278793          	addi	a5,a5,-862 # 80014180 <cons>
    800004e6:	0987a783          	lw	a5,152(a5)
    800004ea:	2781                	sext.w	a5,a5
    800004ec:	0017871b          	addiw	a4,a5,1
    800004f0:	0007069b          	sext.w	a3,a4
    800004f4:	00014717          	auipc	a4,0x14
    800004f8:	c8c70713          	addi	a4,a4,-884 # 80014180 <cons>
    800004fc:	08d72c23          	sw	a3,152(a4)
    80000500:	07f7f793          	andi	a5,a5,127
    80000504:	2781                	sext.w	a5,a5
    80000506:	00014717          	auipc	a4,0x14
    8000050a:	c7a70713          	addi	a4,a4,-902 # 80014180 <cons>
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
    8000053c:	c4878793          	addi	a5,a5,-952 # 80014180 <cons>
    80000540:	0987a783          	lw	a5,152(a5)
    80000544:	37fd                	addiw	a5,a5,-1
    80000546:	0007871b          	sext.w	a4,a5
    8000054a:	00014797          	auipc	a5,0x14
    8000054e:	c3678793          	addi	a5,a5,-970 # 80014180 <cons>
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
    8000057a:	414080e7          	jalr	1044(ra) # 8000398a <either_copyout>
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
    800005c4:	bc050513          	addi	a0,a0,-1088 # 80014180 <cons>
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
    800005fc:	b8850513          	addi	a0,a0,-1144 # 80014180 <cons>
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
    80000664:	412080e7          	jalr	1042(ra) # 80003a72 <procdump>
    break;
    80000668:	aac1                	j	80000838 <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000066a:	00014797          	auipc	a5,0x14
    8000066e:	b1678793          	addi	a5,a5,-1258 # 80014180 <cons>
    80000672:	0a07a783          	lw	a5,160(a5)
    80000676:	37fd                	addiw	a5,a5,-1
    80000678:	0007871b          	sext.w	a4,a5
    8000067c:	00014797          	auipc	a5,0x14
    80000680:	b0478793          	addi	a5,a5,-1276 # 80014180 <cons>
    80000684:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000688:	10000513          	li	a0,256
    8000068c:	00000097          	auipc	ra,0x0
    80000690:	ce8080e7          	jalr	-792(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    80000694:	00014797          	auipc	a5,0x14
    80000698:	aec78793          	addi	a5,a5,-1300 # 80014180 <cons>
    8000069c:	0a07a703          	lw	a4,160(a5)
    800006a0:	00014797          	auipc	a5,0x14
    800006a4:	ae078793          	addi	a5,a5,-1312 # 80014180 <cons>
    800006a8:	09c7a783          	lw	a5,156(a5)
    800006ac:	18f70163          	beq	a4,a5,8000082e <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    800006b0:	00014797          	auipc	a5,0x14
    800006b4:	ad078793          	addi	a5,a5,-1328 # 80014180 <cons>
    800006b8:	0a07a783          	lw	a5,160(a5)
    800006bc:	37fd                	addiw	a5,a5,-1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	07f7f793          	andi	a5,a5,127
    800006c4:	2781                	sext.w	a5,a5
    800006c6:	00014717          	auipc	a4,0x14
    800006ca:	aba70713          	addi	a4,a4,-1350 # 80014180 <cons>
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
    800006e6:	a9e78793          	addi	a5,a5,-1378 # 80014180 <cons>
    800006ea:	0a07a703          	lw	a4,160(a5)
    800006ee:	00014797          	auipc	a5,0x14
    800006f2:	a9278793          	addi	a5,a5,-1390 # 80014180 <cons>
    800006f6:	09c7a783          	lw	a5,156(a5)
    800006fa:	12f70c63          	beq	a4,a5,80000832 <consoleintr+0x248>
      cons.e--;
    800006fe:	00014797          	auipc	a5,0x14
    80000702:	a8278793          	addi	a5,a5,-1406 # 80014180 <cons>
    80000706:	0a07a783          	lw	a5,160(a5)
    8000070a:	37fd                	addiw	a5,a5,-1
    8000070c:	0007871b          	sext.w	a4,a5
    80000710:	00014797          	auipc	a5,0x14
    80000714:	a7078793          	addi	a5,a5,-1424 # 80014180 <cons>
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
    80000738:	a4c78793          	addi	a5,a5,-1460 # 80014180 <cons>
    8000073c:	0a07a703          	lw	a4,160(a5)
    80000740:	00014797          	auipc	a5,0x14
    80000744:	a4078793          	addi	a5,a5,-1472 # 80014180 <cons>
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
    80000788:	9fc78793          	addi	a5,a5,-1540 # 80014180 <cons>
    8000078c:	0a07a783          	lw	a5,160(a5)
    80000790:	2781                	sext.w	a5,a5
    80000792:	0017871b          	addiw	a4,a5,1
    80000796:	0007069b          	sext.w	a3,a4
    8000079a:	00014717          	auipc	a4,0x14
    8000079e:	9e670713          	addi	a4,a4,-1562 # 80014180 <cons>
    800007a2:	0ad72023          	sw	a3,160(a4)
    800007a6:	07f7f793          	andi	a5,a5,127
    800007aa:	2781                	sext.w	a5,a5
    800007ac:	fec42703          	lw	a4,-20(s0)
    800007b0:	0ff77713          	andi	a4,a4,255
    800007b4:	00014697          	auipc	a3,0x14
    800007b8:	9cc68693          	addi	a3,a3,-1588 # 80014180 <cons>
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
    800007e6:	99e78793          	addi	a5,a5,-1634 # 80014180 <cons>
    800007ea:	0a07a703          	lw	a4,160(a5)
    800007ee:	00014797          	auipc	a5,0x14
    800007f2:	99278793          	addi	a5,a5,-1646 # 80014180 <cons>
    800007f6:	0987a783          	lw	a5,152(a5)
    800007fa:	0807879b          	addiw	a5,a5,128
    800007fe:	2781                	sext.w	a5,a5
    80000800:	02f71b63          	bne	a4,a5,80000836 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000804:	00014797          	auipc	a5,0x14
    80000808:	97c78793          	addi	a5,a5,-1668 # 80014180 <cons>
    8000080c:	0a07a703          	lw	a4,160(a5)
    80000810:	00014797          	auipc	a5,0x14
    80000814:	97078793          	addi	a5,a5,-1680 # 80014180 <cons>
    80000818:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000081c:	00014517          	auipc	a0,0x14
    80000820:	9fc50513          	addi	a0,a0,-1540 # 80014218 <cons+0x98>
    80000824:	00003097          	auipc	ra,0x3
    80000828:	02a080e7          	jalr	42(ra) # 8000384e <wakeup>
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
    8000083c:	94850513          	addi	a0,a0,-1720 # 80014180 <cons>
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
    80000866:	91e50513          	addi	a0,a0,-1762 # 80014180 <cons>
    8000086a:	00001097          	auipc	ra,0x1
    8000086e:	9d4080e7          	jalr	-1580(ra) # 8000123e <initlock>

  uartinit();
    80000872:	00000097          	auipc	ra,0x0
    80000876:	494080e7          	jalr	1172(ra) # 80000d06 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000087a:	00024797          	auipc	a5,0x24
    8000087e:	4fe78793          	addi	a5,a5,1278 # 80024d78 <devsw>
    80000882:	00000717          	auipc	a4,0x0
    80000886:	bd270713          	addi	a4,a4,-1070 # 80000454 <consoleread>
    8000088a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000088c:	00024797          	auipc	a5,0x24
    80000890:	4ec78793          	addi	a5,a5,1260 # 80024d78 <devsw>
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
    80000a4a:	7e278793          	addi	a5,a5,2018 # 80014228 <pr>
    80000a4e:	4f9c                	lw	a5,24(a5)
    80000a50:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a54:	fdc42783          	lw	a5,-36(s0)
    80000a58:	2781                	sext.w	a5,a5
    80000a5a:	cb89                	beqz	a5,80000a6c <printf+0x44>
    acquire(&pr.lock);
    80000a5c:	00013517          	auipc	a0,0x13
    80000a60:	7cc50513          	addi	a0,a0,1996 # 80014228 <pr>
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
    80000c68:	5c450513          	addi	a0,a0,1476 # 80014228 <pr>
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
    80000c8e:	59e78793          	addi	a5,a5,1438 # 80014228 <pr>
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
    80000ce4:	54850513          	addi	a0,a0,1352 # 80014228 <pr>
    80000ce8:	00000097          	auipc	ra,0x0
    80000cec:	556080e7          	jalr	1366(ra) # 8000123e <initlock>
  pr.locking = 1;
    80000cf0:	00013797          	auipc	a5,0x13
    80000cf4:	53878793          	addi	a5,a5,1336 # 80014228 <pr>
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
    80000d6a:	4e250513          	addi	a0,a0,1250 # 80014248 <uart_tx_lock>
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
    80000d92:	4ba50513          	addi	a0,a0,1210 # 80014248 <uart_tx_lock>
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
    80000dce:	47e58593          	addi	a1,a1,1150 # 80014248 <uart_tx_lock>
    80000dd2:	0000b517          	auipc	a0,0xb
    80000dd6:	23e50513          	addi	a0,a0,574 # 8000c010 <uart_tx_r>
    80000dda:	00003097          	auipc	ra,0x3
    80000dde:	9f8080e7          	jalr	-1544(ra) # 800037d2 <sleep>
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
    80000dfc:	46868693          	addi	a3,a3,1128 # 80014260 <uart_tx_buf>
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
    80000e2a:	42250513          	addi	a0,a0,1058 # 80014248 <uart_tx_lock>
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
    80000eea:	37a70713          	addi	a4,a4,890 # 80014260 <uart_tx_buf>
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
    80000f1c:	936080e7          	jalr	-1738(ra) # 8000384e <wakeup>
    
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
    80000fb0:	29c50513          	addi	a0,a0,668 # 80014248 <uart_tx_lock>
    80000fb4:	00000097          	auipc	ra,0x0
    80000fb8:	2ba080e7          	jalr	698(ra) # 8000126e <acquire>
  uartstart();
    80000fbc:	00000097          	auipc	ra,0x0
    80000fc0:	ee6080e7          	jalr	-282(ra) # 80000ea2 <uartstart>
  release(&uart_tx_lock);
    80000fc4:	00013517          	auipc	a0,0x13
    80000fc8:	28450513          	addi	a0,a0,644 # 80014248 <uart_tx_lock>
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
    80000ff2:	29250513          	addi	a0,a0,658 # 80014280 <kmem>
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
    800010d6:	1ae50513          	addi	a0,a0,430 # 80014280 <kmem>
    800010da:	00000097          	auipc	ra,0x0
    800010de:	194080e7          	jalr	404(ra) # 8000126e <acquire>
  r->next = kmem.freelist;
    800010e2:	00013797          	auipc	a5,0x13
    800010e6:	19e78793          	addi	a5,a5,414 # 80014280 <kmem>
    800010ea:	6f98                	ld	a4,24(a5)
    800010ec:	fe843783          	ld	a5,-24(s0)
    800010f0:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010f2:	00013797          	auipc	a5,0x13
    800010f6:	18e78793          	addi	a5,a5,398 # 80014280 <kmem>
    800010fa:	fe843703          	ld	a4,-24(s0)
    800010fe:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001100:	00013517          	auipc	a0,0x13
    80001104:	18050513          	addi	a0,a0,384 # 80014280 <kmem>
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
    80001126:	15e50513          	addi	a0,a0,350 # 80014280 <kmem>
    8000112a:	00000097          	auipc	ra,0x0
    8000112e:	144080e7          	jalr	324(ra) # 8000126e <acquire>
  r = kmem.freelist;
    80001132:	00013797          	auipc	a5,0x13
    80001136:	14e78793          	addi	a5,a5,334 # 80014280 <kmem>
    8000113a:	6f9c                	ld	a5,24(a5)
    8000113c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001140:	fe843783          	ld	a5,-24(s0)
    80001144:	cb89                	beqz	a5,80001156 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001146:	fe843783          	ld	a5,-24(s0)
    8000114a:	6398                	ld	a4,0(a5)
    8000114c:	00013797          	auipc	a5,0x13
    80001150:	13478793          	addi	a5,a5,308 # 80014280 <kmem>
    80001154:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001156:	00013517          	auipc	a0,0x13
    8000115a:	12a50513          	addi	a0,a0,298 # 80014280 <kmem>
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
    8000186e:	4f0080e7          	jalr	1264(ra) # 80003d5a <trapinit>
    trapinithart();  // install kernel trap vector
    80001872:	00002097          	auipc	ra,0x2
    80001876:	512080e7          	jalr	1298(ra) # 80003d84 <trapinithart>
    plicinit();      // set up interrupt controller
    8000187a:	00007097          	auipc	ra,0x7
    8000187e:	420080e7          	jalr	1056(ra) # 80008c9a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001882:	00007097          	auipc	ra,0x7
    80001886:	43c080e7          	jalr	1084(ra) # 80008cbe <plicinithart>
    binit();         // buffer cache
    8000188a:	00003097          	auipc	ra,0x3
    8000188e:	038080e7          	jalr	56(ra) # 800048c2 <binit>
    iinit();         // inode table
    80001892:	00004097          	auipc	ra,0x4
    80001896:	884080e7          	jalr	-1916(ra) # 80005116 <iinit>
    fileinit();      // file table
    8000189a:	00005097          	auipc	ra,0x5
    8000189e:	226080e7          	jalr	550(ra) # 80006ac0 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a2:	00007097          	auipc	ra,0x7
    800018a6:	4f0080e7          	jalr	1264(ra) # 80008d92 <virtio_disk_init>
    userinit();      // first user process
    800018aa:	00001097          	auipc	ra,0x1
    800018ae:	2ee080e7          	jalr	750(ra) # 80002b98 <userinit>
    __sync_synchronize();
    800018b2:	0ff0000f          	fence
    started = 1;
    800018b6:	00013797          	auipc	a5,0x13
    800018ba:	9ea78793          	addi	a5,a5,-1558 # 800142a0 <started>
    800018be:	4705                	li	a4,1
    800018c0:	c398                	sw	a4,0(a5)
    800018c2:	a0a9                	j	8000190c <main+0x116>
  } else {
    while(started == 0)
    800018c4:	0001                	nop
    800018c6:	00013797          	auipc	a5,0x13
    800018ca:	9da78793          	addi	a5,a5,-1574 # 800142a0 <started>
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
    80001900:	488080e7          	jalr	1160(ra) # 80003d84 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001904:	00007097          	auipc	ra,0x7
    80001908:	3ba080e7          	jalr	954(ra) # 80008cbe <plicinithart>
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
    80002644:	0a878793          	addi	a5,a5,168 # 800146e8 <proc>
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
    80002678:	07478793          	addi	a5,a5,116 # 800146e8 <proc>
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
    800026dc:	41078793          	addi	a5,a5,1040 # 8001aae8 <pid_lock>
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
    80002704:	3e850513          	addi	a0,a0,1000 # 8001aae8 <pid_lock>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	b36080e7          	jalr	-1226(ra) # 8000123e <initlock>
  initlock(&wait_lock, "wait_lock");
    80002710:	00009597          	auipc	a1,0x9
    80002714:	ac058593          	addi	a1,a1,-1344 # 8000b1d0 <etext+0x1d0>
    80002718:	00018517          	auipc	a0,0x18
    8000271c:	40050513          	addi	a0,a0,1024 # 8001ab18 <wait_lock>
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b1e080e7          	jalr	-1250(ra) # 8000123e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002728:	00012797          	auipc	a5,0x12
    8000272c:	fc078793          	addi	a5,a5,-64 # 800146e8 <proc>
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
    80002754:	f9878793          	addi	a5,a5,-104 # 800146e8 <proc>
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
    800027a2:	34a78793          	addi	a5,a5,842 # 8001aae8 <pid_lock>
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
    80002800:	aac70713          	addi	a4,a4,-1364 # 800142a8 <cpus>
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
    80002860:	28c50513          	addi	a0,a0,652 # 8001aae8 <pid_lock>
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
    80002898:	25450513          	addi	a0,a0,596 # 8001aae8 <pid_lock>
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
    800028be:	e2e78793          	addi	a5,a5,-466 # 800146e8 <proc>
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
    80002900:	1ec78793          	addi	a5,a5,492 # 8001aae8 <pid_lock>
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
    800029b4:	dd270713          	addi	a4,a4,-558 # 80003782 <forkret>
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
    80002c1a:	5c0080e7          	jalr	1472(ra) # 800061d6 <namei>
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
    80002dd0:	da2080e7          	jalr	-606(ra) # 80006b6e <filedup>
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
    80002e0c:	68c080e7          	jalr	1676(ra) # 80005494 <idup>
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
    80002e54:	cc850513          	addi	a0,a0,-824 # 8001ab18 <wait_lock>
    80002e58:	ffffe097          	auipc	ra,0xffffe
    80002e5c:	416080e7          	jalr	1046(ra) # 8000126e <acquire>
  np->parent = p;
    80002e60:	fd843783          	ld	a5,-40(s0)
    80002e64:	fe043703          	ld	a4,-32(s0)
    80002e68:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002e6a:	00018517          	auipc	a0,0x18
    80002e6e:	cae50513          	addi	a0,a0,-850 # 8001ab18 <wait_lock>
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
    80002ec0:	82c78793          	addi	a5,a5,-2004 # 800146e8 <proc>
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
    80002ef8:	95a080e7          	jalr	-1702(ra) # 8000384e <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002efc:	fe843783          	ld	a5,-24(s0)
    80002f00:	19078793          	addi	a5,a5,400
    80002f04:	fef43423          	sd	a5,-24(s0)
    80002f08:	fe843703          	ld	a4,-24(s0)
    80002f0c:	00018797          	auipc	a5,0x18
    80002f10:	bdc78793          	addi	a5,a5,-1060 # 8001aae8 <pid_lock>
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
    80002f94:	c44080e7          	jalr	-956(ra) # 80006bd4 <fileclose>
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
    80002fc6:	578080e7          	jalr	1400(ra) # 8000653a <begin_op>
  iput(p->cwd);
    80002fca:	fe043783          	ld	a5,-32(s0)
    80002fce:	1507b783          	ld	a5,336(a5)
    80002fd2:	853e                	mv	a0,a5
    80002fd4:	00002097          	auipc	ra,0x2
    80002fd8:	69a080e7          	jalr	1690(ra) # 8000566e <iput>
  end_op();
    80002fdc:	00003097          	auipc	ra,0x3
    80002fe0:	620080e7          	jalr	1568(ra) # 800065fc <end_op>
  p->cwd = 0;
    80002fe4:	fe043783          	ld	a5,-32(s0)
    80002fe8:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80002fec:	00018517          	auipc	a0,0x18
    80002ff0:	b2c50513          	addi	a0,a0,-1236 # 8001ab18 <wait_lock>
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
    80003010:	00001097          	auipc	ra,0x1
    80003014:	83e080e7          	jalr	-1986(ra) # 8000384e <wakeup>
  
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
    8000303c:	ae050513          	addi	a0,a0,-1312 # 8001ab18 <wait_lock>
    80003040:	ffffe097          	auipc	ra,0xffffe
    80003044:	292080e7          	jalr	658(ra) # 800012d2 <release>

  // Jump into the scheduler, never to return.
  //if(process_lock.locked)release(&process_lock);
  sched();
    80003048:	00000097          	auipc	ra,0x0
    8000304c:	60a080e7          	jalr	1546(ra) # 80003652 <sched>
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
    8000307c:	aa050513          	addi	a0,a0,-1376 # 8001ab18 <wait_lock>
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	1ee080e7          	jalr	494(ra) # 8000126e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003088:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    8000308c:	00011797          	auipc	a5,0x11
    80003090:	65c78793          	addi	a5,a5,1628 # 800146e8 <proc>
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
    80003112:	a0a50513          	addi	a0,a0,-1526 # 8001ab18 <wait_lock>
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
    80003140:	9dc50513          	addi	a0,a0,-1572 # 8001ab18 <wait_lock>
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
    80003174:	97878793          	addi	a5,a5,-1672 # 8001aae8 <pid_lock>
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
    80003190:	98c50513          	addi	a0,a0,-1652 # 8001ab18 <wait_lock>
    80003194:	ffffe097          	auipc	ra,0xffffe
    80003198:	13e080e7          	jalr	318(ra) # 800012d2 <release>
      return -1;
    8000319c:	57fd                	li	a5,-1
    8000319e:	a821                	j	800031b6 <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800031a0:	00018597          	auipc	a1,0x18
    800031a4:	97858593          	addi	a1,a1,-1672 # 8001ab18 <wait_lock>
    800031a8:	fd843503          	ld	a0,-40(s0)
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	626080e7          	jalr	1574(ra) # 800037d2 <sleep>
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
    800031cc:	52078793          	addi	a5,a5,1312 # 800146e8 <proc>
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
    80003246:	8a678793          	addi	a5,a5,-1882 # 8001aae8 <pid_lock>
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
    8000326e:	dc678793          	addi	a5,a5,-570 # 8000c030 <ticks>
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
    800032b2:	43a78793          	addi	a5,a5,1082 # 800146e8 <proc>
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
    80003320:	7cc78793          	addi	a5,a5,1996 # 8001aae8 <pid_lock>
    80003324:	f8f76ce3          	bltu	a4,a5,800032bc <getSJF+0x1c>
    }
    if(chosen)
    80003328:	fe043783          	ld	a5,-32(s0)
    8000332c:	c78d                	beqz	a5,80003356 <getSJF+0xb6>
    {
       // acquire(&process_lock);
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
    80003348:	cec78793          	addi	a5,a5,-788 # 8000c030 <ticks>
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
    80003386:	cae78793          	addi	a5,a5,-850 # 8000c030 <ticks>
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
    800033ac:	c8878793          	addi	a5,a5,-888 # 8000c030 <ticks>
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

  c->proc = 0;
    80003428:	fe043783          	ld	a5,-32(s0)
    8000342c:	0007b023          	sd	zero,0(a5)
  for(;;){
      if(!c->scheduler)
    80003430:	fe043783          	ld	a5,-32(s0)
    80003434:	63dc                	ld	a5,128(a5)
    80003436:	e3b9                	bnez	a5,8000347c <scheduler+0x68>
      {
          sch.scheduling_algorithm=CFS;
    80003438:	4789                	li	a5,2
    8000343a:	fcf42823          	sw	a5,-48(s0)
          sch.exsponential_variant=1;
    8000343e:	4785                	li	a5,1
    80003440:	fcf42a23          	sw	a5,-44(s0)
          sch.preemptive=1;
    80003444:	4785                	li	a5,1
    80003446:	fcf42c23          	sw	a5,-40(s0)
          sch.kvant=0;
    8000344a:	fc042e23          	sw	zero,-36(s0)
          tajmerMAX=sch.kvant;
    8000344e:	fdc42703          	lw	a4,-36(s0)
    80003452:	00009797          	auipc	a5,0x9
    80003456:	bd678793          	addi	a5,a5,-1066 # 8000c028 <tajmerMAX>
    8000345a:	c398                	sw	a4,0(a5)
          tajmer=tajmerMAX;
    8000345c:	00009797          	auipc	a5,0x9
    80003460:	bcc78793          	addi	a5,a5,-1076 # 8000c028 <tajmerMAX>
    80003464:	4398                	lw	a4,0(a5)
    80003466:	00009797          	auipc	a5,0x9
    8000346a:	bc678793          	addi	a5,a5,-1082 # 8000c02c <tajmer>
    8000346e:	c398                	sw	a4,0(a5)
          c->scheduler=&sch;
    80003470:	fe043783          	ld	a5,-32(s0)
    80003474:	fd040713          	addi	a4,s0,-48
    80003478:	e3d8                	sd	a4,128(a5)
    8000347a:	a811                	j	8000348e <scheduler+0x7a>
      }
      else
      {
          tajmerMAX=c->scheduler->kvant;
    8000347c:	fe043783          	ld	a5,-32(s0)
    80003480:	63dc                	ld	a5,128(a5)
    80003482:	47d8                	lw	a4,12(a5)
    80003484:	00009797          	auipc	a5,0x9
    80003488:	ba478793          	addi	a5,a5,-1116 # 8000c028 <tajmerMAX>
    8000348c:	c398                	sw	a4,0(a5)

      }

    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000348e:	fffff097          	auipc	ra,0xfffff
    80003492:	136080e7          	jalr	310(ra) # 800025c4 <intr_on>

      if(c->scheduler->scheduling_algorithm==SJF)
    80003496:	fe043783          	ld	a5,-32(s0)
    8000349a:	63dc                	ld	a5,128(a5)
    8000349c:	439c                	lw	a5,0(a5)
    8000349e:	873e                	mv	a4,a5
    800034a0:	4785                	li	a5,1
    800034a2:	00f71963          	bne	a4,a5,800034b4 <scheduler+0xa0>
      {
          p=getSJF();
    800034a6:	00000097          	auipc	ra,0x0
    800034aa:	dfa080e7          	jalr	-518(ra) # 800032a0 <getSJF>
    800034ae:	fea43423          	sd	a0,-24(s0)
    800034b2:	a039                	j	800034c0 <scheduler+0xac>
      }
      else
      {
          p=getCFS();
    800034b4:	00000097          	auipc	ra,0x0
    800034b8:	d0c080e7          	jalr	-756(ra) # 800031c0 <getCFS>
    800034bc:	fea43423          	sd	a0,-24(s0)
      }
    //p=get();
    if(p)
    800034c0:	fe843783          	ld	a5,-24(s0)
    800034c4:	d7b5                	beqz	a5,80003430 <scheduler+0x1c>
    {
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.

        c->proc = p;
    800034c6:	fe043783          	ld	a5,-32(s0)
    800034ca:	fe843703          	ld	a4,-24(s0)
    800034ce:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    800034d0:	fe043783          	ld	a5,-32(s0)
    800034d4:	00878713          	addi	a4,a5,8
    800034d8:	fe843783          	ld	a5,-24(s0)
    800034dc:	06078793          	addi	a5,a5,96
    800034e0:	85be                	mv	a1,a5
    800034e2:	853a                	mv	a0,a4
    800034e4:	00000097          	auipc	ra,0x0
    800034e8:	670080e7          	jalr	1648(ra) # 80003b54 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800034ec:	fe043783          	ld	a5,-32(s0)
    800034f0:	0007b023          	sd	zero,0(a5)

        if(&p->lock.locked) release(&p->lock);
    800034f4:	fe843783          	ld	a5,-24(s0)
    800034f8:	df85                	beqz	a5,80003430 <scheduler+0x1c>
    800034fa:	fe843783          	ld	a5,-24(s0)
    800034fe:	853e                	mv	a0,a5
    80003500:	ffffe097          	auipc	ra,0xffffe
    80003504:	dd2080e7          	jalr	-558(ra) # 800012d2 <release>
      if(!c->scheduler)
    80003508:	b725                	j	80003430 <scheduler+0x1c>

000000008000350a <changeSchedulingAlgorithm>:
    //if(process_lock.locked)release(&process_lock);
  }
}
//Fja za promenu algoritma rasporedjivanja na odredjenom procesoru
int changeSchedulingAlgorithm(char *type,int exsponential_variant,int bool)
{
    8000350a:	7179                	addi	sp,sp,-48
    8000350c:	f406                	sd	ra,40(sp)
    8000350e:	f022                	sd	s0,32(sp)
    80003510:	1800                	addi	s0,sp,48
    80003512:	fca43c23          	sd	a0,-40(s0)
    80003516:	87ae                	mv	a5,a1
    80003518:	8732                	mv	a4,a2
    8000351a:	fcf42a23          	sw	a5,-44(s0)
    8000351e:	87ba                	mv	a5,a4
    80003520:	fcf42823          	sw	a5,-48(s0)
    struct cpu *c = mycpu();
    80003524:	fffff097          	auipc	ra,0xfffff
    80003528:	2b6080e7          	jalr	694(ra) # 800027da <mycpu>
    8000352c:	fea43423          	sd	a0,-24(s0)
        if (type[0]=='S' && type[1]=='J' && type[2]=='F'){
    80003530:	fd843783          	ld	a5,-40(s0)
    80003534:	0007c783          	lbu	a5,0(a5)
    80003538:	873e                	mv	a4,a5
    8000353a:	05300793          	li	a5,83
    8000353e:	04f71063          	bne	a4,a5,8000357e <changeSchedulingAlgorithm+0x74>
    80003542:	fd843783          	ld	a5,-40(s0)
    80003546:	0785                	addi	a5,a5,1
    80003548:	0007c783          	lbu	a5,0(a5)
    8000354c:	873e                	mv	a4,a5
    8000354e:	04a00793          	li	a5,74
    80003552:	02f71663          	bne	a4,a5,8000357e <changeSchedulingAlgorithm+0x74>
    80003556:	fd843783          	ld	a5,-40(s0)
    8000355a:	0789                	addi	a5,a5,2
    8000355c:	0007c783          	lbu	a5,0(a5)
    80003560:	873e                	mv	a4,a5
    80003562:	04600793          	li	a5,70
    80003566:	00f71c63          	bne	a4,a5,8000357e <changeSchedulingAlgorithm+0x74>
            c->scheduler->scheduling_algorithm= SJF;
    8000356a:	fe843783          	ld	a5,-24(s0)
    8000356e:	63dc                	ld	a5,128(a5)
    80003570:	4705                	li	a4,1
    80003572:	c398                	sw	a4,0(a5)
            c->scheduler->kvant=0;
    80003574:	fe843783          	ld	a5,-24(s0)
    80003578:	63dc                	ld	a5,128(a5)
    8000357a:	0007a623          	sw	zero,12(a5)
        }

        if (type[0]=='C' && type[1]=='F' && type[2]=='S')
    8000357e:	fd843783          	ld	a5,-40(s0)
    80003582:	0007c783          	lbu	a5,0(a5)
    80003586:	873e                	mv	a4,a5
    80003588:	04300793          	li	a5,67
    8000358c:	04f71163          	bne	a4,a5,800035ce <changeSchedulingAlgorithm+0xc4>
    80003590:	fd843783          	ld	a5,-40(s0)
    80003594:	0785                	addi	a5,a5,1
    80003596:	0007c783          	lbu	a5,0(a5)
    8000359a:	873e                	mv	a4,a5
    8000359c:	04600793          	li	a5,70
    800035a0:	02f71763          	bne	a4,a5,800035ce <changeSchedulingAlgorithm+0xc4>
    800035a4:	fd843783          	ld	a5,-40(s0)
    800035a8:	0789                	addi	a5,a5,2
    800035aa:	0007c783          	lbu	a5,0(a5)
    800035ae:	873e                	mv	a4,a5
    800035b0:	05300793          	li	a5,83
    800035b4:	00f71d63          	bne	a4,a5,800035ce <changeSchedulingAlgorithm+0xc4>
        {
            c->scheduler->scheduling_algorithm= CFS;
    800035b8:	fe843783          	ld	a5,-24(s0)
    800035bc:	63dc                	ld	a5,128(a5)
    800035be:	4709                	li	a4,2
    800035c0:	c398                	sw	a4,0(a5)
            c->scheduler->kvant=50;
    800035c2:	fe843783          	ld	a5,-24(s0)
    800035c6:	63dc                	ld	a5,128(a5)
    800035c8:	03200713          	li	a4,50
    800035cc:	c7d8                	sw	a4,12(a5)
        }
        tajmer=c->scheduler->kvant;
    800035ce:	fe843783          	ld	a5,-24(s0)
    800035d2:	63dc                	ld	a5,128(a5)
    800035d4:	47d8                	lw	a4,12(a5)
    800035d6:	00009797          	auipc	a5,0x9
    800035da:	a5678793          	addi	a5,a5,-1450 # 8000c02c <tajmer>
    800035de:	c398                	sw	a4,0(a5)
        c->scheduler->exsponential_variant=exsponential_variant;
    800035e0:	fe843783          	ld	a5,-24(s0)
    800035e4:	63dc                	ld	a5,128(a5)
    800035e6:	fd442703          	lw	a4,-44(s0)
    800035ea:	c3d8                	sw	a4,4(a5)
        c->scheduler->preemptive=bool;
    800035ec:	fe843783          	ld	a5,-24(s0)
    800035f0:	63dc                	ld	a5,128(a5)
    800035f2:	fd042703          	lw	a4,-48(s0)
    800035f6:	c798                	sw	a4,8(a5)
        printf("treca1-USPESNO: %d \n",c->scheduler->scheduling_algorithm);
    800035f8:	fe843783          	ld	a5,-24(s0)
    800035fc:	63dc                	ld	a5,128(a5)
    800035fe:	439c                	lw	a5,0(a5)
    80003600:	85be                	mv	a1,a5
    80003602:	00008517          	auipc	a0,0x8
    80003606:	c1e50513          	addi	a0,a0,-994 # 8000b220 <etext+0x220>
    8000360a:	ffffd097          	auipc	ra,0xffffd
    8000360e:	41e080e7          	jalr	1054(ra) # 80000a28 <printf>
        printf("treca2-USPESNO: %d \n",c->scheduler->exsponential_variant);
    80003612:	fe843783          	ld	a5,-24(s0)
    80003616:	63dc                	ld	a5,128(a5)
    80003618:	43dc                	lw	a5,4(a5)
    8000361a:	85be                	mv	a1,a5
    8000361c:	00008517          	auipc	a0,0x8
    80003620:	c1c50513          	addi	a0,a0,-996 # 8000b238 <etext+0x238>
    80003624:	ffffd097          	auipc	ra,0xffffd
    80003628:	404080e7          	jalr	1028(ra) # 80000a28 <printf>
        printf("treca3-USPESNO: %d \n",c->scheduler->preemptive);
    8000362c:	fe843783          	ld	a5,-24(s0)
    80003630:	63dc                	ld	a5,128(a5)
    80003632:	479c                	lw	a5,8(a5)
    80003634:	85be                	mv	a1,a5
    80003636:	00008517          	auipc	a0,0x8
    8000363a:	c1a50513          	addi	a0,a0,-998 # 8000b250 <etext+0x250>
    8000363e:	ffffd097          	auipc	ra,0xffffd
    80003642:	3ea080e7          	jalr	1002(ra) # 80000a28 <printf>
        return 0;
    80003646:	4781                	li	a5,0
//    }
//    else return -1;

}
    80003648:	853e                	mv	a0,a5
    8000364a:	70a2                	ld	ra,40(sp)
    8000364c:	7402                	ld	s0,32(sp)
    8000364e:	6145                	addi	sp,sp,48
    80003650:	8082                	ret

0000000080003652 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80003652:	7179                	addi	sp,sp,-48
    80003654:	f406                	sd	ra,40(sp)
    80003656:	f022                	sd	s0,32(sp)
    80003658:	ec26                	sd	s1,24(sp)
    8000365a:	1800                	addi	s0,sp,48

  int intena;
  struct proc *p = myproc();
    8000365c:	fffff097          	auipc	ra,0xfffff
    80003660:	1bc080e7          	jalr	444(ra) # 80002818 <myproc>
    80003664:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80003668:	fd843783          	ld	a5,-40(s0)
    8000366c:	853e                	mv	a0,a5
    8000366e:	ffffe097          	auipc	ra,0xffffe
    80003672:	cba080e7          	jalr	-838(ra) # 80001328 <holding>
    80003676:	87aa                	mv	a5,a0
    80003678:	eb89                	bnez	a5,8000368a <sched+0x38>
    panic("sched p->lock");
    8000367a:	00008517          	auipc	a0,0x8
    8000367e:	bee50513          	addi	a0,a0,-1042 # 8000b268 <etext+0x268>
    80003682:	ffffd097          	auipc	ra,0xffffd
    80003686:	5fc080e7          	jalr	1532(ra) # 80000c7e <panic>
  if(mycpu()->noff != 1)
    8000368a:	fffff097          	auipc	ra,0xfffff
    8000368e:	150080e7          	jalr	336(ra) # 800027da <mycpu>
    80003692:	87aa                	mv	a5,a0
    80003694:	5fbc                	lw	a5,120(a5)
    80003696:	873e                	mv	a4,a5
    80003698:	4785                	li	a5,1
    8000369a:	00f70a63          	beq	a4,a5,800036ae <sched+0x5c>
    panic("sched locks");
    8000369e:	00008517          	auipc	a0,0x8
    800036a2:	bda50513          	addi	a0,a0,-1062 # 8000b278 <etext+0x278>
    800036a6:	ffffd097          	auipc	ra,0xffffd
    800036aa:	5d8080e7          	jalr	1496(ra) # 80000c7e <panic>
  if(p->state == RUNNING)
    800036ae:	fd843783          	ld	a5,-40(s0)
    800036b2:	4f9c                	lw	a5,24(a5)
    800036b4:	873e                	mv	a4,a5
    800036b6:	4791                	li	a5,4
    800036b8:	00f71a63          	bne	a4,a5,800036cc <sched+0x7a>
    panic("sched running");
    800036bc:	00008517          	auipc	a0,0x8
    800036c0:	bcc50513          	addi	a0,a0,-1076 # 8000b288 <etext+0x288>
    800036c4:	ffffd097          	auipc	ra,0xffffd
    800036c8:	5ba080e7          	jalr	1466(ra) # 80000c7e <panic>
  if(intr_get())
    800036cc:	fffff097          	auipc	ra,0xfffff
    800036d0:	f22080e7          	jalr	-222(ra) # 800025ee <intr_get>
    800036d4:	87aa                	mv	a5,a0
    800036d6:	cb89                	beqz	a5,800036e8 <sched+0x96>
    panic("sched interruptible");
    800036d8:	00008517          	auipc	a0,0x8
    800036dc:	bc050513          	addi	a0,a0,-1088 # 8000b298 <etext+0x298>
    800036e0:	ffffd097          	auipc	ra,0xffffd
    800036e4:	59e080e7          	jalr	1438(ra) # 80000c7e <panic>

  intena = mycpu()->intena;
    800036e8:	fffff097          	auipc	ra,0xfffff
    800036ec:	0f2080e7          	jalr	242(ra) # 800027da <mycpu>
    800036f0:	87aa                	mv	a5,a0
    800036f2:	5ffc                	lw	a5,124(a5)
    800036f4:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800036f8:	fd843783          	ld	a5,-40(s0)
    800036fc:	06078493          	addi	s1,a5,96
    80003700:	fffff097          	auipc	ra,0xfffff
    80003704:	0da080e7          	jalr	218(ra) # 800027da <mycpu>
    80003708:	87aa                	mv	a5,a0
    8000370a:	07a1                	addi	a5,a5,8
    8000370c:	85be                	mv	a1,a5
    8000370e:	8526                	mv	a0,s1
    80003710:	00000097          	auipc	ra,0x0
    80003714:	444080e7          	jalr	1092(ra) # 80003b54 <swtch>
  mycpu()->intena = intena;
    80003718:	fffff097          	auipc	ra,0xfffff
    8000371c:	0c2080e7          	jalr	194(ra) # 800027da <mycpu>
    80003720:	872a                	mv	a4,a0
    80003722:	fd442783          	lw	a5,-44(s0)
    80003726:	df7c                	sw	a5,124(a4)
}
    80003728:	0001                	nop
    8000372a:	70a2                	ld	ra,40(sp)
    8000372c:	7402                	ld	s0,32(sp)
    8000372e:	64e2                	ld	s1,24(sp)
    80003730:	6145                	addi	sp,sp,48
    80003732:	8082                	ret

0000000080003734 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003734:	1101                	addi	sp,sp,-32
    80003736:	ec06                	sd	ra,24(sp)
    80003738:	e822                	sd	s0,16(sp)
    8000373a:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8000373c:	fffff097          	auipc	ra,0xfffff
    80003740:	0dc080e7          	jalr	220(ra) # 80002818 <myproc>
    80003744:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003748:	fe843783          	ld	a5,-24(s0)
    8000374c:	853e                	mv	a0,a5
    8000374e:	ffffe097          	auipc	ra,0xffffe
    80003752:	b20080e7          	jalr	-1248(ra) # 8000126e <acquire>
  put(p);
    80003756:	fe843503          	ld	a0,-24(s0)
    8000375a:	00000097          	auipc	ra,0x0
    8000375e:	c0a080e7          	jalr	-1014(ra) # 80003364 <put>
  sched();
    80003762:	00000097          	auipc	ra,0x0
    80003766:	ef0080e7          	jalr	-272(ra) # 80003652 <sched>
  release(&p->lock);
    8000376a:	fe843783          	ld	a5,-24(s0)
    8000376e:	853e                	mv	a0,a5
    80003770:	ffffe097          	auipc	ra,0xffffe
    80003774:	b62080e7          	jalr	-1182(ra) # 800012d2 <release>
}
    80003778:	0001                	nop
    8000377a:	60e2                	ld	ra,24(sp)
    8000377c:	6442                	ld	s0,16(sp)
    8000377e:	6105                	addi	sp,sp,32
    80003780:	8082                	ret

0000000080003782 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003782:	1141                	addi	sp,sp,-16
    80003784:	e406                	sd	ra,8(sp)
    80003786:	e022                	sd	s0,0(sp)
    80003788:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    8000378a:	fffff097          	auipc	ra,0xfffff
    8000378e:	08e080e7          	jalr	142(ra) # 80002818 <myproc>
    80003792:	87aa                	mv	a5,a0
    80003794:	853e                	mv	a0,a5
    80003796:	ffffe097          	auipc	ra,0xffffe
    8000379a:	b3c080e7          	jalr	-1220(ra) # 800012d2 <release>

  if (first) {
    8000379e:	00008797          	auipc	a5,0x8
    800037a2:	fe678793          	addi	a5,a5,-26 # 8000b784 <first.1724>
    800037a6:	439c                	lw	a5,0(a5)
    800037a8:	cf81                	beqz	a5,800037c0 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    800037aa:	00008797          	auipc	a5,0x8
    800037ae:	fda78793          	addi	a5,a5,-38 # 8000b784 <first.1724>
    800037b2:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    800037b6:	4505                	li	a0,1
    800037b8:	00001097          	auipc	ra,0x1
    800037bc:	5b6080e7          	jalr	1462(ra) # 80004d6e <fsinit>
  }

  usertrapret();
    800037c0:	00000097          	auipc	ra,0x0
    800037c4:	77e080e7          	jalr	1918(ra) # 80003f3e <usertrapret>
}
    800037c8:	0001                	nop
    800037ca:	60a2                	ld	ra,8(sp)
    800037cc:	6402                	ld	s0,0(sp)
    800037ce:	0141                	addi	sp,sp,16
    800037d0:	8082                	ret

00000000800037d2 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    800037d2:	7179                	addi	sp,sp,-48
    800037d4:	f406                	sd	ra,40(sp)
    800037d6:	f022                	sd	s0,32(sp)
    800037d8:	1800                	addi	s0,sp,48
    800037da:	fca43c23          	sd	a0,-40(s0)
    800037de:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800037e2:	fffff097          	auipc	ra,0xfffff
    800037e6:	036080e7          	jalr	54(ra) # 80002818 <myproc>
    800037ea:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    800037ee:	fe843783          	ld	a5,-24(s0)
    800037f2:	853e                	mv	a0,a5
    800037f4:	ffffe097          	auipc	ra,0xffffe
    800037f8:	a7a080e7          	jalr	-1414(ra) # 8000126e <acquire>
  release(lk);
    800037fc:	fd043503          	ld	a0,-48(s0)
    80003800:	ffffe097          	auipc	ra,0xffffe
    80003804:	ad2080e7          	jalr	-1326(ra) # 800012d2 <release>

  // Go to sleep.
  p->chan = chan;
    80003808:	fe843783          	ld	a5,-24(s0)
    8000380c:	fd843703          	ld	a4,-40(s0)
    80003810:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003812:	fe843783          	ld	a5,-24(s0)
    80003816:	4709                	li	a4,2
    80003818:	cf98                	sw	a4,24(a5)

  //if(process_lock.locked)release(&process_lock);
  sched();
    8000381a:	00000097          	auipc	ra,0x0
    8000381e:	e38080e7          	jalr	-456(ra) # 80003652 <sched>

  // Tidy up.
  p->chan = 0;
    80003822:	fe843783          	ld	a5,-24(s0)
    80003826:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    8000382a:	fe843783          	ld	a5,-24(s0)
    8000382e:	853e                	mv	a0,a5
    80003830:	ffffe097          	auipc	ra,0xffffe
    80003834:	aa2080e7          	jalr	-1374(ra) # 800012d2 <release>
  acquire(lk);
    80003838:	fd043503          	ld	a0,-48(s0)
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	a32080e7          	jalr	-1486(ra) # 8000126e <acquire>
}
    80003844:	0001                	nop
    80003846:	70a2                	ld	ra,40(sp)
    80003848:	7402                	ld	s0,32(sp)
    8000384a:	6145                	addi	sp,sp,48
    8000384c:	8082                	ret

000000008000384e <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    8000384e:	7179                	addi	sp,sp,-48
    80003850:	f406                	sd	ra,40(sp)
    80003852:	f022                	sd	s0,32(sp)
    80003854:	1800                	addi	s0,sp,48
    80003856:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    8000385a:	00011797          	auipc	a5,0x11
    8000385e:	e8e78793          	addi	a5,a5,-370 # 800146e8 <proc>
    80003862:	fef43423          	sd	a5,-24(s0)
    80003866:	a095                	j	800038ca <wakeup+0x7c>
    if(p != myproc()){
    80003868:	fffff097          	auipc	ra,0xfffff
    8000386c:	fb0080e7          	jalr	-80(ra) # 80002818 <myproc>
    80003870:	872a                	mv	a4,a0
    80003872:	fe843783          	ld	a5,-24(s0)
    80003876:	04e78463          	beq	a5,a4,800038be <wakeup+0x70>
      acquire(&p->lock);
    8000387a:	fe843783          	ld	a5,-24(s0)
    8000387e:	853e                	mv	a0,a5
    80003880:	ffffe097          	auipc	ra,0xffffe
    80003884:	9ee080e7          	jalr	-1554(ra) # 8000126e <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003888:	fe843783          	ld	a5,-24(s0)
    8000388c:	4f9c                	lw	a5,24(a5)
    8000388e:	873e                	mv	a4,a5
    80003890:	4789                	li	a5,2
    80003892:	00f71f63          	bne	a4,a5,800038b0 <wakeup+0x62>
    80003896:	fe843783          	ld	a5,-24(s0)
    8000389a:	739c                	ld	a5,32(a5)
    8000389c:	fd843703          	ld	a4,-40(s0)
    800038a0:	00f71863          	bne	a4,a5,800038b0 <wakeup+0x62>
          put(p);
    800038a4:	fe843503          	ld	a0,-24(s0)
    800038a8:	00000097          	auipc	ra,0x0
    800038ac:	abc080e7          	jalr	-1348(ra) # 80003364 <put>
      }
      release(&p->lock);
    800038b0:	fe843783          	ld	a5,-24(s0)
    800038b4:	853e                	mv	a0,a5
    800038b6:	ffffe097          	auipc	ra,0xffffe
    800038ba:	a1c080e7          	jalr	-1508(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800038be:	fe843783          	ld	a5,-24(s0)
    800038c2:	19078793          	addi	a5,a5,400
    800038c6:	fef43423          	sd	a5,-24(s0)
    800038ca:	fe843703          	ld	a4,-24(s0)
    800038ce:	00017797          	auipc	a5,0x17
    800038d2:	21a78793          	addi	a5,a5,538 # 8001aae8 <pid_lock>
    800038d6:	f8f769e3          	bltu	a4,a5,80003868 <wakeup+0x1a>
    }
  }
}
    800038da:	0001                	nop
    800038dc:	0001                	nop
    800038de:	70a2                	ld	ra,40(sp)
    800038e0:	7402                	ld	s0,32(sp)
    800038e2:	6145                	addi	sp,sp,48
    800038e4:	8082                	ret

00000000800038e6 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800038e6:	7179                	addi	sp,sp,-48
    800038e8:	f406                	sd	ra,40(sp)
    800038ea:	f022                	sd	s0,32(sp)
    800038ec:	1800                	addi	s0,sp,48
    800038ee:	87aa                	mv	a5,a0
    800038f0:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    800038f4:	00011797          	auipc	a5,0x11
    800038f8:	df478793          	addi	a5,a5,-524 # 800146e8 <proc>
    800038fc:	fef43423          	sd	a5,-24(s0)
    80003900:	a0bd                	j	8000396e <kill+0x88>
    acquire(&p->lock);
    80003902:	fe843783          	ld	a5,-24(s0)
    80003906:	853e                	mv	a0,a5
    80003908:	ffffe097          	auipc	ra,0xffffe
    8000390c:	966080e7          	jalr	-1690(ra) # 8000126e <acquire>
    if(p->pid == pid){
    80003910:	fe843783          	ld	a5,-24(s0)
    80003914:	5b98                	lw	a4,48(a5)
    80003916:	fdc42783          	lw	a5,-36(s0)
    8000391a:	2781                	sext.w	a5,a5
    8000391c:	02e79c63          	bne	a5,a4,80003954 <kill+0x6e>
      p->killed = 1;
    80003920:	fe843783          	ld	a5,-24(s0)
    80003924:	4705                	li	a4,1
    80003926:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003928:	fe843783          	ld	a5,-24(s0)
    8000392c:	4f9c                	lw	a5,24(a5)
    8000392e:	873e                	mv	a4,a5
    80003930:	4789                	li	a5,2
    80003932:	00f71863          	bne	a4,a5,80003942 <kill+0x5c>
        // Wake process from sleep().
        put(p);
    80003936:	fe843503          	ld	a0,-24(s0)
    8000393a:	00000097          	auipc	ra,0x0
    8000393e:	a2a080e7          	jalr	-1494(ra) # 80003364 <put>
      }
      release(&p->lock);
    80003942:	fe843783          	ld	a5,-24(s0)
    80003946:	853e                	mv	a0,a5
    80003948:	ffffe097          	auipc	ra,0xffffe
    8000394c:	98a080e7          	jalr	-1654(ra) # 800012d2 <release>
      return 0;
    80003950:	4781                	li	a5,0
    80003952:	a03d                	j	80003980 <kill+0x9a>
    }
    release(&p->lock);
    80003954:	fe843783          	ld	a5,-24(s0)
    80003958:	853e                	mv	a0,a5
    8000395a:	ffffe097          	auipc	ra,0xffffe
    8000395e:	978080e7          	jalr	-1672(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003962:	fe843783          	ld	a5,-24(s0)
    80003966:	19078793          	addi	a5,a5,400
    8000396a:	fef43423          	sd	a5,-24(s0)
    8000396e:	fe843703          	ld	a4,-24(s0)
    80003972:	00017797          	auipc	a5,0x17
    80003976:	17678793          	addi	a5,a5,374 # 8001aae8 <pid_lock>
    8000397a:	f8f764e3          	bltu	a4,a5,80003902 <kill+0x1c>
  }
  return -1;
    8000397e:	57fd                	li	a5,-1
}
    80003980:	853e                	mv	a0,a5
    80003982:	70a2                	ld	ra,40(sp)
    80003984:	7402                	ld	s0,32(sp)
    80003986:	6145                	addi	sp,sp,48
    80003988:	8082                	ret

000000008000398a <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8000398a:	7139                	addi	sp,sp,-64
    8000398c:	fc06                	sd	ra,56(sp)
    8000398e:	f822                	sd	s0,48(sp)
    80003990:	0080                	addi	s0,sp,64
    80003992:	87aa                	mv	a5,a0
    80003994:	fcb43823          	sd	a1,-48(s0)
    80003998:	fcc43423          	sd	a2,-56(s0)
    8000399c:	fcd43023          	sd	a3,-64(s0)
    800039a0:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800039a4:	fffff097          	auipc	ra,0xfffff
    800039a8:	e74080e7          	jalr	-396(ra) # 80002818 <myproc>
    800039ac:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    800039b0:	fdc42783          	lw	a5,-36(s0)
    800039b4:	2781                	sext.w	a5,a5
    800039b6:	c38d                	beqz	a5,800039d8 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    800039b8:	fe843783          	ld	a5,-24(s0)
    800039bc:	6bbc                	ld	a5,80(a5)
    800039be:	fc043683          	ld	a3,-64(s0)
    800039c2:	fc843603          	ld	a2,-56(s0)
    800039c6:	fd043583          	ld	a1,-48(s0)
    800039ca:	853e                	mv	a0,a5
    800039cc:	fffff097          	auipc	ra,0xfffff
    800039d0:	91a080e7          	jalr	-1766(ra) # 800022e6 <copyout>
    800039d4:	87aa                	mv	a5,a0
    800039d6:	a839                	j	800039f4 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800039d8:	fd043783          	ld	a5,-48(s0)
    800039dc:	fc043703          	ld	a4,-64(s0)
    800039e0:	2701                	sext.w	a4,a4
    800039e2:	863a                	mv	a2,a4
    800039e4:	fc843583          	ld	a1,-56(s0)
    800039e8:	853e                	mv	a0,a5
    800039ea:	ffffe097          	auipc	ra,0xffffe
    800039ee:	b3c080e7          	jalr	-1220(ra) # 80001526 <memmove>
    return 0;
    800039f2:	4781                	li	a5,0
  }
}
    800039f4:	853e                	mv	a0,a5
    800039f6:	70e2                	ld	ra,56(sp)
    800039f8:	7442                	ld	s0,48(sp)
    800039fa:	6121                	addi	sp,sp,64
    800039fc:	8082                	ret

00000000800039fe <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800039fe:	7139                	addi	sp,sp,-64
    80003a00:	fc06                	sd	ra,56(sp)
    80003a02:	f822                	sd	s0,48(sp)
    80003a04:	0080                	addi	s0,sp,64
    80003a06:	fca43c23          	sd	a0,-40(s0)
    80003a0a:	87ae                	mv	a5,a1
    80003a0c:	fcc43423          	sd	a2,-56(s0)
    80003a10:	fcd43023          	sd	a3,-64(s0)
    80003a14:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003a18:	fffff097          	auipc	ra,0xfffff
    80003a1c:	e00080e7          	jalr	-512(ra) # 80002818 <myproc>
    80003a20:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003a24:	fd442783          	lw	a5,-44(s0)
    80003a28:	2781                	sext.w	a5,a5
    80003a2a:	c38d                	beqz	a5,80003a4c <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003a2c:	fe843783          	ld	a5,-24(s0)
    80003a30:	6bbc                	ld	a5,80(a5)
    80003a32:	fc043683          	ld	a3,-64(s0)
    80003a36:	fc843603          	ld	a2,-56(s0)
    80003a3a:	fd843583          	ld	a1,-40(s0)
    80003a3e:	853e                	mv	a0,a5
    80003a40:	fffff097          	auipc	ra,0xfffff
    80003a44:	974080e7          	jalr	-1676(ra) # 800023b4 <copyin>
    80003a48:	87aa                	mv	a5,a0
    80003a4a:	a839                	j	80003a68 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003a4c:	fc843783          	ld	a5,-56(s0)
    80003a50:	fc043703          	ld	a4,-64(s0)
    80003a54:	2701                	sext.w	a4,a4
    80003a56:	863a                	mv	a2,a4
    80003a58:	85be                	mv	a1,a5
    80003a5a:	fd843503          	ld	a0,-40(s0)
    80003a5e:	ffffe097          	auipc	ra,0xffffe
    80003a62:	ac8080e7          	jalr	-1336(ra) # 80001526 <memmove>
    return 0;
    80003a66:	4781                	li	a5,0
  }
}
    80003a68:	853e                	mv	a0,a5
    80003a6a:	70e2                	ld	ra,56(sp)
    80003a6c:	7442                	ld	s0,48(sp)
    80003a6e:	6121                	addi	sp,sp,64
    80003a70:	8082                	ret

0000000080003a72 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003a72:	1101                	addi	sp,sp,-32
    80003a74:	ec06                	sd	ra,24(sp)
    80003a76:	e822                	sd	s0,16(sp)
    80003a78:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003a7a:	00008517          	auipc	a0,0x8
    80003a7e:	83650513          	addi	a0,a0,-1994 # 8000b2b0 <etext+0x2b0>
    80003a82:	ffffd097          	auipc	ra,0xffffd
    80003a86:	fa6080e7          	jalr	-90(ra) # 80000a28 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003a8a:	00011797          	auipc	a5,0x11
    80003a8e:	c5e78793          	addi	a5,a5,-930 # 800146e8 <proc>
    80003a92:	fef43423          	sd	a5,-24(s0)
    80003a96:	a04d                	j	80003b38 <procdump+0xc6>
    if(p->state == UNUSED)
    80003a98:	fe843783          	ld	a5,-24(s0)
    80003a9c:	4f9c                	lw	a5,24(a5)
    80003a9e:	c7d1                	beqz	a5,80003b2a <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003aa0:	fe843783          	ld	a5,-24(s0)
    80003aa4:	4f9c                	lw	a5,24(a5)
    80003aa6:	873e                	mv	a4,a5
    80003aa8:	4795                	li	a5,5
    80003aaa:	02e7ee63          	bltu	a5,a4,80003ae6 <procdump+0x74>
    80003aae:	fe843783          	ld	a5,-24(s0)
    80003ab2:	4f9c                	lw	a5,24(a5)
    80003ab4:	00008717          	auipc	a4,0x8
    80003ab8:	d2c70713          	addi	a4,a4,-724 # 8000b7e0 <states.1761>
    80003abc:	1782                	slli	a5,a5,0x20
    80003abe:	9381                	srli	a5,a5,0x20
    80003ac0:	078e                	slli	a5,a5,0x3
    80003ac2:	97ba                	add	a5,a5,a4
    80003ac4:	639c                	ld	a5,0(a5)
    80003ac6:	c385                	beqz	a5,80003ae6 <procdump+0x74>
      state = states[p->state];
    80003ac8:	fe843783          	ld	a5,-24(s0)
    80003acc:	4f9c                	lw	a5,24(a5)
    80003ace:	00008717          	auipc	a4,0x8
    80003ad2:	d1270713          	addi	a4,a4,-750 # 8000b7e0 <states.1761>
    80003ad6:	1782                	slli	a5,a5,0x20
    80003ad8:	9381                	srli	a5,a5,0x20
    80003ada:	078e                	slli	a5,a5,0x3
    80003adc:	97ba                	add	a5,a5,a4
    80003ade:	639c                	ld	a5,0(a5)
    80003ae0:	fef43023          	sd	a5,-32(s0)
    80003ae4:	a039                	j	80003af2 <procdump+0x80>
    else
      state = "???";
    80003ae6:	00007797          	auipc	a5,0x7
    80003aea:	7d278793          	addi	a5,a5,2002 # 8000b2b8 <etext+0x2b8>
    80003aee:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003af2:	fe843783          	ld	a5,-24(s0)
    80003af6:	5b98                	lw	a4,48(a5)
    80003af8:	fe843783          	ld	a5,-24(s0)
    80003afc:	15878793          	addi	a5,a5,344
    80003b00:	86be                	mv	a3,a5
    80003b02:	fe043603          	ld	a2,-32(s0)
    80003b06:	85ba                	mv	a1,a4
    80003b08:	00007517          	auipc	a0,0x7
    80003b0c:	7b850513          	addi	a0,a0,1976 # 8000b2c0 <etext+0x2c0>
    80003b10:	ffffd097          	auipc	ra,0xffffd
    80003b14:	f18080e7          	jalr	-232(ra) # 80000a28 <printf>
    printf("\n");
    80003b18:	00007517          	auipc	a0,0x7
    80003b1c:	79850513          	addi	a0,a0,1944 # 8000b2b0 <etext+0x2b0>
    80003b20:	ffffd097          	auipc	ra,0xffffd
    80003b24:	f08080e7          	jalr	-248(ra) # 80000a28 <printf>
    80003b28:	a011                	j	80003b2c <procdump+0xba>
      continue;
    80003b2a:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003b2c:	fe843783          	ld	a5,-24(s0)
    80003b30:	19078793          	addi	a5,a5,400
    80003b34:	fef43423          	sd	a5,-24(s0)
    80003b38:	fe843703          	ld	a4,-24(s0)
    80003b3c:	00017797          	auipc	a5,0x17
    80003b40:	fac78793          	addi	a5,a5,-84 # 8001aae8 <pid_lock>
    80003b44:	f4f76ae3          	bltu	a4,a5,80003a98 <procdump+0x26>
  }
}
    80003b48:	0001                	nop
    80003b4a:	0001                	nop
    80003b4c:	60e2                	ld	ra,24(sp)
    80003b4e:	6442                	ld	s0,16(sp)
    80003b50:	6105                	addi	sp,sp,32
    80003b52:	8082                	ret

0000000080003b54 <swtch>:
    80003b54:	00153023          	sd	ra,0(a0)
    80003b58:	00253423          	sd	sp,8(a0)
    80003b5c:	e900                	sd	s0,16(a0)
    80003b5e:	ed04                	sd	s1,24(a0)
    80003b60:	03253023          	sd	s2,32(a0)
    80003b64:	03353423          	sd	s3,40(a0)
    80003b68:	03453823          	sd	s4,48(a0)
    80003b6c:	03553c23          	sd	s5,56(a0)
    80003b70:	05653023          	sd	s6,64(a0)
    80003b74:	05753423          	sd	s7,72(a0)
    80003b78:	05853823          	sd	s8,80(a0)
    80003b7c:	05953c23          	sd	s9,88(a0)
    80003b80:	07a53023          	sd	s10,96(a0)
    80003b84:	07b53423          	sd	s11,104(a0)
    80003b88:	0005b083          	ld	ra,0(a1)
    80003b8c:	0085b103          	ld	sp,8(a1)
    80003b90:	6980                	ld	s0,16(a1)
    80003b92:	6d84                	ld	s1,24(a1)
    80003b94:	0205b903          	ld	s2,32(a1)
    80003b98:	0285b983          	ld	s3,40(a1)
    80003b9c:	0305ba03          	ld	s4,48(a1)
    80003ba0:	0385ba83          	ld	s5,56(a1)
    80003ba4:	0405bb03          	ld	s6,64(a1)
    80003ba8:	0485bb83          	ld	s7,72(a1)
    80003bac:	0505bc03          	ld	s8,80(a1)
    80003bb0:	0585bc83          	ld	s9,88(a1)
    80003bb4:	0605bd03          	ld	s10,96(a1)
    80003bb8:	0685bd83          	ld	s11,104(a1)
    80003bbc:	8082                	ret

0000000080003bbe <r_sstatus>:
{
    80003bbe:	1101                	addi	sp,sp,-32
    80003bc0:	ec22                	sd	s0,24(sp)
    80003bc2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003bc4:	100027f3          	csrr	a5,sstatus
    80003bc8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bcc:	fe843783          	ld	a5,-24(s0)
}
    80003bd0:	853e                	mv	a0,a5
    80003bd2:	6462                	ld	s0,24(sp)
    80003bd4:	6105                	addi	sp,sp,32
    80003bd6:	8082                	ret

0000000080003bd8 <w_sstatus>:
{
    80003bd8:	1101                	addi	sp,sp,-32
    80003bda:	ec22                	sd	s0,24(sp)
    80003bdc:	1000                	addi	s0,sp,32
    80003bde:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003be2:	fe843783          	ld	a5,-24(s0)
    80003be6:	10079073          	csrw	sstatus,a5
}
    80003bea:	0001                	nop
    80003bec:	6462                	ld	s0,24(sp)
    80003bee:	6105                	addi	sp,sp,32
    80003bf0:	8082                	ret

0000000080003bf2 <r_sip>:
{
    80003bf2:	1101                	addi	sp,sp,-32
    80003bf4:	ec22                	sd	s0,24(sp)
    80003bf6:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003bf8:	144027f3          	csrr	a5,sip
    80003bfc:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c00:	fe843783          	ld	a5,-24(s0)
}
    80003c04:	853e                	mv	a0,a5
    80003c06:	6462                	ld	s0,24(sp)
    80003c08:	6105                	addi	sp,sp,32
    80003c0a:	8082                	ret

0000000080003c0c <w_sip>:
{
    80003c0c:	1101                	addi	sp,sp,-32
    80003c0e:	ec22                	sd	s0,24(sp)
    80003c10:	1000                	addi	s0,sp,32
    80003c12:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003c16:	fe843783          	ld	a5,-24(s0)
    80003c1a:	14479073          	csrw	sip,a5
}
    80003c1e:	0001                	nop
    80003c20:	6462                	ld	s0,24(sp)
    80003c22:	6105                	addi	sp,sp,32
    80003c24:	8082                	ret

0000000080003c26 <w_sepc>:
{
    80003c26:	1101                	addi	sp,sp,-32
    80003c28:	ec22                	sd	s0,24(sp)
    80003c2a:	1000                	addi	s0,sp,32
    80003c2c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003c30:	fe843783          	ld	a5,-24(s0)
    80003c34:	14179073          	csrw	sepc,a5
}
    80003c38:	0001                	nop
    80003c3a:	6462                	ld	s0,24(sp)
    80003c3c:	6105                	addi	sp,sp,32
    80003c3e:	8082                	ret

0000000080003c40 <r_sepc>:
{
    80003c40:	1101                	addi	sp,sp,-32
    80003c42:	ec22                	sd	s0,24(sp)
    80003c44:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003c46:	141027f3          	csrr	a5,sepc
    80003c4a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c4e:	fe843783          	ld	a5,-24(s0)
}
    80003c52:	853e                	mv	a0,a5
    80003c54:	6462                	ld	s0,24(sp)
    80003c56:	6105                	addi	sp,sp,32
    80003c58:	8082                	ret

0000000080003c5a <w_stvec>:
{
    80003c5a:	1101                	addi	sp,sp,-32
    80003c5c:	ec22                	sd	s0,24(sp)
    80003c5e:	1000                	addi	s0,sp,32
    80003c60:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003c64:	fe843783          	ld	a5,-24(s0)
    80003c68:	10579073          	csrw	stvec,a5
}
    80003c6c:	0001                	nop
    80003c6e:	6462                	ld	s0,24(sp)
    80003c70:	6105                	addi	sp,sp,32
    80003c72:	8082                	ret

0000000080003c74 <r_satp>:
{
    80003c74:	1101                	addi	sp,sp,-32
    80003c76:	ec22                	sd	s0,24(sp)
    80003c78:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003c7a:	180027f3          	csrr	a5,satp
    80003c7e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c82:	fe843783          	ld	a5,-24(s0)
}
    80003c86:	853e                	mv	a0,a5
    80003c88:	6462                	ld	s0,24(sp)
    80003c8a:	6105                	addi	sp,sp,32
    80003c8c:	8082                	ret

0000000080003c8e <r_scause>:
{
    80003c8e:	1101                	addi	sp,sp,-32
    80003c90:	ec22                	sd	s0,24(sp)
    80003c92:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003c94:	142027f3          	csrr	a5,scause
    80003c98:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c9c:	fe843783          	ld	a5,-24(s0)
}
    80003ca0:	853e                	mv	a0,a5
    80003ca2:	6462                	ld	s0,24(sp)
    80003ca4:	6105                	addi	sp,sp,32
    80003ca6:	8082                	ret

0000000080003ca8 <r_stval>:
{
    80003ca8:	1101                	addi	sp,sp,-32
    80003caa:	ec22                	sd	s0,24(sp)
    80003cac:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003cae:	143027f3          	csrr	a5,stval
    80003cb2:	fef43423          	sd	a5,-24(s0)
  return x;
    80003cb6:	fe843783          	ld	a5,-24(s0)
}
    80003cba:	853e                	mv	a0,a5
    80003cbc:	6462                	ld	s0,24(sp)
    80003cbe:	6105                	addi	sp,sp,32
    80003cc0:	8082                	ret

0000000080003cc2 <intr_on>:
{
    80003cc2:	1141                	addi	sp,sp,-16
    80003cc4:	e406                	sd	ra,8(sp)
    80003cc6:	e022                	sd	s0,0(sp)
    80003cc8:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003cca:	00000097          	auipc	ra,0x0
    80003cce:	ef4080e7          	jalr	-268(ra) # 80003bbe <r_sstatus>
    80003cd2:	87aa                	mv	a5,a0
    80003cd4:	0027e793          	ori	a5,a5,2
    80003cd8:	853e                	mv	a0,a5
    80003cda:	00000097          	auipc	ra,0x0
    80003cde:	efe080e7          	jalr	-258(ra) # 80003bd8 <w_sstatus>
}
    80003ce2:	0001                	nop
    80003ce4:	60a2                	ld	ra,8(sp)
    80003ce6:	6402                	ld	s0,0(sp)
    80003ce8:	0141                	addi	sp,sp,16
    80003cea:	8082                	ret

0000000080003cec <intr_off>:
{
    80003cec:	1141                	addi	sp,sp,-16
    80003cee:	e406                	sd	ra,8(sp)
    80003cf0:	e022                	sd	s0,0(sp)
    80003cf2:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003cf4:	00000097          	auipc	ra,0x0
    80003cf8:	eca080e7          	jalr	-310(ra) # 80003bbe <r_sstatus>
    80003cfc:	87aa                	mv	a5,a0
    80003cfe:	9bf5                	andi	a5,a5,-3
    80003d00:	853e                	mv	a0,a5
    80003d02:	00000097          	auipc	ra,0x0
    80003d06:	ed6080e7          	jalr	-298(ra) # 80003bd8 <w_sstatus>
}
    80003d0a:	0001                	nop
    80003d0c:	60a2                	ld	ra,8(sp)
    80003d0e:	6402                	ld	s0,0(sp)
    80003d10:	0141                	addi	sp,sp,16
    80003d12:	8082                	ret

0000000080003d14 <intr_get>:
{
    80003d14:	1101                	addi	sp,sp,-32
    80003d16:	ec06                	sd	ra,24(sp)
    80003d18:	e822                	sd	s0,16(sp)
    80003d1a:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003d1c:	00000097          	auipc	ra,0x0
    80003d20:	ea2080e7          	jalr	-350(ra) # 80003bbe <r_sstatus>
    80003d24:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003d28:	fe843783          	ld	a5,-24(s0)
    80003d2c:	8b89                	andi	a5,a5,2
    80003d2e:	00f037b3          	snez	a5,a5
    80003d32:	0ff7f793          	andi	a5,a5,255
    80003d36:	2781                	sext.w	a5,a5
}
    80003d38:	853e                	mv	a0,a5
    80003d3a:	60e2                	ld	ra,24(sp)
    80003d3c:	6442                	ld	s0,16(sp)
    80003d3e:	6105                	addi	sp,sp,32
    80003d40:	8082                	ret

0000000080003d42 <r_tp>:
{
    80003d42:	1101                	addi	sp,sp,-32
    80003d44:	ec22                	sd	s0,24(sp)
    80003d46:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003d48:	8792                	mv	a5,tp
    80003d4a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003d4e:	fe843783          	ld	a5,-24(s0)
}
    80003d52:	853e                	mv	a0,a5
    80003d54:	6462                	ld	s0,24(sp)
    80003d56:	6105                	addi	sp,sp,32
    80003d58:	8082                	ret

0000000080003d5a <trapinit>:
extern Time tajmer;
extern Time tajmerMAX;

void
trapinit(void)
{
    80003d5a:	1141                	addi	sp,sp,-16
    80003d5c:	e406                	sd	ra,8(sp)
    80003d5e:	e022                	sd	s0,0(sp)
    80003d60:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003d62:	00007597          	auipc	a1,0x7
    80003d66:	59e58593          	addi	a1,a1,1438 # 8000b300 <etext+0x300>
    80003d6a:	00017517          	auipc	a0,0x17
    80003d6e:	dc650513          	addi	a0,a0,-570 # 8001ab30 <tickslock>
    80003d72:	ffffd097          	auipc	ra,0xffffd
    80003d76:	4cc080e7          	jalr	1228(ra) # 8000123e <initlock>
}
    80003d7a:	0001                	nop
    80003d7c:	60a2                	ld	ra,8(sp)
    80003d7e:	6402                	ld	s0,0(sp)
    80003d80:	0141                	addi	sp,sp,16
    80003d82:	8082                	ret

0000000080003d84 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003d84:	1141                	addi	sp,sp,-16
    80003d86:	e406                	sd	ra,8(sp)
    80003d88:	e022                	sd	s0,0(sp)
    80003d8a:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003d8c:	00005797          	auipc	a5,0x5
    80003d90:	e5478793          	addi	a5,a5,-428 # 80008be0 <kernelvec>
    80003d94:	853e                	mv	a0,a5
    80003d96:	00000097          	auipc	ra,0x0
    80003d9a:	ec4080e7          	jalr	-316(ra) # 80003c5a <w_stvec>
}
    80003d9e:	0001                	nop
    80003da0:	60a2                	ld	ra,8(sp)
    80003da2:	6402                	ld	s0,0(sp)
    80003da4:	0141                	addi	sp,sp,16
    80003da6:	8082                	ret

0000000080003da8 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003da8:	7179                	addi	sp,sp,-48
    80003daa:	f406                	sd	ra,40(sp)
    80003dac:	f022                	sd	s0,32(sp)
    80003dae:	ec26                	sd	s1,24(sp)
    80003db0:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003db2:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003db6:	00000097          	auipc	ra,0x0
    80003dba:	e08080e7          	jalr	-504(ra) # 80003bbe <r_sstatus>
    80003dbe:	87aa                	mv	a5,a0
    80003dc0:	1007f793          	andi	a5,a5,256
    80003dc4:	cb89                	beqz	a5,80003dd6 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003dc6:	00007517          	auipc	a0,0x7
    80003dca:	54250513          	addi	a0,a0,1346 # 8000b308 <etext+0x308>
    80003dce:	ffffd097          	auipc	ra,0xffffd
    80003dd2:	eb0080e7          	jalr	-336(ra) # 80000c7e <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003dd6:	00005797          	auipc	a5,0x5
    80003dda:	e0a78793          	addi	a5,a5,-502 # 80008be0 <kernelvec>
    80003dde:	853e                	mv	a0,a5
    80003de0:	00000097          	auipc	ra,0x0
    80003de4:	e7a080e7          	jalr	-390(ra) # 80003c5a <w_stvec>

  struct proc *p = myproc();
    80003de8:	fffff097          	auipc	ra,0xfffff
    80003dec:	a30080e7          	jalr	-1488(ra) # 80002818 <myproc>
    80003df0:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003df4:	fd043783          	ld	a5,-48(s0)
    80003df8:	6fa4                	ld	s1,88(a5)
    80003dfa:	00000097          	auipc	ra,0x0
    80003dfe:	e46080e7          	jalr	-442(ra) # 80003c40 <r_sepc>
    80003e02:	87aa                	mv	a5,a0
    80003e04:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003e06:	00000097          	auipc	ra,0x0
    80003e0a:	e88080e7          	jalr	-376(ra) # 80003c8e <r_scause>
    80003e0e:	872a                	mv	a4,a0
    80003e10:	47a1                	li	a5,8
    80003e12:	02f71d63          	bne	a4,a5,80003e4c <usertrap+0xa4>
    // system call

    if(p->killed)
    80003e16:	fd043783          	ld	a5,-48(s0)
    80003e1a:	579c                	lw	a5,40(a5)
    80003e1c:	c791                	beqz	a5,80003e28 <usertrap+0x80>
      exit(-1);
    80003e1e:	557d                	li	a0,-1
    80003e20:	fffff097          	auipc	ra,0xfffff
    80003e24:	104080e7          	jalr	260(ra) # 80002f24 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003e28:	fd043783          	ld	a5,-48(s0)
    80003e2c:	6fbc                	ld	a5,88(a5)
    80003e2e:	6f98                	ld	a4,24(a5)
    80003e30:	fd043783          	ld	a5,-48(s0)
    80003e34:	6fbc                	ld	a5,88(a5)
    80003e36:	0711                	addi	a4,a4,4
    80003e38:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80003e3a:	00000097          	auipc	ra,0x0
    80003e3e:	e88080e7          	jalr	-376(ra) # 80003cc2 <intr_on>

    syscall();
    80003e42:	00000097          	auipc	ra,0x0
    80003e46:	716080e7          	jalr	1814(ra) # 80004558 <syscall>
    80003e4a:	a0b5                	j	80003eb6 <usertrap+0x10e>
  } else if((which_dev = devintr()) != 0){
    80003e4c:	00000097          	auipc	ra,0x0
    80003e50:	3de080e7          	jalr	990(ra) # 8000422a <devintr>
    80003e54:	87aa                	mv	a5,a0
    80003e56:	fcf42e23          	sw	a5,-36(s0)
    80003e5a:	fdc42783          	lw	a5,-36(s0)
    80003e5e:	2781                	sext.w	a5,a5
    80003e60:	ebb9                	bnez	a5,80003eb6 <usertrap+0x10e>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003e62:	00000097          	auipc	ra,0x0
    80003e66:	e2c080e7          	jalr	-468(ra) # 80003c8e <r_scause>
    80003e6a:	872a                	mv	a4,a0
    80003e6c:	fd043783          	ld	a5,-48(s0)
    80003e70:	5b9c                	lw	a5,48(a5)
    80003e72:	863e                	mv	a2,a5
    80003e74:	85ba                	mv	a1,a4
    80003e76:	00007517          	auipc	a0,0x7
    80003e7a:	4b250513          	addi	a0,a0,1202 # 8000b328 <etext+0x328>
    80003e7e:	ffffd097          	auipc	ra,0xffffd
    80003e82:	baa080e7          	jalr	-1110(ra) # 80000a28 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003e86:	00000097          	auipc	ra,0x0
    80003e8a:	dba080e7          	jalr	-582(ra) # 80003c40 <r_sepc>
    80003e8e:	84aa                	mv	s1,a0
    80003e90:	00000097          	auipc	ra,0x0
    80003e94:	e18080e7          	jalr	-488(ra) # 80003ca8 <r_stval>
    80003e98:	87aa                	mv	a5,a0
    80003e9a:	863e                	mv	a2,a5
    80003e9c:	85a6                	mv	a1,s1
    80003e9e:	00007517          	auipc	a0,0x7
    80003ea2:	4ba50513          	addi	a0,a0,1210 # 8000b358 <etext+0x358>
    80003ea6:	ffffd097          	auipc	ra,0xffffd
    80003eaa:	b82080e7          	jalr	-1150(ra) # 80000a28 <printf>
    p->killed = 1;
    80003eae:	fd043783          	ld	a5,-48(s0)
    80003eb2:	4705                	li	a4,1
    80003eb4:	d798                	sw	a4,40(a5)
  }

  if(p->killed)
    80003eb6:	fd043783          	ld	a5,-48(s0)
    80003eba:	579c                	lw	a5,40(a5)
    80003ebc:	c791                	beqz	a5,80003ec8 <usertrap+0x120>
    exit(-1);
    80003ebe:	557d                	li	a0,-1
    80003ec0:	fffff097          	auipc	ra,0xfffff
    80003ec4:	064080e7          	jalr	100(ra) # 80002f24 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && mycpu()->scheduler->preemptive)
    80003ec8:	fdc42783          	lw	a5,-36(s0)
    80003ecc:	0007871b          	sext.w	a4,a5
    80003ed0:	4789                	li	a5,2
    80003ed2:	04f71c63          	bne	a4,a5,80003f2a <usertrap+0x182>
    80003ed6:	fffff097          	auipc	ra,0xfffff
    80003eda:	904080e7          	jalr	-1788(ra) # 800027da <mycpu>
    80003ede:	87aa                	mv	a5,a0
    80003ee0:	63dc                	ld	a5,128(a5)
    80003ee2:	479c                	lw	a5,8(a5)
    80003ee4:	c3b9                	beqz	a5,80003f2a <usertrap+0x182>
  {
      if(tajmer==0)
    80003ee6:	00008797          	auipc	a5,0x8
    80003eea:	14678793          	addi	a5,a5,326 # 8000c02c <tajmer>
    80003eee:	439c                	lw	a5,0(a5)
    80003ef0:	e385                	bnez	a5,80003f10 <usertrap+0x168>
      {
          tajmer=tajmerMAX;
    80003ef2:	00008797          	auipc	a5,0x8
    80003ef6:	13678793          	addi	a5,a5,310 # 8000c028 <tajmerMAX>
    80003efa:	4398                	lw	a4,0(a5)
    80003efc:	00008797          	auipc	a5,0x8
    80003f00:	13078793          	addi	a5,a5,304 # 8000c02c <tajmer>
    80003f04:	c398                	sw	a4,0(a5)
          yield();
    80003f06:	00000097          	auipc	ra,0x0
    80003f0a:	82e080e7          	jalr	-2002(ra) # 80003734 <yield>
    80003f0e:	a831                	j	80003f2a <usertrap+0x182>
      }
      else tajmer=tajmer-1;
    80003f10:	00008797          	auipc	a5,0x8
    80003f14:	11c78793          	addi	a5,a5,284 # 8000c02c <tajmer>
    80003f18:	439c                	lw	a5,0(a5)
    80003f1a:	37fd                	addiw	a5,a5,-1
    80003f1c:	0007871b          	sext.w	a4,a5
    80003f20:	00008797          	auipc	a5,0x8
    80003f24:	10c78793          	addi	a5,a5,268 # 8000c02c <tajmer>
    80003f28:	c398                	sw	a4,0(a5)
  }

  usertrapret();
    80003f2a:	00000097          	auipc	ra,0x0
    80003f2e:	014080e7          	jalr	20(ra) # 80003f3e <usertrapret>
}
    80003f32:	0001                	nop
    80003f34:	70a2                	ld	ra,40(sp)
    80003f36:	7402                	ld	s0,32(sp)
    80003f38:	64e2                	ld	s1,24(sp)
    80003f3a:	6145                	addi	sp,sp,48
    80003f3c:	8082                	ret

0000000080003f3e <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003f3e:	7139                	addi	sp,sp,-64
    80003f40:	fc06                	sd	ra,56(sp)
    80003f42:	f822                	sd	s0,48(sp)
    80003f44:	f426                	sd	s1,40(sp)
    80003f46:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80003f48:	fffff097          	auipc	ra,0xfffff
    80003f4c:	8d0080e7          	jalr	-1840(ra) # 80002818 <myproc>
    80003f50:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003f54:	00000097          	auipc	ra,0x0
    80003f58:	d98080e7          	jalr	-616(ra) # 80003cec <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80003f5c:	00006717          	auipc	a4,0x6
    80003f60:	0a470713          	addi	a4,a4,164 # 8000a000 <_trampoline>
    80003f64:	00006797          	auipc	a5,0x6
    80003f68:	09c78793          	addi	a5,a5,156 # 8000a000 <_trampoline>
    80003f6c:	8f1d                	sub	a4,a4,a5
    80003f6e:	040007b7          	lui	a5,0x4000
    80003f72:	17fd                	addi	a5,a5,-1
    80003f74:	07b2                	slli	a5,a5,0xc
    80003f76:	97ba                	add	a5,a5,a4
    80003f78:	853e                	mv	a0,a5
    80003f7a:	00000097          	auipc	ra,0x0
    80003f7e:	ce0080e7          	jalr	-800(ra) # 80003c5a <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003f82:	fd843783          	ld	a5,-40(s0)
    80003f86:	6fa4                	ld	s1,88(a5)
    80003f88:	00000097          	auipc	ra,0x0
    80003f8c:	cec080e7          	jalr	-788(ra) # 80003c74 <r_satp>
    80003f90:	87aa                	mv	a5,a0
    80003f92:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003f94:	fd843783          	ld	a5,-40(s0)
    80003f98:	63b4                	ld	a3,64(a5)
    80003f9a:	fd843783          	ld	a5,-40(s0)
    80003f9e:	6fbc                	ld	a5,88(a5)
    80003fa0:	6705                	lui	a4,0x1
    80003fa2:	9736                	add	a4,a4,a3
    80003fa4:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003fa6:	fd843783          	ld	a5,-40(s0)
    80003faa:	6fbc                	ld	a5,88(a5)
    80003fac:	00000717          	auipc	a4,0x0
    80003fb0:	dfc70713          	addi	a4,a4,-516 # 80003da8 <usertrap>
    80003fb4:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003fb6:	fd843783          	ld	a5,-40(s0)
    80003fba:	6fa4                	ld	s1,88(a5)
    80003fbc:	00000097          	auipc	ra,0x0
    80003fc0:	d86080e7          	jalr	-634(ra) # 80003d42 <r_tp>
    80003fc4:	87aa                	mv	a5,a0
    80003fc6:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003fc8:	00000097          	auipc	ra,0x0
    80003fcc:	bf6080e7          	jalr	-1034(ra) # 80003bbe <r_sstatus>
    80003fd0:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003fd4:	fd043783          	ld	a5,-48(s0)
    80003fd8:	eff7f793          	andi	a5,a5,-257
    80003fdc:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003fe0:	fd043783          	ld	a5,-48(s0)
    80003fe4:	0207e793          	ori	a5,a5,32
    80003fe8:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    80003fec:	fd043503          	ld	a0,-48(s0)
    80003ff0:	00000097          	auipc	ra,0x0
    80003ff4:	be8080e7          	jalr	-1048(ra) # 80003bd8 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003ff8:	fd843783          	ld	a5,-40(s0)
    80003ffc:	6fbc                	ld	a5,88(a5)
    80003ffe:	6f9c                	ld	a5,24(a5)
    80004000:	853e                	mv	a0,a5
    80004002:	00000097          	auipc	ra,0x0
    80004006:	c24080e7          	jalr	-988(ra) # 80003c26 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    8000400a:	fd843783          	ld	a5,-40(s0)
    8000400e:	6bbc                	ld	a5,80(a5)
    80004010:	00c7d713          	srli	a4,a5,0xc
    80004014:	57fd                	li	a5,-1
    80004016:	17fe                	slli	a5,a5,0x3f
    80004018:	8fd9                	or	a5,a5,a4
    8000401a:	fcf43423          	sd	a5,-56(s0)

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    8000401e:	00006717          	auipc	a4,0x6
    80004022:	07270713          	addi	a4,a4,114 # 8000a090 <userret>
    80004026:	00006797          	auipc	a5,0x6
    8000402a:	fda78793          	addi	a5,a5,-38 # 8000a000 <_trampoline>
    8000402e:	8f1d                	sub	a4,a4,a5
    80004030:	040007b7          	lui	a5,0x4000
    80004034:	17fd                	addi	a5,a5,-1
    80004036:	07b2                	slli	a5,a5,0xc
    80004038:	97ba                	add	a5,a5,a4
    8000403a:	fcf43023          	sd	a5,-64(s0)
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    8000403e:	fc043703          	ld	a4,-64(s0)
    80004042:	fc843583          	ld	a1,-56(s0)
    80004046:	020007b7          	lui	a5,0x2000
    8000404a:	17fd                	addi	a5,a5,-1
    8000404c:	00d79513          	slli	a0,a5,0xd
    80004050:	9702                	jalr	a4
}
    80004052:	0001                	nop
    80004054:	70e2                	ld	ra,56(sp)
    80004056:	7442                	ld	s0,48(sp)
    80004058:	74a2                	ld	s1,40(sp)
    8000405a:	6121                	addi	sp,sp,64
    8000405c:	8082                	ret

000000008000405e <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    8000405e:	7139                	addi	sp,sp,-64
    80004060:	fc06                	sd	ra,56(sp)
    80004062:	f822                	sd	s0,48(sp)
    80004064:	f426                	sd	s1,40(sp)
    80004066:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80004068:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    8000406c:	00000097          	auipc	ra,0x0
    80004070:	bd4080e7          	jalr	-1068(ra) # 80003c40 <r_sepc>
    80004074:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80004078:	00000097          	auipc	ra,0x0
    8000407c:	b46080e7          	jalr	-1210(ra) # 80003bbe <r_sstatus>
    80004080:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80004084:	00000097          	auipc	ra,0x0
    80004088:	c0a080e7          	jalr	-1014(ra) # 80003c8e <r_scause>
    8000408c:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80004090:	fc843783          	ld	a5,-56(s0)
    80004094:	1007f793          	andi	a5,a5,256
    80004098:	eb89                	bnez	a5,800040aa <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    8000409a:	00007517          	auipc	a0,0x7
    8000409e:	2de50513          	addi	a0,a0,734 # 8000b378 <etext+0x378>
    800040a2:	ffffd097          	auipc	ra,0xffffd
    800040a6:	bdc080e7          	jalr	-1060(ra) # 80000c7e <panic>
  if(intr_get() != 0)
    800040aa:	00000097          	auipc	ra,0x0
    800040ae:	c6a080e7          	jalr	-918(ra) # 80003d14 <intr_get>
    800040b2:	87aa                	mv	a5,a0
    800040b4:	cb89                	beqz	a5,800040c6 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    800040b6:	00007517          	auipc	a0,0x7
    800040ba:	2ea50513          	addi	a0,a0,746 # 8000b3a0 <etext+0x3a0>
    800040be:	ffffd097          	auipc	ra,0xffffd
    800040c2:	bc0080e7          	jalr	-1088(ra) # 80000c7e <panic>

  if((which_dev = devintr()) == 0){
    800040c6:	00000097          	auipc	ra,0x0
    800040ca:	164080e7          	jalr	356(ra) # 8000422a <devintr>
    800040ce:	87aa                	mv	a5,a0
    800040d0:	fcf42e23          	sw	a5,-36(s0)
    800040d4:	fdc42783          	lw	a5,-36(s0)
    800040d8:	2781                	sext.w	a5,a5
    800040da:	e7b9                	bnez	a5,80004128 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    800040dc:	fc043583          	ld	a1,-64(s0)
    800040e0:	00007517          	auipc	a0,0x7
    800040e4:	2e050513          	addi	a0,a0,736 # 8000b3c0 <etext+0x3c0>
    800040e8:	ffffd097          	auipc	ra,0xffffd
    800040ec:	940080e7          	jalr	-1728(ra) # 80000a28 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	b50080e7          	jalr	-1200(ra) # 80003c40 <r_sepc>
    800040f8:	84aa                	mv	s1,a0
    800040fa:	00000097          	auipc	ra,0x0
    800040fe:	bae080e7          	jalr	-1106(ra) # 80003ca8 <r_stval>
    80004102:	87aa                	mv	a5,a0
    80004104:	863e                	mv	a2,a5
    80004106:	85a6                	mv	a1,s1
    80004108:	00007517          	auipc	a0,0x7
    8000410c:	2c850513          	addi	a0,a0,712 # 8000b3d0 <etext+0x3d0>
    80004110:	ffffd097          	auipc	ra,0xffffd
    80004114:	918080e7          	jalr	-1768(ra) # 80000a28 <printf>
    panic("kerneltrap");
    80004118:	00007517          	auipc	a0,0x7
    8000411c:	2d050513          	addi	a0,a0,720 # 8000b3e8 <etext+0x3e8>
    80004120:	ffffd097          	auipc	ra,0xffffd
    80004124:	b5e080e7          	jalr	-1186(ra) # 80000c7e <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING && mycpu()->scheduler->preemptive)
    80004128:	fdc42783          	lw	a5,-36(s0)
    8000412c:	0007871b          	sext.w	a4,a5
    80004130:	4789                	li	a5,2
    80004132:	06f71c63          	bne	a4,a5,800041aa <kerneltrap+0x14c>
    80004136:	ffffe097          	auipc	ra,0xffffe
    8000413a:	6e2080e7          	jalr	1762(ra) # 80002818 <myproc>
    8000413e:	87aa                	mv	a5,a0
    80004140:	c7ad                	beqz	a5,800041aa <kerneltrap+0x14c>
    80004142:	ffffe097          	auipc	ra,0xffffe
    80004146:	6d6080e7          	jalr	1750(ra) # 80002818 <myproc>
    8000414a:	87aa                	mv	a5,a0
    8000414c:	4f9c                	lw	a5,24(a5)
    8000414e:	873e                	mv	a4,a5
    80004150:	4791                	li	a5,4
    80004152:	04f71c63          	bne	a4,a5,800041aa <kerneltrap+0x14c>
    80004156:	ffffe097          	auipc	ra,0xffffe
    8000415a:	684080e7          	jalr	1668(ra) # 800027da <mycpu>
    8000415e:	87aa                	mv	a5,a0
    80004160:	63dc                	ld	a5,128(a5)
    80004162:	479c                	lw	a5,8(a5)
    80004164:	c3b9                	beqz	a5,800041aa <kerneltrap+0x14c>
  {
      if(tajmer==0)
    80004166:	00008797          	auipc	a5,0x8
    8000416a:	ec678793          	addi	a5,a5,-314 # 8000c02c <tajmer>
    8000416e:	439c                	lw	a5,0(a5)
    80004170:	e385                	bnez	a5,80004190 <kerneltrap+0x132>
      {
          tajmer=tajmerMAX;
    80004172:	00008797          	auipc	a5,0x8
    80004176:	eb678793          	addi	a5,a5,-330 # 8000c028 <tajmerMAX>
    8000417a:	4398                	lw	a4,0(a5)
    8000417c:	00008797          	auipc	a5,0x8
    80004180:	eb078793          	addi	a5,a5,-336 # 8000c02c <tajmer>
    80004184:	c398                	sw	a4,0(a5)
          yield();
    80004186:	fffff097          	auipc	ra,0xfffff
    8000418a:	5ae080e7          	jalr	1454(ra) # 80003734 <yield>
    8000418e:	a831                	j	800041aa <kerneltrap+0x14c>
      }
      else tajmer=tajmer-1;
    80004190:	00008797          	auipc	a5,0x8
    80004194:	e9c78793          	addi	a5,a5,-356 # 8000c02c <tajmer>
    80004198:	439c                	lw	a5,0(a5)
    8000419a:	37fd                	addiw	a5,a5,-1
    8000419c:	0007871b          	sext.w	a4,a5
    800041a0:	00008797          	auipc	a5,0x8
    800041a4:	e8c78793          	addi	a5,a5,-372 # 8000c02c <tajmer>
    800041a8:	c398                	sw	a4,0(a5)



  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    800041aa:	fd043503          	ld	a0,-48(s0)
    800041ae:	00000097          	auipc	ra,0x0
    800041b2:	a78080e7          	jalr	-1416(ra) # 80003c26 <w_sepc>
  w_sstatus(sstatus);
    800041b6:	fc843503          	ld	a0,-56(s0)
    800041ba:	00000097          	auipc	ra,0x0
    800041be:	a1e080e7          	jalr	-1506(ra) # 80003bd8 <w_sstatus>
}
    800041c2:	0001                	nop
    800041c4:	70e2                	ld	ra,56(sp)
    800041c6:	7442                	ld	s0,48(sp)
    800041c8:	74a2                	ld	s1,40(sp)
    800041ca:	6121                	addi	sp,sp,64
    800041cc:	8082                	ret

00000000800041ce <clockintr>:

void
clockintr()
{
    800041ce:	1141                	addi	sp,sp,-16
    800041d0:	e406                	sd	ra,8(sp)
    800041d2:	e022                	sd	s0,0(sp)
    800041d4:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    800041d6:	00017517          	auipc	a0,0x17
    800041da:	95a50513          	addi	a0,a0,-1702 # 8001ab30 <tickslock>
    800041de:	ffffd097          	auipc	ra,0xffffd
    800041e2:	090080e7          	jalr	144(ra) # 8000126e <acquire>
  ticks++;
    800041e6:	00008797          	auipc	a5,0x8
    800041ea:	e4a78793          	addi	a5,a5,-438 # 8000c030 <ticks>
    800041ee:	439c                	lw	a5,0(a5)
    800041f0:	2785                	addiw	a5,a5,1
    800041f2:	0007871b          	sext.w	a4,a5
    800041f6:	00008797          	auipc	a5,0x8
    800041fa:	e3a78793          	addi	a5,a5,-454 # 8000c030 <ticks>
    800041fe:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80004200:	00008517          	auipc	a0,0x8
    80004204:	e3050513          	addi	a0,a0,-464 # 8000c030 <ticks>
    80004208:	fffff097          	auipc	ra,0xfffff
    8000420c:	646080e7          	jalr	1606(ra) # 8000384e <wakeup>
  release(&tickslock);
    80004210:	00017517          	auipc	a0,0x17
    80004214:	92050513          	addi	a0,a0,-1760 # 8001ab30 <tickslock>
    80004218:	ffffd097          	auipc	ra,0xffffd
    8000421c:	0ba080e7          	jalr	186(ra) # 800012d2 <release>
}
    80004220:	0001                	nop
    80004222:	60a2                	ld	ra,8(sp)
    80004224:	6402                	ld	s0,0(sp)
    80004226:	0141                	addi	sp,sp,16
    80004228:	8082                	ret

000000008000422a <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    8000422a:	1101                	addi	sp,sp,-32
    8000422c:	ec06                	sd	ra,24(sp)
    8000422e:	e822                	sd	s0,16(sp)
    80004230:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004232:	00000097          	auipc	ra,0x0
    80004236:	a5c080e7          	jalr	-1444(ra) # 80003c8e <r_scause>
    8000423a:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    8000423e:	fe843783          	ld	a5,-24(s0)
    80004242:	0807d463          	bgez	a5,800042ca <devintr+0xa0>
     (scause & 0xff) == 9){
    80004246:	fe843783          	ld	a5,-24(s0)
    8000424a:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    8000424e:	47a5                	li	a5,9
    80004250:	06f71d63          	bne	a4,a5,800042ca <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004254:	00005097          	auipc	ra,0x5
    80004258:	abe080e7          	jalr	-1346(ra) # 80008d12 <plic_claim>
    8000425c:	87aa                	mv	a5,a0
    8000425e:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004262:	fe442783          	lw	a5,-28(s0)
    80004266:	0007871b          	sext.w	a4,a5
    8000426a:	47a9                	li	a5,10
    8000426c:	00f71763          	bne	a4,a5,8000427a <devintr+0x50>
      uartintr();
    80004270:	ffffd097          	auipc	ra,0xffffd
    80004274:	d06080e7          	jalr	-762(ra) # 80000f76 <uartintr>
    80004278:	a825                	j	800042b0 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    8000427a:	fe442783          	lw	a5,-28(s0)
    8000427e:	0007871b          	sext.w	a4,a5
    80004282:	4785                	li	a5,1
    80004284:	00f71763          	bne	a4,a5,80004292 <devintr+0x68>
      virtio_disk_intr();
    80004288:	00005097          	auipc	ra,0x5
    8000428c:	39e080e7          	jalr	926(ra) # 80009626 <virtio_disk_intr>
    80004290:	a005                	j	800042b0 <devintr+0x86>
    } else if(irq){
    80004292:	fe442783          	lw	a5,-28(s0)
    80004296:	2781                	sext.w	a5,a5
    80004298:	cf81                	beqz	a5,800042b0 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    8000429a:	fe442783          	lw	a5,-28(s0)
    8000429e:	85be                	mv	a1,a5
    800042a0:	00007517          	auipc	a0,0x7
    800042a4:	15850513          	addi	a0,a0,344 # 8000b3f8 <etext+0x3f8>
    800042a8:	ffffc097          	auipc	ra,0xffffc
    800042ac:	780080e7          	jalr	1920(ra) # 80000a28 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800042b0:	fe442783          	lw	a5,-28(s0)
    800042b4:	2781                	sext.w	a5,a5
    800042b6:	cb81                	beqz	a5,800042c6 <devintr+0x9c>
      plic_complete(irq);
    800042b8:	fe442783          	lw	a5,-28(s0)
    800042bc:	853e                	mv	a0,a5
    800042be:	00005097          	auipc	ra,0x5
    800042c2:	a92080e7          	jalr	-1390(ra) # 80008d50 <plic_complete>

    return 1;
    800042c6:	4785                	li	a5,1
    800042c8:	a081                	j	80004308 <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    800042ca:	fe843703          	ld	a4,-24(s0)
    800042ce:	57fd                	li	a5,-1
    800042d0:	17fe                	slli	a5,a5,0x3f
    800042d2:	0785                	addi	a5,a5,1
    800042d4:	02f71963          	bne	a4,a5,80004306 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800042d8:	ffffe097          	auipc	ra,0xffffe
    800042dc:	4de080e7          	jalr	1246(ra) # 800027b6 <cpuid>
    800042e0:	87aa                	mv	a5,a0
    800042e2:	e789                	bnez	a5,800042ec <devintr+0xc2>
      clockintr();
    800042e4:	00000097          	auipc	ra,0x0
    800042e8:	eea080e7          	jalr	-278(ra) # 800041ce <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800042ec:	00000097          	auipc	ra,0x0
    800042f0:	906080e7          	jalr	-1786(ra) # 80003bf2 <r_sip>
    800042f4:	87aa                	mv	a5,a0
    800042f6:	9bf5                	andi	a5,a5,-3
    800042f8:	853e                	mv	a0,a5
    800042fa:	00000097          	auipc	ra,0x0
    800042fe:	912080e7          	jalr	-1774(ra) # 80003c0c <w_sip>

    return 2;
    80004302:	4789                	li	a5,2
    80004304:	a011                	j	80004308 <devintr+0xde>
  } else {
    return 0;
    80004306:	4781                	li	a5,0
  }
}
    80004308:	853e                	mv	a0,a5
    8000430a:	60e2                	ld	ra,24(sp)
    8000430c:	6442                	ld	s0,16(sp)
    8000430e:	6105                	addi	sp,sp,32
    80004310:	8082                	ret

0000000080004312 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80004312:	7179                	addi	sp,sp,-48
    80004314:	f406                	sd	ra,40(sp)
    80004316:	f022                	sd	s0,32(sp)
    80004318:	1800                	addi	s0,sp,48
    8000431a:	fca43c23          	sd	a0,-40(s0)
    8000431e:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80004322:	ffffe097          	auipc	ra,0xffffe
    80004326:	4f6080e7          	jalr	1270(ra) # 80002818 <myproc>
    8000432a:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    8000432e:	fe843783          	ld	a5,-24(s0)
    80004332:	67bc                	ld	a5,72(a5)
    80004334:	fd843703          	ld	a4,-40(s0)
    80004338:	00f77b63          	bgeu	a4,a5,8000434e <fetchaddr+0x3c>
    8000433c:	fd843783          	ld	a5,-40(s0)
    80004340:	00878713          	addi	a4,a5,8
    80004344:	fe843783          	ld	a5,-24(s0)
    80004348:	67bc                	ld	a5,72(a5)
    8000434a:	00e7f463          	bgeu	a5,a4,80004352 <fetchaddr+0x40>
    return -1;
    8000434e:	57fd                	li	a5,-1
    80004350:	a01d                	j	80004376 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004352:	fe843783          	ld	a5,-24(s0)
    80004356:	6bbc                	ld	a5,80(a5)
    80004358:	46a1                	li	a3,8
    8000435a:	fd843603          	ld	a2,-40(s0)
    8000435e:	fd043583          	ld	a1,-48(s0)
    80004362:	853e                	mv	a0,a5
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	050080e7          	jalr	80(ra) # 800023b4 <copyin>
    8000436c:	87aa                	mv	a5,a0
    8000436e:	c399                	beqz	a5,80004374 <fetchaddr+0x62>
    return -1;
    80004370:	57fd                	li	a5,-1
    80004372:	a011                	j	80004376 <fetchaddr+0x64>
  return 0;
    80004374:	4781                	li	a5,0
}
    80004376:	853e                	mv	a0,a5
    80004378:	70a2                	ld	ra,40(sp)
    8000437a:	7402                	ld	s0,32(sp)
    8000437c:	6145                	addi	sp,sp,48
    8000437e:	8082                	ret

0000000080004380 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004380:	7139                	addi	sp,sp,-64
    80004382:	fc06                	sd	ra,56(sp)
    80004384:	f822                	sd	s0,48(sp)
    80004386:	0080                	addi	s0,sp,64
    80004388:	fca43c23          	sd	a0,-40(s0)
    8000438c:	fcb43823          	sd	a1,-48(s0)
    80004390:	87b2                	mv	a5,a2
    80004392:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004396:	ffffe097          	auipc	ra,0xffffe
    8000439a:	482080e7          	jalr	1154(ra) # 80002818 <myproc>
    8000439e:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    800043a2:	fe843783          	ld	a5,-24(s0)
    800043a6:	6bbc                	ld	a5,80(a5)
    800043a8:	fcc42703          	lw	a4,-52(s0)
    800043ac:	86ba                	mv	a3,a4
    800043ae:	fd843603          	ld	a2,-40(s0)
    800043b2:	fd043583          	ld	a1,-48(s0)
    800043b6:	853e                	mv	a0,a5
    800043b8:	ffffe097          	auipc	ra,0xffffe
    800043bc:	0ca080e7          	jalr	202(ra) # 80002482 <copyinstr>
    800043c0:	87aa                	mv	a5,a0
    800043c2:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    800043c6:	fe442783          	lw	a5,-28(s0)
    800043ca:	2781                	sext.w	a5,a5
    800043cc:	0007d563          	bgez	a5,800043d6 <fetchstr+0x56>
    return err;
    800043d0:	fe442783          	lw	a5,-28(s0)
    800043d4:	a801                	j	800043e4 <fetchstr+0x64>
  return strlen(buf);
    800043d6:	fd043503          	ld	a0,-48(s0)
    800043da:	ffffd097          	auipc	ra,0xffffd
    800043de:	3e6080e7          	jalr	998(ra) # 800017c0 <strlen>
    800043e2:	87aa                	mv	a5,a0
}
    800043e4:	853e                	mv	a0,a5
    800043e6:	70e2                	ld	ra,56(sp)
    800043e8:	7442                	ld	s0,48(sp)
    800043ea:	6121                	addi	sp,sp,64
    800043ec:	8082                	ret

00000000800043ee <argraw>:

static uint64
argraw(int n)
{
    800043ee:	7179                	addi	sp,sp,-48
    800043f0:	f406                	sd	ra,40(sp)
    800043f2:	f022                	sd	s0,32(sp)
    800043f4:	1800                	addi	s0,sp,48
    800043f6:	87aa                	mv	a5,a0
    800043f8:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800043fc:	ffffe097          	auipc	ra,0xffffe
    80004400:	41c080e7          	jalr	1052(ra) # 80002818 <myproc>
    80004404:	fea43423          	sd	a0,-24(s0)
    80004408:	fdc42783          	lw	a5,-36(s0)
    8000440c:	0007871b          	sext.w	a4,a5
    80004410:	4795                	li	a5,5
    80004412:	06e7e263          	bltu	a5,a4,80004476 <argraw+0x88>
    80004416:	fdc46783          	lwu	a5,-36(s0)
    8000441a:	00279713          	slli	a4,a5,0x2
    8000441e:	00007797          	auipc	a5,0x7
    80004422:	00278793          	addi	a5,a5,2 # 8000b420 <etext+0x420>
    80004426:	97ba                	add	a5,a5,a4
    80004428:	439c                	lw	a5,0(a5)
    8000442a:	0007871b          	sext.w	a4,a5
    8000442e:	00007797          	auipc	a5,0x7
    80004432:	ff278793          	addi	a5,a5,-14 # 8000b420 <etext+0x420>
    80004436:	97ba                	add	a5,a5,a4
    80004438:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    8000443a:	fe843783          	ld	a5,-24(s0)
    8000443e:	6fbc                	ld	a5,88(a5)
    80004440:	7bbc                	ld	a5,112(a5)
    80004442:	a091                	j	80004486 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004444:	fe843783          	ld	a5,-24(s0)
    80004448:	6fbc                	ld	a5,88(a5)
    8000444a:	7fbc                	ld	a5,120(a5)
    8000444c:	a82d                	j	80004486 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    8000444e:	fe843783          	ld	a5,-24(s0)
    80004452:	6fbc                	ld	a5,88(a5)
    80004454:	63dc                	ld	a5,128(a5)
    80004456:	a805                	j	80004486 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004458:	fe843783          	ld	a5,-24(s0)
    8000445c:	6fbc                	ld	a5,88(a5)
    8000445e:	67dc                	ld	a5,136(a5)
    80004460:	a01d                	j	80004486 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004462:	fe843783          	ld	a5,-24(s0)
    80004466:	6fbc                	ld	a5,88(a5)
    80004468:	6bdc                	ld	a5,144(a5)
    8000446a:	a831                	j	80004486 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000446c:	fe843783          	ld	a5,-24(s0)
    80004470:	6fbc                	ld	a5,88(a5)
    80004472:	6fdc                	ld	a5,152(a5)
    80004474:	a809                	j	80004486 <argraw+0x98>
  }
  panic("argraw");
    80004476:	00007517          	auipc	a0,0x7
    8000447a:	fa250513          	addi	a0,a0,-94 # 8000b418 <etext+0x418>
    8000447e:	ffffd097          	auipc	ra,0xffffd
    80004482:	800080e7          	jalr	-2048(ra) # 80000c7e <panic>
  return -1;
}
    80004486:	853e                	mv	a0,a5
    80004488:	70a2                	ld	ra,40(sp)
    8000448a:	7402                	ld	s0,32(sp)
    8000448c:	6145                	addi	sp,sp,48
    8000448e:	8082                	ret

0000000080004490 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    80004490:	1101                	addi	sp,sp,-32
    80004492:	ec06                	sd	ra,24(sp)
    80004494:	e822                	sd	s0,16(sp)
    80004496:	1000                	addi	s0,sp,32
    80004498:	87aa                	mv	a5,a0
    8000449a:	feb43023          	sd	a1,-32(s0)
    8000449e:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800044a2:	fec42783          	lw	a5,-20(s0)
    800044a6:	853e                	mv	a0,a5
    800044a8:	00000097          	auipc	ra,0x0
    800044ac:	f46080e7          	jalr	-186(ra) # 800043ee <argraw>
    800044b0:	87aa                	mv	a5,a0
    800044b2:	0007871b          	sext.w	a4,a5
    800044b6:	fe043783          	ld	a5,-32(s0)
    800044ba:	c398                	sw	a4,0(a5)
  return 0;
    800044bc:	4781                	li	a5,0
}
    800044be:	853e                	mv	a0,a5
    800044c0:	60e2                	ld	ra,24(sp)
    800044c2:	6442                	ld	s0,16(sp)
    800044c4:	6105                	addi	sp,sp,32
    800044c6:	8082                	ret

00000000800044c8 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    800044c8:	1101                	addi	sp,sp,-32
    800044ca:	ec06                	sd	ra,24(sp)
    800044cc:	e822                	sd	s0,16(sp)
    800044ce:	1000                	addi	s0,sp,32
    800044d0:	87aa                	mv	a5,a0
    800044d2:	feb43023          	sd	a1,-32(s0)
    800044d6:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800044da:	fec42783          	lw	a5,-20(s0)
    800044de:	853e                	mv	a0,a5
    800044e0:	00000097          	auipc	ra,0x0
    800044e4:	f0e080e7          	jalr	-242(ra) # 800043ee <argraw>
    800044e8:	872a                	mv	a4,a0
    800044ea:	fe043783          	ld	a5,-32(s0)
    800044ee:	e398                	sd	a4,0(a5)
  return 0;
    800044f0:	4781                	li	a5,0
}
    800044f2:	853e                	mv	a0,a5
    800044f4:	60e2                	ld	ra,24(sp)
    800044f6:	6442                	ld	s0,16(sp)
    800044f8:	6105                	addi	sp,sp,32
    800044fa:	8082                	ret

00000000800044fc <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800044fc:	7179                	addi	sp,sp,-48
    800044fe:	f406                	sd	ra,40(sp)
    80004500:	f022                	sd	s0,32(sp)
    80004502:	1800                	addi	s0,sp,48
    80004504:	87aa                	mv	a5,a0
    80004506:	fcb43823          	sd	a1,-48(s0)
    8000450a:	8732                	mv	a4,a2
    8000450c:	fcf42e23          	sw	a5,-36(s0)
    80004510:	87ba                	mv	a5,a4
    80004512:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    80004516:	fe840713          	addi	a4,s0,-24
    8000451a:	fdc42783          	lw	a5,-36(s0)
    8000451e:	85ba                	mv	a1,a4
    80004520:	853e                	mv	a0,a5
    80004522:	00000097          	auipc	ra,0x0
    80004526:	fa6080e7          	jalr	-90(ra) # 800044c8 <argaddr>
    8000452a:	87aa                	mv	a5,a0
    8000452c:	0007d463          	bgez	a5,80004534 <argstr+0x38>
    return -1;
    80004530:	57fd                	li	a5,-1
    80004532:	a831                	j	8000454e <argstr+0x52>
  return fetchstr(addr, buf, max);
    80004534:	fe843783          	ld	a5,-24(s0)
    80004538:	fd842703          	lw	a4,-40(s0)
    8000453c:	863a                	mv	a2,a4
    8000453e:	fd043583          	ld	a1,-48(s0)
    80004542:	853e                	mv	a0,a5
    80004544:	00000097          	auipc	ra,0x0
    80004548:	e3c080e7          	jalr	-452(ra) # 80004380 <fetchstr>
    8000454c:	87aa                	mv	a5,a0
}
    8000454e:	853e                	mv	a0,a5
    80004550:	70a2                	ld	ra,40(sp)
    80004552:	7402                	ld	s0,32(sp)
    80004554:	6145                	addi	sp,sp,48
    80004556:	8082                	ret

0000000080004558 <syscall>:
[SYS_changeSchedulingAlgorithm] sys_changeSchedulingAlgorithm,
};

void
syscall(void)
{
    80004558:	7179                	addi	sp,sp,-48
    8000455a:	f406                	sd	ra,40(sp)
    8000455c:	f022                	sd	s0,32(sp)
    8000455e:	ec26                	sd	s1,24(sp)
    80004560:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004562:	ffffe097          	auipc	ra,0xffffe
    80004566:	2b6080e7          	jalr	694(ra) # 80002818 <myproc>
    8000456a:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    8000456e:	fd843783          	ld	a5,-40(s0)
    80004572:	6fbc                	ld	a5,88(a5)
    80004574:	77dc                	ld	a5,168(a5)
    80004576:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000457a:	fd442783          	lw	a5,-44(s0)
    8000457e:	2781                	sext.w	a5,a5
    80004580:	04f05263          	blez	a5,800045c4 <syscall+0x6c>
    80004584:	fd442783          	lw	a5,-44(s0)
    80004588:	873e                	mv	a4,a5
    8000458a:	47d9                	li	a5,22
    8000458c:	02e7ec63          	bltu	a5,a4,800045c4 <syscall+0x6c>
    80004590:	00007717          	auipc	a4,0x7
    80004594:	28070713          	addi	a4,a4,640 # 8000b810 <syscalls>
    80004598:	fd442783          	lw	a5,-44(s0)
    8000459c:	078e                	slli	a5,a5,0x3
    8000459e:	97ba                	add	a5,a5,a4
    800045a0:	639c                	ld	a5,0(a5)
    800045a2:	c38d                	beqz	a5,800045c4 <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    800045a4:	00007717          	auipc	a4,0x7
    800045a8:	26c70713          	addi	a4,a4,620 # 8000b810 <syscalls>
    800045ac:	fd442783          	lw	a5,-44(s0)
    800045b0:	078e                	slli	a5,a5,0x3
    800045b2:	97ba                	add	a5,a5,a4
    800045b4:	6398                	ld	a4,0(a5)
    800045b6:	fd843783          	ld	a5,-40(s0)
    800045ba:	6fa4                	ld	s1,88(a5)
    800045bc:	9702                	jalr	a4
    800045be:	87aa                	mv	a5,a0
    800045c0:	f8bc                	sd	a5,112(s1)
    800045c2:	a815                	j	800045f6 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800045c4:	fd843783          	ld	a5,-40(s0)
    800045c8:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800045ca:	fd843783          	ld	a5,-40(s0)
    800045ce:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800045d2:	fd442683          	lw	a3,-44(s0)
    800045d6:	863e                	mv	a2,a5
    800045d8:	85ba                	mv	a1,a4
    800045da:	00007517          	auipc	a0,0x7
    800045de:	e5e50513          	addi	a0,a0,-418 # 8000b438 <etext+0x438>
    800045e2:	ffffc097          	auipc	ra,0xffffc
    800045e6:	446080e7          	jalr	1094(ra) # 80000a28 <printf>
    p->trapframe->a0 = -1;
    800045ea:	fd843783          	ld	a5,-40(s0)
    800045ee:	6fbc                	ld	a5,88(a5)
    800045f0:	577d                	li	a4,-1
    800045f2:	fbb8                	sd	a4,112(a5)
  }
}
    800045f4:	0001                	nop
    800045f6:	0001                	nop
    800045f8:	70a2                	ld	ra,40(sp)
    800045fa:	7402                	ld	s0,32(sp)
    800045fc:	64e2                	ld	s1,24(sp)
    800045fe:	6145                	addi	sp,sp,48
    80004600:	8082                	ret

0000000080004602 <sys_exit>:
#include "proc.h"


uint64
sys_exit(void)
{
    80004602:	1101                	addi	sp,sp,-32
    80004604:	ec06                	sd	ra,24(sp)
    80004606:	e822                	sd	s0,16(sp)
    80004608:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8000460a:	fec40793          	addi	a5,s0,-20
    8000460e:	85be                	mv	a1,a5
    80004610:	4501                	li	a0,0
    80004612:	00000097          	auipc	ra,0x0
    80004616:	e7e080e7          	jalr	-386(ra) # 80004490 <argint>
    8000461a:	87aa                	mv	a5,a0
    8000461c:	0007d463          	bgez	a5,80004624 <sys_exit+0x22>
    return -1;
    80004620:	57fd                	li	a5,-1
    80004622:	a809                	j	80004634 <sys_exit+0x32>
  exit(n);
    80004624:	fec42783          	lw	a5,-20(s0)
    80004628:	853e                	mv	a0,a5
    8000462a:	fffff097          	auipc	ra,0xfffff
    8000462e:	8fa080e7          	jalr	-1798(ra) # 80002f24 <exit>
  return 0;  // not reached
    80004632:	4781                	li	a5,0
}
    80004634:	853e                	mv	a0,a5
    80004636:	60e2                	ld	ra,24(sp)
    80004638:	6442                	ld	s0,16(sp)
    8000463a:	6105                	addi	sp,sp,32
    8000463c:	8082                	ret

000000008000463e <sys_getpid>:

uint64
sys_getpid(void)
{
    8000463e:	1141                	addi	sp,sp,-16
    80004640:	e406                	sd	ra,8(sp)
    80004642:	e022                	sd	s0,0(sp)
    80004644:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004646:	ffffe097          	auipc	ra,0xffffe
    8000464a:	1d2080e7          	jalr	466(ra) # 80002818 <myproc>
    8000464e:	87aa                	mv	a5,a0
    80004650:	5b9c                	lw	a5,48(a5)
}
    80004652:	853e                	mv	a0,a5
    80004654:	60a2                	ld	ra,8(sp)
    80004656:	6402                	ld	s0,0(sp)
    80004658:	0141                	addi	sp,sp,16
    8000465a:	8082                	ret

000000008000465c <sys_fork>:

uint64
sys_fork(void)
{
    8000465c:	1141                	addi	sp,sp,-16
    8000465e:	e406                	sd	ra,8(sp)
    80004660:	e022                	sd	s0,0(sp)
    80004662:	0800                	addi	s0,sp,16
  return fork();
    80004664:	ffffe097          	auipc	ra,0xffffe
    80004668:	69a080e7          	jalr	1690(ra) # 80002cfe <fork>
    8000466c:	87aa                	mv	a5,a0
}
    8000466e:	853e                	mv	a0,a5
    80004670:	60a2                	ld	ra,8(sp)
    80004672:	6402                	ld	s0,0(sp)
    80004674:	0141                	addi	sp,sp,16
    80004676:	8082                	ret

0000000080004678 <sys_wait>:

uint64
sys_wait(void)
{
    80004678:	1101                	addi	sp,sp,-32
    8000467a:	ec06                	sd	ra,24(sp)
    8000467c:	e822                	sd	s0,16(sp)
    8000467e:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80004680:	fe840793          	addi	a5,s0,-24
    80004684:	85be                	mv	a1,a5
    80004686:	4501                	li	a0,0
    80004688:	00000097          	auipc	ra,0x0
    8000468c:	e40080e7          	jalr	-448(ra) # 800044c8 <argaddr>
    80004690:	87aa                	mv	a5,a0
    80004692:	0007d463          	bgez	a5,8000469a <sys_wait+0x22>
    return -1;
    80004696:	57fd                	li	a5,-1
    80004698:	a809                	j	800046aa <sys_wait+0x32>
  return wait(p);
    8000469a:	fe843783          	ld	a5,-24(s0)
    8000469e:	853e                	mv	a0,a5
    800046a0:	fffff097          	auipc	ra,0xfffff
    800046a4:	9c0080e7          	jalr	-1600(ra) # 80003060 <wait>
    800046a8:	87aa                	mv	a5,a0
}
    800046aa:	853e                	mv	a0,a5
    800046ac:	60e2                	ld	ra,24(sp)
    800046ae:	6442                	ld	s0,16(sp)
    800046b0:	6105                	addi	sp,sp,32
    800046b2:	8082                	ret

00000000800046b4 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800046b4:	1101                	addi	sp,sp,-32
    800046b6:	ec06                	sd	ra,24(sp)
    800046b8:	e822                	sd	s0,16(sp)
    800046ba:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800046bc:	fe840793          	addi	a5,s0,-24
    800046c0:	85be                	mv	a1,a5
    800046c2:	4501                	li	a0,0
    800046c4:	00000097          	auipc	ra,0x0
    800046c8:	dcc080e7          	jalr	-564(ra) # 80004490 <argint>
    800046cc:	87aa                	mv	a5,a0
    800046ce:	0007d463          	bgez	a5,800046d6 <sys_sbrk+0x22>
    return -1;
    800046d2:	57fd                	li	a5,-1
    800046d4:	a03d                	j	80004702 <sys_sbrk+0x4e>
  addr = myproc()->sz;
    800046d6:	ffffe097          	auipc	ra,0xffffe
    800046da:	142080e7          	jalr	322(ra) # 80002818 <myproc>
    800046de:	87aa                	mv	a5,a0
    800046e0:	67bc                	ld	a5,72(a5)
    800046e2:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    800046e6:	fe842783          	lw	a5,-24(s0)
    800046ea:	853e                	mv	a0,a5
    800046ec:	ffffe097          	auipc	ra,0xffffe
    800046f0:	560080e7          	jalr	1376(ra) # 80002c4c <growproc>
    800046f4:	87aa                	mv	a5,a0
    800046f6:	0007d463          	bgez	a5,800046fe <sys_sbrk+0x4a>
    return -1;
    800046fa:	57fd                	li	a5,-1
    800046fc:	a019                	j	80004702 <sys_sbrk+0x4e>
  return addr;
    800046fe:	fec42783          	lw	a5,-20(s0)
}
    80004702:	853e                	mv	a0,a5
    80004704:	60e2                	ld	ra,24(sp)
    80004706:	6442                	ld	s0,16(sp)
    80004708:	6105                	addi	sp,sp,32
    8000470a:	8082                	ret

000000008000470c <sys_sleep>:

uint64
sys_sleep(void)
{
    8000470c:	1101                	addi	sp,sp,-32
    8000470e:	ec06                	sd	ra,24(sp)
    80004710:	e822                	sd	s0,16(sp)
    80004712:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80004714:	fe840793          	addi	a5,s0,-24
    80004718:	85be                	mv	a1,a5
    8000471a:	4501                	li	a0,0
    8000471c:	00000097          	auipc	ra,0x0
    80004720:	d74080e7          	jalr	-652(ra) # 80004490 <argint>
    80004724:	87aa                	mv	a5,a0
    80004726:	0007d463          	bgez	a5,8000472e <sys_sleep+0x22>
    return -1;
    8000472a:	57fd                	li	a5,-1
    8000472c:	a079                	j	800047ba <sys_sleep+0xae>
  acquire(&tickslock);
    8000472e:	00016517          	auipc	a0,0x16
    80004732:	40250513          	addi	a0,a0,1026 # 8001ab30 <tickslock>
    80004736:	ffffd097          	auipc	ra,0xffffd
    8000473a:	b38080e7          	jalr	-1224(ra) # 8000126e <acquire>
  ticks0 = ticks;
    8000473e:	00008797          	auipc	a5,0x8
    80004742:	8f278793          	addi	a5,a5,-1806 # 8000c030 <ticks>
    80004746:	439c                	lw	a5,0(a5)
    80004748:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000474c:	a835                	j	80004788 <sys_sleep+0x7c>
    if(myproc()->killed){
    8000474e:	ffffe097          	auipc	ra,0xffffe
    80004752:	0ca080e7          	jalr	202(ra) # 80002818 <myproc>
    80004756:	87aa                	mv	a5,a0
    80004758:	579c                	lw	a5,40(a5)
    8000475a:	cb99                	beqz	a5,80004770 <sys_sleep+0x64>
      release(&tickslock);
    8000475c:	00016517          	auipc	a0,0x16
    80004760:	3d450513          	addi	a0,a0,980 # 8001ab30 <tickslock>
    80004764:	ffffd097          	auipc	ra,0xffffd
    80004768:	b6e080e7          	jalr	-1170(ra) # 800012d2 <release>
      return -1;
    8000476c:	57fd                	li	a5,-1
    8000476e:	a0b1                	j	800047ba <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004770:	00016597          	auipc	a1,0x16
    80004774:	3c058593          	addi	a1,a1,960 # 8001ab30 <tickslock>
    80004778:	00008517          	auipc	a0,0x8
    8000477c:	8b850513          	addi	a0,a0,-1864 # 8000c030 <ticks>
    80004780:	fffff097          	auipc	ra,0xfffff
    80004784:	052080e7          	jalr	82(ra) # 800037d2 <sleep>
  while(ticks - ticks0 < n){
    80004788:	00008797          	auipc	a5,0x8
    8000478c:	8a878793          	addi	a5,a5,-1880 # 8000c030 <ticks>
    80004790:	4398                	lw	a4,0(a5)
    80004792:	fec42783          	lw	a5,-20(s0)
    80004796:	40f707bb          	subw	a5,a4,a5
    8000479a:	0007871b          	sext.w	a4,a5
    8000479e:	fe842783          	lw	a5,-24(s0)
    800047a2:	2781                	sext.w	a5,a5
    800047a4:	faf765e3          	bltu	a4,a5,8000474e <sys_sleep+0x42>
  }
  release(&tickslock);
    800047a8:	00016517          	auipc	a0,0x16
    800047ac:	38850513          	addi	a0,a0,904 # 8001ab30 <tickslock>
    800047b0:	ffffd097          	auipc	ra,0xffffd
    800047b4:	b22080e7          	jalr	-1246(ra) # 800012d2 <release>
  return 0;
    800047b8:	4781                	li	a5,0
}
    800047ba:	853e                	mv	a0,a5
    800047bc:	60e2                	ld	ra,24(sp)
    800047be:	6442                	ld	s0,16(sp)
    800047c0:	6105                	addi	sp,sp,32
    800047c2:	8082                	ret

00000000800047c4 <sys_kill>:

uint64
sys_kill(void)
{
    800047c4:	1101                	addi	sp,sp,-32
    800047c6:	ec06                	sd	ra,24(sp)
    800047c8:	e822                	sd	s0,16(sp)
    800047ca:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    800047cc:	fec40793          	addi	a5,s0,-20
    800047d0:	85be                	mv	a1,a5
    800047d2:	4501                	li	a0,0
    800047d4:	00000097          	auipc	ra,0x0
    800047d8:	cbc080e7          	jalr	-836(ra) # 80004490 <argint>
    800047dc:	87aa                	mv	a5,a0
    800047de:	0007d463          	bgez	a5,800047e6 <sys_kill+0x22>
    return -1;
    800047e2:	57fd                	li	a5,-1
    800047e4:	a809                	j	800047f6 <sys_kill+0x32>
  return kill(pid);
    800047e6:	fec42783          	lw	a5,-20(s0)
    800047ea:	853e                	mv	a0,a5
    800047ec:	fffff097          	auipc	ra,0xfffff
    800047f0:	0fa080e7          	jalr	250(ra) # 800038e6 <kill>
    800047f4:	87aa                	mv	a5,a0
}
    800047f6:	853e                	mv	a0,a5
    800047f8:	60e2                	ld	ra,24(sp)
    800047fa:	6442                	ld	s0,16(sp)
    800047fc:	6105                	addi	sp,sp,32
    800047fe:	8082                	ret

0000000080004800 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004800:	1101                	addi	sp,sp,-32
    80004802:	ec06                	sd	ra,24(sp)
    80004804:	e822                	sd	s0,16(sp)
    80004806:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004808:	00016517          	auipc	a0,0x16
    8000480c:	32850513          	addi	a0,a0,808 # 8001ab30 <tickslock>
    80004810:	ffffd097          	auipc	ra,0xffffd
    80004814:	a5e080e7          	jalr	-1442(ra) # 8000126e <acquire>
  xticks = ticks;
    80004818:	00008797          	auipc	a5,0x8
    8000481c:	81878793          	addi	a5,a5,-2024 # 8000c030 <ticks>
    80004820:	439c                	lw	a5,0(a5)
    80004822:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004826:	00016517          	auipc	a0,0x16
    8000482a:	30a50513          	addi	a0,a0,778 # 8001ab30 <tickslock>
    8000482e:	ffffd097          	auipc	ra,0xffffd
    80004832:	aa4080e7          	jalr	-1372(ra) # 800012d2 <release>
  return xticks;
    80004836:	fec46783          	lwu	a5,-20(s0)
}
    8000483a:	853e                	mv	a0,a5
    8000483c:	60e2                	ld	ra,24(sp)
    8000483e:	6442                	ld	s0,16(sp)
    80004840:	6105                	addi	sp,sp,32
    80004842:	8082                	ret

0000000080004844 <sys_changeSchedulingAlgorithm>:

uint64
sys_changeSchedulingAlgorithm(void)
{
    80004844:	1101                	addi	sp,sp,-32
    80004846:	ec06                	sd	ra,24(sp)
    80004848:	e822                	sd	s0,16(sp)
    8000484a:	1000                	addi	s0,sp,32
    char sp[3];
    int ex;
    int bool;
    if(argstr(0, sp,4) < 0) //uzimamo prvi parametar koji nam govori koji algoritam da koristimo
    8000484c:	fe840793          	addi	a5,s0,-24
    80004850:	4611                	li	a2,4
    80004852:	85be                	mv	a1,a5
    80004854:	4501                	li	a0,0
    80004856:	00000097          	auipc	ra,0x0
    8000485a:	ca6080e7          	jalr	-858(ra) # 800044fc <argstr>
    8000485e:	87aa                	mv	a5,a0
    80004860:	0007d463          	bgez	a5,80004868 <sys_changeSchedulingAlgorithm+0x24>
        return -1;
    80004864:	57fd                	li	a5,-1
    80004866:	a889                	j	800048b8 <sys_changeSchedulingAlgorithm+0x74>
    if(argint(1, &ex) < 0) //uzimamo drugi parametar koji nam govori koji algoritam da koristimo
    80004868:	fe440793          	addi	a5,s0,-28
    8000486c:	85be                	mv	a1,a5
    8000486e:	4505                	li	a0,1
    80004870:	00000097          	auipc	ra,0x0
    80004874:	c20080e7          	jalr	-992(ra) # 80004490 <argint>
    80004878:	87aa                	mv	a5,a0
    8000487a:	0007d463          	bgez	a5,80004882 <sys_changeSchedulingAlgorithm+0x3e>
        return -1;
    8000487e:	57fd                	li	a5,-1
    80004880:	a825                	j	800048b8 <sys_changeSchedulingAlgorithm+0x74>
    if(argint(2, &bool) < 0) //uzimamo treci parametar koji nam govori koji algoritam da koristimo
    80004882:	fe040793          	addi	a5,s0,-32
    80004886:	85be                	mv	a1,a5
    80004888:	4509                	li	a0,2
    8000488a:	00000097          	auipc	ra,0x0
    8000488e:	c06080e7          	jalr	-1018(ra) # 80004490 <argint>
    80004892:	87aa                	mv	a5,a0
    80004894:	0007d463          	bgez	a5,8000489c <sys_changeSchedulingAlgorithm+0x58>
        return -1;
    80004898:	57fd                	li	a5,-1
    8000489a:	a839                	j	800048b8 <sys_changeSchedulingAlgorithm+0x74>

//    printf(" prva1: %s  ",sp);
//    printf(" prva2: %d \n",ex);
    return changeSchedulingAlgorithm(sp,ex,bool);
    8000489c:	fe442703          	lw	a4,-28(s0)
    800048a0:	fe042683          	lw	a3,-32(s0)
    800048a4:	fe840793          	addi	a5,s0,-24
    800048a8:	8636                	mv	a2,a3
    800048aa:	85ba                	mv	a1,a4
    800048ac:	853e                	mv	a0,a5
    800048ae:	fffff097          	auipc	ra,0xfffff
    800048b2:	c5c080e7          	jalr	-932(ra) # 8000350a <changeSchedulingAlgorithm>
    800048b6:	87aa                	mv	a5,a0
    800048b8:	853e                	mv	a0,a5
    800048ba:	60e2                	ld	ra,24(sp)
    800048bc:	6442                	ld	s0,16(sp)
    800048be:	6105                	addi	sp,sp,32
    800048c0:	8082                	ret

00000000800048c2 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800048c2:	1101                	addi	sp,sp,-32
    800048c4:	ec06                	sd	ra,24(sp)
    800048c6:	e822                	sd	s0,16(sp)
    800048c8:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800048ca:	00007597          	auipc	a1,0x7
    800048ce:	b8e58593          	addi	a1,a1,-1138 # 8000b458 <etext+0x458>
    800048d2:	00016517          	auipc	a0,0x16
    800048d6:	27650513          	addi	a0,a0,630 # 8001ab48 <bcache>
    800048da:	ffffd097          	auipc	ra,0xffffd
    800048de:	964080e7          	jalr	-1692(ra) # 8000123e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800048e2:	00016717          	auipc	a4,0x16
    800048e6:	26670713          	addi	a4,a4,614 # 8001ab48 <bcache>
    800048ea:	67a1                	lui	a5,0x8
    800048ec:	97ba                	add	a5,a5,a4
    800048ee:	0001e717          	auipc	a4,0x1e
    800048f2:	4c270713          	addi	a4,a4,1218 # 80022db0 <bcache+0x8268>
    800048f6:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800048fa:	00016717          	auipc	a4,0x16
    800048fe:	24e70713          	addi	a4,a4,590 # 8001ab48 <bcache>
    80004902:	67a1                	lui	a5,0x8
    80004904:	97ba                	add	a5,a5,a4
    80004906:	0001e717          	auipc	a4,0x1e
    8000490a:	4aa70713          	addi	a4,a4,1194 # 80022db0 <bcache+0x8268>
    8000490e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004912:	00016797          	auipc	a5,0x16
    80004916:	24e78793          	addi	a5,a5,590 # 8001ab60 <bcache+0x18>
    8000491a:	fef43423          	sd	a5,-24(s0)
    8000491e:	a895                	j	80004992 <binit+0xd0>
    b->next = bcache.head.next;
    80004920:	00016717          	auipc	a4,0x16
    80004924:	22870713          	addi	a4,a4,552 # 8001ab48 <bcache>
    80004928:	67a1                	lui	a5,0x8
    8000492a:	97ba                	add	a5,a5,a4
    8000492c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004930:	fe843783          	ld	a5,-24(s0)
    80004934:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004936:	fe843783          	ld	a5,-24(s0)
    8000493a:	0001e717          	auipc	a4,0x1e
    8000493e:	47670713          	addi	a4,a4,1142 # 80022db0 <bcache+0x8268>
    80004942:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004944:	fe843783          	ld	a5,-24(s0)
    80004948:	07c1                	addi	a5,a5,16
    8000494a:	00007597          	auipc	a1,0x7
    8000494e:	b1658593          	addi	a1,a1,-1258 # 8000b460 <etext+0x460>
    80004952:	853e                	mv	a0,a5
    80004954:	00002097          	auipc	ra,0x2
    80004958:	ff8080e7          	jalr	-8(ra) # 8000694c <initsleeplock>
    bcache.head.next->prev = b;
    8000495c:	00016717          	auipc	a4,0x16
    80004960:	1ec70713          	addi	a4,a4,492 # 8001ab48 <bcache>
    80004964:	67a1                	lui	a5,0x8
    80004966:	97ba                	add	a5,a5,a4
    80004968:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000496c:	fe843703          	ld	a4,-24(s0)
    80004970:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004972:	00016717          	auipc	a4,0x16
    80004976:	1d670713          	addi	a4,a4,470 # 8001ab48 <bcache>
    8000497a:	67a1                	lui	a5,0x8
    8000497c:	97ba                	add	a5,a5,a4
    8000497e:	fe843703          	ld	a4,-24(s0)
    80004982:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004986:	fe843783          	ld	a5,-24(s0)
    8000498a:	45878793          	addi	a5,a5,1112
    8000498e:	fef43423          	sd	a5,-24(s0)
    80004992:	0001e797          	auipc	a5,0x1e
    80004996:	41e78793          	addi	a5,a5,1054 # 80022db0 <bcache+0x8268>
    8000499a:	fe843703          	ld	a4,-24(s0)
    8000499e:	f8f761e3          	bltu	a4,a5,80004920 <binit+0x5e>
  }
}
    800049a2:	0001                	nop
    800049a4:	0001                	nop
    800049a6:	60e2                	ld	ra,24(sp)
    800049a8:	6442                	ld	s0,16(sp)
    800049aa:	6105                	addi	sp,sp,32
    800049ac:	8082                	ret

00000000800049ae <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800049ae:	7179                	addi	sp,sp,-48
    800049b0:	f406                	sd	ra,40(sp)
    800049b2:	f022                	sd	s0,32(sp)
    800049b4:	1800                	addi	s0,sp,48
    800049b6:	87aa                	mv	a5,a0
    800049b8:	872e                	mv	a4,a1
    800049ba:	fcf42e23          	sw	a5,-36(s0)
    800049be:	87ba                	mv	a5,a4
    800049c0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800049c4:	00016517          	auipc	a0,0x16
    800049c8:	18450513          	addi	a0,a0,388 # 8001ab48 <bcache>
    800049cc:	ffffd097          	auipc	ra,0xffffd
    800049d0:	8a2080e7          	jalr	-1886(ra) # 8000126e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800049d4:	00016717          	auipc	a4,0x16
    800049d8:	17470713          	addi	a4,a4,372 # 8001ab48 <bcache>
    800049dc:	67a1                	lui	a5,0x8
    800049de:	97ba                	add	a5,a5,a4
    800049e0:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800049e4:	fef43423          	sd	a5,-24(s0)
    800049e8:	a095                	j	80004a4c <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800049ea:	fe843783          	ld	a5,-24(s0)
    800049ee:	4798                	lw	a4,8(a5)
    800049f0:	fdc42783          	lw	a5,-36(s0)
    800049f4:	2781                	sext.w	a5,a5
    800049f6:	04e79663          	bne	a5,a4,80004a42 <bget+0x94>
    800049fa:	fe843783          	ld	a5,-24(s0)
    800049fe:	47d8                	lw	a4,12(a5)
    80004a00:	fd842783          	lw	a5,-40(s0)
    80004a04:	2781                	sext.w	a5,a5
    80004a06:	02e79e63          	bne	a5,a4,80004a42 <bget+0x94>
      b->refcnt++;
    80004a0a:	fe843783          	ld	a5,-24(s0)
    80004a0e:	43bc                	lw	a5,64(a5)
    80004a10:	2785                	addiw	a5,a5,1
    80004a12:	0007871b          	sext.w	a4,a5
    80004a16:	fe843783          	ld	a5,-24(s0)
    80004a1a:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004a1c:	00016517          	auipc	a0,0x16
    80004a20:	12c50513          	addi	a0,a0,300 # 8001ab48 <bcache>
    80004a24:	ffffd097          	auipc	ra,0xffffd
    80004a28:	8ae080e7          	jalr	-1874(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    80004a2c:	fe843783          	ld	a5,-24(s0)
    80004a30:	07c1                	addi	a5,a5,16
    80004a32:	853e                	mv	a0,a5
    80004a34:	00002097          	auipc	ra,0x2
    80004a38:	f64080e7          	jalr	-156(ra) # 80006998 <acquiresleep>
      return b;
    80004a3c:	fe843783          	ld	a5,-24(s0)
    80004a40:	a07d                	j	80004aee <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004a42:	fe843783          	ld	a5,-24(s0)
    80004a46:	6bbc                	ld	a5,80(a5)
    80004a48:	fef43423          	sd	a5,-24(s0)
    80004a4c:	fe843703          	ld	a4,-24(s0)
    80004a50:	0001e797          	auipc	a5,0x1e
    80004a54:	36078793          	addi	a5,a5,864 # 80022db0 <bcache+0x8268>
    80004a58:	f8f719e3          	bne	a4,a5,800049ea <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004a5c:	00016717          	auipc	a4,0x16
    80004a60:	0ec70713          	addi	a4,a4,236 # 8001ab48 <bcache>
    80004a64:	67a1                	lui	a5,0x8
    80004a66:	97ba                	add	a5,a5,a4
    80004a68:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004a6c:	fef43423          	sd	a5,-24(s0)
    80004a70:	a8b9                	j	80004ace <bget+0x120>
    if(b->refcnt == 0) {
    80004a72:	fe843783          	ld	a5,-24(s0)
    80004a76:	43bc                	lw	a5,64(a5)
    80004a78:	e7b1                	bnez	a5,80004ac4 <bget+0x116>
      b->dev = dev;
    80004a7a:	fe843783          	ld	a5,-24(s0)
    80004a7e:	fdc42703          	lw	a4,-36(s0)
    80004a82:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004a84:	fe843783          	ld	a5,-24(s0)
    80004a88:	fd842703          	lw	a4,-40(s0)
    80004a8c:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004a8e:	fe843783          	ld	a5,-24(s0)
    80004a92:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004a96:	fe843783          	ld	a5,-24(s0)
    80004a9a:	4705                	li	a4,1
    80004a9c:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004a9e:	00016517          	auipc	a0,0x16
    80004aa2:	0aa50513          	addi	a0,a0,170 # 8001ab48 <bcache>
    80004aa6:	ffffd097          	auipc	ra,0xffffd
    80004aaa:	82c080e7          	jalr	-2004(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    80004aae:	fe843783          	ld	a5,-24(s0)
    80004ab2:	07c1                	addi	a5,a5,16
    80004ab4:	853e                	mv	a0,a5
    80004ab6:	00002097          	auipc	ra,0x2
    80004aba:	ee2080e7          	jalr	-286(ra) # 80006998 <acquiresleep>
      return b;
    80004abe:	fe843783          	ld	a5,-24(s0)
    80004ac2:	a035                	j	80004aee <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004ac4:	fe843783          	ld	a5,-24(s0)
    80004ac8:	67bc                	ld	a5,72(a5)
    80004aca:	fef43423          	sd	a5,-24(s0)
    80004ace:	fe843703          	ld	a4,-24(s0)
    80004ad2:	0001e797          	auipc	a5,0x1e
    80004ad6:	2de78793          	addi	a5,a5,734 # 80022db0 <bcache+0x8268>
    80004ada:	f8f71ce3          	bne	a4,a5,80004a72 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004ade:	00007517          	auipc	a0,0x7
    80004ae2:	98a50513          	addi	a0,a0,-1654 # 8000b468 <etext+0x468>
    80004ae6:	ffffc097          	auipc	ra,0xffffc
    80004aea:	198080e7          	jalr	408(ra) # 80000c7e <panic>
}
    80004aee:	853e                	mv	a0,a5
    80004af0:	70a2                	ld	ra,40(sp)
    80004af2:	7402                	ld	s0,32(sp)
    80004af4:	6145                	addi	sp,sp,48
    80004af6:	8082                	ret

0000000080004af8 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004af8:	7179                	addi	sp,sp,-48
    80004afa:	f406                	sd	ra,40(sp)
    80004afc:	f022                	sd	s0,32(sp)
    80004afe:	1800                	addi	s0,sp,48
    80004b00:	87aa                	mv	a5,a0
    80004b02:	872e                	mv	a4,a1
    80004b04:	fcf42e23          	sw	a5,-36(s0)
    80004b08:	87ba                	mv	a5,a4
    80004b0a:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004b0e:	fd842703          	lw	a4,-40(s0)
    80004b12:	fdc42783          	lw	a5,-36(s0)
    80004b16:	85ba                	mv	a1,a4
    80004b18:	853e                	mv	a0,a5
    80004b1a:	00000097          	auipc	ra,0x0
    80004b1e:	e94080e7          	jalr	-364(ra) # 800049ae <bget>
    80004b22:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004b26:	fe843783          	ld	a5,-24(s0)
    80004b2a:	439c                	lw	a5,0(a5)
    80004b2c:	ef81                	bnez	a5,80004b44 <bread+0x4c>
    virtio_disk_rw(b, 0);
    80004b2e:	4581                	li	a1,0
    80004b30:	fe843503          	ld	a0,-24(s0)
    80004b34:	00004097          	auipc	ra,0x4
    80004b38:	756080e7          	jalr	1878(ra) # 8000928a <virtio_disk_rw>
    b->valid = 1;
    80004b3c:	fe843783          	ld	a5,-24(s0)
    80004b40:	4705                	li	a4,1
    80004b42:	c398                	sw	a4,0(a5)
  }
  return b;
    80004b44:	fe843783          	ld	a5,-24(s0)
}
    80004b48:	853e                	mv	a0,a5
    80004b4a:	70a2                	ld	ra,40(sp)
    80004b4c:	7402                	ld	s0,32(sp)
    80004b4e:	6145                	addi	sp,sp,48
    80004b50:	8082                	ret

0000000080004b52 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004b52:	1101                	addi	sp,sp,-32
    80004b54:	ec06                	sd	ra,24(sp)
    80004b56:	e822                	sd	s0,16(sp)
    80004b58:	1000                	addi	s0,sp,32
    80004b5a:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004b5e:	fe843783          	ld	a5,-24(s0)
    80004b62:	07c1                	addi	a5,a5,16
    80004b64:	853e                	mv	a0,a5
    80004b66:	00002097          	auipc	ra,0x2
    80004b6a:	ef2080e7          	jalr	-270(ra) # 80006a58 <holdingsleep>
    80004b6e:	87aa                	mv	a5,a0
    80004b70:	eb89                	bnez	a5,80004b82 <bwrite+0x30>
    panic("bwrite");
    80004b72:	00007517          	auipc	a0,0x7
    80004b76:	90e50513          	addi	a0,a0,-1778 # 8000b480 <etext+0x480>
    80004b7a:	ffffc097          	auipc	ra,0xffffc
    80004b7e:	104080e7          	jalr	260(ra) # 80000c7e <panic>
  virtio_disk_rw(b, 1);
    80004b82:	4585                	li	a1,1
    80004b84:	fe843503          	ld	a0,-24(s0)
    80004b88:	00004097          	auipc	ra,0x4
    80004b8c:	702080e7          	jalr	1794(ra) # 8000928a <virtio_disk_rw>
}
    80004b90:	0001                	nop
    80004b92:	60e2                	ld	ra,24(sp)
    80004b94:	6442                	ld	s0,16(sp)
    80004b96:	6105                	addi	sp,sp,32
    80004b98:	8082                	ret

0000000080004b9a <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004b9a:	1101                	addi	sp,sp,-32
    80004b9c:	ec06                	sd	ra,24(sp)
    80004b9e:	e822                	sd	s0,16(sp)
    80004ba0:	1000                	addi	s0,sp,32
    80004ba2:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004ba6:	fe843783          	ld	a5,-24(s0)
    80004baa:	07c1                	addi	a5,a5,16
    80004bac:	853e                	mv	a0,a5
    80004bae:	00002097          	auipc	ra,0x2
    80004bb2:	eaa080e7          	jalr	-342(ra) # 80006a58 <holdingsleep>
    80004bb6:	87aa                	mv	a5,a0
    80004bb8:	eb89                	bnez	a5,80004bca <brelse+0x30>
    panic("brelse");
    80004bba:	00007517          	auipc	a0,0x7
    80004bbe:	8ce50513          	addi	a0,a0,-1842 # 8000b488 <etext+0x488>
    80004bc2:	ffffc097          	auipc	ra,0xffffc
    80004bc6:	0bc080e7          	jalr	188(ra) # 80000c7e <panic>

  releasesleep(&b->lock);
    80004bca:	fe843783          	ld	a5,-24(s0)
    80004bce:	07c1                	addi	a5,a5,16
    80004bd0:	853e                	mv	a0,a5
    80004bd2:	00002097          	auipc	ra,0x2
    80004bd6:	e34080e7          	jalr	-460(ra) # 80006a06 <releasesleep>

  acquire(&bcache.lock);
    80004bda:	00016517          	auipc	a0,0x16
    80004bde:	f6e50513          	addi	a0,a0,-146 # 8001ab48 <bcache>
    80004be2:	ffffc097          	auipc	ra,0xffffc
    80004be6:	68c080e7          	jalr	1676(ra) # 8000126e <acquire>
  b->refcnt--;
    80004bea:	fe843783          	ld	a5,-24(s0)
    80004bee:	43bc                	lw	a5,64(a5)
    80004bf0:	37fd                	addiw	a5,a5,-1
    80004bf2:	0007871b          	sext.w	a4,a5
    80004bf6:	fe843783          	ld	a5,-24(s0)
    80004bfa:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004bfc:	fe843783          	ld	a5,-24(s0)
    80004c00:	43bc                	lw	a5,64(a5)
    80004c02:	e7b5                	bnez	a5,80004c6e <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004c04:	fe843783          	ld	a5,-24(s0)
    80004c08:	6bbc                	ld	a5,80(a5)
    80004c0a:	fe843703          	ld	a4,-24(s0)
    80004c0e:	6738                	ld	a4,72(a4)
    80004c10:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004c12:	fe843783          	ld	a5,-24(s0)
    80004c16:	67bc                	ld	a5,72(a5)
    80004c18:	fe843703          	ld	a4,-24(s0)
    80004c1c:	6b38                	ld	a4,80(a4)
    80004c1e:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004c20:	00016717          	auipc	a4,0x16
    80004c24:	f2870713          	addi	a4,a4,-216 # 8001ab48 <bcache>
    80004c28:	67a1                	lui	a5,0x8
    80004c2a:	97ba                	add	a5,a5,a4
    80004c2c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004c30:	fe843783          	ld	a5,-24(s0)
    80004c34:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004c36:	fe843783          	ld	a5,-24(s0)
    80004c3a:	0001e717          	auipc	a4,0x1e
    80004c3e:	17670713          	addi	a4,a4,374 # 80022db0 <bcache+0x8268>
    80004c42:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004c44:	00016717          	auipc	a4,0x16
    80004c48:	f0470713          	addi	a4,a4,-252 # 8001ab48 <bcache>
    80004c4c:	67a1                	lui	a5,0x8
    80004c4e:	97ba                	add	a5,a5,a4
    80004c50:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004c54:	fe843703          	ld	a4,-24(s0)
    80004c58:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004c5a:	00016717          	auipc	a4,0x16
    80004c5e:	eee70713          	addi	a4,a4,-274 # 8001ab48 <bcache>
    80004c62:	67a1                	lui	a5,0x8
    80004c64:	97ba                	add	a5,a5,a4
    80004c66:	fe843703          	ld	a4,-24(s0)
    80004c6a:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004c6e:	00016517          	auipc	a0,0x16
    80004c72:	eda50513          	addi	a0,a0,-294 # 8001ab48 <bcache>
    80004c76:	ffffc097          	auipc	ra,0xffffc
    80004c7a:	65c080e7          	jalr	1628(ra) # 800012d2 <release>
}
    80004c7e:	0001                	nop
    80004c80:	60e2                	ld	ra,24(sp)
    80004c82:	6442                	ld	s0,16(sp)
    80004c84:	6105                	addi	sp,sp,32
    80004c86:	8082                	ret

0000000080004c88 <bpin>:

void
bpin(struct buf *b) {
    80004c88:	1101                	addi	sp,sp,-32
    80004c8a:	ec06                	sd	ra,24(sp)
    80004c8c:	e822                	sd	s0,16(sp)
    80004c8e:	1000                	addi	s0,sp,32
    80004c90:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004c94:	00016517          	auipc	a0,0x16
    80004c98:	eb450513          	addi	a0,a0,-332 # 8001ab48 <bcache>
    80004c9c:	ffffc097          	auipc	ra,0xffffc
    80004ca0:	5d2080e7          	jalr	1490(ra) # 8000126e <acquire>
  b->refcnt++;
    80004ca4:	fe843783          	ld	a5,-24(s0)
    80004ca8:	43bc                	lw	a5,64(a5)
    80004caa:	2785                	addiw	a5,a5,1
    80004cac:	0007871b          	sext.w	a4,a5
    80004cb0:	fe843783          	ld	a5,-24(s0)
    80004cb4:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004cb6:	00016517          	auipc	a0,0x16
    80004cba:	e9250513          	addi	a0,a0,-366 # 8001ab48 <bcache>
    80004cbe:	ffffc097          	auipc	ra,0xffffc
    80004cc2:	614080e7          	jalr	1556(ra) # 800012d2 <release>
}
    80004cc6:	0001                	nop
    80004cc8:	60e2                	ld	ra,24(sp)
    80004cca:	6442                	ld	s0,16(sp)
    80004ccc:	6105                	addi	sp,sp,32
    80004cce:	8082                	ret

0000000080004cd0 <bunpin>:

void
bunpin(struct buf *b) {
    80004cd0:	1101                	addi	sp,sp,-32
    80004cd2:	ec06                	sd	ra,24(sp)
    80004cd4:	e822                	sd	s0,16(sp)
    80004cd6:	1000                	addi	s0,sp,32
    80004cd8:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004cdc:	00016517          	auipc	a0,0x16
    80004ce0:	e6c50513          	addi	a0,a0,-404 # 8001ab48 <bcache>
    80004ce4:	ffffc097          	auipc	ra,0xffffc
    80004ce8:	58a080e7          	jalr	1418(ra) # 8000126e <acquire>
  b->refcnt--;
    80004cec:	fe843783          	ld	a5,-24(s0)
    80004cf0:	43bc                	lw	a5,64(a5)
    80004cf2:	37fd                	addiw	a5,a5,-1
    80004cf4:	0007871b          	sext.w	a4,a5
    80004cf8:	fe843783          	ld	a5,-24(s0)
    80004cfc:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004cfe:	00016517          	auipc	a0,0x16
    80004d02:	e4a50513          	addi	a0,a0,-438 # 8001ab48 <bcache>
    80004d06:	ffffc097          	auipc	ra,0xffffc
    80004d0a:	5cc080e7          	jalr	1484(ra) # 800012d2 <release>
}
    80004d0e:	0001                	nop
    80004d10:	60e2                	ld	ra,24(sp)
    80004d12:	6442                	ld	s0,16(sp)
    80004d14:	6105                	addi	sp,sp,32
    80004d16:	8082                	ret

0000000080004d18 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004d18:	7179                	addi	sp,sp,-48
    80004d1a:	f406                	sd	ra,40(sp)
    80004d1c:	f022                	sd	s0,32(sp)
    80004d1e:	1800                	addi	s0,sp,48
    80004d20:	87aa                	mv	a5,a0
    80004d22:	fcb43823          	sd	a1,-48(s0)
    80004d26:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004d2a:	fdc42783          	lw	a5,-36(s0)
    80004d2e:	4585                	li	a1,1
    80004d30:	853e                	mv	a0,a5
    80004d32:	00000097          	auipc	ra,0x0
    80004d36:	dc6080e7          	jalr	-570(ra) # 80004af8 <bread>
    80004d3a:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004d3e:	fe843783          	ld	a5,-24(s0)
    80004d42:	05878793          	addi	a5,a5,88
    80004d46:	02000613          	li	a2,32
    80004d4a:	85be                	mv	a1,a5
    80004d4c:	fd043503          	ld	a0,-48(s0)
    80004d50:	ffffc097          	auipc	ra,0xffffc
    80004d54:	7d6080e7          	jalr	2006(ra) # 80001526 <memmove>
  brelse(bp);
    80004d58:	fe843503          	ld	a0,-24(s0)
    80004d5c:	00000097          	auipc	ra,0x0
    80004d60:	e3e080e7          	jalr	-450(ra) # 80004b9a <brelse>
}
    80004d64:	0001                	nop
    80004d66:	70a2                	ld	ra,40(sp)
    80004d68:	7402                	ld	s0,32(sp)
    80004d6a:	6145                	addi	sp,sp,48
    80004d6c:	8082                	ret

0000000080004d6e <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004d6e:	1101                	addi	sp,sp,-32
    80004d70:	ec06                	sd	ra,24(sp)
    80004d72:	e822                	sd	s0,16(sp)
    80004d74:	1000                	addi	s0,sp,32
    80004d76:	87aa                	mv	a5,a0
    80004d78:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004d7c:	fec42783          	lw	a5,-20(s0)
    80004d80:	0001e597          	auipc	a1,0x1e
    80004d84:	48858593          	addi	a1,a1,1160 # 80023208 <sb>
    80004d88:	853e                	mv	a0,a5
    80004d8a:	00000097          	auipc	ra,0x0
    80004d8e:	f8e080e7          	jalr	-114(ra) # 80004d18 <readsb>
  if(sb.magic != FSMAGIC)
    80004d92:	0001e797          	auipc	a5,0x1e
    80004d96:	47678793          	addi	a5,a5,1142 # 80023208 <sb>
    80004d9a:	439c                	lw	a5,0(a5)
    80004d9c:	873e                	mv	a4,a5
    80004d9e:	102037b7          	lui	a5,0x10203
    80004da2:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004da6:	00f70a63          	beq	a4,a5,80004dba <fsinit+0x4c>
    panic("invalid file system");
    80004daa:	00006517          	auipc	a0,0x6
    80004dae:	6e650513          	addi	a0,a0,1766 # 8000b490 <etext+0x490>
    80004db2:	ffffc097          	auipc	ra,0xffffc
    80004db6:	ecc080e7          	jalr	-308(ra) # 80000c7e <panic>
  initlog(dev, &sb);
    80004dba:	fec42783          	lw	a5,-20(s0)
    80004dbe:	0001e597          	auipc	a1,0x1e
    80004dc2:	44a58593          	addi	a1,a1,1098 # 80023208 <sb>
    80004dc6:	853e                	mv	a0,a5
    80004dc8:	00001097          	auipc	ra,0x1
    80004dcc:	468080e7          	jalr	1128(ra) # 80006230 <initlog>
}
    80004dd0:	0001                	nop
    80004dd2:	60e2                	ld	ra,24(sp)
    80004dd4:	6442                	ld	s0,16(sp)
    80004dd6:	6105                	addi	sp,sp,32
    80004dd8:	8082                	ret

0000000080004dda <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004dda:	7179                	addi	sp,sp,-48
    80004ddc:	f406                	sd	ra,40(sp)
    80004dde:	f022                	sd	s0,32(sp)
    80004de0:	1800                	addi	s0,sp,48
    80004de2:	87aa                	mv	a5,a0
    80004de4:	872e                	mv	a4,a1
    80004de6:	fcf42e23          	sw	a5,-36(s0)
    80004dea:	87ba                	mv	a5,a4
    80004dec:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004df0:	fdc42783          	lw	a5,-36(s0)
    80004df4:	fd842703          	lw	a4,-40(s0)
    80004df8:	85ba                	mv	a1,a4
    80004dfa:	853e                	mv	a0,a5
    80004dfc:	00000097          	auipc	ra,0x0
    80004e00:	cfc080e7          	jalr	-772(ra) # 80004af8 <bread>
    80004e04:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004e08:	fe843783          	ld	a5,-24(s0)
    80004e0c:	05878793          	addi	a5,a5,88
    80004e10:	40000613          	li	a2,1024
    80004e14:	4581                	li	a1,0
    80004e16:	853e                	mv	a0,a5
    80004e18:	ffffc097          	auipc	ra,0xffffc
    80004e1c:	62a080e7          	jalr	1578(ra) # 80001442 <memset>
  log_write(bp);
    80004e20:	fe843503          	ld	a0,-24(s0)
    80004e24:	00002097          	auipc	ra,0x2
    80004e28:	9f4080e7          	jalr	-1548(ra) # 80006818 <log_write>
  brelse(bp);
    80004e2c:	fe843503          	ld	a0,-24(s0)
    80004e30:	00000097          	auipc	ra,0x0
    80004e34:	d6a080e7          	jalr	-662(ra) # 80004b9a <brelse>
}
    80004e38:	0001                	nop
    80004e3a:	70a2                	ld	ra,40(sp)
    80004e3c:	7402                	ld	s0,32(sp)
    80004e3e:	6145                	addi	sp,sp,48
    80004e40:	8082                	ret

0000000080004e42 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    80004e42:	7139                	addi	sp,sp,-64
    80004e44:	fc06                	sd	ra,56(sp)
    80004e46:	f822                	sd	s0,48(sp)
    80004e48:	0080                	addi	s0,sp,64
    80004e4a:	87aa                	mv	a5,a0
    80004e4c:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004e50:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004e54:	fe042623          	sw	zero,-20(s0)
    80004e58:	a2b5                	j	80004fc4 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004e5a:	fec42783          	lw	a5,-20(s0)
    80004e5e:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e62:	0137571b          	srliw	a4,a4,0x13
    80004e66:	9fb9                	addw	a5,a5,a4
    80004e68:	40d7d79b          	sraiw	a5,a5,0xd
    80004e6c:	2781                	sext.w	a5,a5
    80004e6e:	0007871b          	sext.w	a4,a5
    80004e72:	0001e797          	auipc	a5,0x1e
    80004e76:	39678793          	addi	a5,a5,918 # 80023208 <sb>
    80004e7a:	4fdc                	lw	a5,28(a5)
    80004e7c:	9fb9                	addw	a5,a5,a4
    80004e7e:	0007871b          	sext.w	a4,a5
    80004e82:	fcc42783          	lw	a5,-52(s0)
    80004e86:	85ba                	mv	a1,a4
    80004e88:	853e                	mv	a0,a5
    80004e8a:	00000097          	auipc	ra,0x0
    80004e8e:	c6e080e7          	jalr	-914(ra) # 80004af8 <bread>
    80004e92:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004e96:	fe042423          	sw	zero,-24(s0)
    80004e9a:	a0dd                	j	80004f80 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004e9c:	fe842703          	lw	a4,-24(s0)
    80004ea0:	41f7579b          	sraiw	a5,a4,0x1f
    80004ea4:	01d7d79b          	srliw	a5,a5,0x1d
    80004ea8:	9f3d                	addw	a4,a4,a5
    80004eaa:	8b1d                	andi	a4,a4,7
    80004eac:	40f707bb          	subw	a5,a4,a5
    80004eb0:	2781                	sext.w	a5,a5
    80004eb2:	4705                	li	a4,1
    80004eb4:	00f717bb          	sllw	a5,a4,a5
    80004eb8:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004ebc:	fe842783          	lw	a5,-24(s0)
    80004ec0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ec4:	01d7571b          	srliw	a4,a4,0x1d
    80004ec8:	9fb9                	addw	a5,a5,a4
    80004eca:	4037d79b          	sraiw	a5,a5,0x3
    80004ece:	2781                	sext.w	a5,a5
    80004ed0:	fe043703          	ld	a4,-32(s0)
    80004ed4:	97ba                	add	a5,a5,a4
    80004ed6:	0587c783          	lbu	a5,88(a5)
    80004eda:	0007871b          	sext.w	a4,a5
    80004ede:	fdc42783          	lw	a5,-36(s0)
    80004ee2:	8ff9                	and	a5,a5,a4
    80004ee4:	2781                	sext.w	a5,a5
    80004ee6:	ebc1                	bnez	a5,80004f76 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004ee8:	fe842783          	lw	a5,-24(s0)
    80004eec:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ef0:	01d7571b          	srliw	a4,a4,0x1d
    80004ef4:	9fb9                	addw	a5,a5,a4
    80004ef6:	4037d79b          	sraiw	a5,a5,0x3
    80004efa:	2781                	sext.w	a5,a5
    80004efc:	fe043703          	ld	a4,-32(s0)
    80004f00:	973e                	add	a4,a4,a5
    80004f02:	05874703          	lbu	a4,88(a4)
    80004f06:	0187169b          	slliw	a3,a4,0x18
    80004f0a:	4186d69b          	sraiw	a3,a3,0x18
    80004f0e:	fdc42703          	lw	a4,-36(s0)
    80004f12:	0187171b          	slliw	a4,a4,0x18
    80004f16:	4187571b          	sraiw	a4,a4,0x18
    80004f1a:	8f55                	or	a4,a4,a3
    80004f1c:	0187171b          	slliw	a4,a4,0x18
    80004f20:	4187571b          	sraiw	a4,a4,0x18
    80004f24:	0ff77713          	andi	a4,a4,255
    80004f28:	fe043683          	ld	a3,-32(s0)
    80004f2c:	97b6                	add	a5,a5,a3
    80004f2e:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004f32:	fe043503          	ld	a0,-32(s0)
    80004f36:	00002097          	auipc	ra,0x2
    80004f3a:	8e2080e7          	jalr	-1822(ra) # 80006818 <log_write>
        brelse(bp);
    80004f3e:	fe043503          	ld	a0,-32(s0)
    80004f42:	00000097          	auipc	ra,0x0
    80004f46:	c58080e7          	jalr	-936(ra) # 80004b9a <brelse>
        bzero(dev, b + bi);
    80004f4a:	fcc42683          	lw	a3,-52(s0)
    80004f4e:	fec42703          	lw	a4,-20(s0)
    80004f52:	fe842783          	lw	a5,-24(s0)
    80004f56:	9fb9                	addw	a5,a5,a4
    80004f58:	2781                	sext.w	a5,a5
    80004f5a:	85be                	mv	a1,a5
    80004f5c:	8536                	mv	a0,a3
    80004f5e:	00000097          	auipc	ra,0x0
    80004f62:	e7c080e7          	jalr	-388(ra) # 80004dda <bzero>
        return b + bi;
    80004f66:	fec42703          	lw	a4,-20(s0)
    80004f6a:	fe842783          	lw	a5,-24(s0)
    80004f6e:	9fb9                	addw	a5,a5,a4
    80004f70:	2781                	sext.w	a5,a5
    80004f72:	2781                	sext.w	a5,a5
    80004f74:	a88d                	j	80004fe6 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004f76:	fe842783          	lw	a5,-24(s0)
    80004f7a:	2785                	addiw	a5,a5,1
    80004f7c:	fef42423          	sw	a5,-24(s0)
    80004f80:	fe842783          	lw	a5,-24(s0)
    80004f84:	0007871b          	sext.w	a4,a5
    80004f88:	6789                	lui	a5,0x2
    80004f8a:	02f75163          	bge	a4,a5,80004fac <balloc+0x16a>
    80004f8e:	fec42703          	lw	a4,-20(s0)
    80004f92:	fe842783          	lw	a5,-24(s0)
    80004f96:	9fb9                	addw	a5,a5,a4
    80004f98:	2781                	sext.w	a5,a5
    80004f9a:	0007871b          	sext.w	a4,a5
    80004f9e:	0001e797          	auipc	a5,0x1e
    80004fa2:	26a78793          	addi	a5,a5,618 # 80023208 <sb>
    80004fa6:	43dc                	lw	a5,4(a5)
    80004fa8:	eef76ae3          	bltu	a4,a5,80004e9c <balloc+0x5a>
      }
    }
    brelse(bp);
    80004fac:	fe043503          	ld	a0,-32(s0)
    80004fb0:	00000097          	auipc	ra,0x0
    80004fb4:	bea080e7          	jalr	-1046(ra) # 80004b9a <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004fb8:	fec42703          	lw	a4,-20(s0)
    80004fbc:	6789                	lui	a5,0x2
    80004fbe:	9fb9                	addw	a5,a5,a4
    80004fc0:	fef42623          	sw	a5,-20(s0)
    80004fc4:	0001e797          	auipc	a5,0x1e
    80004fc8:	24478793          	addi	a5,a5,580 # 80023208 <sb>
    80004fcc:	43d8                	lw	a4,4(a5)
    80004fce:	fec42783          	lw	a5,-20(s0)
    80004fd2:	e8e7e4e3          	bltu	a5,a4,80004e5a <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80004fd6:	00006517          	auipc	a0,0x6
    80004fda:	4d250513          	addi	a0,a0,1234 # 8000b4a8 <etext+0x4a8>
    80004fde:	ffffc097          	auipc	ra,0xffffc
    80004fe2:	ca0080e7          	jalr	-864(ra) # 80000c7e <panic>
}
    80004fe6:	853e                	mv	a0,a5
    80004fe8:	70e2                	ld	ra,56(sp)
    80004fea:	7442                	ld	s0,48(sp)
    80004fec:	6121                	addi	sp,sp,64
    80004fee:	8082                	ret

0000000080004ff0 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004ff0:	7179                	addi	sp,sp,-48
    80004ff2:	f406                	sd	ra,40(sp)
    80004ff4:	f022                	sd	s0,32(sp)
    80004ff6:	1800                	addi	s0,sp,48
    80004ff8:	87aa                	mv	a5,a0
    80004ffa:	872e                	mv	a4,a1
    80004ffc:	fcf42e23          	sw	a5,-36(s0)
    80005000:	87ba                	mv	a5,a4
    80005002:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80005006:	fdc42683          	lw	a3,-36(s0)
    8000500a:	fd842783          	lw	a5,-40(s0)
    8000500e:	00d7d79b          	srliw	a5,a5,0xd
    80005012:	0007871b          	sext.w	a4,a5
    80005016:	0001e797          	auipc	a5,0x1e
    8000501a:	1f278793          	addi	a5,a5,498 # 80023208 <sb>
    8000501e:	4fdc                	lw	a5,28(a5)
    80005020:	9fb9                	addw	a5,a5,a4
    80005022:	2781                	sext.w	a5,a5
    80005024:	85be                	mv	a1,a5
    80005026:	8536                	mv	a0,a3
    80005028:	00000097          	auipc	ra,0x0
    8000502c:	ad0080e7          	jalr	-1328(ra) # 80004af8 <bread>
    80005030:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80005034:	fd842703          	lw	a4,-40(s0)
    80005038:	6789                	lui	a5,0x2
    8000503a:	17fd                	addi	a5,a5,-1
    8000503c:	8ff9                	and	a5,a5,a4
    8000503e:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80005042:	fe442703          	lw	a4,-28(s0)
    80005046:	41f7579b          	sraiw	a5,a4,0x1f
    8000504a:	01d7d79b          	srliw	a5,a5,0x1d
    8000504e:	9f3d                	addw	a4,a4,a5
    80005050:	8b1d                	andi	a4,a4,7
    80005052:	40f707bb          	subw	a5,a4,a5
    80005056:	2781                	sext.w	a5,a5
    80005058:	4705                	li	a4,1
    8000505a:	00f717bb          	sllw	a5,a4,a5
    8000505e:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80005062:	fe442783          	lw	a5,-28(s0)
    80005066:	41f7d71b          	sraiw	a4,a5,0x1f
    8000506a:	01d7571b          	srliw	a4,a4,0x1d
    8000506e:	9fb9                	addw	a5,a5,a4
    80005070:	4037d79b          	sraiw	a5,a5,0x3
    80005074:	2781                	sext.w	a5,a5
    80005076:	fe843703          	ld	a4,-24(s0)
    8000507a:	97ba                	add	a5,a5,a4
    8000507c:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80005080:	0007871b          	sext.w	a4,a5
    80005084:	fe042783          	lw	a5,-32(s0)
    80005088:	8ff9                	and	a5,a5,a4
    8000508a:	2781                	sext.w	a5,a5
    8000508c:	eb89                	bnez	a5,8000509e <bfree+0xae>
    panic("freeing free block");
    8000508e:	00006517          	auipc	a0,0x6
    80005092:	43250513          	addi	a0,a0,1074 # 8000b4c0 <etext+0x4c0>
    80005096:	ffffc097          	auipc	ra,0xffffc
    8000509a:	be8080e7          	jalr	-1048(ra) # 80000c7e <panic>
  bp->data[bi/8] &= ~m;
    8000509e:	fe442783          	lw	a5,-28(s0)
    800050a2:	41f7d71b          	sraiw	a4,a5,0x1f
    800050a6:	01d7571b          	srliw	a4,a4,0x1d
    800050aa:	9fb9                	addw	a5,a5,a4
    800050ac:	4037d79b          	sraiw	a5,a5,0x3
    800050b0:	2781                	sext.w	a5,a5
    800050b2:	fe843703          	ld	a4,-24(s0)
    800050b6:	973e                	add	a4,a4,a5
    800050b8:	05874703          	lbu	a4,88(a4)
    800050bc:	0187169b          	slliw	a3,a4,0x18
    800050c0:	4186d69b          	sraiw	a3,a3,0x18
    800050c4:	fe042703          	lw	a4,-32(s0)
    800050c8:	0187171b          	slliw	a4,a4,0x18
    800050cc:	4187571b          	sraiw	a4,a4,0x18
    800050d0:	fff74713          	not	a4,a4
    800050d4:	0187171b          	slliw	a4,a4,0x18
    800050d8:	4187571b          	sraiw	a4,a4,0x18
    800050dc:	8f75                	and	a4,a4,a3
    800050de:	0187171b          	slliw	a4,a4,0x18
    800050e2:	4187571b          	sraiw	a4,a4,0x18
    800050e6:	0ff77713          	andi	a4,a4,255
    800050ea:	fe843683          	ld	a3,-24(s0)
    800050ee:	97b6                	add	a5,a5,a3
    800050f0:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    800050f4:	fe843503          	ld	a0,-24(s0)
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	720080e7          	jalr	1824(ra) # 80006818 <log_write>
  brelse(bp);
    80005100:	fe843503          	ld	a0,-24(s0)
    80005104:	00000097          	auipc	ra,0x0
    80005108:	a96080e7          	jalr	-1386(ra) # 80004b9a <brelse>
}
    8000510c:	0001                	nop
    8000510e:	70a2                	ld	ra,40(sp)
    80005110:	7402                	ld	s0,32(sp)
    80005112:	6145                	addi	sp,sp,48
    80005114:	8082                	ret

0000000080005116 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80005116:	1101                	addi	sp,sp,-32
    80005118:	ec06                	sd	ra,24(sp)
    8000511a:	e822                	sd	s0,16(sp)
    8000511c:	1000                	addi	s0,sp,32
  int i = 0;
    8000511e:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80005122:	00006597          	auipc	a1,0x6
    80005126:	3b658593          	addi	a1,a1,950 # 8000b4d8 <etext+0x4d8>
    8000512a:	0001e517          	auipc	a0,0x1e
    8000512e:	0fe50513          	addi	a0,a0,254 # 80023228 <itable>
    80005132:	ffffc097          	auipc	ra,0xffffc
    80005136:	10c080e7          	jalr	268(ra) # 8000123e <initlock>
  for(i = 0; i < NINODE; i++) {
    8000513a:	fe042623          	sw	zero,-20(s0)
    8000513e:	a82d                	j	80005178 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80005140:	fec42703          	lw	a4,-20(s0)
    80005144:	87ba                	mv	a5,a4
    80005146:	0792                	slli	a5,a5,0x4
    80005148:	97ba                	add	a5,a5,a4
    8000514a:	078e                	slli	a5,a5,0x3
    8000514c:	02078713          	addi	a4,a5,32
    80005150:	0001e797          	auipc	a5,0x1e
    80005154:	0d878793          	addi	a5,a5,216 # 80023228 <itable>
    80005158:	97ba                	add	a5,a5,a4
    8000515a:	07a1                	addi	a5,a5,8
    8000515c:	00006597          	auipc	a1,0x6
    80005160:	38458593          	addi	a1,a1,900 # 8000b4e0 <etext+0x4e0>
    80005164:	853e                	mv	a0,a5
    80005166:	00001097          	auipc	ra,0x1
    8000516a:	7e6080e7          	jalr	2022(ra) # 8000694c <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    8000516e:	fec42783          	lw	a5,-20(s0)
    80005172:	2785                	addiw	a5,a5,1
    80005174:	fef42623          	sw	a5,-20(s0)
    80005178:	fec42783          	lw	a5,-20(s0)
    8000517c:	0007871b          	sext.w	a4,a5
    80005180:	03100793          	li	a5,49
    80005184:	fae7dee3          	bge	a5,a4,80005140 <iinit+0x2a>
  }
}
    80005188:	0001                	nop
    8000518a:	0001                	nop
    8000518c:	60e2                	ld	ra,24(sp)
    8000518e:	6442                	ld	s0,16(sp)
    80005190:	6105                	addi	sp,sp,32
    80005192:	8082                	ret

0000000080005194 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    80005194:	7139                	addi	sp,sp,-64
    80005196:	fc06                	sd	ra,56(sp)
    80005198:	f822                	sd	s0,48(sp)
    8000519a:	0080                	addi	s0,sp,64
    8000519c:	87aa                	mv	a5,a0
    8000519e:	872e                	mv	a4,a1
    800051a0:	fcf42623          	sw	a5,-52(s0)
    800051a4:	87ba                	mv	a5,a4
    800051a6:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    800051aa:	4785                	li	a5,1
    800051ac:	fef42623          	sw	a5,-20(s0)
    800051b0:	a855                	j	80005264 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800051b2:	fec42783          	lw	a5,-20(s0)
    800051b6:	8391                	srli	a5,a5,0x4
    800051b8:	0007871b          	sext.w	a4,a5
    800051bc:	0001e797          	auipc	a5,0x1e
    800051c0:	04c78793          	addi	a5,a5,76 # 80023208 <sb>
    800051c4:	4f9c                	lw	a5,24(a5)
    800051c6:	9fb9                	addw	a5,a5,a4
    800051c8:	0007871b          	sext.w	a4,a5
    800051cc:	fcc42783          	lw	a5,-52(s0)
    800051d0:	85ba                	mv	a1,a4
    800051d2:	853e                	mv	a0,a5
    800051d4:	00000097          	auipc	ra,0x0
    800051d8:	924080e7          	jalr	-1756(ra) # 80004af8 <bread>
    800051dc:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    800051e0:	fe043783          	ld	a5,-32(s0)
    800051e4:	05878713          	addi	a4,a5,88
    800051e8:	fec42783          	lw	a5,-20(s0)
    800051ec:	8bbd                	andi	a5,a5,15
    800051ee:	079a                	slli	a5,a5,0x6
    800051f0:	97ba                	add	a5,a5,a4
    800051f2:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    800051f6:	fd843783          	ld	a5,-40(s0)
    800051fa:	00079783          	lh	a5,0(a5)
    800051fe:	eba1                	bnez	a5,8000524e <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005200:	04000613          	li	a2,64
    80005204:	4581                	li	a1,0
    80005206:	fd843503          	ld	a0,-40(s0)
    8000520a:	ffffc097          	auipc	ra,0xffffc
    8000520e:	238080e7          	jalr	568(ra) # 80001442 <memset>
      dip->type = type;
    80005212:	fd843783          	ld	a5,-40(s0)
    80005216:	fca45703          	lhu	a4,-54(s0)
    8000521a:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    8000521e:	fe043503          	ld	a0,-32(s0)
    80005222:	00001097          	auipc	ra,0x1
    80005226:	5f6080e7          	jalr	1526(ra) # 80006818 <log_write>
      brelse(bp);
    8000522a:	fe043503          	ld	a0,-32(s0)
    8000522e:	00000097          	auipc	ra,0x0
    80005232:	96c080e7          	jalr	-1684(ra) # 80004b9a <brelse>
      return iget(dev, inum);
    80005236:	fec42703          	lw	a4,-20(s0)
    8000523a:	fcc42783          	lw	a5,-52(s0)
    8000523e:	85ba                	mv	a1,a4
    80005240:	853e                	mv	a0,a5
    80005242:	00000097          	auipc	ra,0x0
    80005246:	136080e7          	jalr	310(ra) # 80005378 <iget>
    8000524a:	87aa                	mv	a5,a0
    8000524c:	a82d                	j	80005286 <ialloc+0xf2>
    }
    brelse(bp);
    8000524e:	fe043503          	ld	a0,-32(s0)
    80005252:	00000097          	auipc	ra,0x0
    80005256:	948080e7          	jalr	-1720(ra) # 80004b9a <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000525a:	fec42783          	lw	a5,-20(s0)
    8000525e:	2785                	addiw	a5,a5,1
    80005260:	fef42623          	sw	a5,-20(s0)
    80005264:	0001e797          	auipc	a5,0x1e
    80005268:	fa478793          	addi	a5,a5,-92 # 80023208 <sb>
    8000526c:	47d8                	lw	a4,12(a5)
    8000526e:	fec42783          	lw	a5,-20(s0)
    80005272:	f4e7e0e3          	bltu	a5,a4,800051b2 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    80005276:	00006517          	auipc	a0,0x6
    8000527a:	27250513          	addi	a0,a0,626 # 8000b4e8 <etext+0x4e8>
    8000527e:	ffffc097          	auipc	ra,0xffffc
    80005282:	a00080e7          	jalr	-1536(ra) # 80000c7e <panic>
}
    80005286:	853e                	mv	a0,a5
    80005288:	70e2                	ld	ra,56(sp)
    8000528a:	7442                	ld	s0,48(sp)
    8000528c:	6121                	addi	sp,sp,64
    8000528e:	8082                	ret

0000000080005290 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80005290:	7179                	addi	sp,sp,-48
    80005292:	f406                	sd	ra,40(sp)
    80005294:	f022                	sd	s0,32(sp)
    80005296:	1800                	addi	s0,sp,48
    80005298:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000529c:	fd843783          	ld	a5,-40(s0)
    800052a0:	4394                	lw	a3,0(a5)
    800052a2:	fd843783          	ld	a5,-40(s0)
    800052a6:	43dc                	lw	a5,4(a5)
    800052a8:	0047d79b          	srliw	a5,a5,0x4
    800052ac:	0007871b          	sext.w	a4,a5
    800052b0:	0001e797          	auipc	a5,0x1e
    800052b4:	f5878793          	addi	a5,a5,-168 # 80023208 <sb>
    800052b8:	4f9c                	lw	a5,24(a5)
    800052ba:	9fb9                	addw	a5,a5,a4
    800052bc:	2781                	sext.w	a5,a5
    800052be:	85be                	mv	a1,a5
    800052c0:	8536                	mv	a0,a3
    800052c2:	00000097          	auipc	ra,0x0
    800052c6:	836080e7          	jalr	-1994(ra) # 80004af8 <bread>
    800052ca:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800052ce:	fe843783          	ld	a5,-24(s0)
    800052d2:	05878713          	addi	a4,a5,88
    800052d6:	fd843783          	ld	a5,-40(s0)
    800052da:	43dc                	lw	a5,4(a5)
    800052dc:	1782                	slli	a5,a5,0x20
    800052de:	9381                	srli	a5,a5,0x20
    800052e0:	8bbd                	andi	a5,a5,15
    800052e2:	079a                	slli	a5,a5,0x6
    800052e4:	97ba                	add	a5,a5,a4
    800052e6:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    800052ea:	fd843783          	ld	a5,-40(s0)
    800052ee:	04479703          	lh	a4,68(a5)
    800052f2:	fe043783          	ld	a5,-32(s0)
    800052f6:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    800052fa:	fd843783          	ld	a5,-40(s0)
    800052fe:	04679703          	lh	a4,70(a5)
    80005302:	fe043783          	ld	a5,-32(s0)
    80005306:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    8000530a:	fd843783          	ld	a5,-40(s0)
    8000530e:	04879703          	lh	a4,72(a5)
    80005312:	fe043783          	ld	a5,-32(s0)
    80005316:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    8000531a:	fd843783          	ld	a5,-40(s0)
    8000531e:	04a79703          	lh	a4,74(a5)
    80005322:	fe043783          	ld	a5,-32(s0)
    80005326:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000532a:	fd843783          	ld	a5,-40(s0)
    8000532e:	47f8                	lw	a4,76(a5)
    80005330:	fe043783          	ld	a5,-32(s0)
    80005334:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005336:	fe043783          	ld	a5,-32(s0)
    8000533a:	00c78713          	addi	a4,a5,12
    8000533e:	fd843783          	ld	a5,-40(s0)
    80005342:	05078793          	addi	a5,a5,80
    80005346:	03400613          	li	a2,52
    8000534a:	85be                	mv	a1,a5
    8000534c:	853a                	mv	a0,a4
    8000534e:	ffffc097          	auipc	ra,0xffffc
    80005352:	1d8080e7          	jalr	472(ra) # 80001526 <memmove>
  log_write(bp);
    80005356:	fe843503          	ld	a0,-24(s0)
    8000535a:	00001097          	auipc	ra,0x1
    8000535e:	4be080e7          	jalr	1214(ra) # 80006818 <log_write>
  brelse(bp);
    80005362:	fe843503          	ld	a0,-24(s0)
    80005366:	00000097          	auipc	ra,0x0
    8000536a:	834080e7          	jalr	-1996(ra) # 80004b9a <brelse>
}
    8000536e:	0001                	nop
    80005370:	70a2                	ld	ra,40(sp)
    80005372:	7402                	ld	s0,32(sp)
    80005374:	6145                	addi	sp,sp,48
    80005376:	8082                	ret

0000000080005378 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80005378:	7179                	addi	sp,sp,-48
    8000537a:	f406                	sd	ra,40(sp)
    8000537c:	f022                	sd	s0,32(sp)
    8000537e:	1800                	addi	s0,sp,48
    80005380:	87aa                	mv	a5,a0
    80005382:	872e                	mv	a4,a1
    80005384:	fcf42e23          	sw	a5,-36(s0)
    80005388:	87ba                	mv	a5,a4
    8000538a:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    8000538e:	0001e517          	auipc	a0,0x1e
    80005392:	e9a50513          	addi	a0,a0,-358 # 80023228 <itable>
    80005396:	ffffc097          	auipc	ra,0xffffc
    8000539a:	ed8080e7          	jalr	-296(ra) # 8000126e <acquire>

  // Is the inode already in the table?
  empty = 0;
    8000539e:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800053a2:	0001e797          	auipc	a5,0x1e
    800053a6:	e9e78793          	addi	a5,a5,-354 # 80023240 <itable+0x18>
    800053aa:	fef43423          	sd	a5,-24(s0)
    800053ae:	a89d                	j	80005424 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800053b0:	fe843783          	ld	a5,-24(s0)
    800053b4:	479c                	lw	a5,8(a5)
    800053b6:	04f05663          	blez	a5,80005402 <iget+0x8a>
    800053ba:	fe843783          	ld	a5,-24(s0)
    800053be:	4398                	lw	a4,0(a5)
    800053c0:	fdc42783          	lw	a5,-36(s0)
    800053c4:	2781                	sext.w	a5,a5
    800053c6:	02e79e63          	bne	a5,a4,80005402 <iget+0x8a>
    800053ca:	fe843783          	ld	a5,-24(s0)
    800053ce:	43d8                	lw	a4,4(a5)
    800053d0:	fd842783          	lw	a5,-40(s0)
    800053d4:	2781                	sext.w	a5,a5
    800053d6:	02e79663          	bne	a5,a4,80005402 <iget+0x8a>
      ip->ref++;
    800053da:	fe843783          	ld	a5,-24(s0)
    800053de:	479c                	lw	a5,8(a5)
    800053e0:	2785                	addiw	a5,a5,1
    800053e2:	0007871b          	sext.w	a4,a5
    800053e6:	fe843783          	ld	a5,-24(s0)
    800053ea:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    800053ec:	0001e517          	auipc	a0,0x1e
    800053f0:	e3c50513          	addi	a0,a0,-452 # 80023228 <itable>
    800053f4:	ffffc097          	auipc	ra,0xffffc
    800053f8:	ede080e7          	jalr	-290(ra) # 800012d2 <release>
      return ip;
    800053fc:	fe843783          	ld	a5,-24(s0)
    80005400:	a069                	j	8000548a <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005402:	fe043783          	ld	a5,-32(s0)
    80005406:	eb89                	bnez	a5,80005418 <iget+0xa0>
    80005408:	fe843783          	ld	a5,-24(s0)
    8000540c:	479c                	lw	a5,8(a5)
    8000540e:	e789                	bnez	a5,80005418 <iget+0xa0>
      empty = ip;
    80005410:	fe843783          	ld	a5,-24(s0)
    80005414:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005418:	fe843783          	ld	a5,-24(s0)
    8000541c:	08878793          	addi	a5,a5,136
    80005420:	fef43423          	sd	a5,-24(s0)
    80005424:	fe843703          	ld	a4,-24(s0)
    80005428:	00020797          	auipc	a5,0x20
    8000542c:	8a878793          	addi	a5,a5,-1880 # 80024cd0 <log>
    80005430:	f8f760e3          	bltu	a4,a5,800053b0 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005434:	fe043783          	ld	a5,-32(s0)
    80005438:	eb89                	bnez	a5,8000544a <iget+0xd2>
    panic("iget: no inodes");
    8000543a:	00006517          	auipc	a0,0x6
    8000543e:	0c650513          	addi	a0,a0,198 # 8000b500 <etext+0x500>
    80005442:	ffffc097          	auipc	ra,0xffffc
    80005446:	83c080e7          	jalr	-1988(ra) # 80000c7e <panic>

  ip = empty;
    8000544a:	fe043783          	ld	a5,-32(s0)
    8000544e:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005452:	fe843783          	ld	a5,-24(s0)
    80005456:	fdc42703          	lw	a4,-36(s0)
    8000545a:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000545c:	fe843783          	ld	a5,-24(s0)
    80005460:	fd842703          	lw	a4,-40(s0)
    80005464:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005466:	fe843783          	ld	a5,-24(s0)
    8000546a:	4705                	li	a4,1
    8000546c:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    8000546e:	fe843783          	ld	a5,-24(s0)
    80005472:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005476:	0001e517          	auipc	a0,0x1e
    8000547a:	db250513          	addi	a0,a0,-590 # 80023228 <itable>
    8000547e:	ffffc097          	auipc	ra,0xffffc
    80005482:	e54080e7          	jalr	-428(ra) # 800012d2 <release>

  return ip;
    80005486:	fe843783          	ld	a5,-24(s0)
}
    8000548a:	853e                	mv	a0,a5
    8000548c:	70a2                	ld	ra,40(sp)
    8000548e:	7402                	ld	s0,32(sp)
    80005490:	6145                	addi	sp,sp,48
    80005492:	8082                	ret

0000000080005494 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005494:	1101                	addi	sp,sp,-32
    80005496:	ec06                	sd	ra,24(sp)
    80005498:	e822                	sd	s0,16(sp)
    8000549a:	1000                	addi	s0,sp,32
    8000549c:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800054a0:	0001e517          	auipc	a0,0x1e
    800054a4:	d8850513          	addi	a0,a0,-632 # 80023228 <itable>
    800054a8:	ffffc097          	auipc	ra,0xffffc
    800054ac:	dc6080e7          	jalr	-570(ra) # 8000126e <acquire>
  ip->ref++;
    800054b0:	fe843783          	ld	a5,-24(s0)
    800054b4:	479c                	lw	a5,8(a5)
    800054b6:	2785                	addiw	a5,a5,1
    800054b8:	0007871b          	sext.w	a4,a5
    800054bc:	fe843783          	ld	a5,-24(s0)
    800054c0:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800054c2:	0001e517          	auipc	a0,0x1e
    800054c6:	d6650513          	addi	a0,a0,-666 # 80023228 <itable>
    800054ca:	ffffc097          	auipc	ra,0xffffc
    800054ce:	e08080e7          	jalr	-504(ra) # 800012d2 <release>
  return ip;
    800054d2:	fe843783          	ld	a5,-24(s0)
}
    800054d6:	853e                	mv	a0,a5
    800054d8:	60e2                	ld	ra,24(sp)
    800054da:	6442                	ld	s0,16(sp)
    800054dc:	6105                	addi	sp,sp,32
    800054de:	8082                	ret

00000000800054e0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    800054e0:	7179                	addi	sp,sp,-48
    800054e2:	f406                	sd	ra,40(sp)
    800054e4:	f022                	sd	s0,32(sp)
    800054e6:	1800                	addi	s0,sp,48
    800054e8:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800054ec:	fd843783          	ld	a5,-40(s0)
    800054f0:	c791                	beqz	a5,800054fc <ilock+0x1c>
    800054f2:	fd843783          	ld	a5,-40(s0)
    800054f6:	479c                	lw	a5,8(a5)
    800054f8:	00f04a63          	bgtz	a5,8000550c <ilock+0x2c>
    panic("ilock");
    800054fc:	00006517          	auipc	a0,0x6
    80005500:	01450513          	addi	a0,a0,20 # 8000b510 <etext+0x510>
    80005504:	ffffb097          	auipc	ra,0xffffb
    80005508:	77a080e7          	jalr	1914(ra) # 80000c7e <panic>

  acquiresleep(&ip->lock);
    8000550c:	fd843783          	ld	a5,-40(s0)
    80005510:	07c1                	addi	a5,a5,16
    80005512:	853e                	mv	a0,a5
    80005514:	00001097          	auipc	ra,0x1
    80005518:	484080e7          	jalr	1156(ra) # 80006998 <acquiresleep>

  if(ip->valid == 0){
    8000551c:	fd843783          	ld	a5,-40(s0)
    80005520:	43bc                	lw	a5,64(a5)
    80005522:	e7e5                	bnez	a5,8000560a <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005524:	fd843783          	ld	a5,-40(s0)
    80005528:	4394                	lw	a3,0(a5)
    8000552a:	fd843783          	ld	a5,-40(s0)
    8000552e:	43dc                	lw	a5,4(a5)
    80005530:	0047d79b          	srliw	a5,a5,0x4
    80005534:	0007871b          	sext.w	a4,a5
    80005538:	0001e797          	auipc	a5,0x1e
    8000553c:	cd078793          	addi	a5,a5,-816 # 80023208 <sb>
    80005540:	4f9c                	lw	a5,24(a5)
    80005542:	9fb9                	addw	a5,a5,a4
    80005544:	2781                	sext.w	a5,a5
    80005546:	85be                	mv	a1,a5
    80005548:	8536                	mv	a0,a3
    8000554a:	fffff097          	auipc	ra,0xfffff
    8000554e:	5ae080e7          	jalr	1454(ra) # 80004af8 <bread>
    80005552:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005556:	fe843783          	ld	a5,-24(s0)
    8000555a:	05878713          	addi	a4,a5,88
    8000555e:	fd843783          	ld	a5,-40(s0)
    80005562:	43dc                	lw	a5,4(a5)
    80005564:	1782                	slli	a5,a5,0x20
    80005566:	9381                	srli	a5,a5,0x20
    80005568:	8bbd                	andi	a5,a5,15
    8000556a:	079a                	slli	a5,a5,0x6
    8000556c:	97ba                	add	a5,a5,a4
    8000556e:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005572:	fe043783          	ld	a5,-32(s0)
    80005576:	00079703          	lh	a4,0(a5)
    8000557a:	fd843783          	ld	a5,-40(s0)
    8000557e:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    80005582:	fe043783          	ld	a5,-32(s0)
    80005586:	00279703          	lh	a4,2(a5)
    8000558a:	fd843783          	ld	a5,-40(s0)
    8000558e:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    80005592:	fe043783          	ld	a5,-32(s0)
    80005596:	00479703          	lh	a4,4(a5)
    8000559a:	fd843783          	ld	a5,-40(s0)
    8000559e:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800055a2:	fe043783          	ld	a5,-32(s0)
    800055a6:	00679703          	lh	a4,6(a5)
    800055aa:	fd843783          	ld	a5,-40(s0)
    800055ae:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800055b2:	fe043783          	ld	a5,-32(s0)
    800055b6:	4798                	lw	a4,8(a5)
    800055b8:	fd843783          	ld	a5,-40(s0)
    800055bc:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800055be:	fd843783          	ld	a5,-40(s0)
    800055c2:	05078713          	addi	a4,a5,80
    800055c6:	fe043783          	ld	a5,-32(s0)
    800055ca:	07b1                	addi	a5,a5,12
    800055cc:	03400613          	li	a2,52
    800055d0:	85be                	mv	a1,a5
    800055d2:	853a                	mv	a0,a4
    800055d4:	ffffc097          	auipc	ra,0xffffc
    800055d8:	f52080e7          	jalr	-174(ra) # 80001526 <memmove>
    brelse(bp);
    800055dc:	fe843503          	ld	a0,-24(s0)
    800055e0:	fffff097          	auipc	ra,0xfffff
    800055e4:	5ba080e7          	jalr	1466(ra) # 80004b9a <brelse>
    ip->valid = 1;
    800055e8:	fd843783          	ld	a5,-40(s0)
    800055ec:	4705                	li	a4,1
    800055ee:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800055f0:	fd843783          	ld	a5,-40(s0)
    800055f4:	04479783          	lh	a5,68(a5)
    800055f8:	eb89                	bnez	a5,8000560a <ilock+0x12a>
      panic("ilock: no type");
    800055fa:	00006517          	auipc	a0,0x6
    800055fe:	f1e50513          	addi	a0,a0,-226 # 8000b518 <etext+0x518>
    80005602:	ffffb097          	auipc	ra,0xffffb
    80005606:	67c080e7          	jalr	1660(ra) # 80000c7e <panic>
  }
}
    8000560a:	0001                	nop
    8000560c:	70a2                	ld	ra,40(sp)
    8000560e:	7402                	ld	s0,32(sp)
    80005610:	6145                	addi	sp,sp,48
    80005612:	8082                	ret

0000000080005614 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005614:	1101                	addi	sp,sp,-32
    80005616:	ec06                	sd	ra,24(sp)
    80005618:	e822                	sd	s0,16(sp)
    8000561a:	1000                	addi	s0,sp,32
    8000561c:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005620:	fe843783          	ld	a5,-24(s0)
    80005624:	c385                	beqz	a5,80005644 <iunlock+0x30>
    80005626:	fe843783          	ld	a5,-24(s0)
    8000562a:	07c1                	addi	a5,a5,16
    8000562c:	853e                	mv	a0,a5
    8000562e:	00001097          	auipc	ra,0x1
    80005632:	42a080e7          	jalr	1066(ra) # 80006a58 <holdingsleep>
    80005636:	87aa                	mv	a5,a0
    80005638:	c791                	beqz	a5,80005644 <iunlock+0x30>
    8000563a:	fe843783          	ld	a5,-24(s0)
    8000563e:	479c                	lw	a5,8(a5)
    80005640:	00f04a63          	bgtz	a5,80005654 <iunlock+0x40>
    panic("iunlock");
    80005644:	00006517          	auipc	a0,0x6
    80005648:	ee450513          	addi	a0,a0,-284 # 8000b528 <etext+0x528>
    8000564c:	ffffb097          	auipc	ra,0xffffb
    80005650:	632080e7          	jalr	1586(ra) # 80000c7e <panic>

  releasesleep(&ip->lock);
    80005654:	fe843783          	ld	a5,-24(s0)
    80005658:	07c1                	addi	a5,a5,16
    8000565a:	853e                	mv	a0,a5
    8000565c:	00001097          	auipc	ra,0x1
    80005660:	3aa080e7          	jalr	938(ra) # 80006a06 <releasesleep>
}
    80005664:	0001                	nop
    80005666:	60e2                	ld	ra,24(sp)
    80005668:	6442                	ld	s0,16(sp)
    8000566a:	6105                	addi	sp,sp,32
    8000566c:	8082                	ret

000000008000566e <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    8000566e:	1101                	addi	sp,sp,-32
    80005670:	ec06                	sd	ra,24(sp)
    80005672:	e822                	sd	s0,16(sp)
    80005674:	1000                	addi	s0,sp,32
    80005676:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000567a:	0001e517          	auipc	a0,0x1e
    8000567e:	bae50513          	addi	a0,a0,-1106 # 80023228 <itable>
    80005682:	ffffc097          	auipc	ra,0xffffc
    80005686:	bec080e7          	jalr	-1044(ra) # 8000126e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000568a:	fe843783          	ld	a5,-24(s0)
    8000568e:	479c                	lw	a5,8(a5)
    80005690:	873e                	mv	a4,a5
    80005692:	4785                	li	a5,1
    80005694:	06f71f63          	bne	a4,a5,80005712 <iput+0xa4>
    80005698:	fe843783          	ld	a5,-24(s0)
    8000569c:	43bc                	lw	a5,64(a5)
    8000569e:	cbb5                	beqz	a5,80005712 <iput+0xa4>
    800056a0:	fe843783          	ld	a5,-24(s0)
    800056a4:	04a79783          	lh	a5,74(a5)
    800056a8:	e7ad                	bnez	a5,80005712 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800056aa:	fe843783          	ld	a5,-24(s0)
    800056ae:	07c1                	addi	a5,a5,16
    800056b0:	853e                	mv	a0,a5
    800056b2:	00001097          	auipc	ra,0x1
    800056b6:	2e6080e7          	jalr	742(ra) # 80006998 <acquiresleep>

    release(&itable.lock);
    800056ba:	0001e517          	auipc	a0,0x1e
    800056be:	b6e50513          	addi	a0,a0,-1170 # 80023228 <itable>
    800056c2:	ffffc097          	auipc	ra,0xffffc
    800056c6:	c10080e7          	jalr	-1008(ra) # 800012d2 <release>

    itrunc(ip);
    800056ca:	fe843503          	ld	a0,-24(s0)
    800056ce:	00000097          	auipc	ra,0x0
    800056d2:	1fa080e7          	jalr	506(ra) # 800058c8 <itrunc>
    ip->type = 0;
    800056d6:	fe843783          	ld	a5,-24(s0)
    800056da:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800056de:	fe843503          	ld	a0,-24(s0)
    800056e2:	00000097          	auipc	ra,0x0
    800056e6:	bae080e7          	jalr	-1106(ra) # 80005290 <iupdate>
    ip->valid = 0;
    800056ea:	fe843783          	ld	a5,-24(s0)
    800056ee:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800056f2:	fe843783          	ld	a5,-24(s0)
    800056f6:	07c1                	addi	a5,a5,16
    800056f8:	853e                	mv	a0,a5
    800056fa:	00001097          	auipc	ra,0x1
    800056fe:	30c080e7          	jalr	780(ra) # 80006a06 <releasesleep>

    acquire(&itable.lock);
    80005702:	0001e517          	auipc	a0,0x1e
    80005706:	b2650513          	addi	a0,a0,-1242 # 80023228 <itable>
    8000570a:	ffffc097          	auipc	ra,0xffffc
    8000570e:	b64080e7          	jalr	-1180(ra) # 8000126e <acquire>
  }

  ip->ref--;
    80005712:	fe843783          	ld	a5,-24(s0)
    80005716:	479c                	lw	a5,8(a5)
    80005718:	37fd                	addiw	a5,a5,-1
    8000571a:	0007871b          	sext.w	a4,a5
    8000571e:	fe843783          	ld	a5,-24(s0)
    80005722:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005724:	0001e517          	auipc	a0,0x1e
    80005728:	b0450513          	addi	a0,a0,-1276 # 80023228 <itable>
    8000572c:	ffffc097          	auipc	ra,0xffffc
    80005730:	ba6080e7          	jalr	-1114(ra) # 800012d2 <release>
}
    80005734:	0001                	nop
    80005736:	60e2                	ld	ra,24(sp)
    80005738:	6442                	ld	s0,16(sp)
    8000573a:	6105                	addi	sp,sp,32
    8000573c:	8082                	ret

000000008000573e <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    8000573e:	1101                	addi	sp,sp,-32
    80005740:	ec06                	sd	ra,24(sp)
    80005742:	e822                	sd	s0,16(sp)
    80005744:	1000                	addi	s0,sp,32
    80005746:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000574a:	fe843503          	ld	a0,-24(s0)
    8000574e:	00000097          	auipc	ra,0x0
    80005752:	ec6080e7          	jalr	-314(ra) # 80005614 <iunlock>
  iput(ip);
    80005756:	fe843503          	ld	a0,-24(s0)
    8000575a:	00000097          	auipc	ra,0x0
    8000575e:	f14080e7          	jalr	-236(ra) # 8000566e <iput>
}
    80005762:	0001                	nop
    80005764:	60e2                	ld	ra,24(sp)
    80005766:	6442                	ld	s0,16(sp)
    80005768:	6105                	addi	sp,sp,32
    8000576a:	8082                	ret

000000008000576c <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    8000576c:	7139                	addi	sp,sp,-64
    8000576e:	fc06                	sd	ra,56(sp)
    80005770:	f822                	sd	s0,48(sp)
    80005772:	0080                	addi	s0,sp,64
    80005774:	fca43423          	sd	a0,-56(s0)
    80005778:	87ae                	mv	a5,a1
    8000577a:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    8000577e:	fc442783          	lw	a5,-60(s0)
    80005782:	0007871b          	sext.w	a4,a5
    80005786:	47ad                	li	a5,11
    80005788:	04e7e863          	bltu	a5,a4,800057d8 <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    8000578c:	fc843703          	ld	a4,-56(s0)
    80005790:	fc446783          	lwu	a5,-60(s0)
    80005794:	07d1                	addi	a5,a5,20
    80005796:	078a                	slli	a5,a5,0x2
    80005798:	97ba                	add	a5,a5,a4
    8000579a:	439c                	lw	a5,0(a5)
    8000579c:	fef42623          	sw	a5,-20(s0)
    800057a0:	fec42783          	lw	a5,-20(s0)
    800057a4:	2781                	sext.w	a5,a5
    800057a6:	e795                	bnez	a5,800057d2 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    800057a8:	fc843783          	ld	a5,-56(s0)
    800057ac:	439c                	lw	a5,0(a5)
    800057ae:	853e                	mv	a0,a5
    800057b0:	fffff097          	auipc	ra,0xfffff
    800057b4:	692080e7          	jalr	1682(ra) # 80004e42 <balloc>
    800057b8:	87aa                	mv	a5,a0
    800057ba:	fef42623          	sw	a5,-20(s0)
    800057be:	fc843703          	ld	a4,-56(s0)
    800057c2:	fc446783          	lwu	a5,-60(s0)
    800057c6:	07d1                	addi	a5,a5,20
    800057c8:	078a                	slli	a5,a5,0x2
    800057ca:	97ba                	add	a5,a5,a4
    800057cc:	fec42703          	lw	a4,-20(s0)
    800057d0:	c398                	sw	a4,0(a5)
    return addr;
    800057d2:	fec42783          	lw	a5,-20(s0)
    800057d6:	a0e5                	j	800058be <bmap+0x152>
  }
  bn -= NDIRECT;
    800057d8:	fc442783          	lw	a5,-60(s0)
    800057dc:	37d1                	addiw	a5,a5,-12
    800057de:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800057e2:	fc442783          	lw	a5,-60(s0)
    800057e6:	0007871b          	sext.w	a4,a5
    800057ea:	0ff00793          	li	a5,255
    800057ee:	0ce7e063          	bltu	a5,a4,800058ae <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    800057f2:	fc843783          	ld	a5,-56(s0)
    800057f6:	0807a783          	lw	a5,128(a5)
    800057fa:	fef42623          	sw	a5,-20(s0)
    800057fe:	fec42783          	lw	a5,-20(s0)
    80005802:	2781                	sext.w	a5,a5
    80005804:	e395                	bnez	a5,80005828 <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80005806:	fc843783          	ld	a5,-56(s0)
    8000580a:	439c                	lw	a5,0(a5)
    8000580c:	853e                	mv	a0,a5
    8000580e:	fffff097          	auipc	ra,0xfffff
    80005812:	634080e7          	jalr	1588(ra) # 80004e42 <balloc>
    80005816:	87aa                	mv	a5,a0
    80005818:	fef42623          	sw	a5,-20(s0)
    8000581c:	fc843783          	ld	a5,-56(s0)
    80005820:	fec42703          	lw	a4,-20(s0)
    80005824:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    80005828:	fc843783          	ld	a5,-56(s0)
    8000582c:	439c                	lw	a5,0(a5)
    8000582e:	fec42703          	lw	a4,-20(s0)
    80005832:	85ba                	mv	a1,a4
    80005834:	853e                	mv	a0,a5
    80005836:	fffff097          	auipc	ra,0xfffff
    8000583a:	2c2080e7          	jalr	706(ra) # 80004af8 <bread>
    8000583e:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005842:	fe043783          	ld	a5,-32(s0)
    80005846:	05878793          	addi	a5,a5,88
    8000584a:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    8000584e:	fc446783          	lwu	a5,-60(s0)
    80005852:	078a                	slli	a5,a5,0x2
    80005854:	fd843703          	ld	a4,-40(s0)
    80005858:	97ba                	add	a5,a5,a4
    8000585a:	439c                	lw	a5,0(a5)
    8000585c:	fef42623          	sw	a5,-20(s0)
    80005860:	fec42783          	lw	a5,-20(s0)
    80005864:	2781                	sext.w	a5,a5
    80005866:	eb9d                	bnez	a5,8000589c <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    80005868:	fc843783          	ld	a5,-56(s0)
    8000586c:	439c                	lw	a5,0(a5)
    8000586e:	853e                	mv	a0,a5
    80005870:	fffff097          	auipc	ra,0xfffff
    80005874:	5d2080e7          	jalr	1490(ra) # 80004e42 <balloc>
    80005878:	87aa                	mv	a5,a0
    8000587a:	fef42623          	sw	a5,-20(s0)
    8000587e:	fc446783          	lwu	a5,-60(s0)
    80005882:	078a                	slli	a5,a5,0x2
    80005884:	fd843703          	ld	a4,-40(s0)
    80005888:	97ba                	add	a5,a5,a4
    8000588a:	fec42703          	lw	a4,-20(s0)
    8000588e:	c398                	sw	a4,0(a5)
      log_write(bp);
    80005890:	fe043503          	ld	a0,-32(s0)
    80005894:	00001097          	auipc	ra,0x1
    80005898:	f84080e7          	jalr	-124(ra) # 80006818 <log_write>
    }
    brelse(bp);
    8000589c:	fe043503          	ld	a0,-32(s0)
    800058a0:	fffff097          	auipc	ra,0xfffff
    800058a4:	2fa080e7          	jalr	762(ra) # 80004b9a <brelse>
    return addr;
    800058a8:	fec42783          	lw	a5,-20(s0)
    800058ac:	a809                	j	800058be <bmap+0x152>
  }

  panic("bmap: out of range");
    800058ae:	00006517          	auipc	a0,0x6
    800058b2:	c8250513          	addi	a0,a0,-894 # 8000b530 <etext+0x530>
    800058b6:	ffffb097          	auipc	ra,0xffffb
    800058ba:	3c8080e7          	jalr	968(ra) # 80000c7e <panic>
}
    800058be:	853e                	mv	a0,a5
    800058c0:	70e2                	ld	ra,56(sp)
    800058c2:	7442                	ld	s0,48(sp)
    800058c4:	6121                	addi	sp,sp,64
    800058c6:	8082                	ret

00000000800058c8 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800058c8:	7139                	addi	sp,sp,-64
    800058ca:	fc06                	sd	ra,56(sp)
    800058cc:	f822                	sd	s0,48(sp)
    800058ce:	0080                	addi	s0,sp,64
    800058d0:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800058d4:	fe042623          	sw	zero,-20(s0)
    800058d8:	a899                	j	8000592e <itrunc+0x66>
    if(ip->addrs[i]){
    800058da:	fc843703          	ld	a4,-56(s0)
    800058de:	fec42783          	lw	a5,-20(s0)
    800058e2:	07d1                	addi	a5,a5,20
    800058e4:	078a                	slli	a5,a5,0x2
    800058e6:	97ba                	add	a5,a5,a4
    800058e8:	439c                	lw	a5,0(a5)
    800058ea:	cf8d                	beqz	a5,80005924 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    800058ec:	fc843783          	ld	a5,-56(s0)
    800058f0:	439c                	lw	a5,0(a5)
    800058f2:	0007869b          	sext.w	a3,a5
    800058f6:	fc843703          	ld	a4,-56(s0)
    800058fa:	fec42783          	lw	a5,-20(s0)
    800058fe:	07d1                	addi	a5,a5,20
    80005900:	078a                	slli	a5,a5,0x2
    80005902:	97ba                	add	a5,a5,a4
    80005904:	439c                	lw	a5,0(a5)
    80005906:	85be                	mv	a1,a5
    80005908:	8536                	mv	a0,a3
    8000590a:	fffff097          	auipc	ra,0xfffff
    8000590e:	6e6080e7          	jalr	1766(ra) # 80004ff0 <bfree>
      ip->addrs[i] = 0;
    80005912:	fc843703          	ld	a4,-56(s0)
    80005916:	fec42783          	lw	a5,-20(s0)
    8000591a:	07d1                	addi	a5,a5,20
    8000591c:	078a                	slli	a5,a5,0x2
    8000591e:	97ba                	add	a5,a5,a4
    80005920:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005924:	fec42783          	lw	a5,-20(s0)
    80005928:	2785                	addiw	a5,a5,1
    8000592a:	fef42623          	sw	a5,-20(s0)
    8000592e:	fec42783          	lw	a5,-20(s0)
    80005932:	0007871b          	sext.w	a4,a5
    80005936:	47ad                	li	a5,11
    80005938:	fae7d1e3          	bge	a5,a4,800058da <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000593c:	fc843783          	ld	a5,-56(s0)
    80005940:	0807a783          	lw	a5,128(a5)
    80005944:	cbc5                	beqz	a5,800059f4 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005946:	fc843783          	ld	a5,-56(s0)
    8000594a:	4398                	lw	a4,0(a5)
    8000594c:	fc843783          	ld	a5,-56(s0)
    80005950:	0807a783          	lw	a5,128(a5)
    80005954:	85be                	mv	a1,a5
    80005956:	853a                	mv	a0,a4
    80005958:	fffff097          	auipc	ra,0xfffff
    8000595c:	1a0080e7          	jalr	416(ra) # 80004af8 <bread>
    80005960:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005964:	fe043783          	ld	a5,-32(s0)
    80005968:	05878793          	addi	a5,a5,88
    8000596c:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005970:	fe042423          	sw	zero,-24(s0)
    80005974:	a081                	j	800059b4 <itrunc+0xec>
      if(a[j])
    80005976:	fe842783          	lw	a5,-24(s0)
    8000597a:	078a                	slli	a5,a5,0x2
    8000597c:	fd843703          	ld	a4,-40(s0)
    80005980:	97ba                	add	a5,a5,a4
    80005982:	439c                	lw	a5,0(a5)
    80005984:	c39d                	beqz	a5,800059aa <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005986:	fc843783          	ld	a5,-56(s0)
    8000598a:	439c                	lw	a5,0(a5)
    8000598c:	0007869b          	sext.w	a3,a5
    80005990:	fe842783          	lw	a5,-24(s0)
    80005994:	078a                	slli	a5,a5,0x2
    80005996:	fd843703          	ld	a4,-40(s0)
    8000599a:	97ba                	add	a5,a5,a4
    8000599c:	439c                	lw	a5,0(a5)
    8000599e:	85be                	mv	a1,a5
    800059a0:	8536                	mv	a0,a3
    800059a2:	fffff097          	auipc	ra,0xfffff
    800059a6:	64e080e7          	jalr	1614(ra) # 80004ff0 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800059aa:	fe842783          	lw	a5,-24(s0)
    800059ae:	2785                	addiw	a5,a5,1
    800059b0:	fef42423          	sw	a5,-24(s0)
    800059b4:	fe842783          	lw	a5,-24(s0)
    800059b8:	873e                	mv	a4,a5
    800059ba:	0ff00793          	li	a5,255
    800059be:	fae7fce3          	bgeu	a5,a4,80005976 <itrunc+0xae>
    }
    brelse(bp);
    800059c2:	fe043503          	ld	a0,-32(s0)
    800059c6:	fffff097          	auipc	ra,0xfffff
    800059ca:	1d4080e7          	jalr	468(ra) # 80004b9a <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800059ce:	fc843783          	ld	a5,-56(s0)
    800059d2:	439c                	lw	a5,0(a5)
    800059d4:	0007871b          	sext.w	a4,a5
    800059d8:	fc843783          	ld	a5,-56(s0)
    800059dc:	0807a783          	lw	a5,128(a5)
    800059e0:	85be                	mv	a1,a5
    800059e2:	853a                	mv	a0,a4
    800059e4:	fffff097          	auipc	ra,0xfffff
    800059e8:	60c080e7          	jalr	1548(ra) # 80004ff0 <bfree>
    ip->addrs[NDIRECT] = 0;
    800059ec:	fc843783          	ld	a5,-56(s0)
    800059f0:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    800059f4:	fc843783          	ld	a5,-56(s0)
    800059f8:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    800059fc:	fc843503          	ld	a0,-56(s0)
    80005a00:	00000097          	auipc	ra,0x0
    80005a04:	890080e7          	jalr	-1904(ra) # 80005290 <iupdate>
}
    80005a08:	0001                	nop
    80005a0a:	70e2                	ld	ra,56(sp)
    80005a0c:	7442                	ld	s0,48(sp)
    80005a0e:	6121                	addi	sp,sp,64
    80005a10:	8082                	ret

0000000080005a12 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005a12:	1101                	addi	sp,sp,-32
    80005a14:	ec22                	sd	s0,24(sp)
    80005a16:	1000                	addi	s0,sp,32
    80005a18:	fea43423          	sd	a0,-24(s0)
    80005a1c:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005a20:	fe843783          	ld	a5,-24(s0)
    80005a24:	439c                	lw	a5,0(a5)
    80005a26:	0007871b          	sext.w	a4,a5
    80005a2a:	fe043783          	ld	a5,-32(s0)
    80005a2e:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005a30:	fe843783          	ld	a5,-24(s0)
    80005a34:	43d8                	lw	a4,4(a5)
    80005a36:	fe043783          	ld	a5,-32(s0)
    80005a3a:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80005a3c:	fe843783          	ld	a5,-24(s0)
    80005a40:	04479703          	lh	a4,68(a5)
    80005a44:	fe043783          	ld	a5,-32(s0)
    80005a48:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005a4c:	fe843783          	ld	a5,-24(s0)
    80005a50:	04a79703          	lh	a4,74(a5)
    80005a54:	fe043783          	ld	a5,-32(s0)
    80005a58:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005a5c:	fe843783          	ld	a5,-24(s0)
    80005a60:	47fc                	lw	a5,76(a5)
    80005a62:	02079713          	slli	a4,a5,0x20
    80005a66:	9301                	srli	a4,a4,0x20
    80005a68:	fe043783          	ld	a5,-32(s0)
    80005a6c:	eb98                	sd	a4,16(a5)
}
    80005a6e:	0001                	nop
    80005a70:	6462                	ld	s0,24(sp)
    80005a72:	6105                	addi	sp,sp,32
    80005a74:	8082                	ret

0000000080005a76 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005a76:	711d                	addi	sp,sp,-96
    80005a78:	ec86                	sd	ra,88(sp)
    80005a7a:	e8a2                	sd	s0,80(sp)
    80005a7c:	e4a6                	sd	s1,72(sp)
    80005a7e:	1080                	addi	s0,sp,96
    80005a80:	faa43c23          	sd	a0,-72(s0)
    80005a84:	87ae                	mv	a5,a1
    80005a86:	fac43423          	sd	a2,-88(s0)
    80005a8a:	faf42a23          	sw	a5,-76(s0)
    80005a8e:	87b6                	mv	a5,a3
    80005a90:	faf42823          	sw	a5,-80(s0)
    80005a94:	87ba                	mv	a5,a4
    80005a96:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a9a:	fb843783          	ld	a5,-72(s0)
    80005a9e:	47f8                	lw	a4,76(a5)
    80005aa0:	fb042783          	lw	a5,-80(s0)
    80005aa4:	2781                	sext.w	a5,a5
    80005aa6:	00f76e63          	bltu	a4,a5,80005ac2 <readi+0x4c>
    80005aaa:	fb042703          	lw	a4,-80(s0)
    80005aae:	fa442783          	lw	a5,-92(s0)
    80005ab2:	9fb9                	addw	a5,a5,a4
    80005ab4:	0007871b          	sext.w	a4,a5
    80005ab8:	fb042783          	lw	a5,-80(s0)
    80005abc:	2781                	sext.w	a5,a5
    80005abe:	00f77463          	bgeu	a4,a5,80005ac6 <readi+0x50>
    return 0;
    80005ac2:	4781                	li	a5,0
    80005ac4:	aa05                	j	80005bf4 <readi+0x17e>
  if(off + n > ip->size)
    80005ac6:	fb042703          	lw	a4,-80(s0)
    80005aca:	fa442783          	lw	a5,-92(s0)
    80005ace:	9fb9                	addw	a5,a5,a4
    80005ad0:	0007871b          	sext.w	a4,a5
    80005ad4:	fb843783          	ld	a5,-72(s0)
    80005ad8:	47fc                	lw	a5,76(a5)
    80005ada:	00e7fb63          	bgeu	a5,a4,80005af0 <readi+0x7a>
    n = ip->size - off;
    80005ade:	fb843783          	ld	a5,-72(s0)
    80005ae2:	47f8                	lw	a4,76(a5)
    80005ae4:	fb042783          	lw	a5,-80(s0)
    80005ae8:	40f707bb          	subw	a5,a4,a5
    80005aec:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005af0:	fc042e23          	sw	zero,-36(s0)
    80005af4:	a0f5                	j	80005be0 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005af6:	fb843783          	ld	a5,-72(s0)
    80005afa:	4384                	lw	s1,0(a5)
    80005afc:	fb042783          	lw	a5,-80(s0)
    80005b00:	00a7d79b          	srliw	a5,a5,0xa
    80005b04:	2781                	sext.w	a5,a5
    80005b06:	85be                	mv	a1,a5
    80005b08:	fb843503          	ld	a0,-72(s0)
    80005b0c:	00000097          	auipc	ra,0x0
    80005b10:	c60080e7          	jalr	-928(ra) # 8000576c <bmap>
    80005b14:	87aa                	mv	a5,a0
    80005b16:	2781                	sext.w	a5,a5
    80005b18:	85be                	mv	a1,a5
    80005b1a:	8526                	mv	a0,s1
    80005b1c:	fffff097          	auipc	ra,0xfffff
    80005b20:	fdc080e7          	jalr	-36(ra) # 80004af8 <bread>
    80005b24:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005b28:	fb042783          	lw	a5,-80(s0)
    80005b2c:	3ff7f793          	andi	a5,a5,1023
    80005b30:	2781                	sext.w	a5,a5
    80005b32:	40000713          	li	a4,1024
    80005b36:	40f707bb          	subw	a5,a4,a5
    80005b3a:	0007869b          	sext.w	a3,a5
    80005b3e:	fa442703          	lw	a4,-92(s0)
    80005b42:	fdc42783          	lw	a5,-36(s0)
    80005b46:	40f707bb          	subw	a5,a4,a5
    80005b4a:	2781                	sext.w	a5,a5
    80005b4c:	863e                	mv	a2,a5
    80005b4e:	87b6                	mv	a5,a3
    80005b50:	0007869b          	sext.w	a3,a5
    80005b54:	0006071b          	sext.w	a4,a2
    80005b58:	00d77363          	bgeu	a4,a3,80005b5e <readi+0xe8>
    80005b5c:	87b2                	mv	a5,a2
    80005b5e:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005b62:	fd043783          	ld	a5,-48(s0)
    80005b66:	05878713          	addi	a4,a5,88
    80005b6a:	fb046783          	lwu	a5,-80(s0)
    80005b6e:	3ff7f793          	andi	a5,a5,1023
    80005b72:	973e                	add	a4,a4,a5
    80005b74:	fcc46683          	lwu	a3,-52(s0)
    80005b78:	fb442783          	lw	a5,-76(s0)
    80005b7c:	863a                	mv	a2,a4
    80005b7e:	fa843583          	ld	a1,-88(s0)
    80005b82:	853e                	mv	a0,a5
    80005b84:	ffffe097          	auipc	ra,0xffffe
    80005b88:	e06080e7          	jalr	-506(ra) # 8000398a <either_copyout>
    80005b8c:	87aa                	mv	a5,a0
    80005b8e:	873e                	mv	a4,a5
    80005b90:	57fd                	li	a5,-1
    80005b92:	00f71c63          	bne	a4,a5,80005baa <readi+0x134>
      brelse(bp);
    80005b96:	fd043503          	ld	a0,-48(s0)
    80005b9a:	fffff097          	auipc	ra,0xfffff
    80005b9e:	000080e7          	jalr	ra # 80004b9a <brelse>
      tot = -1;
    80005ba2:	57fd                	li	a5,-1
    80005ba4:	fcf42e23          	sw	a5,-36(s0)
      break;
    80005ba8:	a0a1                	j	80005bf0 <readi+0x17a>
    }
    brelse(bp);
    80005baa:	fd043503          	ld	a0,-48(s0)
    80005bae:	fffff097          	auipc	ra,0xfffff
    80005bb2:	fec080e7          	jalr	-20(ra) # 80004b9a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005bb6:	fdc42703          	lw	a4,-36(s0)
    80005bba:	fcc42783          	lw	a5,-52(s0)
    80005bbe:	9fb9                	addw	a5,a5,a4
    80005bc0:	fcf42e23          	sw	a5,-36(s0)
    80005bc4:	fb042703          	lw	a4,-80(s0)
    80005bc8:	fcc42783          	lw	a5,-52(s0)
    80005bcc:	9fb9                	addw	a5,a5,a4
    80005bce:	faf42823          	sw	a5,-80(s0)
    80005bd2:	fcc46783          	lwu	a5,-52(s0)
    80005bd6:	fa843703          	ld	a4,-88(s0)
    80005bda:	97ba                	add	a5,a5,a4
    80005bdc:	faf43423          	sd	a5,-88(s0)
    80005be0:	fdc42703          	lw	a4,-36(s0)
    80005be4:	fa442783          	lw	a5,-92(s0)
    80005be8:	2701                	sext.w	a4,a4
    80005bea:	2781                	sext.w	a5,a5
    80005bec:	f0f765e3          	bltu	a4,a5,80005af6 <readi+0x80>
  }
  return tot;
    80005bf0:	fdc42783          	lw	a5,-36(s0)
}
    80005bf4:	853e                	mv	a0,a5
    80005bf6:	60e6                	ld	ra,88(sp)
    80005bf8:	6446                	ld	s0,80(sp)
    80005bfa:	64a6                	ld	s1,72(sp)
    80005bfc:	6125                	addi	sp,sp,96
    80005bfe:	8082                	ret

0000000080005c00 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005c00:	711d                	addi	sp,sp,-96
    80005c02:	ec86                	sd	ra,88(sp)
    80005c04:	e8a2                	sd	s0,80(sp)
    80005c06:	e4a6                	sd	s1,72(sp)
    80005c08:	1080                	addi	s0,sp,96
    80005c0a:	faa43c23          	sd	a0,-72(s0)
    80005c0e:	87ae                	mv	a5,a1
    80005c10:	fac43423          	sd	a2,-88(s0)
    80005c14:	faf42a23          	sw	a5,-76(s0)
    80005c18:	87b6                	mv	a5,a3
    80005c1a:	faf42823          	sw	a5,-80(s0)
    80005c1e:	87ba                	mv	a5,a4
    80005c20:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005c24:	fb843783          	ld	a5,-72(s0)
    80005c28:	47f8                	lw	a4,76(a5)
    80005c2a:	fb042783          	lw	a5,-80(s0)
    80005c2e:	2781                	sext.w	a5,a5
    80005c30:	00f76e63          	bltu	a4,a5,80005c4c <writei+0x4c>
    80005c34:	fb042703          	lw	a4,-80(s0)
    80005c38:	fa442783          	lw	a5,-92(s0)
    80005c3c:	9fb9                	addw	a5,a5,a4
    80005c3e:	0007871b          	sext.w	a4,a5
    80005c42:	fb042783          	lw	a5,-80(s0)
    80005c46:	2781                	sext.w	a5,a5
    80005c48:	00f77463          	bgeu	a4,a5,80005c50 <writei+0x50>
    return -1;
    80005c4c:	57fd                	li	a5,-1
    80005c4e:	a2b1                	j	80005d9a <writei+0x19a>
  if(off + n > MAXFILE*BSIZE)
    80005c50:	fb042703          	lw	a4,-80(s0)
    80005c54:	fa442783          	lw	a5,-92(s0)
    80005c58:	9fb9                	addw	a5,a5,a4
    80005c5a:	2781                	sext.w	a5,a5
    80005c5c:	873e                	mv	a4,a5
    80005c5e:	000437b7          	lui	a5,0x43
    80005c62:	00e7f463          	bgeu	a5,a4,80005c6a <writei+0x6a>
    return -1;
    80005c66:	57fd                	li	a5,-1
    80005c68:	aa0d                	j	80005d9a <writei+0x19a>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005c6a:	fc042e23          	sw	zero,-36(s0)
    80005c6e:	a8cd                	j	80005d60 <writei+0x160>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005c70:	fb843783          	ld	a5,-72(s0)
    80005c74:	4384                	lw	s1,0(a5)
    80005c76:	fb042783          	lw	a5,-80(s0)
    80005c7a:	00a7d79b          	srliw	a5,a5,0xa
    80005c7e:	2781                	sext.w	a5,a5
    80005c80:	85be                	mv	a1,a5
    80005c82:	fb843503          	ld	a0,-72(s0)
    80005c86:	00000097          	auipc	ra,0x0
    80005c8a:	ae6080e7          	jalr	-1306(ra) # 8000576c <bmap>
    80005c8e:	87aa                	mv	a5,a0
    80005c90:	2781                	sext.w	a5,a5
    80005c92:	85be                	mv	a1,a5
    80005c94:	8526                	mv	a0,s1
    80005c96:	fffff097          	auipc	ra,0xfffff
    80005c9a:	e62080e7          	jalr	-414(ra) # 80004af8 <bread>
    80005c9e:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005ca2:	fb042783          	lw	a5,-80(s0)
    80005ca6:	3ff7f793          	andi	a5,a5,1023
    80005caa:	2781                	sext.w	a5,a5
    80005cac:	40000713          	li	a4,1024
    80005cb0:	40f707bb          	subw	a5,a4,a5
    80005cb4:	0007869b          	sext.w	a3,a5
    80005cb8:	fa442703          	lw	a4,-92(s0)
    80005cbc:	fdc42783          	lw	a5,-36(s0)
    80005cc0:	40f707bb          	subw	a5,a4,a5
    80005cc4:	2781                	sext.w	a5,a5
    80005cc6:	863e                	mv	a2,a5
    80005cc8:	87b6                	mv	a5,a3
    80005cca:	0007869b          	sext.w	a3,a5
    80005cce:	0006071b          	sext.w	a4,a2
    80005cd2:	00d77363          	bgeu	a4,a3,80005cd8 <writei+0xd8>
    80005cd6:	87b2                	mv	a5,a2
    80005cd8:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005cdc:	fd043783          	ld	a5,-48(s0)
    80005ce0:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005ce4:	fb046783          	lwu	a5,-80(s0)
    80005ce8:	3ff7f793          	andi	a5,a5,1023
    80005cec:	97ba                	add	a5,a5,a4
    80005cee:	fcc46683          	lwu	a3,-52(s0)
    80005cf2:	fb442703          	lw	a4,-76(s0)
    80005cf6:	fa843603          	ld	a2,-88(s0)
    80005cfa:	85ba                	mv	a1,a4
    80005cfc:	853e                	mv	a0,a5
    80005cfe:	ffffe097          	auipc	ra,0xffffe
    80005d02:	d00080e7          	jalr	-768(ra) # 800039fe <either_copyin>
    80005d06:	87aa                	mv	a5,a0
    80005d08:	873e                	mv	a4,a5
    80005d0a:	57fd                	li	a5,-1
    80005d0c:	00f71963          	bne	a4,a5,80005d1e <writei+0x11e>
      brelse(bp);
    80005d10:	fd043503          	ld	a0,-48(s0)
    80005d14:	fffff097          	auipc	ra,0xfffff
    80005d18:	e86080e7          	jalr	-378(ra) # 80004b9a <brelse>
      break;
    80005d1c:	a891                	j	80005d70 <writei+0x170>
    }
    log_write(bp);
    80005d1e:	fd043503          	ld	a0,-48(s0)
    80005d22:	00001097          	auipc	ra,0x1
    80005d26:	af6080e7          	jalr	-1290(ra) # 80006818 <log_write>
    brelse(bp);
    80005d2a:	fd043503          	ld	a0,-48(s0)
    80005d2e:	fffff097          	auipc	ra,0xfffff
    80005d32:	e6c080e7          	jalr	-404(ra) # 80004b9a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005d36:	fdc42703          	lw	a4,-36(s0)
    80005d3a:	fcc42783          	lw	a5,-52(s0)
    80005d3e:	9fb9                	addw	a5,a5,a4
    80005d40:	fcf42e23          	sw	a5,-36(s0)
    80005d44:	fb042703          	lw	a4,-80(s0)
    80005d48:	fcc42783          	lw	a5,-52(s0)
    80005d4c:	9fb9                	addw	a5,a5,a4
    80005d4e:	faf42823          	sw	a5,-80(s0)
    80005d52:	fcc46783          	lwu	a5,-52(s0)
    80005d56:	fa843703          	ld	a4,-88(s0)
    80005d5a:	97ba                	add	a5,a5,a4
    80005d5c:	faf43423          	sd	a5,-88(s0)
    80005d60:	fdc42703          	lw	a4,-36(s0)
    80005d64:	fa442783          	lw	a5,-92(s0)
    80005d68:	2701                	sext.w	a4,a4
    80005d6a:	2781                	sext.w	a5,a5
    80005d6c:	f0f762e3          	bltu	a4,a5,80005c70 <writei+0x70>
  }

  if(off > ip->size)
    80005d70:	fb843783          	ld	a5,-72(s0)
    80005d74:	47f8                	lw	a4,76(a5)
    80005d76:	fb042783          	lw	a5,-80(s0)
    80005d7a:	2781                	sext.w	a5,a5
    80005d7c:	00f77763          	bgeu	a4,a5,80005d8a <writei+0x18a>
    ip->size = off;
    80005d80:	fb843783          	ld	a5,-72(s0)
    80005d84:	fb042703          	lw	a4,-80(s0)
    80005d88:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005d8a:	fb843503          	ld	a0,-72(s0)
    80005d8e:	fffff097          	auipc	ra,0xfffff
    80005d92:	502080e7          	jalr	1282(ra) # 80005290 <iupdate>

  return tot;
    80005d96:	fdc42783          	lw	a5,-36(s0)
}
    80005d9a:	853e                	mv	a0,a5
    80005d9c:	60e6                	ld	ra,88(sp)
    80005d9e:	6446                	ld	s0,80(sp)
    80005da0:	64a6                	ld	s1,72(sp)
    80005da2:	6125                	addi	sp,sp,96
    80005da4:	8082                	ret

0000000080005da6 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005da6:	1101                	addi	sp,sp,-32
    80005da8:	ec06                	sd	ra,24(sp)
    80005daa:	e822                	sd	s0,16(sp)
    80005dac:	1000                	addi	s0,sp,32
    80005dae:	fea43423          	sd	a0,-24(s0)
    80005db2:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005db6:	4639                	li	a2,14
    80005db8:	fe043583          	ld	a1,-32(s0)
    80005dbc:	fe843503          	ld	a0,-24(s0)
    80005dc0:	ffffc097          	auipc	ra,0xffffc
    80005dc4:	87a080e7          	jalr	-1926(ra) # 8000163a <strncmp>
    80005dc8:	87aa                	mv	a5,a0
}
    80005dca:	853e                	mv	a0,a5
    80005dcc:	60e2                	ld	ra,24(sp)
    80005dce:	6442                	ld	s0,16(sp)
    80005dd0:	6105                	addi	sp,sp,32
    80005dd2:	8082                	ret

0000000080005dd4 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005dd4:	715d                	addi	sp,sp,-80
    80005dd6:	e486                	sd	ra,72(sp)
    80005dd8:	e0a2                	sd	s0,64(sp)
    80005dda:	0880                	addi	s0,sp,80
    80005ddc:	fca43423          	sd	a0,-56(s0)
    80005de0:	fcb43023          	sd	a1,-64(s0)
    80005de4:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005de8:	fc843783          	ld	a5,-56(s0)
    80005dec:	04479783          	lh	a5,68(a5)
    80005df0:	0007871b          	sext.w	a4,a5
    80005df4:	4785                	li	a5,1
    80005df6:	00f70a63          	beq	a4,a5,80005e0a <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005dfa:	00005517          	auipc	a0,0x5
    80005dfe:	74e50513          	addi	a0,a0,1870 # 8000b548 <etext+0x548>
    80005e02:	ffffb097          	auipc	ra,0xffffb
    80005e06:	e7c080e7          	jalr	-388(ra) # 80000c7e <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e0a:	fe042623          	sw	zero,-20(s0)
    80005e0e:	a849                	j	80005ea0 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005e10:	fd840793          	addi	a5,s0,-40
    80005e14:	fec42683          	lw	a3,-20(s0)
    80005e18:	4741                	li	a4,16
    80005e1a:	863e                	mv	a2,a5
    80005e1c:	4581                	li	a1,0
    80005e1e:	fc843503          	ld	a0,-56(s0)
    80005e22:	00000097          	auipc	ra,0x0
    80005e26:	c54080e7          	jalr	-940(ra) # 80005a76 <readi>
    80005e2a:	87aa                	mv	a5,a0
    80005e2c:	873e                	mv	a4,a5
    80005e2e:	47c1                	li	a5,16
    80005e30:	00f70a63          	beq	a4,a5,80005e44 <dirlookup+0x70>
      panic("dirlookup read");
    80005e34:	00005517          	auipc	a0,0x5
    80005e38:	72c50513          	addi	a0,a0,1836 # 8000b560 <etext+0x560>
    80005e3c:	ffffb097          	auipc	ra,0xffffb
    80005e40:	e42080e7          	jalr	-446(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005e44:	fd845783          	lhu	a5,-40(s0)
    80005e48:	c7b1                	beqz	a5,80005e94 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005e4a:	fd840793          	addi	a5,s0,-40
    80005e4e:	0789                	addi	a5,a5,2
    80005e50:	85be                	mv	a1,a5
    80005e52:	fc043503          	ld	a0,-64(s0)
    80005e56:	00000097          	auipc	ra,0x0
    80005e5a:	f50080e7          	jalr	-176(ra) # 80005da6 <namecmp>
    80005e5e:	87aa                	mv	a5,a0
    80005e60:	eb9d                	bnez	a5,80005e96 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005e62:	fb843783          	ld	a5,-72(s0)
    80005e66:	c791                	beqz	a5,80005e72 <dirlookup+0x9e>
        *poff = off;
    80005e68:	fb843783          	ld	a5,-72(s0)
    80005e6c:	fec42703          	lw	a4,-20(s0)
    80005e70:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005e72:	fd845783          	lhu	a5,-40(s0)
    80005e76:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005e7a:	fc843783          	ld	a5,-56(s0)
    80005e7e:	439c                	lw	a5,0(a5)
    80005e80:	fe842703          	lw	a4,-24(s0)
    80005e84:	85ba                	mv	a1,a4
    80005e86:	853e                	mv	a0,a5
    80005e88:	fffff097          	auipc	ra,0xfffff
    80005e8c:	4f0080e7          	jalr	1264(ra) # 80005378 <iget>
    80005e90:	87aa                	mv	a5,a0
    80005e92:	a005                	j	80005eb2 <dirlookup+0xde>
      continue;
    80005e94:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e96:	fec42783          	lw	a5,-20(s0)
    80005e9a:	27c1                	addiw	a5,a5,16
    80005e9c:	fef42623          	sw	a5,-20(s0)
    80005ea0:	fc843783          	ld	a5,-56(s0)
    80005ea4:	47f8                	lw	a4,76(a5)
    80005ea6:	fec42783          	lw	a5,-20(s0)
    80005eaa:	2781                	sext.w	a5,a5
    80005eac:	f6e7e2e3          	bltu	a5,a4,80005e10 <dirlookup+0x3c>
    }
  }

  return 0;
    80005eb0:	4781                	li	a5,0
}
    80005eb2:	853e                	mv	a0,a5
    80005eb4:	60a6                	ld	ra,72(sp)
    80005eb6:	6406                	ld	s0,64(sp)
    80005eb8:	6161                	addi	sp,sp,80
    80005eba:	8082                	ret

0000000080005ebc <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005ebc:	715d                	addi	sp,sp,-80
    80005ebe:	e486                	sd	ra,72(sp)
    80005ec0:	e0a2                	sd	s0,64(sp)
    80005ec2:	0880                	addi	s0,sp,80
    80005ec4:	fca43423          	sd	a0,-56(s0)
    80005ec8:	fcb43023          	sd	a1,-64(s0)
    80005ecc:	87b2                	mv	a5,a2
    80005ece:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005ed2:	4601                	li	a2,0
    80005ed4:	fc043583          	ld	a1,-64(s0)
    80005ed8:	fc843503          	ld	a0,-56(s0)
    80005edc:	00000097          	auipc	ra,0x0
    80005ee0:	ef8080e7          	jalr	-264(ra) # 80005dd4 <dirlookup>
    80005ee4:	fea43023          	sd	a0,-32(s0)
    80005ee8:	fe043783          	ld	a5,-32(s0)
    80005eec:	cb89                	beqz	a5,80005efe <dirlink+0x42>
    iput(ip);
    80005eee:	fe043503          	ld	a0,-32(s0)
    80005ef2:	fffff097          	auipc	ra,0xfffff
    80005ef6:	77c080e7          	jalr	1916(ra) # 8000566e <iput>
    return -1;
    80005efa:	57fd                	li	a5,-1
    80005efc:	a865                	j	80005fb4 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005efe:	fe042623          	sw	zero,-20(s0)
    80005f02:	a0a1                	j	80005f4a <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005f04:	fd040793          	addi	a5,s0,-48
    80005f08:	fec42683          	lw	a3,-20(s0)
    80005f0c:	4741                	li	a4,16
    80005f0e:	863e                	mv	a2,a5
    80005f10:	4581                	li	a1,0
    80005f12:	fc843503          	ld	a0,-56(s0)
    80005f16:	00000097          	auipc	ra,0x0
    80005f1a:	b60080e7          	jalr	-1184(ra) # 80005a76 <readi>
    80005f1e:	87aa                	mv	a5,a0
    80005f20:	873e                	mv	a4,a5
    80005f22:	47c1                	li	a5,16
    80005f24:	00f70a63          	beq	a4,a5,80005f38 <dirlink+0x7c>
      panic("dirlink read");
    80005f28:	00005517          	auipc	a0,0x5
    80005f2c:	64850513          	addi	a0,a0,1608 # 8000b570 <etext+0x570>
    80005f30:	ffffb097          	auipc	ra,0xffffb
    80005f34:	d4e080e7          	jalr	-690(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005f38:	fd045783          	lhu	a5,-48(s0)
    80005f3c:	cf99                	beqz	a5,80005f5a <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005f3e:	fec42783          	lw	a5,-20(s0)
    80005f42:	27c1                	addiw	a5,a5,16
    80005f44:	2781                	sext.w	a5,a5
    80005f46:	fef42623          	sw	a5,-20(s0)
    80005f4a:	fc843783          	ld	a5,-56(s0)
    80005f4e:	47f8                	lw	a4,76(a5)
    80005f50:	fec42783          	lw	a5,-20(s0)
    80005f54:	fae7e8e3          	bltu	a5,a4,80005f04 <dirlink+0x48>
    80005f58:	a011                	j	80005f5c <dirlink+0xa0>
      break;
    80005f5a:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005f5c:	fd040793          	addi	a5,s0,-48
    80005f60:	0789                	addi	a5,a5,2
    80005f62:	4639                	li	a2,14
    80005f64:	fc043583          	ld	a1,-64(s0)
    80005f68:	853e                	mv	a0,a5
    80005f6a:	ffffb097          	auipc	ra,0xffffb
    80005f6e:	75a080e7          	jalr	1882(ra) # 800016c4 <strncpy>
  de.inum = inum;
    80005f72:	fbc42783          	lw	a5,-68(s0)
    80005f76:	17c2                	slli	a5,a5,0x30
    80005f78:	93c1                	srli	a5,a5,0x30
    80005f7a:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005f7e:	fd040793          	addi	a5,s0,-48
    80005f82:	fec42683          	lw	a3,-20(s0)
    80005f86:	4741                	li	a4,16
    80005f88:	863e                	mv	a2,a5
    80005f8a:	4581                	li	a1,0
    80005f8c:	fc843503          	ld	a0,-56(s0)
    80005f90:	00000097          	auipc	ra,0x0
    80005f94:	c70080e7          	jalr	-912(ra) # 80005c00 <writei>
    80005f98:	87aa                	mv	a5,a0
    80005f9a:	873e                	mv	a4,a5
    80005f9c:	47c1                	li	a5,16
    80005f9e:	00f70a63          	beq	a4,a5,80005fb2 <dirlink+0xf6>
    panic("dirlink");
    80005fa2:	00005517          	auipc	a0,0x5
    80005fa6:	5de50513          	addi	a0,a0,1502 # 8000b580 <etext+0x580>
    80005faa:	ffffb097          	auipc	ra,0xffffb
    80005fae:	cd4080e7          	jalr	-812(ra) # 80000c7e <panic>

  return 0;
    80005fb2:	4781                	li	a5,0
}
    80005fb4:	853e                	mv	a0,a5
    80005fb6:	60a6                	ld	ra,72(sp)
    80005fb8:	6406                	ld	s0,64(sp)
    80005fba:	6161                	addi	sp,sp,80
    80005fbc:	8082                	ret

0000000080005fbe <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005fbe:	7179                	addi	sp,sp,-48
    80005fc0:	f406                	sd	ra,40(sp)
    80005fc2:	f022                	sd	s0,32(sp)
    80005fc4:	1800                	addi	s0,sp,48
    80005fc6:	fca43c23          	sd	a0,-40(s0)
    80005fca:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005fce:	a031                	j	80005fda <skipelem+0x1c>
    path++;
    80005fd0:	fd843783          	ld	a5,-40(s0)
    80005fd4:	0785                	addi	a5,a5,1
    80005fd6:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005fda:	fd843783          	ld	a5,-40(s0)
    80005fde:	0007c783          	lbu	a5,0(a5)
    80005fe2:	873e                	mv	a4,a5
    80005fe4:	02f00793          	li	a5,47
    80005fe8:	fef704e3          	beq	a4,a5,80005fd0 <skipelem+0x12>
  if(*path == 0)
    80005fec:	fd843783          	ld	a5,-40(s0)
    80005ff0:	0007c783          	lbu	a5,0(a5)
    80005ff4:	e399                	bnez	a5,80005ffa <skipelem+0x3c>
    return 0;
    80005ff6:	4781                	li	a5,0
    80005ff8:	a06d                	j	800060a2 <skipelem+0xe4>
  s = path;
    80005ffa:	fd843783          	ld	a5,-40(s0)
    80005ffe:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80006002:	a031                	j	8000600e <skipelem+0x50>
    path++;
    80006004:	fd843783          	ld	a5,-40(s0)
    80006008:	0785                	addi	a5,a5,1
    8000600a:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    8000600e:	fd843783          	ld	a5,-40(s0)
    80006012:	0007c783          	lbu	a5,0(a5)
    80006016:	873e                	mv	a4,a5
    80006018:	02f00793          	li	a5,47
    8000601c:	00f70763          	beq	a4,a5,8000602a <skipelem+0x6c>
    80006020:	fd843783          	ld	a5,-40(s0)
    80006024:	0007c783          	lbu	a5,0(a5)
    80006028:	fff1                	bnez	a5,80006004 <skipelem+0x46>
  len = path - s;
    8000602a:	fd843703          	ld	a4,-40(s0)
    8000602e:	fe843783          	ld	a5,-24(s0)
    80006032:	40f707b3          	sub	a5,a4,a5
    80006036:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    8000603a:	fe442783          	lw	a5,-28(s0)
    8000603e:	0007871b          	sext.w	a4,a5
    80006042:	47b5                	li	a5,13
    80006044:	00e7dc63          	bge	a5,a4,8000605c <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80006048:	4639                	li	a2,14
    8000604a:	fe843583          	ld	a1,-24(s0)
    8000604e:	fd043503          	ld	a0,-48(s0)
    80006052:	ffffb097          	auipc	ra,0xffffb
    80006056:	4d4080e7          	jalr	1236(ra) # 80001526 <memmove>
    8000605a:	a80d                	j	8000608c <skipelem+0xce>
  else {
    memmove(name, s, len);
    8000605c:	fe442783          	lw	a5,-28(s0)
    80006060:	863e                	mv	a2,a5
    80006062:	fe843583          	ld	a1,-24(s0)
    80006066:	fd043503          	ld	a0,-48(s0)
    8000606a:	ffffb097          	auipc	ra,0xffffb
    8000606e:	4bc080e7          	jalr	1212(ra) # 80001526 <memmove>
    name[len] = 0;
    80006072:	fe442783          	lw	a5,-28(s0)
    80006076:	fd043703          	ld	a4,-48(s0)
    8000607a:	97ba                	add	a5,a5,a4
    8000607c:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80006080:	a031                	j	8000608c <skipelem+0xce>
    path++;
    80006082:	fd843783          	ld	a5,-40(s0)
    80006086:	0785                	addi	a5,a5,1
    80006088:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    8000608c:	fd843783          	ld	a5,-40(s0)
    80006090:	0007c783          	lbu	a5,0(a5)
    80006094:	873e                	mv	a4,a5
    80006096:	02f00793          	li	a5,47
    8000609a:	fef704e3          	beq	a4,a5,80006082 <skipelem+0xc4>
  return path;
    8000609e:	fd843783          	ld	a5,-40(s0)
}
    800060a2:	853e                	mv	a0,a5
    800060a4:	70a2                	ld	ra,40(sp)
    800060a6:	7402                	ld	s0,32(sp)
    800060a8:	6145                	addi	sp,sp,48
    800060aa:	8082                	ret

00000000800060ac <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    800060ac:	7139                	addi	sp,sp,-64
    800060ae:	fc06                	sd	ra,56(sp)
    800060b0:	f822                	sd	s0,48(sp)
    800060b2:	0080                	addi	s0,sp,64
    800060b4:	fca43c23          	sd	a0,-40(s0)
    800060b8:	87ae                	mv	a5,a1
    800060ba:	fcc43423          	sd	a2,-56(s0)
    800060be:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    800060c2:	fd843783          	ld	a5,-40(s0)
    800060c6:	0007c783          	lbu	a5,0(a5)
    800060ca:	873e                	mv	a4,a5
    800060cc:	02f00793          	li	a5,47
    800060d0:	00f71b63          	bne	a4,a5,800060e6 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    800060d4:	4585                	li	a1,1
    800060d6:	4505                	li	a0,1
    800060d8:	fffff097          	auipc	ra,0xfffff
    800060dc:	2a0080e7          	jalr	672(ra) # 80005378 <iget>
    800060e0:	fea43423          	sd	a0,-24(s0)
    800060e4:	a84d                	j	80006196 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    800060e6:	ffffc097          	auipc	ra,0xffffc
    800060ea:	732080e7          	jalr	1842(ra) # 80002818 <myproc>
    800060ee:	87aa                	mv	a5,a0
    800060f0:	1507b783          	ld	a5,336(a5)
    800060f4:	853e                	mv	a0,a5
    800060f6:	fffff097          	auipc	ra,0xfffff
    800060fa:	39e080e7          	jalr	926(ra) # 80005494 <idup>
    800060fe:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80006102:	a851                	j	80006196 <namex+0xea>
    ilock(ip);
    80006104:	fe843503          	ld	a0,-24(s0)
    80006108:	fffff097          	auipc	ra,0xfffff
    8000610c:	3d8080e7          	jalr	984(ra) # 800054e0 <ilock>
    if(ip->type != T_DIR){
    80006110:	fe843783          	ld	a5,-24(s0)
    80006114:	04479783          	lh	a5,68(a5)
    80006118:	0007871b          	sext.w	a4,a5
    8000611c:	4785                	li	a5,1
    8000611e:	00f70a63          	beq	a4,a5,80006132 <namex+0x86>
      iunlockput(ip);
    80006122:	fe843503          	ld	a0,-24(s0)
    80006126:	fffff097          	auipc	ra,0xfffff
    8000612a:	618080e7          	jalr	1560(ra) # 8000573e <iunlockput>
      return 0;
    8000612e:	4781                	li	a5,0
    80006130:	a871                	j	800061cc <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80006132:	fd442783          	lw	a5,-44(s0)
    80006136:	2781                	sext.w	a5,a5
    80006138:	cf99                	beqz	a5,80006156 <namex+0xaa>
    8000613a:	fd843783          	ld	a5,-40(s0)
    8000613e:	0007c783          	lbu	a5,0(a5)
    80006142:	eb91                	bnez	a5,80006156 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80006144:	fe843503          	ld	a0,-24(s0)
    80006148:	fffff097          	auipc	ra,0xfffff
    8000614c:	4cc080e7          	jalr	1228(ra) # 80005614 <iunlock>
      return ip;
    80006150:	fe843783          	ld	a5,-24(s0)
    80006154:	a8a5                	j	800061cc <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80006156:	4601                	li	a2,0
    80006158:	fc843583          	ld	a1,-56(s0)
    8000615c:	fe843503          	ld	a0,-24(s0)
    80006160:	00000097          	auipc	ra,0x0
    80006164:	c74080e7          	jalr	-908(ra) # 80005dd4 <dirlookup>
    80006168:	fea43023          	sd	a0,-32(s0)
    8000616c:	fe043783          	ld	a5,-32(s0)
    80006170:	eb89                	bnez	a5,80006182 <namex+0xd6>
      iunlockput(ip);
    80006172:	fe843503          	ld	a0,-24(s0)
    80006176:	fffff097          	auipc	ra,0xfffff
    8000617a:	5c8080e7          	jalr	1480(ra) # 8000573e <iunlockput>
      return 0;
    8000617e:	4781                	li	a5,0
    80006180:	a0b1                	j	800061cc <namex+0x120>
    }
    iunlockput(ip);
    80006182:	fe843503          	ld	a0,-24(s0)
    80006186:	fffff097          	auipc	ra,0xfffff
    8000618a:	5b8080e7          	jalr	1464(ra) # 8000573e <iunlockput>
    ip = next;
    8000618e:	fe043783          	ld	a5,-32(s0)
    80006192:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80006196:	fc843583          	ld	a1,-56(s0)
    8000619a:	fd843503          	ld	a0,-40(s0)
    8000619e:	00000097          	auipc	ra,0x0
    800061a2:	e20080e7          	jalr	-480(ra) # 80005fbe <skipelem>
    800061a6:	fca43c23          	sd	a0,-40(s0)
    800061aa:	fd843783          	ld	a5,-40(s0)
    800061ae:	fbb9                	bnez	a5,80006104 <namex+0x58>
  }
  if(nameiparent){
    800061b0:	fd442783          	lw	a5,-44(s0)
    800061b4:	2781                	sext.w	a5,a5
    800061b6:	cb89                	beqz	a5,800061c8 <namex+0x11c>
    iput(ip);
    800061b8:	fe843503          	ld	a0,-24(s0)
    800061bc:	fffff097          	auipc	ra,0xfffff
    800061c0:	4b2080e7          	jalr	1202(ra) # 8000566e <iput>
    return 0;
    800061c4:	4781                	li	a5,0
    800061c6:	a019                	j	800061cc <namex+0x120>
  }
  return ip;
    800061c8:	fe843783          	ld	a5,-24(s0)
}
    800061cc:	853e                	mv	a0,a5
    800061ce:	70e2                	ld	ra,56(sp)
    800061d0:	7442                	ld	s0,48(sp)
    800061d2:	6121                	addi	sp,sp,64
    800061d4:	8082                	ret

00000000800061d6 <namei>:

struct inode*
namei(char *path)
{
    800061d6:	7179                	addi	sp,sp,-48
    800061d8:	f406                	sd	ra,40(sp)
    800061da:	f022                	sd	s0,32(sp)
    800061dc:	1800                	addi	s0,sp,48
    800061de:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    800061e2:	fe040793          	addi	a5,s0,-32
    800061e6:	863e                	mv	a2,a5
    800061e8:	4581                	li	a1,0
    800061ea:	fd843503          	ld	a0,-40(s0)
    800061ee:	00000097          	auipc	ra,0x0
    800061f2:	ebe080e7          	jalr	-322(ra) # 800060ac <namex>
    800061f6:	87aa                	mv	a5,a0
}
    800061f8:	853e                	mv	a0,a5
    800061fa:	70a2                	ld	ra,40(sp)
    800061fc:	7402                	ld	s0,32(sp)
    800061fe:	6145                	addi	sp,sp,48
    80006200:	8082                	ret

0000000080006202 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80006202:	1101                	addi	sp,sp,-32
    80006204:	ec06                	sd	ra,24(sp)
    80006206:	e822                	sd	s0,16(sp)
    80006208:	1000                	addi	s0,sp,32
    8000620a:	fea43423          	sd	a0,-24(s0)
    8000620e:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80006212:	fe043603          	ld	a2,-32(s0)
    80006216:	4585                	li	a1,1
    80006218:	fe843503          	ld	a0,-24(s0)
    8000621c:	00000097          	auipc	ra,0x0
    80006220:	e90080e7          	jalr	-368(ra) # 800060ac <namex>
    80006224:	87aa                	mv	a5,a0
}
    80006226:	853e                	mv	a0,a5
    80006228:	60e2                	ld	ra,24(sp)
    8000622a:	6442                	ld	s0,16(sp)
    8000622c:	6105                	addi	sp,sp,32
    8000622e:	8082                	ret

0000000080006230 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006230:	1101                	addi	sp,sp,-32
    80006232:	ec06                	sd	ra,24(sp)
    80006234:	e822                	sd	s0,16(sp)
    80006236:	1000                	addi	s0,sp,32
    80006238:	87aa                	mv	a5,a0
    8000623a:	feb43023          	sd	a1,-32(s0)
    8000623e:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80006242:	00005597          	auipc	a1,0x5
    80006246:	34658593          	addi	a1,a1,838 # 8000b588 <etext+0x588>
    8000624a:	0001f517          	auipc	a0,0x1f
    8000624e:	a8650513          	addi	a0,a0,-1402 # 80024cd0 <log>
    80006252:	ffffb097          	auipc	ra,0xffffb
    80006256:	fec080e7          	jalr	-20(ra) # 8000123e <initlock>
  log.start = sb->logstart;
    8000625a:	fe043783          	ld	a5,-32(s0)
    8000625e:	4bdc                	lw	a5,20(a5)
    80006260:	0007871b          	sext.w	a4,a5
    80006264:	0001f797          	auipc	a5,0x1f
    80006268:	a6c78793          	addi	a5,a5,-1428 # 80024cd0 <log>
    8000626c:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    8000626e:	fe043783          	ld	a5,-32(s0)
    80006272:	4b9c                	lw	a5,16(a5)
    80006274:	0007871b          	sext.w	a4,a5
    80006278:	0001f797          	auipc	a5,0x1f
    8000627c:	a5878793          	addi	a5,a5,-1448 # 80024cd0 <log>
    80006280:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80006282:	0001f797          	auipc	a5,0x1f
    80006286:	a4e78793          	addi	a5,a5,-1458 # 80024cd0 <log>
    8000628a:	fec42703          	lw	a4,-20(s0)
    8000628e:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006290:	00000097          	auipc	ra,0x0
    80006294:	272080e7          	jalr	626(ra) # 80006502 <recover_from_log>
}
    80006298:	0001                	nop
    8000629a:	60e2                	ld	ra,24(sp)
    8000629c:	6442                	ld	s0,16(sp)
    8000629e:	6105                	addi	sp,sp,32
    800062a0:	8082                	ret

00000000800062a2 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800062a2:	7139                	addi	sp,sp,-64
    800062a4:	fc06                	sd	ra,56(sp)
    800062a6:	f822                	sd	s0,48(sp)
    800062a8:	0080                	addi	s0,sp,64
    800062aa:	87aa                	mv	a5,a0
    800062ac:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800062b0:	fe042623          	sw	zero,-20(s0)
    800062b4:	a0f9                	j	80006382 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    800062b6:	0001f797          	auipc	a5,0x1f
    800062ba:	a1a78793          	addi	a5,a5,-1510 # 80024cd0 <log>
    800062be:	579c                	lw	a5,40(a5)
    800062c0:	0007869b          	sext.w	a3,a5
    800062c4:	0001f797          	auipc	a5,0x1f
    800062c8:	a0c78793          	addi	a5,a5,-1524 # 80024cd0 <log>
    800062cc:	4f9c                	lw	a5,24(a5)
    800062ce:	fec42703          	lw	a4,-20(s0)
    800062d2:	9fb9                	addw	a5,a5,a4
    800062d4:	2781                	sext.w	a5,a5
    800062d6:	2785                	addiw	a5,a5,1
    800062d8:	2781                	sext.w	a5,a5
    800062da:	2781                	sext.w	a5,a5
    800062dc:	85be                	mv	a1,a5
    800062de:	8536                	mv	a0,a3
    800062e0:	fffff097          	auipc	ra,0xfffff
    800062e4:	818080e7          	jalr	-2024(ra) # 80004af8 <bread>
    800062e8:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    800062ec:	0001f797          	auipc	a5,0x1f
    800062f0:	9e478793          	addi	a5,a5,-1564 # 80024cd0 <log>
    800062f4:	579c                	lw	a5,40(a5)
    800062f6:	0007869b          	sext.w	a3,a5
    800062fa:	0001f717          	auipc	a4,0x1f
    800062fe:	9d670713          	addi	a4,a4,-1578 # 80024cd0 <log>
    80006302:	fec42783          	lw	a5,-20(s0)
    80006306:	07a1                	addi	a5,a5,8
    80006308:	078a                	slli	a5,a5,0x2
    8000630a:	97ba                	add	a5,a5,a4
    8000630c:	4b9c                	lw	a5,16(a5)
    8000630e:	2781                	sext.w	a5,a5
    80006310:	85be                	mv	a1,a5
    80006312:	8536                	mv	a0,a3
    80006314:	ffffe097          	auipc	ra,0xffffe
    80006318:	7e4080e7          	jalr	2020(ra) # 80004af8 <bread>
    8000631c:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006320:	fd843783          	ld	a5,-40(s0)
    80006324:	05878713          	addi	a4,a5,88
    80006328:	fe043783          	ld	a5,-32(s0)
    8000632c:	05878793          	addi	a5,a5,88
    80006330:	40000613          	li	a2,1024
    80006334:	85be                	mv	a1,a5
    80006336:	853a                	mv	a0,a4
    80006338:	ffffb097          	auipc	ra,0xffffb
    8000633c:	1ee080e7          	jalr	494(ra) # 80001526 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006340:	fd843503          	ld	a0,-40(s0)
    80006344:	fffff097          	auipc	ra,0xfffff
    80006348:	80e080e7          	jalr	-2034(ra) # 80004b52 <bwrite>
    if(recovering == 0)
    8000634c:	fcc42783          	lw	a5,-52(s0)
    80006350:	2781                	sext.w	a5,a5
    80006352:	e799                	bnez	a5,80006360 <install_trans+0xbe>
      bunpin(dbuf);
    80006354:	fd843503          	ld	a0,-40(s0)
    80006358:	fffff097          	auipc	ra,0xfffff
    8000635c:	978080e7          	jalr	-1672(ra) # 80004cd0 <bunpin>
    brelse(lbuf);
    80006360:	fe043503          	ld	a0,-32(s0)
    80006364:	fffff097          	auipc	ra,0xfffff
    80006368:	836080e7          	jalr	-1994(ra) # 80004b9a <brelse>
    brelse(dbuf);
    8000636c:	fd843503          	ld	a0,-40(s0)
    80006370:	fffff097          	auipc	ra,0xfffff
    80006374:	82a080e7          	jalr	-2006(ra) # 80004b9a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006378:	fec42783          	lw	a5,-20(s0)
    8000637c:	2785                	addiw	a5,a5,1
    8000637e:	fef42623          	sw	a5,-20(s0)
    80006382:	0001f797          	auipc	a5,0x1f
    80006386:	94e78793          	addi	a5,a5,-1714 # 80024cd0 <log>
    8000638a:	57d8                	lw	a4,44(a5)
    8000638c:	fec42783          	lw	a5,-20(s0)
    80006390:	2781                	sext.w	a5,a5
    80006392:	f2e7c2e3          	blt	a5,a4,800062b6 <install_trans+0x14>
  }
}
    80006396:	0001                	nop
    80006398:	0001                	nop
    8000639a:	70e2                	ld	ra,56(sp)
    8000639c:	7442                	ld	s0,48(sp)
    8000639e:	6121                	addi	sp,sp,64
    800063a0:	8082                	ret

00000000800063a2 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800063a2:	7179                	addi	sp,sp,-48
    800063a4:	f406                	sd	ra,40(sp)
    800063a6:	f022                	sd	s0,32(sp)
    800063a8:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800063aa:	0001f797          	auipc	a5,0x1f
    800063ae:	92678793          	addi	a5,a5,-1754 # 80024cd0 <log>
    800063b2:	579c                	lw	a5,40(a5)
    800063b4:	0007871b          	sext.w	a4,a5
    800063b8:	0001f797          	auipc	a5,0x1f
    800063bc:	91878793          	addi	a5,a5,-1768 # 80024cd0 <log>
    800063c0:	4f9c                	lw	a5,24(a5)
    800063c2:	2781                	sext.w	a5,a5
    800063c4:	85be                	mv	a1,a5
    800063c6:	853a                	mv	a0,a4
    800063c8:	ffffe097          	auipc	ra,0xffffe
    800063cc:	730080e7          	jalr	1840(ra) # 80004af8 <bread>
    800063d0:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    800063d4:	fe043783          	ld	a5,-32(s0)
    800063d8:	05878793          	addi	a5,a5,88
    800063dc:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    800063e0:	fd843783          	ld	a5,-40(s0)
    800063e4:	4398                	lw	a4,0(a5)
    800063e6:	0001f797          	auipc	a5,0x1f
    800063ea:	8ea78793          	addi	a5,a5,-1814 # 80024cd0 <log>
    800063ee:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063f0:	fe042623          	sw	zero,-20(s0)
    800063f4:	a03d                	j	80006422 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    800063f6:	fd843703          	ld	a4,-40(s0)
    800063fa:	fec42783          	lw	a5,-20(s0)
    800063fe:	078a                	slli	a5,a5,0x2
    80006400:	97ba                	add	a5,a5,a4
    80006402:	43d8                	lw	a4,4(a5)
    80006404:	0001f697          	auipc	a3,0x1f
    80006408:	8cc68693          	addi	a3,a3,-1844 # 80024cd0 <log>
    8000640c:	fec42783          	lw	a5,-20(s0)
    80006410:	07a1                	addi	a5,a5,8
    80006412:	078a                	slli	a5,a5,0x2
    80006414:	97b6                	add	a5,a5,a3
    80006416:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006418:	fec42783          	lw	a5,-20(s0)
    8000641c:	2785                	addiw	a5,a5,1
    8000641e:	fef42623          	sw	a5,-20(s0)
    80006422:	0001f797          	auipc	a5,0x1f
    80006426:	8ae78793          	addi	a5,a5,-1874 # 80024cd0 <log>
    8000642a:	57d8                	lw	a4,44(a5)
    8000642c:	fec42783          	lw	a5,-20(s0)
    80006430:	2781                	sext.w	a5,a5
    80006432:	fce7c2e3          	blt	a5,a4,800063f6 <read_head+0x54>
  }
  brelse(buf);
    80006436:	fe043503          	ld	a0,-32(s0)
    8000643a:	ffffe097          	auipc	ra,0xffffe
    8000643e:	760080e7          	jalr	1888(ra) # 80004b9a <brelse>
}
    80006442:	0001                	nop
    80006444:	70a2                	ld	ra,40(sp)
    80006446:	7402                	ld	s0,32(sp)
    80006448:	6145                	addi	sp,sp,48
    8000644a:	8082                	ret

000000008000644c <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000644c:	7179                	addi	sp,sp,-48
    8000644e:	f406                	sd	ra,40(sp)
    80006450:	f022                	sd	s0,32(sp)
    80006452:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006454:	0001f797          	auipc	a5,0x1f
    80006458:	87c78793          	addi	a5,a5,-1924 # 80024cd0 <log>
    8000645c:	579c                	lw	a5,40(a5)
    8000645e:	0007871b          	sext.w	a4,a5
    80006462:	0001f797          	auipc	a5,0x1f
    80006466:	86e78793          	addi	a5,a5,-1938 # 80024cd0 <log>
    8000646a:	4f9c                	lw	a5,24(a5)
    8000646c:	2781                	sext.w	a5,a5
    8000646e:	85be                	mv	a1,a5
    80006470:	853a                	mv	a0,a4
    80006472:	ffffe097          	auipc	ra,0xffffe
    80006476:	686080e7          	jalr	1670(ra) # 80004af8 <bread>
    8000647a:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    8000647e:	fe043783          	ld	a5,-32(s0)
    80006482:	05878793          	addi	a5,a5,88
    80006486:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000648a:	0001f797          	auipc	a5,0x1f
    8000648e:	84678793          	addi	a5,a5,-1978 # 80024cd0 <log>
    80006492:	57d8                	lw	a4,44(a5)
    80006494:	fd843783          	ld	a5,-40(s0)
    80006498:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000649a:	fe042623          	sw	zero,-20(s0)
    8000649e:	a03d                	j	800064cc <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800064a0:	0001f717          	auipc	a4,0x1f
    800064a4:	83070713          	addi	a4,a4,-2000 # 80024cd0 <log>
    800064a8:	fec42783          	lw	a5,-20(s0)
    800064ac:	07a1                	addi	a5,a5,8
    800064ae:	078a                	slli	a5,a5,0x2
    800064b0:	97ba                	add	a5,a5,a4
    800064b2:	4b98                	lw	a4,16(a5)
    800064b4:	fd843683          	ld	a3,-40(s0)
    800064b8:	fec42783          	lw	a5,-20(s0)
    800064bc:	078a                	slli	a5,a5,0x2
    800064be:	97b6                	add	a5,a5,a3
    800064c0:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800064c2:	fec42783          	lw	a5,-20(s0)
    800064c6:	2785                	addiw	a5,a5,1
    800064c8:	fef42623          	sw	a5,-20(s0)
    800064cc:	0001f797          	auipc	a5,0x1f
    800064d0:	80478793          	addi	a5,a5,-2044 # 80024cd0 <log>
    800064d4:	57d8                	lw	a4,44(a5)
    800064d6:	fec42783          	lw	a5,-20(s0)
    800064da:	2781                	sext.w	a5,a5
    800064dc:	fce7c2e3          	blt	a5,a4,800064a0 <write_head+0x54>
  }
  bwrite(buf);
    800064e0:	fe043503          	ld	a0,-32(s0)
    800064e4:	ffffe097          	auipc	ra,0xffffe
    800064e8:	66e080e7          	jalr	1646(ra) # 80004b52 <bwrite>
  brelse(buf);
    800064ec:	fe043503          	ld	a0,-32(s0)
    800064f0:	ffffe097          	auipc	ra,0xffffe
    800064f4:	6aa080e7          	jalr	1706(ra) # 80004b9a <brelse>
}
    800064f8:	0001                	nop
    800064fa:	70a2                	ld	ra,40(sp)
    800064fc:	7402                	ld	s0,32(sp)
    800064fe:	6145                	addi	sp,sp,48
    80006500:	8082                	ret

0000000080006502 <recover_from_log>:

static void
recover_from_log(void)
{
    80006502:	1141                	addi	sp,sp,-16
    80006504:	e406                	sd	ra,8(sp)
    80006506:	e022                	sd	s0,0(sp)
    80006508:	0800                	addi	s0,sp,16
  read_head();
    8000650a:	00000097          	auipc	ra,0x0
    8000650e:	e98080e7          	jalr	-360(ra) # 800063a2 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006512:	4505                	li	a0,1
    80006514:	00000097          	auipc	ra,0x0
    80006518:	d8e080e7          	jalr	-626(ra) # 800062a2 <install_trans>
  log.lh.n = 0;
    8000651c:	0001e797          	auipc	a5,0x1e
    80006520:	7b478793          	addi	a5,a5,1972 # 80024cd0 <log>
    80006524:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006528:	00000097          	auipc	ra,0x0
    8000652c:	f24080e7          	jalr	-220(ra) # 8000644c <write_head>
}
    80006530:	0001                	nop
    80006532:	60a2                	ld	ra,8(sp)
    80006534:	6402                	ld	s0,0(sp)
    80006536:	0141                	addi	sp,sp,16
    80006538:	8082                	ret

000000008000653a <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000653a:	1141                	addi	sp,sp,-16
    8000653c:	e406                	sd	ra,8(sp)
    8000653e:	e022                	sd	s0,0(sp)
    80006540:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006542:	0001e517          	auipc	a0,0x1e
    80006546:	78e50513          	addi	a0,a0,1934 # 80024cd0 <log>
    8000654a:	ffffb097          	auipc	ra,0xffffb
    8000654e:	d24080e7          	jalr	-732(ra) # 8000126e <acquire>
  while(1){
    if(log.committing){
    80006552:	0001e797          	auipc	a5,0x1e
    80006556:	77e78793          	addi	a5,a5,1918 # 80024cd0 <log>
    8000655a:	53dc                	lw	a5,36(a5)
    8000655c:	cf91                	beqz	a5,80006578 <begin_op+0x3e>
      sleep(&log, &log.lock);
    8000655e:	0001e597          	auipc	a1,0x1e
    80006562:	77258593          	addi	a1,a1,1906 # 80024cd0 <log>
    80006566:	0001e517          	auipc	a0,0x1e
    8000656a:	76a50513          	addi	a0,a0,1898 # 80024cd0 <log>
    8000656e:	ffffd097          	auipc	ra,0xffffd
    80006572:	264080e7          	jalr	612(ra) # 800037d2 <sleep>
    80006576:	bff1                	j	80006552 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80006578:	0001e797          	auipc	a5,0x1e
    8000657c:	75878793          	addi	a5,a5,1880 # 80024cd0 <log>
    80006580:	57d8                	lw	a4,44(a5)
    80006582:	0001e797          	auipc	a5,0x1e
    80006586:	74e78793          	addi	a5,a5,1870 # 80024cd0 <log>
    8000658a:	539c                	lw	a5,32(a5)
    8000658c:	2785                	addiw	a5,a5,1
    8000658e:	2781                	sext.w	a5,a5
    80006590:	86be                	mv	a3,a5
    80006592:	87b6                	mv	a5,a3
    80006594:	0027979b          	slliw	a5,a5,0x2
    80006598:	9fb5                	addw	a5,a5,a3
    8000659a:	0017979b          	slliw	a5,a5,0x1
    8000659e:	2781                	sext.w	a5,a5
    800065a0:	9fb9                	addw	a5,a5,a4
    800065a2:	2781                	sext.w	a5,a5
    800065a4:	873e                	mv	a4,a5
    800065a6:	47f9                	li	a5,30
    800065a8:	00e7df63          	bge	a5,a4,800065c6 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800065ac:	0001e597          	auipc	a1,0x1e
    800065b0:	72458593          	addi	a1,a1,1828 # 80024cd0 <log>
    800065b4:	0001e517          	auipc	a0,0x1e
    800065b8:	71c50513          	addi	a0,a0,1820 # 80024cd0 <log>
    800065bc:	ffffd097          	auipc	ra,0xffffd
    800065c0:	216080e7          	jalr	534(ra) # 800037d2 <sleep>
    800065c4:	b779                	j	80006552 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800065c6:	0001e797          	auipc	a5,0x1e
    800065ca:	70a78793          	addi	a5,a5,1802 # 80024cd0 <log>
    800065ce:	539c                	lw	a5,32(a5)
    800065d0:	2785                	addiw	a5,a5,1
    800065d2:	0007871b          	sext.w	a4,a5
    800065d6:	0001e797          	auipc	a5,0x1e
    800065da:	6fa78793          	addi	a5,a5,1786 # 80024cd0 <log>
    800065de:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800065e0:	0001e517          	auipc	a0,0x1e
    800065e4:	6f050513          	addi	a0,a0,1776 # 80024cd0 <log>
    800065e8:	ffffb097          	auipc	ra,0xffffb
    800065ec:	cea080e7          	jalr	-790(ra) # 800012d2 <release>
      break;
    800065f0:	0001                	nop
    }
  }
}
    800065f2:	0001                	nop
    800065f4:	60a2                	ld	ra,8(sp)
    800065f6:	6402                	ld	s0,0(sp)
    800065f8:	0141                	addi	sp,sp,16
    800065fa:	8082                	ret

00000000800065fc <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    800065fc:	1101                	addi	sp,sp,-32
    800065fe:	ec06                	sd	ra,24(sp)
    80006600:	e822                	sd	s0,16(sp)
    80006602:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006604:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006608:	0001e517          	auipc	a0,0x1e
    8000660c:	6c850513          	addi	a0,a0,1736 # 80024cd0 <log>
    80006610:	ffffb097          	auipc	ra,0xffffb
    80006614:	c5e080e7          	jalr	-930(ra) # 8000126e <acquire>
  log.outstanding -= 1;
    80006618:	0001e797          	auipc	a5,0x1e
    8000661c:	6b878793          	addi	a5,a5,1720 # 80024cd0 <log>
    80006620:	539c                	lw	a5,32(a5)
    80006622:	37fd                	addiw	a5,a5,-1
    80006624:	0007871b          	sext.w	a4,a5
    80006628:	0001e797          	auipc	a5,0x1e
    8000662c:	6a878793          	addi	a5,a5,1704 # 80024cd0 <log>
    80006630:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006632:	0001e797          	auipc	a5,0x1e
    80006636:	69e78793          	addi	a5,a5,1694 # 80024cd0 <log>
    8000663a:	53dc                	lw	a5,36(a5)
    8000663c:	cb89                	beqz	a5,8000664e <end_op+0x52>
    panic("log.committing");
    8000663e:	00005517          	auipc	a0,0x5
    80006642:	f5250513          	addi	a0,a0,-174 # 8000b590 <etext+0x590>
    80006646:	ffffa097          	auipc	ra,0xffffa
    8000664a:	638080e7          	jalr	1592(ra) # 80000c7e <panic>
  if(log.outstanding == 0){
    8000664e:	0001e797          	auipc	a5,0x1e
    80006652:	68278793          	addi	a5,a5,1666 # 80024cd0 <log>
    80006656:	539c                	lw	a5,32(a5)
    80006658:	eb99                	bnez	a5,8000666e <end_op+0x72>
    do_commit = 1;
    8000665a:	4785                	li	a5,1
    8000665c:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006660:	0001e797          	auipc	a5,0x1e
    80006664:	67078793          	addi	a5,a5,1648 # 80024cd0 <log>
    80006668:	4705                	li	a4,1
    8000666a:	d3d8                	sw	a4,36(a5)
    8000666c:	a809                	j	8000667e <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    8000666e:	0001e517          	auipc	a0,0x1e
    80006672:	66250513          	addi	a0,a0,1634 # 80024cd0 <log>
    80006676:	ffffd097          	auipc	ra,0xffffd
    8000667a:	1d8080e7          	jalr	472(ra) # 8000384e <wakeup>
  }
  release(&log.lock);
    8000667e:	0001e517          	auipc	a0,0x1e
    80006682:	65250513          	addi	a0,a0,1618 # 80024cd0 <log>
    80006686:	ffffb097          	auipc	ra,0xffffb
    8000668a:	c4c080e7          	jalr	-948(ra) # 800012d2 <release>

  if(do_commit){
    8000668e:	fec42783          	lw	a5,-20(s0)
    80006692:	2781                	sext.w	a5,a5
    80006694:	c3b9                	beqz	a5,800066da <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006696:	00000097          	auipc	ra,0x0
    8000669a:	134080e7          	jalr	308(ra) # 800067ca <commit>
    acquire(&log.lock);
    8000669e:	0001e517          	auipc	a0,0x1e
    800066a2:	63250513          	addi	a0,a0,1586 # 80024cd0 <log>
    800066a6:	ffffb097          	auipc	ra,0xffffb
    800066aa:	bc8080e7          	jalr	-1080(ra) # 8000126e <acquire>
    log.committing = 0;
    800066ae:	0001e797          	auipc	a5,0x1e
    800066b2:	62278793          	addi	a5,a5,1570 # 80024cd0 <log>
    800066b6:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800066ba:	0001e517          	auipc	a0,0x1e
    800066be:	61650513          	addi	a0,a0,1558 # 80024cd0 <log>
    800066c2:	ffffd097          	auipc	ra,0xffffd
    800066c6:	18c080e7          	jalr	396(ra) # 8000384e <wakeup>
    release(&log.lock);
    800066ca:	0001e517          	auipc	a0,0x1e
    800066ce:	60650513          	addi	a0,a0,1542 # 80024cd0 <log>
    800066d2:	ffffb097          	auipc	ra,0xffffb
    800066d6:	c00080e7          	jalr	-1024(ra) # 800012d2 <release>
  }
}
    800066da:	0001                	nop
    800066dc:	60e2                	ld	ra,24(sp)
    800066de:	6442                	ld	s0,16(sp)
    800066e0:	6105                	addi	sp,sp,32
    800066e2:	8082                	ret

00000000800066e4 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800066e4:	7179                	addi	sp,sp,-48
    800066e6:	f406                	sd	ra,40(sp)
    800066e8:	f022                	sd	s0,32(sp)
    800066ea:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800066ec:	fe042623          	sw	zero,-20(s0)
    800066f0:	a86d                	j	800067aa <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    800066f2:	0001e797          	auipc	a5,0x1e
    800066f6:	5de78793          	addi	a5,a5,1502 # 80024cd0 <log>
    800066fa:	579c                	lw	a5,40(a5)
    800066fc:	0007869b          	sext.w	a3,a5
    80006700:	0001e797          	auipc	a5,0x1e
    80006704:	5d078793          	addi	a5,a5,1488 # 80024cd0 <log>
    80006708:	4f9c                	lw	a5,24(a5)
    8000670a:	fec42703          	lw	a4,-20(s0)
    8000670e:	9fb9                	addw	a5,a5,a4
    80006710:	2781                	sext.w	a5,a5
    80006712:	2785                	addiw	a5,a5,1
    80006714:	2781                	sext.w	a5,a5
    80006716:	2781                	sext.w	a5,a5
    80006718:	85be                	mv	a1,a5
    8000671a:	8536                	mv	a0,a3
    8000671c:	ffffe097          	auipc	ra,0xffffe
    80006720:	3dc080e7          	jalr	988(ra) # 80004af8 <bread>
    80006724:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006728:	0001e797          	auipc	a5,0x1e
    8000672c:	5a878793          	addi	a5,a5,1448 # 80024cd0 <log>
    80006730:	579c                	lw	a5,40(a5)
    80006732:	0007869b          	sext.w	a3,a5
    80006736:	0001e717          	auipc	a4,0x1e
    8000673a:	59a70713          	addi	a4,a4,1434 # 80024cd0 <log>
    8000673e:	fec42783          	lw	a5,-20(s0)
    80006742:	07a1                	addi	a5,a5,8
    80006744:	078a                	slli	a5,a5,0x2
    80006746:	97ba                	add	a5,a5,a4
    80006748:	4b9c                	lw	a5,16(a5)
    8000674a:	2781                	sext.w	a5,a5
    8000674c:	85be                	mv	a1,a5
    8000674e:	8536                	mv	a0,a3
    80006750:	ffffe097          	auipc	ra,0xffffe
    80006754:	3a8080e7          	jalr	936(ra) # 80004af8 <bread>
    80006758:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    8000675c:	fe043783          	ld	a5,-32(s0)
    80006760:	05878713          	addi	a4,a5,88
    80006764:	fd843783          	ld	a5,-40(s0)
    80006768:	05878793          	addi	a5,a5,88
    8000676c:	40000613          	li	a2,1024
    80006770:	85be                	mv	a1,a5
    80006772:	853a                	mv	a0,a4
    80006774:	ffffb097          	auipc	ra,0xffffb
    80006778:	db2080e7          	jalr	-590(ra) # 80001526 <memmove>
    bwrite(to);  // write the log
    8000677c:	fe043503          	ld	a0,-32(s0)
    80006780:	ffffe097          	auipc	ra,0xffffe
    80006784:	3d2080e7          	jalr	978(ra) # 80004b52 <bwrite>
    brelse(from);
    80006788:	fd843503          	ld	a0,-40(s0)
    8000678c:	ffffe097          	auipc	ra,0xffffe
    80006790:	40e080e7          	jalr	1038(ra) # 80004b9a <brelse>
    brelse(to);
    80006794:	fe043503          	ld	a0,-32(s0)
    80006798:	ffffe097          	auipc	ra,0xffffe
    8000679c:	402080e7          	jalr	1026(ra) # 80004b9a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800067a0:	fec42783          	lw	a5,-20(s0)
    800067a4:	2785                	addiw	a5,a5,1
    800067a6:	fef42623          	sw	a5,-20(s0)
    800067aa:	0001e797          	auipc	a5,0x1e
    800067ae:	52678793          	addi	a5,a5,1318 # 80024cd0 <log>
    800067b2:	57d8                	lw	a4,44(a5)
    800067b4:	fec42783          	lw	a5,-20(s0)
    800067b8:	2781                	sext.w	a5,a5
    800067ba:	f2e7cce3          	blt	a5,a4,800066f2 <write_log+0xe>
  }
}
    800067be:	0001                	nop
    800067c0:	0001                	nop
    800067c2:	70a2                	ld	ra,40(sp)
    800067c4:	7402                	ld	s0,32(sp)
    800067c6:	6145                	addi	sp,sp,48
    800067c8:	8082                	ret

00000000800067ca <commit>:

static void
commit()
{
    800067ca:	1141                	addi	sp,sp,-16
    800067cc:	e406                	sd	ra,8(sp)
    800067ce:	e022                	sd	s0,0(sp)
    800067d0:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    800067d2:	0001e797          	auipc	a5,0x1e
    800067d6:	4fe78793          	addi	a5,a5,1278 # 80024cd0 <log>
    800067da:	57dc                	lw	a5,44(a5)
    800067dc:	02f05963          	blez	a5,8000680e <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800067e0:	00000097          	auipc	ra,0x0
    800067e4:	f04080e7          	jalr	-252(ra) # 800066e4 <write_log>
    write_head();    // Write header to disk -- the real commit
    800067e8:	00000097          	auipc	ra,0x0
    800067ec:	c64080e7          	jalr	-924(ra) # 8000644c <write_head>
    install_trans(0); // Now install writes to home locations
    800067f0:	4501                	li	a0,0
    800067f2:	00000097          	auipc	ra,0x0
    800067f6:	ab0080e7          	jalr	-1360(ra) # 800062a2 <install_trans>
    log.lh.n = 0;
    800067fa:	0001e797          	auipc	a5,0x1e
    800067fe:	4d678793          	addi	a5,a5,1238 # 80024cd0 <log>
    80006802:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006806:	00000097          	auipc	ra,0x0
    8000680a:	c46080e7          	jalr	-954(ra) # 8000644c <write_head>
  }
}
    8000680e:	0001                	nop
    80006810:	60a2                	ld	ra,8(sp)
    80006812:	6402                	ld	s0,0(sp)
    80006814:	0141                	addi	sp,sp,16
    80006816:	8082                	ret

0000000080006818 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006818:	7179                	addi	sp,sp,-48
    8000681a:	f406                	sd	ra,40(sp)
    8000681c:	f022                	sd	s0,32(sp)
    8000681e:	1800                	addi	s0,sp,48
    80006820:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006824:	0001e517          	auipc	a0,0x1e
    80006828:	4ac50513          	addi	a0,a0,1196 # 80024cd0 <log>
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	a42080e7          	jalr	-1470(ra) # 8000126e <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006834:	0001e797          	auipc	a5,0x1e
    80006838:	49c78793          	addi	a5,a5,1180 # 80024cd0 <log>
    8000683c:	57dc                	lw	a5,44(a5)
    8000683e:	873e                	mv	a4,a5
    80006840:	47f5                	li	a5,29
    80006842:	02e7c063          	blt	a5,a4,80006862 <log_write+0x4a>
    80006846:	0001e797          	auipc	a5,0x1e
    8000684a:	48a78793          	addi	a5,a5,1162 # 80024cd0 <log>
    8000684e:	57d8                	lw	a4,44(a5)
    80006850:	0001e797          	auipc	a5,0x1e
    80006854:	48078793          	addi	a5,a5,1152 # 80024cd0 <log>
    80006858:	4fdc                	lw	a5,28(a5)
    8000685a:	37fd                	addiw	a5,a5,-1
    8000685c:	2781                	sext.w	a5,a5
    8000685e:	00f74a63          	blt	a4,a5,80006872 <log_write+0x5a>
    panic("too big a transaction");
    80006862:	00005517          	auipc	a0,0x5
    80006866:	d3e50513          	addi	a0,a0,-706 # 8000b5a0 <etext+0x5a0>
    8000686a:	ffffa097          	auipc	ra,0xffffa
    8000686e:	414080e7          	jalr	1044(ra) # 80000c7e <panic>
  if (log.outstanding < 1)
    80006872:	0001e797          	auipc	a5,0x1e
    80006876:	45e78793          	addi	a5,a5,1118 # 80024cd0 <log>
    8000687a:	539c                	lw	a5,32(a5)
    8000687c:	00f04a63          	bgtz	a5,80006890 <log_write+0x78>
    panic("log_write outside of trans");
    80006880:	00005517          	auipc	a0,0x5
    80006884:	d3850513          	addi	a0,a0,-712 # 8000b5b8 <etext+0x5b8>
    80006888:	ffffa097          	auipc	ra,0xffffa
    8000688c:	3f6080e7          	jalr	1014(ra) # 80000c7e <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006890:	fe042623          	sw	zero,-20(s0)
    80006894:	a03d                	j	800068c2 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006896:	0001e717          	auipc	a4,0x1e
    8000689a:	43a70713          	addi	a4,a4,1082 # 80024cd0 <log>
    8000689e:	fec42783          	lw	a5,-20(s0)
    800068a2:	07a1                	addi	a5,a5,8
    800068a4:	078a                	slli	a5,a5,0x2
    800068a6:	97ba                	add	a5,a5,a4
    800068a8:	4b9c                	lw	a5,16(a5)
    800068aa:	0007871b          	sext.w	a4,a5
    800068ae:	fd843783          	ld	a5,-40(s0)
    800068b2:	47dc                	lw	a5,12(a5)
    800068b4:	02f70263          	beq	a4,a5,800068d8 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800068b8:	fec42783          	lw	a5,-20(s0)
    800068bc:	2785                	addiw	a5,a5,1
    800068be:	fef42623          	sw	a5,-20(s0)
    800068c2:	0001e797          	auipc	a5,0x1e
    800068c6:	40e78793          	addi	a5,a5,1038 # 80024cd0 <log>
    800068ca:	57d8                	lw	a4,44(a5)
    800068cc:	fec42783          	lw	a5,-20(s0)
    800068d0:	2781                	sext.w	a5,a5
    800068d2:	fce7c2e3          	blt	a5,a4,80006896 <log_write+0x7e>
    800068d6:	a011                	j	800068da <log_write+0xc2>
      break;
    800068d8:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    800068da:	fd843783          	ld	a5,-40(s0)
    800068de:	47dc                	lw	a5,12(a5)
    800068e0:	0007871b          	sext.w	a4,a5
    800068e4:	0001e697          	auipc	a3,0x1e
    800068e8:	3ec68693          	addi	a3,a3,1004 # 80024cd0 <log>
    800068ec:	fec42783          	lw	a5,-20(s0)
    800068f0:	07a1                	addi	a5,a5,8
    800068f2:	078a                	slli	a5,a5,0x2
    800068f4:	97b6                	add	a5,a5,a3
    800068f6:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    800068f8:	0001e797          	auipc	a5,0x1e
    800068fc:	3d878793          	addi	a5,a5,984 # 80024cd0 <log>
    80006900:	57d8                	lw	a4,44(a5)
    80006902:	fec42783          	lw	a5,-20(s0)
    80006906:	2781                	sext.w	a5,a5
    80006908:	02e79563          	bne	a5,a4,80006932 <log_write+0x11a>
    bpin(b);
    8000690c:	fd843503          	ld	a0,-40(s0)
    80006910:	ffffe097          	auipc	ra,0xffffe
    80006914:	378080e7          	jalr	888(ra) # 80004c88 <bpin>
    log.lh.n++;
    80006918:	0001e797          	auipc	a5,0x1e
    8000691c:	3b878793          	addi	a5,a5,952 # 80024cd0 <log>
    80006920:	57dc                	lw	a5,44(a5)
    80006922:	2785                	addiw	a5,a5,1
    80006924:	0007871b          	sext.w	a4,a5
    80006928:	0001e797          	auipc	a5,0x1e
    8000692c:	3a878793          	addi	a5,a5,936 # 80024cd0 <log>
    80006930:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006932:	0001e517          	auipc	a0,0x1e
    80006936:	39e50513          	addi	a0,a0,926 # 80024cd0 <log>
    8000693a:	ffffb097          	auipc	ra,0xffffb
    8000693e:	998080e7          	jalr	-1640(ra) # 800012d2 <release>
}
    80006942:	0001                	nop
    80006944:	70a2                	ld	ra,40(sp)
    80006946:	7402                	ld	s0,32(sp)
    80006948:	6145                	addi	sp,sp,48
    8000694a:	8082                	ret

000000008000694c <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000694c:	1101                	addi	sp,sp,-32
    8000694e:	ec06                	sd	ra,24(sp)
    80006950:	e822                	sd	s0,16(sp)
    80006952:	1000                	addi	s0,sp,32
    80006954:	fea43423          	sd	a0,-24(s0)
    80006958:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    8000695c:	fe843783          	ld	a5,-24(s0)
    80006960:	07a1                	addi	a5,a5,8
    80006962:	00005597          	auipc	a1,0x5
    80006966:	c7658593          	addi	a1,a1,-906 # 8000b5d8 <etext+0x5d8>
    8000696a:	853e                	mv	a0,a5
    8000696c:	ffffb097          	auipc	ra,0xffffb
    80006970:	8d2080e7          	jalr	-1838(ra) # 8000123e <initlock>
  lk->name = name;
    80006974:	fe843783          	ld	a5,-24(s0)
    80006978:	fe043703          	ld	a4,-32(s0)
    8000697c:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    8000697e:	fe843783          	ld	a5,-24(s0)
    80006982:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006986:	fe843783          	ld	a5,-24(s0)
    8000698a:	0207a423          	sw	zero,40(a5)
}
    8000698e:	0001                	nop
    80006990:	60e2                	ld	ra,24(sp)
    80006992:	6442                	ld	s0,16(sp)
    80006994:	6105                	addi	sp,sp,32
    80006996:	8082                	ret

0000000080006998 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006998:	1101                	addi	sp,sp,-32
    8000699a:	ec06                	sd	ra,24(sp)
    8000699c:	e822                	sd	s0,16(sp)
    8000699e:	1000                	addi	s0,sp,32
    800069a0:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800069a4:	fe843783          	ld	a5,-24(s0)
    800069a8:	07a1                	addi	a5,a5,8
    800069aa:	853e                	mv	a0,a5
    800069ac:	ffffb097          	auipc	ra,0xffffb
    800069b0:	8c2080e7          	jalr	-1854(ra) # 8000126e <acquire>
  while (lk->locked) {
    800069b4:	a819                	j	800069ca <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    800069b6:	fe843783          	ld	a5,-24(s0)
    800069ba:	07a1                	addi	a5,a5,8
    800069bc:	85be                	mv	a1,a5
    800069be:	fe843503          	ld	a0,-24(s0)
    800069c2:	ffffd097          	auipc	ra,0xffffd
    800069c6:	e10080e7          	jalr	-496(ra) # 800037d2 <sleep>
  while (lk->locked) {
    800069ca:	fe843783          	ld	a5,-24(s0)
    800069ce:	439c                	lw	a5,0(a5)
    800069d0:	f3fd                	bnez	a5,800069b6 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    800069d2:	fe843783          	ld	a5,-24(s0)
    800069d6:	4705                	li	a4,1
    800069d8:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    800069da:	ffffc097          	auipc	ra,0xffffc
    800069de:	e3e080e7          	jalr	-450(ra) # 80002818 <myproc>
    800069e2:	87aa                	mv	a5,a0
    800069e4:	5b98                	lw	a4,48(a5)
    800069e6:	fe843783          	ld	a5,-24(s0)
    800069ea:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800069ec:	fe843783          	ld	a5,-24(s0)
    800069f0:	07a1                	addi	a5,a5,8
    800069f2:	853e                	mv	a0,a5
    800069f4:	ffffb097          	auipc	ra,0xffffb
    800069f8:	8de080e7          	jalr	-1826(ra) # 800012d2 <release>
}
    800069fc:	0001                	nop
    800069fe:	60e2                	ld	ra,24(sp)
    80006a00:	6442                	ld	s0,16(sp)
    80006a02:	6105                	addi	sp,sp,32
    80006a04:	8082                	ret

0000000080006a06 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006a06:	1101                	addi	sp,sp,-32
    80006a08:	ec06                	sd	ra,24(sp)
    80006a0a:	e822                	sd	s0,16(sp)
    80006a0c:	1000                	addi	s0,sp,32
    80006a0e:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006a12:	fe843783          	ld	a5,-24(s0)
    80006a16:	07a1                	addi	a5,a5,8
    80006a18:	853e                	mv	a0,a5
    80006a1a:	ffffb097          	auipc	ra,0xffffb
    80006a1e:	854080e7          	jalr	-1964(ra) # 8000126e <acquire>
  lk->locked = 0;
    80006a22:	fe843783          	ld	a5,-24(s0)
    80006a26:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006a2a:	fe843783          	ld	a5,-24(s0)
    80006a2e:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006a32:	fe843503          	ld	a0,-24(s0)
    80006a36:	ffffd097          	auipc	ra,0xffffd
    80006a3a:	e18080e7          	jalr	-488(ra) # 8000384e <wakeup>
  release(&lk->lk);
    80006a3e:	fe843783          	ld	a5,-24(s0)
    80006a42:	07a1                	addi	a5,a5,8
    80006a44:	853e                	mv	a0,a5
    80006a46:	ffffb097          	auipc	ra,0xffffb
    80006a4a:	88c080e7          	jalr	-1908(ra) # 800012d2 <release>
}
    80006a4e:	0001                	nop
    80006a50:	60e2                	ld	ra,24(sp)
    80006a52:	6442                	ld	s0,16(sp)
    80006a54:	6105                	addi	sp,sp,32
    80006a56:	8082                	ret

0000000080006a58 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006a58:	7139                	addi	sp,sp,-64
    80006a5a:	fc06                	sd	ra,56(sp)
    80006a5c:	f822                	sd	s0,48(sp)
    80006a5e:	f426                	sd	s1,40(sp)
    80006a60:	0080                	addi	s0,sp,64
    80006a62:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006a66:	fc843783          	ld	a5,-56(s0)
    80006a6a:	07a1                	addi	a5,a5,8
    80006a6c:	853e                	mv	a0,a5
    80006a6e:	ffffb097          	auipc	ra,0xffffb
    80006a72:	800080e7          	jalr	-2048(ra) # 8000126e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006a76:	fc843783          	ld	a5,-56(s0)
    80006a7a:	439c                	lw	a5,0(a5)
    80006a7c:	cf99                	beqz	a5,80006a9a <holdingsleep+0x42>
    80006a7e:	fc843783          	ld	a5,-56(s0)
    80006a82:	5784                	lw	s1,40(a5)
    80006a84:	ffffc097          	auipc	ra,0xffffc
    80006a88:	d94080e7          	jalr	-620(ra) # 80002818 <myproc>
    80006a8c:	87aa                	mv	a5,a0
    80006a8e:	5b9c                	lw	a5,48(a5)
    80006a90:	8726                	mv	a4,s1
    80006a92:	00f71463          	bne	a4,a5,80006a9a <holdingsleep+0x42>
    80006a96:	4785                	li	a5,1
    80006a98:	a011                	j	80006a9c <holdingsleep+0x44>
    80006a9a:	4781                	li	a5,0
    80006a9c:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006aa0:	fc843783          	ld	a5,-56(s0)
    80006aa4:	07a1                	addi	a5,a5,8
    80006aa6:	853e                	mv	a0,a5
    80006aa8:	ffffb097          	auipc	ra,0xffffb
    80006aac:	82a080e7          	jalr	-2006(ra) # 800012d2 <release>
  return r;
    80006ab0:	fdc42783          	lw	a5,-36(s0)
}
    80006ab4:	853e                	mv	a0,a5
    80006ab6:	70e2                	ld	ra,56(sp)
    80006ab8:	7442                	ld	s0,48(sp)
    80006aba:	74a2                	ld	s1,40(sp)
    80006abc:	6121                	addi	sp,sp,64
    80006abe:	8082                	ret

0000000080006ac0 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006ac0:	1141                	addi	sp,sp,-16
    80006ac2:	e406                	sd	ra,8(sp)
    80006ac4:	e022                	sd	s0,0(sp)
    80006ac6:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006ac8:	00005597          	auipc	a1,0x5
    80006acc:	b2058593          	addi	a1,a1,-1248 # 8000b5e8 <etext+0x5e8>
    80006ad0:	0001e517          	auipc	a0,0x1e
    80006ad4:	34850513          	addi	a0,a0,840 # 80024e18 <ftable>
    80006ad8:	ffffa097          	auipc	ra,0xffffa
    80006adc:	766080e7          	jalr	1894(ra) # 8000123e <initlock>
}
    80006ae0:	0001                	nop
    80006ae2:	60a2                	ld	ra,8(sp)
    80006ae4:	6402                	ld	s0,0(sp)
    80006ae6:	0141                	addi	sp,sp,16
    80006ae8:	8082                	ret

0000000080006aea <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006aea:	1101                	addi	sp,sp,-32
    80006aec:	ec06                	sd	ra,24(sp)
    80006aee:	e822                	sd	s0,16(sp)
    80006af0:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006af2:	0001e517          	auipc	a0,0x1e
    80006af6:	32650513          	addi	a0,a0,806 # 80024e18 <ftable>
    80006afa:	ffffa097          	auipc	ra,0xffffa
    80006afe:	774080e7          	jalr	1908(ra) # 8000126e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006b02:	0001e797          	auipc	a5,0x1e
    80006b06:	32e78793          	addi	a5,a5,814 # 80024e30 <ftable+0x18>
    80006b0a:	fef43423          	sd	a5,-24(s0)
    80006b0e:	a815                	j	80006b42 <filealloc+0x58>
    if(f->ref == 0){
    80006b10:	fe843783          	ld	a5,-24(s0)
    80006b14:	43dc                	lw	a5,4(a5)
    80006b16:	e385                	bnez	a5,80006b36 <filealloc+0x4c>
      f->ref = 1;
    80006b18:	fe843783          	ld	a5,-24(s0)
    80006b1c:	4705                	li	a4,1
    80006b1e:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006b20:	0001e517          	auipc	a0,0x1e
    80006b24:	2f850513          	addi	a0,a0,760 # 80024e18 <ftable>
    80006b28:	ffffa097          	auipc	ra,0xffffa
    80006b2c:	7aa080e7          	jalr	1962(ra) # 800012d2 <release>
      return f;
    80006b30:	fe843783          	ld	a5,-24(s0)
    80006b34:	a805                	j	80006b64 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006b36:	fe843783          	ld	a5,-24(s0)
    80006b3a:	02878793          	addi	a5,a5,40
    80006b3e:	fef43423          	sd	a5,-24(s0)
    80006b42:	0001f797          	auipc	a5,0x1f
    80006b46:	28e78793          	addi	a5,a5,654 # 80025dd0 <ftable+0xfb8>
    80006b4a:	fe843703          	ld	a4,-24(s0)
    80006b4e:	fcf761e3          	bltu	a4,a5,80006b10 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006b52:	0001e517          	auipc	a0,0x1e
    80006b56:	2c650513          	addi	a0,a0,710 # 80024e18 <ftable>
    80006b5a:	ffffa097          	auipc	ra,0xffffa
    80006b5e:	778080e7          	jalr	1912(ra) # 800012d2 <release>
  return 0;
    80006b62:	4781                	li	a5,0
}
    80006b64:	853e                	mv	a0,a5
    80006b66:	60e2                	ld	ra,24(sp)
    80006b68:	6442                	ld	s0,16(sp)
    80006b6a:	6105                	addi	sp,sp,32
    80006b6c:	8082                	ret

0000000080006b6e <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006b6e:	1101                	addi	sp,sp,-32
    80006b70:	ec06                	sd	ra,24(sp)
    80006b72:	e822                	sd	s0,16(sp)
    80006b74:	1000                	addi	s0,sp,32
    80006b76:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006b7a:	0001e517          	auipc	a0,0x1e
    80006b7e:	29e50513          	addi	a0,a0,670 # 80024e18 <ftable>
    80006b82:	ffffa097          	auipc	ra,0xffffa
    80006b86:	6ec080e7          	jalr	1772(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006b8a:	fe843783          	ld	a5,-24(s0)
    80006b8e:	43dc                	lw	a5,4(a5)
    80006b90:	00f04a63          	bgtz	a5,80006ba4 <filedup+0x36>
    panic("filedup");
    80006b94:	00005517          	auipc	a0,0x5
    80006b98:	a5c50513          	addi	a0,a0,-1444 # 8000b5f0 <etext+0x5f0>
    80006b9c:	ffffa097          	auipc	ra,0xffffa
    80006ba0:	0e2080e7          	jalr	226(ra) # 80000c7e <panic>
  f->ref++;
    80006ba4:	fe843783          	ld	a5,-24(s0)
    80006ba8:	43dc                	lw	a5,4(a5)
    80006baa:	2785                	addiw	a5,a5,1
    80006bac:	0007871b          	sext.w	a4,a5
    80006bb0:	fe843783          	ld	a5,-24(s0)
    80006bb4:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006bb6:	0001e517          	auipc	a0,0x1e
    80006bba:	26250513          	addi	a0,a0,610 # 80024e18 <ftable>
    80006bbe:	ffffa097          	auipc	ra,0xffffa
    80006bc2:	714080e7          	jalr	1812(ra) # 800012d2 <release>
  return f;
    80006bc6:	fe843783          	ld	a5,-24(s0)
}
    80006bca:	853e                	mv	a0,a5
    80006bcc:	60e2                	ld	ra,24(sp)
    80006bce:	6442                	ld	s0,16(sp)
    80006bd0:	6105                	addi	sp,sp,32
    80006bd2:	8082                	ret

0000000080006bd4 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006bd4:	715d                	addi	sp,sp,-80
    80006bd6:	e486                	sd	ra,72(sp)
    80006bd8:	e0a2                	sd	s0,64(sp)
    80006bda:	0880                	addi	s0,sp,80
    80006bdc:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006be0:	0001e517          	auipc	a0,0x1e
    80006be4:	23850513          	addi	a0,a0,568 # 80024e18 <ftable>
    80006be8:	ffffa097          	auipc	ra,0xffffa
    80006bec:	686080e7          	jalr	1670(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006bf0:	fb843783          	ld	a5,-72(s0)
    80006bf4:	43dc                	lw	a5,4(a5)
    80006bf6:	00f04a63          	bgtz	a5,80006c0a <fileclose+0x36>
    panic("fileclose");
    80006bfa:	00005517          	auipc	a0,0x5
    80006bfe:	9fe50513          	addi	a0,a0,-1538 # 8000b5f8 <etext+0x5f8>
    80006c02:	ffffa097          	auipc	ra,0xffffa
    80006c06:	07c080e7          	jalr	124(ra) # 80000c7e <panic>
  if(--f->ref > 0){
    80006c0a:	fb843783          	ld	a5,-72(s0)
    80006c0e:	43dc                	lw	a5,4(a5)
    80006c10:	37fd                	addiw	a5,a5,-1
    80006c12:	0007871b          	sext.w	a4,a5
    80006c16:	fb843783          	ld	a5,-72(s0)
    80006c1a:	c3d8                	sw	a4,4(a5)
    80006c1c:	fb843783          	ld	a5,-72(s0)
    80006c20:	43dc                	lw	a5,4(a5)
    80006c22:	00f05b63          	blez	a5,80006c38 <fileclose+0x64>
    release(&ftable.lock);
    80006c26:	0001e517          	auipc	a0,0x1e
    80006c2a:	1f250513          	addi	a0,a0,498 # 80024e18 <ftable>
    80006c2e:	ffffa097          	auipc	ra,0xffffa
    80006c32:	6a4080e7          	jalr	1700(ra) # 800012d2 <release>
    80006c36:	a879                	j	80006cd4 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006c38:	fb843783          	ld	a5,-72(s0)
    80006c3c:	638c                	ld	a1,0(a5)
    80006c3e:	6790                	ld	a2,8(a5)
    80006c40:	6b94                	ld	a3,16(a5)
    80006c42:	6f98                	ld	a4,24(a5)
    80006c44:	739c                	ld	a5,32(a5)
    80006c46:	fcb43423          	sd	a1,-56(s0)
    80006c4a:	fcc43823          	sd	a2,-48(s0)
    80006c4e:	fcd43c23          	sd	a3,-40(s0)
    80006c52:	fee43023          	sd	a4,-32(s0)
    80006c56:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006c5a:	fb843783          	ld	a5,-72(s0)
    80006c5e:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006c62:	fb843783          	ld	a5,-72(s0)
    80006c66:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006c6a:	0001e517          	auipc	a0,0x1e
    80006c6e:	1ae50513          	addi	a0,a0,430 # 80024e18 <ftable>
    80006c72:	ffffa097          	auipc	ra,0xffffa
    80006c76:	660080e7          	jalr	1632(ra) # 800012d2 <release>

  if(ff.type == FD_PIPE){
    80006c7a:	fc842783          	lw	a5,-56(s0)
    80006c7e:	873e                	mv	a4,a5
    80006c80:	4785                	li	a5,1
    80006c82:	00f71e63          	bne	a4,a5,80006c9e <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006c86:	fd843783          	ld	a5,-40(s0)
    80006c8a:	fd144703          	lbu	a4,-47(s0)
    80006c8e:	2701                	sext.w	a4,a4
    80006c90:	85ba                	mv	a1,a4
    80006c92:	853e                	mv	a0,a5
    80006c94:	00000097          	auipc	ra,0x0
    80006c98:	5aa080e7          	jalr	1450(ra) # 8000723e <pipeclose>
    80006c9c:	a825                	j	80006cd4 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006c9e:	fc842783          	lw	a5,-56(s0)
    80006ca2:	873e                	mv	a4,a5
    80006ca4:	4789                	li	a5,2
    80006ca6:	00f70863          	beq	a4,a5,80006cb6 <fileclose+0xe2>
    80006caa:	fc842783          	lw	a5,-56(s0)
    80006cae:	873e                	mv	a4,a5
    80006cb0:	478d                	li	a5,3
    80006cb2:	02f71163          	bne	a4,a5,80006cd4 <fileclose+0x100>
    begin_op();
    80006cb6:	00000097          	auipc	ra,0x0
    80006cba:	884080e7          	jalr	-1916(ra) # 8000653a <begin_op>
    iput(ff.ip);
    80006cbe:	fe043783          	ld	a5,-32(s0)
    80006cc2:	853e                	mv	a0,a5
    80006cc4:	fffff097          	auipc	ra,0xfffff
    80006cc8:	9aa080e7          	jalr	-1622(ra) # 8000566e <iput>
    end_op();
    80006ccc:	00000097          	auipc	ra,0x0
    80006cd0:	930080e7          	jalr	-1744(ra) # 800065fc <end_op>
  }
}
    80006cd4:	60a6                	ld	ra,72(sp)
    80006cd6:	6406                	ld	s0,64(sp)
    80006cd8:	6161                	addi	sp,sp,80
    80006cda:	8082                	ret

0000000080006cdc <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006cdc:	7139                	addi	sp,sp,-64
    80006cde:	fc06                	sd	ra,56(sp)
    80006ce0:	f822                	sd	s0,48(sp)
    80006ce2:	0080                	addi	s0,sp,64
    80006ce4:	fca43423          	sd	a0,-56(s0)
    80006ce8:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006cec:	ffffc097          	auipc	ra,0xffffc
    80006cf0:	b2c080e7          	jalr	-1236(ra) # 80002818 <myproc>
    80006cf4:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006cf8:	fc843783          	ld	a5,-56(s0)
    80006cfc:	439c                	lw	a5,0(a5)
    80006cfe:	873e                	mv	a4,a5
    80006d00:	4789                	li	a5,2
    80006d02:	00f70963          	beq	a4,a5,80006d14 <filestat+0x38>
    80006d06:	fc843783          	ld	a5,-56(s0)
    80006d0a:	439c                	lw	a5,0(a5)
    80006d0c:	873e                	mv	a4,a5
    80006d0e:	478d                	li	a5,3
    80006d10:	06f71263          	bne	a4,a5,80006d74 <filestat+0x98>
    ilock(f->ip);
    80006d14:	fc843783          	ld	a5,-56(s0)
    80006d18:	6f9c                	ld	a5,24(a5)
    80006d1a:	853e                	mv	a0,a5
    80006d1c:	ffffe097          	auipc	ra,0xffffe
    80006d20:	7c4080e7          	jalr	1988(ra) # 800054e0 <ilock>
    stati(f->ip, &st);
    80006d24:	fc843783          	ld	a5,-56(s0)
    80006d28:	6f9c                	ld	a5,24(a5)
    80006d2a:	fd040713          	addi	a4,s0,-48
    80006d2e:	85ba                	mv	a1,a4
    80006d30:	853e                	mv	a0,a5
    80006d32:	fffff097          	auipc	ra,0xfffff
    80006d36:	ce0080e7          	jalr	-800(ra) # 80005a12 <stati>
    iunlock(f->ip);
    80006d3a:	fc843783          	ld	a5,-56(s0)
    80006d3e:	6f9c                	ld	a5,24(a5)
    80006d40:	853e                	mv	a0,a5
    80006d42:	fffff097          	auipc	ra,0xfffff
    80006d46:	8d2080e7          	jalr	-1838(ra) # 80005614 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006d4a:	fe843783          	ld	a5,-24(s0)
    80006d4e:	6bbc                	ld	a5,80(a5)
    80006d50:	fd040713          	addi	a4,s0,-48
    80006d54:	46e1                	li	a3,24
    80006d56:	863a                	mv	a2,a4
    80006d58:	fc043583          	ld	a1,-64(s0)
    80006d5c:	853e                	mv	a0,a5
    80006d5e:	ffffb097          	auipc	ra,0xffffb
    80006d62:	588080e7          	jalr	1416(ra) # 800022e6 <copyout>
    80006d66:	87aa                	mv	a5,a0
    80006d68:	0007d463          	bgez	a5,80006d70 <filestat+0x94>
      return -1;
    80006d6c:	57fd                	li	a5,-1
    80006d6e:	a021                	j	80006d76 <filestat+0x9a>
    return 0;
    80006d70:	4781                	li	a5,0
    80006d72:	a011                	j	80006d76 <filestat+0x9a>
  }
  return -1;
    80006d74:	57fd                	li	a5,-1
}
    80006d76:	853e                	mv	a0,a5
    80006d78:	70e2                	ld	ra,56(sp)
    80006d7a:	7442                	ld	s0,48(sp)
    80006d7c:	6121                	addi	sp,sp,64
    80006d7e:	8082                	ret

0000000080006d80 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006d80:	7139                	addi	sp,sp,-64
    80006d82:	fc06                	sd	ra,56(sp)
    80006d84:	f822                	sd	s0,48(sp)
    80006d86:	0080                	addi	s0,sp,64
    80006d88:	fca43c23          	sd	a0,-40(s0)
    80006d8c:	fcb43823          	sd	a1,-48(s0)
    80006d90:	87b2                	mv	a5,a2
    80006d92:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006d96:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006d9a:	fd843783          	ld	a5,-40(s0)
    80006d9e:	0087c783          	lbu	a5,8(a5)
    80006da2:	e399                	bnez	a5,80006da8 <fileread+0x28>
    return -1;
    80006da4:	57fd                	li	a5,-1
    80006da6:	aa1d                	j	80006edc <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006da8:	fd843783          	ld	a5,-40(s0)
    80006dac:	439c                	lw	a5,0(a5)
    80006dae:	873e                	mv	a4,a5
    80006db0:	4785                	li	a5,1
    80006db2:	02f71363          	bne	a4,a5,80006dd8 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006db6:	fd843783          	ld	a5,-40(s0)
    80006dba:	6b9c                	ld	a5,16(a5)
    80006dbc:	fcc42703          	lw	a4,-52(s0)
    80006dc0:	863a                	mv	a2,a4
    80006dc2:	fd043583          	ld	a1,-48(s0)
    80006dc6:	853e                	mv	a0,a5
    80006dc8:	00000097          	auipc	ra,0x0
    80006dcc:	668080e7          	jalr	1640(ra) # 80007430 <piperead>
    80006dd0:	87aa                	mv	a5,a0
    80006dd2:	fef42623          	sw	a5,-20(s0)
    80006dd6:	a209                	j	80006ed8 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006dd8:	fd843783          	ld	a5,-40(s0)
    80006ddc:	439c                	lw	a5,0(a5)
    80006dde:	873e                	mv	a4,a5
    80006de0:	478d                	li	a5,3
    80006de2:	06f71863          	bne	a4,a5,80006e52 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006de6:	fd843783          	ld	a5,-40(s0)
    80006dea:	02479783          	lh	a5,36(a5)
    80006dee:	2781                	sext.w	a5,a5
    80006df0:	0207c863          	bltz	a5,80006e20 <fileread+0xa0>
    80006df4:	fd843783          	ld	a5,-40(s0)
    80006df8:	02479783          	lh	a5,36(a5)
    80006dfc:	0007871b          	sext.w	a4,a5
    80006e00:	47a5                	li	a5,9
    80006e02:	00e7cf63          	blt	a5,a4,80006e20 <fileread+0xa0>
    80006e06:	fd843783          	ld	a5,-40(s0)
    80006e0a:	02479783          	lh	a5,36(a5)
    80006e0e:	2781                	sext.w	a5,a5
    80006e10:	0001e717          	auipc	a4,0x1e
    80006e14:	f6870713          	addi	a4,a4,-152 # 80024d78 <devsw>
    80006e18:	0792                	slli	a5,a5,0x4
    80006e1a:	97ba                	add	a5,a5,a4
    80006e1c:	639c                	ld	a5,0(a5)
    80006e1e:	e399                	bnez	a5,80006e24 <fileread+0xa4>
      return -1;
    80006e20:	57fd                	li	a5,-1
    80006e22:	a86d                	j	80006edc <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006e24:	fd843783          	ld	a5,-40(s0)
    80006e28:	02479783          	lh	a5,36(a5)
    80006e2c:	2781                	sext.w	a5,a5
    80006e2e:	0001e717          	auipc	a4,0x1e
    80006e32:	f4a70713          	addi	a4,a4,-182 # 80024d78 <devsw>
    80006e36:	0792                	slli	a5,a5,0x4
    80006e38:	97ba                	add	a5,a5,a4
    80006e3a:	6398                	ld	a4,0(a5)
    80006e3c:	fcc42783          	lw	a5,-52(s0)
    80006e40:	863e                	mv	a2,a5
    80006e42:	fd043583          	ld	a1,-48(s0)
    80006e46:	4505                	li	a0,1
    80006e48:	9702                	jalr	a4
    80006e4a:	87aa                	mv	a5,a0
    80006e4c:	fef42623          	sw	a5,-20(s0)
    80006e50:	a061                	j	80006ed8 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006e52:	fd843783          	ld	a5,-40(s0)
    80006e56:	439c                	lw	a5,0(a5)
    80006e58:	873e                	mv	a4,a5
    80006e5a:	4789                	li	a5,2
    80006e5c:	06f71663          	bne	a4,a5,80006ec8 <fileread+0x148>
    ilock(f->ip);
    80006e60:	fd843783          	ld	a5,-40(s0)
    80006e64:	6f9c                	ld	a5,24(a5)
    80006e66:	853e                	mv	a0,a5
    80006e68:	ffffe097          	auipc	ra,0xffffe
    80006e6c:	678080e7          	jalr	1656(ra) # 800054e0 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006e70:	fd843783          	ld	a5,-40(s0)
    80006e74:	6f88                	ld	a0,24(a5)
    80006e76:	fd843783          	ld	a5,-40(s0)
    80006e7a:	539c                	lw	a5,32(a5)
    80006e7c:	fcc42703          	lw	a4,-52(s0)
    80006e80:	86be                	mv	a3,a5
    80006e82:	fd043603          	ld	a2,-48(s0)
    80006e86:	4585                	li	a1,1
    80006e88:	fffff097          	auipc	ra,0xfffff
    80006e8c:	bee080e7          	jalr	-1042(ra) # 80005a76 <readi>
    80006e90:	87aa                	mv	a5,a0
    80006e92:	fef42623          	sw	a5,-20(s0)
    80006e96:	fec42783          	lw	a5,-20(s0)
    80006e9a:	2781                	sext.w	a5,a5
    80006e9c:	00f05d63          	blez	a5,80006eb6 <fileread+0x136>
      f->off += r;
    80006ea0:	fd843783          	ld	a5,-40(s0)
    80006ea4:	5398                	lw	a4,32(a5)
    80006ea6:	fec42783          	lw	a5,-20(s0)
    80006eaa:	9fb9                	addw	a5,a5,a4
    80006eac:	0007871b          	sext.w	a4,a5
    80006eb0:	fd843783          	ld	a5,-40(s0)
    80006eb4:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006eb6:	fd843783          	ld	a5,-40(s0)
    80006eba:	6f9c                	ld	a5,24(a5)
    80006ebc:	853e                	mv	a0,a5
    80006ebe:	ffffe097          	auipc	ra,0xffffe
    80006ec2:	756080e7          	jalr	1878(ra) # 80005614 <iunlock>
    80006ec6:	a809                	j	80006ed8 <fileread+0x158>
  } else {
    panic("fileread");
    80006ec8:	00004517          	auipc	a0,0x4
    80006ecc:	74050513          	addi	a0,a0,1856 # 8000b608 <etext+0x608>
    80006ed0:	ffffa097          	auipc	ra,0xffffa
    80006ed4:	dae080e7          	jalr	-594(ra) # 80000c7e <panic>
  }

  return r;
    80006ed8:	fec42783          	lw	a5,-20(s0)
}
    80006edc:	853e                	mv	a0,a5
    80006ede:	70e2                	ld	ra,56(sp)
    80006ee0:	7442                	ld	s0,48(sp)
    80006ee2:	6121                	addi	sp,sp,64
    80006ee4:	8082                	ret

0000000080006ee6 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006ee6:	715d                	addi	sp,sp,-80
    80006ee8:	e486                	sd	ra,72(sp)
    80006eea:	e0a2                	sd	s0,64(sp)
    80006eec:	0880                	addi	s0,sp,80
    80006eee:	fca43423          	sd	a0,-56(s0)
    80006ef2:	fcb43023          	sd	a1,-64(s0)
    80006ef6:	87b2                	mv	a5,a2
    80006ef8:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006efc:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006f00:	fc843783          	ld	a5,-56(s0)
    80006f04:	0097c783          	lbu	a5,9(a5)
    80006f08:	e399                	bnez	a5,80006f0e <filewrite+0x28>
    return -1;
    80006f0a:	57fd                	li	a5,-1
    80006f0c:	aad1                	j	800070e0 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006f0e:	fc843783          	ld	a5,-56(s0)
    80006f12:	439c                	lw	a5,0(a5)
    80006f14:	873e                	mv	a4,a5
    80006f16:	4785                	li	a5,1
    80006f18:	02f71363          	bne	a4,a5,80006f3e <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006f1c:	fc843783          	ld	a5,-56(s0)
    80006f20:	6b9c                	ld	a5,16(a5)
    80006f22:	fbc42703          	lw	a4,-68(s0)
    80006f26:	863a                	mv	a2,a4
    80006f28:	fc043583          	ld	a1,-64(s0)
    80006f2c:	853e                	mv	a0,a5
    80006f2e:	00000097          	auipc	ra,0x0
    80006f32:	3b8080e7          	jalr	952(ra) # 800072e6 <pipewrite>
    80006f36:	87aa                	mv	a5,a0
    80006f38:	fef42623          	sw	a5,-20(s0)
    80006f3c:	a245                	j	800070dc <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006f3e:	fc843783          	ld	a5,-56(s0)
    80006f42:	439c                	lw	a5,0(a5)
    80006f44:	873e                	mv	a4,a5
    80006f46:	478d                	li	a5,3
    80006f48:	06f71863          	bne	a4,a5,80006fb8 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006f4c:	fc843783          	ld	a5,-56(s0)
    80006f50:	02479783          	lh	a5,36(a5)
    80006f54:	2781                	sext.w	a5,a5
    80006f56:	0207c863          	bltz	a5,80006f86 <filewrite+0xa0>
    80006f5a:	fc843783          	ld	a5,-56(s0)
    80006f5e:	02479783          	lh	a5,36(a5)
    80006f62:	0007871b          	sext.w	a4,a5
    80006f66:	47a5                	li	a5,9
    80006f68:	00e7cf63          	blt	a5,a4,80006f86 <filewrite+0xa0>
    80006f6c:	fc843783          	ld	a5,-56(s0)
    80006f70:	02479783          	lh	a5,36(a5)
    80006f74:	2781                	sext.w	a5,a5
    80006f76:	0001e717          	auipc	a4,0x1e
    80006f7a:	e0270713          	addi	a4,a4,-510 # 80024d78 <devsw>
    80006f7e:	0792                	slli	a5,a5,0x4
    80006f80:	97ba                	add	a5,a5,a4
    80006f82:	679c                	ld	a5,8(a5)
    80006f84:	e399                	bnez	a5,80006f8a <filewrite+0xa4>
      return -1;
    80006f86:	57fd                	li	a5,-1
    80006f88:	aaa1                	j	800070e0 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006f8a:	fc843783          	ld	a5,-56(s0)
    80006f8e:	02479783          	lh	a5,36(a5)
    80006f92:	2781                	sext.w	a5,a5
    80006f94:	0001e717          	auipc	a4,0x1e
    80006f98:	de470713          	addi	a4,a4,-540 # 80024d78 <devsw>
    80006f9c:	0792                	slli	a5,a5,0x4
    80006f9e:	97ba                	add	a5,a5,a4
    80006fa0:	6798                	ld	a4,8(a5)
    80006fa2:	fbc42783          	lw	a5,-68(s0)
    80006fa6:	863e                	mv	a2,a5
    80006fa8:	fc043583          	ld	a1,-64(s0)
    80006fac:	4505                	li	a0,1
    80006fae:	9702                	jalr	a4
    80006fb0:	87aa                	mv	a5,a0
    80006fb2:	fef42623          	sw	a5,-20(s0)
    80006fb6:	a21d                	j	800070dc <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006fb8:	fc843783          	ld	a5,-56(s0)
    80006fbc:	439c                	lw	a5,0(a5)
    80006fbe:	873e                	mv	a4,a5
    80006fc0:	4789                	li	a5,2
    80006fc2:	10f71563          	bne	a4,a5,800070cc <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006fc6:	6785                	lui	a5,0x1
    80006fc8:	c007879b          	addiw	a5,a5,-1024
    80006fcc:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006fd0:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006fd4:	a0d9                	j	8000709a <filewrite+0x1b4>
      int n1 = n - i;
    80006fd6:	fbc42703          	lw	a4,-68(s0)
    80006fda:	fe842783          	lw	a5,-24(s0)
    80006fde:	40f707bb          	subw	a5,a4,a5
    80006fe2:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006fe6:	fe442703          	lw	a4,-28(s0)
    80006fea:	fe042783          	lw	a5,-32(s0)
    80006fee:	2701                	sext.w	a4,a4
    80006ff0:	2781                	sext.w	a5,a5
    80006ff2:	00e7d663          	bge	a5,a4,80006ffe <filewrite+0x118>
        n1 = max;
    80006ff6:	fe042783          	lw	a5,-32(s0)
    80006ffa:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006ffe:	fffff097          	auipc	ra,0xfffff
    80007002:	53c080e7          	jalr	1340(ra) # 8000653a <begin_op>
      ilock(f->ip);
    80007006:	fc843783          	ld	a5,-56(s0)
    8000700a:	6f9c                	ld	a5,24(a5)
    8000700c:	853e                	mv	a0,a5
    8000700e:	ffffe097          	auipc	ra,0xffffe
    80007012:	4d2080e7          	jalr	1234(ra) # 800054e0 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80007016:	fc843783          	ld	a5,-56(s0)
    8000701a:	6f88                	ld	a0,24(a5)
    8000701c:	fe842703          	lw	a4,-24(s0)
    80007020:	fc043783          	ld	a5,-64(s0)
    80007024:	00f70633          	add	a2,a4,a5
    80007028:	fc843783          	ld	a5,-56(s0)
    8000702c:	539c                	lw	a5,32(a5)
    8000702e:	fe442703          	lw	a4,-28(s0)
    80007032:	86be                	mv	a3,a5
    80007034:	4585                	li	a1,1
    80007036:	fffff097          	auipc	ra,0xfffff
    8000703a:	bca080e7          	jalr	-1078(ra) # 80005c00 <writei>
    8000703e:	87aa                	mv	a5,a0
    80007040:	fcf42e23          	sw	a5,-36(s0)
    80007044:	fdc42783          	lw	a5,-36(s0)
    80007048:	2781                	sext.w	a5,a5
    8000704a:	00f05d63          	blez	a5,80007064 <filewrite+0x17e>
        f->off += r;
    8000704e:	fc843783          	ld	a5,-56(s0)
    80007052:	5398                	lw	a4,32(a5)
    80007054:	fdc42783          	lw	a5,-36(s0)
    80007058:	9fb9                	addw	a5,a5,a4
    8000705a:	0007871b          	sext.w	a4,a5
    8000705e:	fc843783          	ld	a5,-56(s0)
    80007062:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80007064:	fc843783          	ld	a5,-56(s0)
    80007068:	6f9c                	ld	a5,24(a5)
    8000706a:	853e                	mv	a0,a5
    8000706c:	ffffe097          	auipc	ra,0xffffe
    80007070:	5a8080e7          	jalr	1448(ra) # 80005614 <iunlock>
      end_op();
    80007074:	fffff097          	auipc	ra,0xfffff
    80007078:	588080e7          	jalr	1416(ra) # 800065fc <end_op>

      if(r != n1){
    8000707c:	fdc42703          	lw	a4,-36(s0)
    80007080:	fe442783          	lw	a5,-28(s0)
    80007084:	2701                	sext.w	a4,a4
    80007086:	2781                	sext.w	a5,a5
    80007088:	02f71263          	bne	a4,a5,800070ac <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    8000708c:	fe842703          	lw	a4,-24(s0)
    80007090:	fdc42783          	lw	a5,-36(s0)
    80007094:	9fb9                	addw	a5,a5,a4
    80007096:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    8000709a:	fe842703          	lw	a4,-24(s0)
    8000709e:	fbc42783          	lw	a5,-68(s0)
    800070a2:	2701                	sext.w	a4,a4
    800070a4:	2781                	sext.w	a5,a5
    800070a6:	f2f748e3          	blt	a4,a5,80006fd6 <filewrite+0xf0>
    800070aa:	a011                	j	800070ae <filewrite+0x1c8>
        break;
    800070ac:	0001                	nop
    }
    ret = (i == n ? n : -1);
    800070ae:	fe842703          	lw	a4,-24(s0)
    800070b2:	fbc42783          	lw	a5,-68(s0)
    800070b6:	2701                	sext.w	a4,a4
    800070b8:	2781                	sext.w	a5,a5
    800070ba:	00f71563          	bne	a4,a5,800070c4 <filewrite+0x1de>
    800070be:	fbc42783          	lw	a5,-68(s0)
    800070c2:	a011                	j	800070c6 <filewrite+0x1e0>
    800070c4:	57fd                	li	a5,-1
    800070c6:	fef42623          	sw	a5,-20(s0)
    800070ca:	a809                	j	800070dc <filewrite+0x1f6>
  } else {
    panic("filewrite");
    800070cc:	00004517          	auipc	a0,0x4
    800070d0:	54c50513          	addi	a0,a0,1356 # 8000b618 <etext+0x618>
    800070d4:	ffffa097          	auipc	ra,0xffffa
    800070d8:	baa080e7          	jalr	-1110(ra) # 80000c7e <panic>
  }

  return ret;
    800070dc:	fec42783          	lw	a5,-20(s0)
}
    800070e0:	853e                	mv	a0,a5
    800070e2:	60a6                	ld	ra,72(sp)
    800070e4:	6406                	ld	s0,64(sp)
    800070e6:	6161                	addi	sp,sp,80
    800070e8:	8082                	ret

00000000800070ea <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    800070ea:	7179                	addi	sp,sp,-48
    800070ec:	f406                	sd	ra,40(sp)
    800070ee:	f022                	sd	s0,32(sp)
    800070f0:	1800                	addi	s0,sp,48
    800070f2:	fca43c23          	sd	a0,-40(s0)
    800070f6:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    800070fa:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    800070fe:	fd043783          	ld	a5,-48(s0)
    80007102:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80007106:	fd043783          	ld	a5,-48(s0)
    8000710a:	6398                	ld	a4,0(a5)
    8000710c:	fd843783          	ld	a5,-40(s0)
    80007110:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80007112:	00000097          	auipc	ra,0x0
    80007116:	9d8080e7          	jalr	-1576(ra) # 80006aea <filealloc>
    8000711a:	872a                	mv	a4,a0
    8000711c:	fd843783          	ld	a5,-40(s0)
    80007120:	e398                	sd	a4,0(a5)
    80007122:	fd843783          	ld	a5,-40(s0)
    80007126:	639c                	ld	a5,0(a5)
    80007128:	c3e9                	beqz	a5,800071ea <pipealloc+0x100>
    8000712a:	00000097          	auipc	ra,0x0
    8000712e:	9c0080e7          	jalr	-1600(ra) # 80006aea <filealloc>
    80007132:	872a                	mv	a4,a0
    80007134:	fd043783          	ld	a5,-48(s0)
    80007138:	e398                	sd	a4,0(a5)
    8000713a:	fd043783          	ld	a5,-48(s0)
    8000713e:	639c                	ld	a5,0(a5)
    80007140:	c7cd                	beqz	a5,800071ea <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80007142:	ffffa097          	auipc	ra,0xffffa
    80007146:	fd8080e7          	jalr	-40(ra) # 8000111a <kalloc>
    8000714a:	fea43423          	sd	a0,-24(s0)
    8000714e:	fe843783          	ld	a5,-24(s0)
    80007152:	cfd1                	beqz	a5,800071ee <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80007154:	fe843783          	ld	a5,-24(s0)
    80007158:	4705                	li	a4,1
    8000715a:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    8000715e:	fe843783          	ld	a5,-24(s0)
    80007162:	4705                	li	a4,1
    80007164:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80007168:	fe843783          	ld	a5,-24(s0)
    8000716c:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80007170:	fe843783          	ld	a5,-24(s0)
    80007174:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80007178:	fe843783          	ld	a5,-24(s0)
    8000717c:	00004597          	auipc	a1,0x4
    80007180:	4ac58593          	addi	a1,a1,1196 # 8000b628 <etext+0x628>
    80007184:	853e                	mv	a0,a5
    80007186:	ffffa097          	auipc	ra,0xffffa
    8000718a:	0b8080e7          	jalr	184(ra) # 8000123e <initlock>
  (*f0)->type = FD_PIPE;
    8000718e:	fd843783          	ld	a5,-40(s0)
    80007192:	639c                	ld	a5,0(a5)
    80007194:	4705                	li	a4,1
    80007196:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80007198:	fd843783          	ld	a5,-40(s0)
    8000719c:	639c                	ld	a5,0(a5)
    8000719e:	4705                	li	a4,1
    800071a0:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    800071a4:	fd843783          	ld	a5,-40(s0)
    800071a8:	639c                	ld	a5,0(a5)
    800071aa:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    800071ae:	fd843783          	ld	a5,-40(s0)
    800071b2:	639c                	ld	a5,0(a5)
    800071b4:	fe843703          	ld	a4,-24(s0)
    800071b8:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    800071ba:	fd043783          	ld	a5,-48(s0)
    800071be:	639c                	ld	a5,0(a5)
    800071c0:	4705                	li	a4,1
    800071c2:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    800071c4:	fd043783          	ld	a5,-48(s0)
    800071c8:	639c                	ld	a5,0(a5)
    800071ca:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    800071ce:	fd043783          	ld	a5,-48(s0)
    800071d2:	639c                	ld	a5,0(a5)
    800071d4:	4705                	li	a4,1
    800071d6:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    800071da:	fd043783          	ld	a5,-48(s0)
    800071de:	639c                	ld	a5,0(a5)
    800071e0:	fe843703          	ld	a4,-24(s0)
    800071e4:	eb98                	sd	a4,16(a5)
  return 0;
    800071e6:	4781                	li	a5,0
    800071e8:	a0b1                	j	80007234 <pipealloc+0x14a>
    goto bad;
    800071ea:	0001                	nop
    800071ec:	a011                	j	800071f0 <pipealloc+0x106>
    goto bad;
    800071ee:	0001                	nop

 bad:
  if(pi)
    800071f0:	fe843783          	ld	a5,-24(s0)
    800071f4:	c799                	beqz	a5,80007202 <pipealloc+0x118>
    kfree((char*)pi);
    800071f6:	fe843503          	ld	a0,-24(s0)
    800071fa:	ffffa097          	auipc	ra,0xffffa
    800071fe:	e7c080e7          	jalr	-388(ra) # 80001076 <kfree>
  if(*f0)
    80007202:	fd843783          	ld	a5,-40(s0)
    80007206:	639c                	ld	a5,0(a5)
    80007208:	cb89                	beqz	a5,8000721a <pipealloc+0x130>
    fileclose(*f0);
    8000720a:	fd843783          	ld	a5,-40(s0)
    8000720e:	639c                	ld	a5,0(a5)
    80007210:	853e                	mv	a0,a5
    80007212:	00000097          	auipc	ra,0x0
    80007216:	9c2080e7          	jalr	-1598(ra) # 80006bd4 <fileclose>
  if(*f1)
    8000721a:	fd043783          	ld	a5,-48(s0)
    8000721e:	639c                	ld	a5,0(a5)
    80007220:	cb89                	beqz	a5,80007232 <pipealloc+0x148>
    fileclose(*f1);
    80007222:	fd043783          	ld	a5,-48(s0)
    80007226:	639c                	ld	a5,0(a5)
    80007228:	853e                	mv	a0,a5
    8000722a:	00000097          	auipc	ra,0x0
    8000722e:	9aa080e7          	jalr	-1622(ra) # 80006bd4 <fileclose>
  return -1;
    80007232:	57fd                	li	a5,-1
}
    80007234:	853e                	mv	a0,a5
    80007236:	70a2                	ld	ra,40(sp)
    80007238:	7402                	ld	s0,32(sp)
    8000723a:	6145                	addi	sp,sp,48
    8000723c:	8082                	ret

000000008000723e <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    8000723e:	1101                	addi	sp,sp,-32
    80007240:	ec06                	sd	ra,24(sp)
    80007242:	e822                	sd	s0,16(sp)
    80007244:	1000                	addi	s0,sp,32
    80007246:	fea43423          	sd	a0,-24(s0)
    8000724a:	87ae                	mv	a5,a1
    8000724c:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80007250:	fe843783          	ld	a5,-24(s0)
    80007254:	853e                	mv	a0,a5
    80007256:	ffffa097          	auipc	ra,0xffffa
    8000725a:	018080e7          	jalr	24(ra) # 8000126e <acquire>
  if(writable){
    8000725e:	fe442783          	lw	a5,-28(s0)
    80007262:	2781                	sext.w	a5,a5
    80007264:	cf99                	beqz	a5,80007282 <pipeclose+0x44>
    pi->writeopen = 0;
    80007266:	fe843783          	ld	a5,-24(s0)
    8000726a:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    8000726e:	fe843783          	ld	a5,-24(s0)
    80007272:	21878793          	addi	a5,a5,536
    80007276:	853e                	mv	a0,a5
    80007278:	ffffc097          	auipc	ra,0xffffc
    8000727c:	5d6080e7          	jalr	1494(ra) # 8000384e <wakeup>
    80007280:	a831                	j	8000729c <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80007282:	fe843783          	ld	a5,-24(s0)
    80007286:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    8000728a:	fe843783          	ld	a5,-24(s0)
    8000728e:	21c78793          	addi	a5,a5,540
    80007292:	853e                	mv	a0,a5
    80007294:	ffffc097          	auipc	ra,0xffffc
    80007298:	5ba080e7          	jalr	1466(ra) # 8000384e <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    8000729c:	fe843783          	ld	a5,-24(s0)
    800072a0:	2207a783          	lw	a5,544(a5)
    800072a4:	e785                	bnez	a5,800072cc <pipeclose+0x8e>
    800072a6:	fe843783          	ld	a5,-24(s0)
    800072aa:	2247a783          	lw	a5,548(a5)
    800072ae:	ef99                	bnez	a5,800072cc <pipeclose+0x8e>
    release(&pi->lock);
    800072b0:	fe843783          	ld	a5,-24(s0)
    800072b4:	853e                	mv	a0,a5
    800072b6:	ffffa097          	auipc	ra,0xffffa
    800072ba:	01c080e7          	jalr	28(ra) # 800012d2 <release>
    kfree((char*)pi);
    800072be:	fe843503          	ld	a0,-24(s0)
    800072c2:	ffffa097          	auipc	ra,0xffffa
    800072c6:	db4080e7          	jalr	-588(ra) # 80001076 <kfree>
    800072ca:	a809                	j	800072dc <pipeclose+0x9e>
  } else
    release(&pi->lock);
    800072cc:	fe843783          	ld	a5,-24(s0)
    800072d0:	853e                	mv	a0,a5
    800072d2:	ffffa097          	auipc	ra,0xffffa
    800072d6:	000080e7          	jalr	ra # 800012d2 <release>
}
    800072da:	0001                	nop
    800072dc:	0001                	nop
    800072de:	60e2                	ld	ra,24(sp)
    800072e0:	6442                	ld	s0,16(sp)
    800072e2:	6105                	addi	sp,sp,32
    800072e4:	8082                	ret

00000000800072e6 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    800072e6:	715d                	addi	sp,sp,-80
    800072e8:	e486                	sd	ra,72(sp)
    800072ea:	e0a2                	sd	s0,64(sp)
    800072ec:	0880                	addi	s0,sp,80
    800072ee:	fca43423          	sd	a0,-56(s0)
    800072f2:	fcb43023          	sd	a1,-64(s0)
    800072f6:	87b2                	mv	a5,a2
    800072f8:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    800072fc:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007300:	ffffb097          	auipc	ra,0xffffb
    80007304:	518080e7          	jalr	1304(ra) # 80002818 <myproc>
    80007308:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000730c:	fc843783          	ld	a5,-56(s0)
    80007310:	853e                	mv	a0,a5
    80007312:	ffffa097          	auipc	ra,0xffffa
    80007316:	f5c080e7          	jalr	-164(ra) # 8000126e <acquire>
  while(i < n){
    8000731a:	a8d1                	j	800073ee <pipewrite+0x108>
    if(pi->readopen == 0 || pr->killed){
    8000731c:	fc843783          	ld	a5,-56(s0)
    80007320:	2207a783          	lw	a5,544(a5)
    80007324:	c789                	beqz	a5,8000732e <pipewrite+0x48>
    80007326:	fe043783          	ld	a5,-32(s0)
    8000732a:	579c                	lw	a5,40(a5)
    8000732c:	cb91                	beqz	a5,80007340 <pipewrite+0x5a>
      release(&pi->lock);
    8000732e:	fc843783          	ld	a5,-56(s0)
    80007332:	853e                	mv	a0,a5
    80007334:	ffffa097          	auipc	ra,0xffffa
    80007338:	f9e080e7          	jalr	-98(ra) # 800012d2 <release>
      return -1;
    8000733c:	57fd                	li	a5,-1
    8000733e:	a0e5                	j	80007426 <pipewrite+0x140>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80007340:	fc843783          	ld	a5,-56(s0)
    80007344:	21c7a703          	lw	a4,540(a5)
    80007348:	fc843783          	ld	a5,-56(s0)
    8000734c:	2187a783          	lw	a5,536(a5)
    80007350:	2007879b          	addiw	a5,a5,512
    80007354:	2781                	sext.w	a5,a5
    80007356:	02f71863          	bne	a4,a5,80007386 <pipewrite+0xa0>
      wakeup(&pi->nread);
    8000735a:	fc843783          	ld	a5,-56(s0)
    8000735e:	21878793          	addi	a5,a5,536
    80007362:	853e                	mv	a0,a5
    80007364:	ffffc097          	auipc	ra,0xffffc
    80007368:	4ea080e7          	jalr	1258(ra) # 8000384e <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8000736c:	fc843783          	ld	a5,-56(s0)
    80007370:	21c78793          	addi	a5,a5,540
    80007374:	fc843703          	ld	a4,-56(s0)
    80007378:	85ba                	mv	a1,a4
    8000737a:	853e                	mv	a0,a5
    8000737c:	ffffc097          	auipc	ra,0xffffc
    80007380:	456080e7          	jalr	1110(ra) # 800037d2 <sleep>
    80007384:	a0ad                	j	800073ee <pipewrite+0x108>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007386:	fe043783          	ld	a5,-32(s0)
    8000738a:	6ba8                	ld	a0,80(a5)
    8000738c:	fec42703          	lw	a4,-20(s0)
    80007390:	fc043783          	ld	a5,-64(s0)
    80007394:	973e                	add	a4,a4,a5
    80007396:	fdf40793          	addi	a5,s0,-33
    8000739a:	4685                	li	a3,1
    8000739c:	863a                	mv	a2,a4
    8000739e:	85be                	mv	a1,a5
    800073a0:	ffffb097          	auipc	ra,0xffffb
    800073a4:	014080e7          	jalr	20(ra) # 800023b4 <copyin>
    800073a8:	87aa                	mv	a5,a0
    800073aa:	873e                	mv	a4,a5
    800073ac:	57fd                	li	a5,-1
    800073ae:	04f70963          	beq	a4,a5,80007400 <pipewrite+0x11a>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    800073b2:	fc843783          	ld	a5,-56(s0)
    800073b6:	21c7a783          	lw	a5,540(a5)
    800073ba:	2781                	sext.w	a5,a5
    800073bc:	0017871b          	addiw	a4,a5,1
    800073c0:	0007069b          	sext.w	a3,a4
    800073c4:	fc843703          	ld	a4,-56(s0)
    800073c8:	20d72e23          	sw	a3,540(a4)
    800073cc:	1ff7f793          	andi	a5,a5,511
    800073d0:	2781                	sext.w	a5,a5
    800073d2:	fdf44703          	lbu	a4,-33(s0)
    800073d6:	fc843683          	ld	a3,-56(s0)
    800073da:	1782                	slli	a5,a5,0x20
    800073dc:	9381                	srli	a5,a5,0x20
    800073de:	97b6                	add	a5,a5,a3
    800073e0:	00e78c23          	sb	a4,24(a5)
      i++;
    800073e4:	fec42783          	lw	a5,-20(s0)
    800073e8:	2785                	addiw	a5,a5,1
    800073ea:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    800073ee:	fec42703          	lw	a4,-20(s0)
    800073f2:	fbc42783          	lw	a5,-68(s0)
    800073f6:	2701                	sext.w	a4,a4
    800073f8:	2781                	sext.w	a5,a5
    800073fa:	f2f741e3          	blt	a4,a5,8000731c <pipewrite+0x36>
    800073fe:	a011                	j	80007402 <pipewrite+0x11c>
        break;
    80007400:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007402:	fc843783          	ld	a5,-56(s0)
    80007406:	21878793          	addi	a5,a5,536
    8000740a:	853e                	mv	a0,a5
    8000740c:	ffffc097          	auipc	ra,0xffffc
    80007410:	442080e7          	jalr	1090(ra) # 8000384e <wakeup>
  release(&pi->lock);
    80007414:	fc843783          	ld	a5,-56(s0)
    80007418:	853e                	mv	a0,a5
    8000741a:	ffffa097          	auipc	ra,0xffffa
    8000741e:	eb8080e7          	jalr	-328(ra) # 800012d2 <release>

  return i;
    80007422:	fec42783          	lw	a5,-20(s0)
}
    80007426:	853e                	mv	a0,a5
    80007428:	60a6                	ld	ra,72(sp)
    8000742a:	6406                	ld	s0,64(sp)
    8000742c:	6161                	addi	sp,sp,80
    8000742e:	8082                	ret

0000000080007430 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80007430:	715d                	addi	sp,sp,-80
    80007432:	e486                	sd	ra,72(sp)
    80007434:	e0a2                	sd	s0,64(sp)
    80007436:	0880                	addi	s0,sp,80
    80007438:	fca43423          	sd	a0,-56(s0)
    8000743c:	fcb43023          	sd	a1,-64(s0)
    80007440:	87b2                	mv	a5,a2
    80007442:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007446:	ffffb097          	auipc	ra,0xffffb
    8000744a:	3d2080e7          	jalr	978(ra) # 80002818 <myproc>
    8000744e:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80007452:	fc843783          	ld	a5,-56(s0)
    80007456:	853e                	mv	a0,a5
    80007458:	ffffa097          	auipc	ra,0xffffa
    8000745c:	e16080e7          	jalr	-490(ra) # 8000126e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007460:	a815                	j	80007494 <piperead+0x64>
    if(pr->killed){
    80007462:	fe043783          	ld	a5,-32(s0)
    80007466:	579c                	lw	a5,40(a5)
    80007468:	cb91                	beqz	a5,8000747c <piperead+0x4c>
      release(&pi->lock);
    8000746a:	fc843783          	ld	a5,-56(s0)
    8000746e:	853e                	mv	a0,a5
    80007470:	ffffa097          	auipc	ra,0xffffa
    80007474:	e62080e7          	jalr	-414(ra) # 800012d2 <release>
      return -1;
    80007478:	57fd                	li	a5,-1
    8000747a:	a8dd                	j	80007570 <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000747c:	fc843783          	ld	a5,-56(s0)
    80007480:	21878793          	addi	a5,a5,536
    80007484:	fc843703          	ld	a4,-56(s0)
    80007488:	85ba                	mv	a1,a4
    8000748a:	853e                	mv	a0,a5
    8000748c:	ffffc097          	auipc	ra,0xffffc
    80007490:	346080e7          	jalr	838(ra) # 800037d2 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007494:	fc843783          	ld	a5,-56(s0)
    80007498:	2187a703          	lw	a4,536(a5)
    8000749c:	fc843783          	ld	a5,-56(s0)
    800074a0:	21c7a783          	lw	a5,540(a5)
    800074a4:	00f71763          	bne	a4,a5,800074b2 <piperead+0x82>
    800074a8:	fc843783          	ld	a5,-56(s0)
    800074ac:	2247a783          	lw	a5,548(a5)
    800074b0:	fbcd                	bnez	a5,80007462 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800074b2:	fe042623          	sw	zero,-20(s0)
    800074b6:	a8bd                	j	80007534 <piperead+0x104>
    if(pi->nread == pi->nwrite)
    800074b8:	fc843783          	ld	a5,-56(s0)
    800074bc:	2187a703          	lw	a4,536(a5)
    800074c0:	fc843783          	ld	a5,-56(s0)
    800074c4:	21c7a783          	lw	a5,540(a5)
    800074c8:	06f70f63          	beq	a4,a5,80007546 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800074cc:	fc843783          	ld	a5,-56(s0)
    800074d0:	2187a783          	lw	a5,536(a5)
    800074d4:	2781                	sext.w	a5,a5
    800074d6:	0017871b          	addiw	a4,a5,1
    800074da:	0007069b          	sext.w	a3,a4
    800074de:	fc843703          	ld	a4,-56(s0)
    800074e2:	20d72c23          	sw	a3,536(a4)
    800074e6:	1ff7f793          	andi	a5,a5,511
    800074ea:	2781                	sext.w	a5,a5
    800074ec:	fc843703          	ld	a4,-56(s0)
    800074f0:	1782                	slli	a5,a5,0x20
    800074f2:	9381                	srli	a5,a5,0x20
    800074f4:	97ba                	add	a5,a5,a4
    800074f6:	0187c783          	lbu	a5,24(a5)
    800074fa:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    800074fe:	fe043783          	ld	a5,-32(s0)
    80007502:	6ba8                	ld	a0,80(a5)
    80007504:	fec42703          	lw	a4,-20(s0)
    80007508:	fc043783          	ld	a5,-64(s0)
    8000750c:	97ba                	add	a5,a5,a4
    8000750e:	fdf40713          	addi	a4,s0,-33
    80007512:	4685                	li	a3,1
    80007514:	863a                	mv	a2,a4
    80007516:	85be                	mv	a1,a5
    80007518:	ffffb097          	auipc	ra,0xffffb
    8000751c:	dce080e7          	jalr	-562(ra) # 800022e6 <copyout>
    80007520:	87aa                	mv	a5,a0
    80007522:	873e                	mv	a4,a5
    80007524:	57fd                	li	a5,-1
    80007526:	02f70263          	beq	a4,a5,8000754a <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000752a:	fec42783          	lw	a5,-20(s0)
    8000752e:	2785                	addiw	a5,a5,1
    80007530:	fef42623          	sw	a5,-20(s0)
    80007534:	fec42703          	lw	a4,-20(s0)
    80007538:	fbc42783          	lw	a5,-68(s0)
    8000753c:	2701                	sext.w	a4,a4
    8000753e:	2781                	sext.w	a5,a5
    80007540:	f6f74ce3          	blt	a4,a5,800074b8 <piperead+0x88>
    80007544:	a021                	j	8000754c <piperead+0x11c>
      break;
    80007546:	0001                	nop
    80007548:	a011                	j	8000754c <piperead+0x11c>
      break;
    8000754a:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8000754c:	fc843783          	ld	a5,-56(s0)
    80007550:	21c78793          	addi	a5,a5,540
    80007554:	853e                	mv	a0,a5
    80007556:	ffffc097          	auipc	ra,0xffffc
    8000755a:	2f8080e7          	jalr	760(ra) # 8000384e <wakeup>
  release(&pi->lock);
    8000755e:	fc843783          	ld	a5,-56(s0)
    80007562:	853e                	mv	a0,a5
    80007564:	ffffa097          	auipc	ra,0xffffa
    80007568:	d6e080e7          	jalr	-658(ra) # 800012d2 <release>
  return i;
    8000756c:	fec42783          	lw	a5,-20(s0)
}
    80007570:	853e                	mv	a0,a5
    80007572:	60a6                	ld	ra,72(sp)
    80007574:	6406                	ld	s0,64(sp)
    80007576:	6161                	addi	sp,sp,80
    80007578:	8082                	ret

000000008000757a <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    8000757a:	de010113          	addi	sp,sp,-544
    8000757e:	20113c23          	sd	ra,536(sp)
    80007582:	20813823          	sd	s0,528(sp)
    80007586:	20913423          	sd	s1,520(sp)
    8000758a:	1400                	addi	s0,sp,544
    8000758c:	dea43423          	sd	a0,-536(s0)
    80007590:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007594:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007598:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000759c:	ffffb097          	auipc	ra,0xffffb
    800075a0:	27c080e7          	jalr	636(ra) # 80002818 <myproc>
    800075a4:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    800075a8:	fffff097          	auipc	ra,0xfffff
    800075ac:	f92080e7          	jalr	-110(ra) # 8000653a <begin_op>

  if((ip = namei(path)) == 0){
    800075b0:	de843503          	ld	a0,-536(s0)
    800075b4:	fffff097          	auipc	ra,0xfffff
    800075b8:	c22080e7          	jalr	-990(ra) # 800061d6 <namei>
    800075bc:	faa43423          	sd	a0,-88(s0)
    800075c0:	fa843783          	ld	a5,-88(s0)
    800075c4:	e799                	bnez	a5,800075d2 <exec+0x58>
    end_op();
    800075c6:	fffff097          	auipc	ra,0xfffff
    800075ca:	036080e7          	jalr	54(ra) # 800065fc <end_op>
    return -1;
    800075ce:	57fd                	li	a5,-1
    800075d0:	a90d                	j	80007a02 <exec+0x488>
  }
  ilock(ip);
    800075d2:	fa843503          	ld	a0,-88(s0)
    800075d6:	ffffe097          	auipc	ra,0xffffe
    800075da:	f0a080e7          	jalr	-246(ra) # 800054e0 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800075de:	e3040793          	addi	a5,s0,-464
    800075e2:	04000713          	li	a4,64
    800075e6:	4681                	li	a3,0
    800075e8:	863e                	mv	a2,a5
    800075ea:	4581                	li	a1,0
    800075ec:	fa843503          	ld	a0,-88(s0)
    800075f0:	ffffe097          	auipc	ra,0xffffe
    800075f4:	486080e7          	jalr	1158(ra) # 80005a76 <readi>
    800075f8:	87aa                	mv	a5,a0
    800075fa:	873e                	mv	a4,a5
    800075fc:	04000793          	li	a5,64
    80007600:	38f71b63          	bne	a4,a5,80007996 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80007604:	e3042783          	lw	a5,-464(s0)
    80007608:	873e                	mv	a4,a5
    8000760a:	464c47b7          	lui	a5,0x464c4
    8000760e:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007612:	38f71463          	bne	a4,a5,8000799a <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80007616:	f9843503          	ld	a0,-104(s0)
    8000761a:	ffffb097          	auipc	ra,0xffffb
    8000761e:	460080e7          	jalr	1120(ra) # 80002a7a <proc_pagetable>
    80007622:	faa43023          	sd	a0,-96(s0)
    80007626:	fa043783          	ld	a5,-96(s0)
    8000762a:	36078a63          	beqz	a5,8000799e <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000762e:	fc042623          	sw	zero,-52(s0)
    80007632:	e5043783          	ld	a5,-432(s0)
    80007636:	fcf42423          	sw	a5,-56(s0)
    8000763a:	a8e1                	j	80007712 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8000763c:	df840793          	addi	a5,s0,-520
    80007640:	fc842683          	lw	a3,-56(s0)
    80007644:	03800713          	li	a4,56
    80007648:	863e                	mv	a2,a5
    8000764a:	4581                	li	a1,0
    8000764c:	fa843503          	ld	a0,-88(s0)
    80007650:	ffffe097          	auipc	ra,0xffffe
    80007654:	426080e7          	jalr	1062(ra) # 80005a76 <readi>
    80007658:	87aa                	mv	a5,a0
    8000765a:	873e                	mv	a4,a5
    8000765c:	03800793          	li	a5,56
    80007660:	34f71163          	bne	a4,a5,800079a2 <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007664:	df842783          	lw	a5,-520(s0)
    80007668:	873e                	mv	a4,a5
    8000766a:	4785                	li	a5,1
    8000766c:	08f71663          	bne	a4,a5,800076f8 <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    80007670:	e2043703          	ld	a4,-480(s0)
    80007674:	e1843783          	ld	a5,-488(s0)
    80007678:	32f76763          	bltu	a4,a5,800079a6 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8000767c:	e0843703          	ld	a4,-504(s0)
    80007680:	e2043783          	ld	a5,-480(s0)
    80007684:	973e                	add	a4,a4,a5
    80007686:	e0843783          	ld	a5,-504(s0)
    8000768a:	32f76063          	bltu	a4,a5,800079aa <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8000768e:	e0843703          	ld	a4,-504(s0)
    80007692:	e2043783          	ld	a5,-480(s0)
    80007696:	97ba                	add	a5,a5,a4
    80007698:	863e                	mv	a2,a5
    8000769a:	fb843583          	ld	a1,-72(s0)
    8000769e:	fa043503          	ld	a0,-96(s0)
    800076a2:	ffffb097          	auipc	ra,0xffffb
    800076a6:	866080e7          	jalr	-1946(ra) # 80001f08 <uvmalloc>
    800076aa:	f6a43823          	sd	a0,-144(s0)
    800076ae:	f7043783          	ld	a5,-144(s0)
    800076b2:	2e078e63          	beqz	a5,800079ae <exec+0x434>
      goto bad;
    sz = sz1;
    800076b6:	f7043783          	ld	a5,-144(s0)
    800076ba:	faf43c23          	sd	a5,-72(s0)
    if((ph.vaddr % PGSIZE) != 0)
    800076be:	e0843703          	ld	a4,-504(s0)
    800076c2:	6785                	lui	a5,0x1
    800076c4:	17fd                	addi	a5,a5,-1
    800076c6:	8ff9                	and	a5,a5,a4
    800076c8:	2e079563          	bnez	a5,800079b2 <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800076cc:	e0843783          	ld	a5,-504(s0)
    800076d0:	e0043703          	ld	a4,-512(s0)
    800076d4:	0007069b          	sext.w	a3,a4
    800076d8:	e1843703          	ld	a4,-488(s0)
    800076dc:	2701                	sext.w	a4,a4
    800076de:	fa843603          	ld	a2,-88(s0)
    800076e2:	85be                	mv	a1,a5
    800076e4:	fa043503          	ld	a0,-96(s0)
    800076e8:	00000097          	auipc	ra,0x0
    800076ec:	32e080e7          	jalr	814(ra) # 80007a16 <loadseg>
    800076f0:	87aa                	mv	a5,a0
    800076f2:	2c07c263          	bltz	a5,800079b6 <exec+0x43c>
    800076f6:	a011                	j	800076fa <exec+0x180>
      continue;
    800076f8:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800076fa:	fcc42783          	lw	a5,-52(s0)
    800076fe:	2785                	addiw	a5,a5,1
    80007700:	fcf42623          	sw	a5,-52(s0)
    80007704:	fc842783          	lw	a5,-56(s0)
    80007708:	0387879b          	addiw	a5,a5,56
    8000770c:	2781                	sext.w	a5,a5
    8000770e:	fcf42423          	sw	a5,-56(s0)
    80007712:	e6845783          	lhu	a5,-408(s0)
    80007716:	0007871b          	sext.w	a4,a5
    8000771a:	fcc42783          	lw	a5,-52(s0)
    8000771e:	2781                	sext.w	a5,a5
    80007720:	f0e7cee3          	blt	a5,a4,8000763c <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007724:	fa843503          	ld	a0,-88(s0)
    80007728:	ffffe097          	auipc	ra,0xffffe
    8000772c:	016080e7          	jalr	22(ra) # 8000573e <iunlockput>
  end_op();
    80007730:	fffff097          	auipc	ra,0xfffff
    80007734:	ecc080e7          	jalr	-308(ra) # 800065fc <end_op>
  ip = 0;
    80007738:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    8000773c:	ffffb097          	auipc	ra,0xffffb
    80007740:	0dc080e7          	jalr	220(ra) # 80002818 <myproc>
    80007744:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007748:	f9843783          	ld	a5,-104(s0)
    8000774c:	67bc                	ld	a5,72(a5)
    8000774e:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007752:	fb843703          	ld	a4,-72(s0)
    80007756:	6785                	lui	a5,0x1
    80007758:	17fd                	addi	a5,a5,-1
    8000775a:	973e                	add	a4,a4,a5
    8000775c:	77fd                	lui	a5,0xfffff
    8000775e:	8ff9                	and	a5,a5,a4
    80007760:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    80007764:	fb843703          	ld	a4,-72(s0)
    80007768:	6789                	lui	a5,0x2
    8000776a:	97ba                	add	a5,a5,a4
    8000776c:	863e                	mv	a2,a5
    8000776e:	fb843583          	ld	a1,-72(s0)
    80007772:	fa043503          	ld	a0,-96(s0)
    80007776:	ffffa097          	auipc	ra,0xffffa
    8000777a:	792080e7          	jalr	1938(ra) # 80001f08 <uvmalloc>
    8000777e:	f8a43423          	sd	a0,-120(s0)
    80007782:	f8843783          	ld	a5,-120(s0)
    80007786:	22078a63          	beqz	a5,800079ba <exec+0x440>
    goto bad;
  sz = sz1;
    8000778a:	f8843783          	ld	a5,-120(s0)
    8000778e:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007792:	fb843703          	ld	a4,-72(s0)
    80007796:	77f9                	lui	a5,0xffffe
    80007798:	97ba                	add	a5,a5,a4
    8000779a:	85be                	mv	a1,a5
    8000779c:	fa043503          	ld	a0,-96(s0)
    800077a0:	ffffb097          	auipc	ra,0xffffb
    800077a4:	af0080e7          	jalr	-1296(ra) # 80002290 <uvmclear>
  sp = sz;
    800077a8:	fb843783          	ld	a5,-72(s0)
    800077ac:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800077b0:	fb043703          	ld	a4,-80(s0)
    800077b4:	77fd                	lui	a5,0xfffff
    800077b6:	97ba                	add	a5,a5,a4
    800077b8:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800077bc:	fc043023          	sd	zero,-64(s0)
    800077c0:	a845                	j	80007870 <exec+0x2f6>
    if(argc >= MAXARG)
    800077c2:	fc043703          	ld	a4,-64(s0)
    800077c6:	47fd                	li	a5,31
    800077c8:	1ee7eb63          	bltu	a5,a4,800079be <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800077cc:	fc043783          	ld	a5,-64(s0)
    800077d0:	078e                	slli	a5,a5,0x3
    800077d2:	de043703          	ld	a4,-544(s0)
    800077d6:	97ba                	add	a5,a5,a4
    800077d8:	639c                	ld	a5,0(a5)
    800077da:	853e                	mv	a0,a5
    800077dc:	ffffa097          	auipc	ra,0xffffa
    800077e0:	fe4080e7          	jalr	-28(ra) # 800017c0 <strlen>
    800077e4:	87aa                	mv	a5,a0
    800077e6:	2785                	addiw	a5,a5,1
    800077e8:	2781                	sext.w	a5,a5
    800077ea:	873e                	mv	a4,a5
    800077ec:	fb043783          	ld	a5,-80(s0)
    800077f0:	8f99                	sub	a5,a5,a4
    800077f2:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800077f6:	fb043783          	ld	a5,-80(s0)
    800077fa:	9bc1                	andi	a5,a5,-16
    800077fc:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007800:	fb043703          	ld	a4,-80(s0)
    80007804:	f8043783          	ld	a5,-128(s0)
    80007808:	1af76d63          	bltu	a4,a5,800079c2 <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8000780c:	fc043783          	ld	a5,-64(s0)
    80007810:	078e                	slli	a5,a5,0x3
    80007812:	de043703          	ld	a4,-544(s0)
    80007816:	97ba                	add	a5,a5,a4
    80007818:	6384                	ld	s1,0(a5)
    8000781a:	fc043783          	ld	a5,-64(s0)
    8000781e:	078e                	slli	a5,a5,0x3
    80007820:	de043703          	ld	a4,-544(s0)
    80007824:	97ba                	add	a5,a5,a4
    80007826:	639c                	ld	a5,0(a5)
    80007828:	853e                	mv	a0,a5
    8000782a:	ffffa097          	auipc	ra,0xffffa
    8000782e:	f96080e7          	jalr	-106(ra) # 800017c0 <strlen>
    80007832:	87aa                	mv	a5,a0
    80007834:	2785                	addiw	a5,a5,1
    80007836:	2781                	sext.w	a5,a5
    80007838:	86be                	mv	a3,a5
    8000783a:	8626                	mv	a2,s1
    8000783c:	fb043583          	ld	a1,-80(s0)
    80007840:	fa043503          	ld	a0,-96(s0)
    80007844:	ffffb097          	auipc	ra,0xffffb
    80007848:	aa2080e7          	jalr	-1374(ra) # 800022e6 <copyout>
    8000784c:	87aa                	mv	a5,a0
    8000784e:	1607cc63          	bltz	a5,800079c6 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    80007852:	fc043783          	ld	a5,-64(s0)
    80007856:	078e                	slli	a5,a5,0x3
    80007858:	fe040713          	addi	a4,s0,-32
    8000785c:	97ba                	add	a5,a5,a4
    8000785e:	fb043703          	ld	a4,-80(s0)
    80007862:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd5e90>
  for(argc = 0; argv[argc]; argc++) {
    80007866:	fc043783          	ld	a5,-64(s0)
    8000786a:	0785                	addi	a5,a5,1
    8000786c:	fcf43023          	sd	a5,-64(s0)
    80007870:	fc043783          	ld	a5,-64(s0)
    80007874:	078e                	slli	a5,a5,0x3
    80007876:	de043703          	ld	a4,-544(s0)
    8000787a:	97ba                	add	a5,a5,a4
    8000787c:	639c                	ld	a5,0(a5)
    8000787e:	f3b1                	bnez	a5,800077c2 <exec+0x248>
  }
  ustack[argc] = 0;
    80007880:	fc043783          	ld	a5,-64(s0)
    80007884:	078e                	slli	a5,a5,0x3
    80007886:	fe040713          	addi	a4,s0,-32
    8000788a:	97ba                	add	a5,a5,a4
    8000788c:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007890:	fc043783          	ld	a5,-64(s0)
    80007894:	0785                	addi	a5,a5,1
    80007896:	078e                	slli	a5,a5,0x3
    80007898:	fb043703          	ld	a4,-80(s0)
    8000789c:	40f707b3          	sub	a5,a4,a5
    800078a0:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    800078a4:	fb043783          	ld	a5,-80(s0)
    800078a8:	9bc1                	andi	a5,a5,-16
    800078aa:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800078ae:	fb043703          	ld	a4,-80(s0)
    800078b2:	f8043783          	ld	a5,-128(s0)
    800078b6:	10f76a63          	bltu	a4,a5,800079ca <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800078ba:	fc043783          	ld	a5,-64(s0)
    800078be:	0785                	addi	a5,a5,1
    800078c0:	00379713          	slli	a4,a5,0x3
    800078c4:	e7040793          	addi	a5,s0,-400
    800078c8:	86ba                	mv	a3,a4
    800078ca:	863e                	mv	a2,a5
    800078cc:	fb043583          	ld	a1,-80(s0)
    800078d0:	fa043503          	ld	a0,-96(s0)
    800078d4:	ffffb097          	auipc	ra,0xffffb
    800078d8:	a12080e7          	jalr	-1518(ra) # 800022e6 <copyout>
    800078dc:	87aa                	mv	a5,a0
    800078de:	0e07c863          	bltz	a5,800079ce <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800078e2:	f9843783          	ld	a5,-104(s0)
    800078e6:	6fbc                	ld	a5,88(a5)
    800078e8:	fb043703          	ld	a4,-80(s0)
    800078ec:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800078ee:	de843783          	ld	a5,-536(s0)
    800078f2:	fcf43c23          	sd	a5,-40(s0)
    800078f6:	fd843783          	ld	a5,-40(s0)
    800078fa:	fcf43823          	sd	a5,-48(s0)
    800078fe:	a025                	j	80007926 <exec+0x3ac>
    if(*s == '/')
    80007900:	fd843783          	ld	a5,-40(s0)
    80007904:	0007c783          	lbu	a5,0(a5)
    80007908:	873e                	mv	a4,a5
    8000790a:	02f00793          	li	a5,47
    8000790e:	00f71763          	bne	a4,a5,8000791c <exec+0x3a2>
      last = s+1;
    80007912:	fd843783          	ld	a5,-40(s0)
    80007916:	0785                	addi	a5,a5,1
    80007918:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    8000791c:	fd843783          	ld	a5,-40(s0)
    80007920:	0785                	addi	a5,a5,1
    80007922:	fcf43c23          	sd	a5,-40(s0)
    80007926:	fd843783          	ld	a5,-40(s0)
    8000792a:	0007c783          	lbu	a5,0(a5)
    8000792e:	fbe9                	bnez	a5,80007900 <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    80007930:	f9843783          	ld	a5,-104(s0)
    80007934:	15878793          	addi	a5,a5,344
    80007938:	4641                	li	a2,16
    8000793a:	fd043583          	ld	a1,-48(s0)
    8000793e:	853e                	mv	a0,a5
    80007940:	ffffa097          	auipc	ra,0xffffa
    80007944:	e06080e7          	jalr	-506(ra) # 80001746 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007948:	f9843783          	ld	a5,-104(s0)
    8000794c:	6bbc                	ld	a5,80(a5)
    8000794e:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007952:	f9843783          	ld	a5,-104(s0)
    80007956:	fa043703          	ld	a4,-96(s0)
    8000795a:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    8000795c:	f9843783          	ld	a5,-104(s0)
    80007960:	fb843703          	ld	a4,-72(s0)
    80007964:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007966:	f9843783          	ld	a5,-104(s0)
    8000796a:	6fbc                	ld	a5,88(a5)
    8000796c:	e4843703          	ld	a4,-440(s0)
    80007970:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007972:	f9843783          	ld	a5,-104(s0)
    80007976:	6fbc                	ld	a5,88(a5)
    80007978:	fb043703          	ld	a4,-80(s0)
    8000797c:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8000797e:	f9043583          	ld	a1,-112(s0)
    80007982:	f7843503          	ld	a0,-136(s0)
    80007986:	ffffb097          	auipc	ra,0xffffb
    8000798a:	1b4080e7          	jalr	436(ra) # 80002b3a <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8000798e:	fc043783          	ld	a5,-64(s0)
    80007992:	2781                	sext.w	a5,a5
    80007994:	a0bd                	j	80007a02 <exec+0x488>
    goto bad;
    80007996:	0001                	nop
    80007998:	a825                	j	800079d0 <exec+0x456>
    goto bad;
    8000799a:	0001                	nop
    8000799c:	a815                	j	800079d0 <exec+0x456>
    goto bad;
    8000799e:	0001                	nop
    800079a0:	a805                	j	800079d0 <exec+0x456>
      goto bad;
    800079a2:	0001                	nop
    800079a4:	a035                	j	800079d0 <exec+0x456>
      goto bad;
    800079a6:	0001                	nop
    800079a8:	a025                	j	800079d0 <exec+0x456>
      goto bad;
    800079aa:	0001                	nop
    800079ac:	a015                	j	800079d0 <exec+0x456>
      goto bad;
    800079ae:	0001                	nop
    800079b0:	a005                	j	800079d0 <exec+0x456>
      goto bad;
    800079b2:	0001                	nop
    800079b4:	a831                	j	800079d0 <exec+0x456>
      goto bad;
    800079b6:	0001                	nop
    800079b8:	a821                	j	800079d0 <exec+0x456>
    goto bad;
    800079ba:	0001                	nop
    800079bc:	a811                	j	800079d0 <exec+0x456>
      goto bad;
    800079be:	0001                	nop
    800079c0:	a801                	j	800079d0 <exec+0x456>
      goto bad;
    800079c2:	0001                	nop
    800079c4:	a031                	j	800079d0 <exec+0x456>
      goto bad;
    800079c6:	0001                	nop
    800079c8:	a021                	j	800079d0 <exec+0x456>
    goto bad;
    800079ca:	0001                	nop
    800079cc:	a011                	j	800079d0 <exec+0x456>
    goto bad;
    800079ce:	0001                	nop

 bad:
  if(pagetable)
    800079d0:	fa043783          	ld	a5,-96(s0)
    800079d4:	cb89                	beqz	a5,800079e6 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    800079d6:	fb843583          	ld	a1,-72(s0)
    800079da:	fa043503          	ld	a0,-96(s0)
    800079de:	ffffb097          	auipc	ra,0xffffb
    800079e2:	15c080e7          	jalr	348(ra) # 80002b3a <proc_freepagetable>
  if(ip){
    800079e6:	fa843783          	ld	a5,-88(s0)
    800079ea:	cb99                	beqz	a5,80007a00 <exec+0x486>
    iunlockput(ip);
    800079ec:	fa843503          	ld	a0,-88(s0)
    800079f0:	ffffe097          	auipc	ra,0xffffe
    800079f4:	d4e080e7          	jalr	-690(ra) # 8000573e <iunlockput>
    end_op();
    800079f8:	fffff097          	auipc	ra,0xfffff
    800079fc:	c04080e7          	jalr	-1020(ra) # 800065fc <end_op>
  }
  return -1;
    80007a00:	57fd                	li	a5,-1
}
    80007a02:	853e                	mv	a0,a5
    80007a04:	21813083          	ld	ra,536(sp)
    80007a08:	21013403          	ld	s0,528(sp)
    80007a0c:	20813483          	ld	s1,520(sp)
    80007a10:	22010113          	addi	sp,sp,544
    80007a14:	8082                	ret

0000000080007a16 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007a16:	7139                	addi	sp,sp,-64
    80007a18:	fc06                	sd	ra,56(sp)
    80007a1a:	f822                	sd	s0,48(sp)
    80007a1c:	0080                	addi	s0,sp,64
    80007a1e:	fca43c23          	sd	a0,-40(s0)
    80007a22:	fcb43823          	sd	a1,-48(s0)
    80007a26:	fcc43423          	sd	a2,-56(s0)
    80007a2a:	87b6                	mv	a5,a3
    80007a2c:	fcf42223          	sw	a5,-60(s0)
    80007a30:	87ba                	mv	a5,a4
    80007a32:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007a36:	fe042623          	sw	zero,-20(s0)
    80007a3a:	a05d                	j	80007ae0 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    80007a3c:	fec46703          	lwu	a4,-20(s0)
    80007a40:	fd043783          	ld	a5,-48(s0)
    80007a44:	97ba                	add	a5,a5,a4
    80007a46:	85be                	mv	a1,a5
    80007a48:	fd843503          	ld	a0,-40(s0)
    80007a4c:	ffffa097          	auipc	ra,0xffffa
    80007a50:	148080e7          	jalr	328(ra) # 80001b94 <walkaddr>
    80007a54:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007a58:	fe043783          	ld	a5,-32(s0)
    80007a5c:	eb89                	bnez	a5,80007a6e <loadseg+0x58>
      panic("loadseg: address should exist");
    80007a5e:	00004517          	auipc	a0,0x4
    80007a62:	bd250513          	addi	a0,a0,-1070 # 8000b630 <etext+0x630>
    80007a66:	ffff9097          	auipc	ra,0xffff9
    80007a6a:	218080e7          	jalr	536(ra) # 80000c7e <panic>
    if(sz - i < PGSIZE)
    80007a6e:	fc042703          	lw	a4,-64(s0)
    80007a72:	fec42783          	lw	a5,-20(s0)
    80007a76:	40f707bb          	subw	a5,a4,a5
    80007a7a:	2781                	sext.w	a5,a5
    80007a7c:	873e                	mv	a4,a5
    80007a7e:	6785                	lui	a5,0x1
    80007a80:	00f77b63          	bgeu	a4,a5,80007a96 <loadseg+0x80>
      n = sz - i;
    80007a84:	fc042703          	lw	a4,-64(s0)
    80007a88:	fec42783          	lw	a5,-20(s0)
    80007a8c:	40f707bb          	subw	a5,a4,a5
    80007a90:	fef42423          	sw	a5,-24(s0)
    80007a94:	a021                	j	80007a9c <loadseg+0x86>
    else
      n = PGSIZE;
    80007a96:	6785                	lui	a5,0x1
    80007a98:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007a9c:	fc442703          	lw	a4,-60(s0)
    80007aa0:	fec42783          	lw	a5,-20(s0)
    80007aa4:	9fb9                	addw	a5,a5,a4
    80007aa6:	2781                	sext.w	a5,a5
    80007aa8:	fe842703          	lw	a4,-24(s0)
    80007aac:	86be                	mv	a3,a5
    80007aae:	fe043603          	ld	a2,-32(s0)
    80007ab2:	4581                	li	a1,0
    80007ab4:	fc843503          	ld	a0,-56(s0)
    80007ab8:	ffffe097          	auipc	ra,0xffffe
    80007abc:	fbe080e7          	jalr	-66(ra) # 80005a76 <readi>
    80007ac0:	87aa                	mv	a5,a0
    80007ac2:	0007871b          	sext.w	a4,a5
    80007ac6:	fe842783          	lw	a5,-24(s0)
    80007aca:	2781                	sext.w	a5,a5
    80007acc:	00e78463          	beq	a5,a4,80007ad4 <loadseg+0xbe>
      return -1;
    80007ad0:	57fd                	li	a5,-1
    80007ad2:	a005                	j	80007af2 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007ad4:	fec42703          	lw	a4,-20(s0)
    80007ad8:	6785                	lui	a5,0x1
    80007ada:	9fb9                	addw	a5,a5,a4
    80007adc:	fef42623          	sw	a5,-20(s0)
    80007ae0:	fec42703          	lw	a4,-20(s0)
    80007ae4:	fc042783          	lw	a5,-64(s0)
    80007ae8:	2701                	sext.w	a4,a4
    80007aea:	2781                	sext.w	a5,a5
    80007aec:	f4f768e3          	bltu	a4,a5,80007a3c <loadseg+0x26>
  }
  
  return 0;
    80007af0:	4781                	li	a5,0
}
    80007af2:	853e                	mv	a0,a5
    80007af4:	70e2                	ld	ra,56(sp)
    80007af6:	7442                	ld	s0,48(sp)
    80007af8:	6121                	addi	sp,sp,64
    80007afa:	8082                	ret

0000000080007afc <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007afc:	7139                	addi	sp,sp,-64
    80007afe:	fc06                	sd	ra,56(sp)
    80007b00:	f822                	sd	s0,48(sp)
    80007b02:	0080                	addi	s0,sp,64
    80007b04:	87aa                	mv	a5,a0
    80007b06:	fcb43823          	sd	a1,-48(s0)
    80007b0a:	fcc43423          	sd	a2,-56(s0)
    80007b0e:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007b12:	fe440713          	addi	a4,s0,-28
    80007b16:	fdc42783          	lw	a5,-36(s0)
    80007b1a:	85ba                	mv	a1,a4
    80007b1c:	853e                	mv	a0,a5
    80007b1e:	ffffd097          	auipc	ra,0xffffd
    80007b22:	972080e7          	jalr	-1678(ra) # 80004490 <argint>
    80007b26:	87aa                	mv	a5,a0
    80007b28:	0007d463          	bgez	a5,80007b30 <argfd+0x34>
    return -1;
    80007b2c:	57fd                	li	a5,-1
    80007b2e:	a8b1                	j	80007b8a <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007b30:	fe442783          	lw	a5,-28(s0)
    80007b34:	0207c863          	bltz	a5,80007b64 <argfd+0x68>
    80007b38:	fe442783          	lw	a5,-28(s0)
    80007b3c:	873e                	mv	a4,a5
    80007b3e:	47bd                	li	a5,15
    80007b40:	02e7c263          	blt	a5,a4,80007b64 <argfd+0x68>
    80007b44:	ffffb097          	auipc	ra,0xffffb
    80007b48:	cd4080e7          	jalr	-812(ra) # 80002818 <myproc>
    80007b4c:	872a                	mv	a4,a0
    80007b4e:	fe442783          	lw	a5,-28(s0)
    80007b52:	07e9                	addi	a5,a5,26
    80007b54:	078e                	slli	a5,a5,0x3
    80007b56:	97ba                	add	a5,a5,a4
    80007b58:	639c                	ld	a5,0(a5)
    80007b5a:	fef43423          	sd	a5,-24(s0)
    80007b5e:	fe843783          	ld	a5,-24(s0)
    80007b62:	e399                	bnez	a5,80007b68 <argfd+0x6c>
    return -1;
    80007b64:	57fd                	li	a5,-1
    80007b66:	a015                	j	80007b8a <argfd+0x8e>
  if(pfd)
    80007b68:	fd043783          	ld	a5,-48(s0)
    80007b6c:	c791                	beqz	a5,80007b78 <argfd+0x7c>
    *pfd = fd;
    80007b6e:	fe442703          	lw	a4,-28(s0)
    80007b72:	fd043783          	ld	a5,-48(s0)
    80007b76:	c398                	sw	a4,0(a5)
  if(pf)
    80007b78:	fc843783          	ld	a5,-56(s0)
    80007b7c:	c791                	beqz	a5,80007b88 <argfd+0x8c>
    *pf = f;
    80007b7e:	fc843783          	ld	a5,-56(s0)
    80007b82:	fe843703          	ld	a4,-24(s0)
    80007b86:	e398                	sd	a4,0(a5)
  return 0;
    80007b88:	4781                	li	a5,0
}
    80007b8a:	853e                	mv	a0,a5
    80007b8c:	70e2                	ld	ra,56(sp)
    80007b8e:	7442                	ld	s0,48(sp)
    80007b90:	6121                	addi	sp,sp,64
    80007b92:	8082                	ret

0000000080007b94 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007b94:	7179                	addi	sp,sp,-48
    80007b96:	f406                	sd	ra,40(sp)
    80007b98:	f022                	sd	s0,32(sp)
    80007b9a:	1800                	addi	s0,sp,48
    80007b9c:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007ba0:	ffffb097          	auipc	ra,0xffffb
    80007ba4:	c78080e7          	jalr	-904(ra) # 80002818 <myproc>
    80007ba8:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007bac:	fe042623          	sw	zero,-20(s0)
    80007bb0:	a825                	j	80007be8 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007bb2:	fe043703          	ld	a4,-32(s0)
    80007bb6:	fec42783          	lw	a5,-20(s0)
    80007bba:	07e9                	addi	a5,a5,26
    80007bbc:	078e                	slli	a5,a5,0x3
    80007bbe:	97ba                	add	a5,a5,a4
    80007bc0:	639c                	ld	a5,0(a5)
    80007bc2:	ef91                	bnez	a5,80007bde <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007bc4:	fe043703          	ld	a4,-32(s0)
    80007bc8:	fec42783          	lw	a5,-20(s0)
    80007bcc:	07e9                	addi	a5,a5,26
    80007bce:	078e                	slli	a5,a5,0x3
    80007bd0:	97ba                	add	a5,a5,a4
    80007bd2:	fd843703          	ld	a4,-40(s0)
    80007bd6:	e398                	sd	a4,0(a5)
      return fd;
    80007bd8:	fec42783          	lw	a5,-20(s0)
    80007bdc:	a831                	j	80007bf8 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007bde:	fec42783          	lw	a5,-20(s0)
    80007be2:	2785                	addiw	a5,a5,1
    80007be4:	fef42623          	sw	a5,-20(s0)
    80007be8:	fec42783          	lw	a5,-20(s0)
    80007bec:	0007871b          	sext.w	a4,a5
    80007bf0:	47bd                	li	a5,15
    80007bf2:	fce7d0e3          	bge	a5,a4,80007bb2 <fdalloc+0x1e>
    }
  }
  return -1;
    80007bf6:	57fd                	li	a5,-1
}
    80007bf8:	853e                	mv	a0,a5
    80007bfa:	70a2                	ld	ra,40(sp)
    80007bfc:	7402                	ld	s0,32(sp)
    80007bfe:	6145                	addi	sp,sp,48
    80007c00:	8082                	ret

0000000080007c02 <sys_dup>:

uint64
sys_dup(void)
{
    80007c02:	1101                	addi	sp,sp,-32
    80007c04:	ec06                	sd	ra,24(sp)
    80007c06:	e822                	sd	s0,16(sp)
    80007c08:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007c0a:	fe040793          	addi	a5,s0,-32
    80007c0e:	863e                	mv	a2,a5
    80007c10:	4581                	li	a1,0
    80007c12:	4501                	li	a0,0
    80007c14:	00000097          	auipc	ra,0x0
    80007c18:	ee8080e7          	jalr	-280(ra) # 80007afc <argfd>
    80007c1c:	87aa                	mv	a5,a0
    80007c1e:	0007d463          	bgez	a5,80007c26 <sys_dup+0x24>
    return -1;
    80007c22:	57fd                	li	a5,-1
    80007c24:	a81d                	j	80007c5a <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007c26:	fe043783          	ld	a5,-32(s0)
    80007c2a:	853e                	mv	a0,a5
    80007c2c:	00000097          	auipc	ra,0x0
    80007c30:	f68080e7          	jalr	-152(ra) # 80007b94 <fdalloc>
    80007c34:	87aa                	mv	a5,a0
    80007c36:	fef42623          	sw	a5,-20(s0)
    80007c3a:	fec42783          	lw	a5,-20(s0)
    80007c3e:	2781                	sext.w	a5,a5
    80007c40:	0007d463          	bgez	a5,80007c48 <sys_dup+0x46>
    return -1;
    80007c44:	57fd                	li	a5,-1
    80007c46:	a811                	j	80007c5a <sys_dup+0x58>
  filedup(f);
    80007c48:	fe043783          	ld	a5,-32(s0)
    80007c4c:	853e                	mv	a0,a5
    80007c4e:	fffff097          	auipc	ra,0xfffff
    80007c52:	f20080e7          	jalr	-224(ra) # 80006b6e <filedup>
  return fd;
    80007c56:	fec42783          	lw	a5,-20(s0)
}
    80007c5a:	853e                	mv	a0,a5
    80007c5c:	60e2                	ld	ra,24(sp)
    80007c5e:	6442                	ld	s0,16(sp)
    80007c60:	6105                	addi	sp,sp,32
    80007c62:	8082                	ret

0000000080007c64 <sys_read>:

uint64
sys_read(void)
{
    80007c64:	7179                	addi	sp,sp,-48
    80007c66:	f406                	sd	ra,40(sp)
    80007c68:	f022                	sd	s0,32(sp)
    80007c6a:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007c6c:	fe840793          	addi	a5,s0,-24
    80007c70:	863e                	mv	a2,a5
    80007c72:	4581                	li	a1,0
    80007c74:	4501                	li	a0,0
    80007c76:	00000097          	auipc	ra,0x0
    80007c7a:	e86080e7          	jalr	-378(ra) # 80007afc <argfd>
    80007c7e:	87aa                	mv	a5,a0
    80007c80:	0207c863          	bltz	a5,80007cb0 <sys_read+0x4c>
    80007c84:	fe440793          	addi	a5,s0,-28
    80007c88:	85be                	mv	a1,a5
    80007c8a:	4509                	li	a0,2
    80007c8c:	ffffd097          	auipc	ra,0xffffd
    80007c90:	804080e7          	jalr	-2044(ra) # 80004490 <argint>
    80007c94:	87aa                	mv	a5,a0
    80007c96:	0007cd63          	bltz	a5,80007cb0 <sys_read+0x4c>
    80007c9a:	fd840793          	addi	a5,s0,-40
    80007c9e:	85be                	mv	a1,a5
    80007ca0:	4505                	li	a0,1
    80007ca2:	ffffd097          	auipc	ra,0xffffd
    80007ca6:	826080e7          	jalr	-2010(ra) # 800044c8 <argaddr>
    80007caa:	87aa                	mv	a5,a0
    80007cac:	0007d463          	bgez	a5,80007cb4 <sys_read+0x50>
    return -1;
    80007cb0:	57fd                	li	a5,-1
    80007cb2:	a839                	j	80007cd0 <sys_read+0x6c>
  return fileread(f, p, n);
    80007cb4:	fe843783          	ld	a5,-24(s0)
    80007cb8:	fd843703          	ld	a4,-40(s0)
    80007cbc:	fe442683          	lw	a3,-28(s0)
    80007cc0:	8636                	mv	a2,a3
    80007cc2:	85ba                	mv	a1,a4
    80007cc4:	853e                	mv	a0,a5
    80007cc6:	fffff097          	auipc	ra,0xfffff
    80007cca:	0ba080e7          	jalr	186(ra) # 80006d80 <fileread>
    80007cce:	87aa                	mv	a5,a0
}
    80007cd0:	853e                	mv	a0,a5
    80007cd2:	70a2                	ld	ra,40(sp)
    80007cd4:	7402                	ld	s0,32(sp)
    80007cd6:	6145                	addi	sp,sp,48
    80007cd8:	8082                	ret

0000000080007cda <sys_write>:

uint64
sys_write(void)
{
    80007cda:	7179                	addi	sp,sp,-48
    80007cdc:	f406                	sd	ra,40(sp)
    80007cde:	f022                	sd	s0,32(sp)
    80007ce0:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007ce2:	fe840793          	addi	a5,s0,-24
    80007ce6:	863e                	mv	a2,a5
    80007ce8:	4581                	li	a1,0
    80007cea:	4501                	li	a0,0
    80007cec:	00000097          	auipc	ra,0x0
    80007cf0:	e10080e7          	jalr	-496(ra) # 80007afc <argfd>
    80007cf4:	87aa                	mv	a5,a0
    80007cf6:	0207c863          	bltz	a5,80007d26 <sys_write+0x4c>
    80007cfa:	fe440793          	addi	a5,s0,-28
    80007cfe:	85be                	mv	a1,a5
    80007d00:	4509                	li	a0,2
    80007d02:	ffffc097          	auipc	ra,0xffffc
    80007d06:	78e080e7          	jalr	1934(ra) # 80004490 <argint>
    80007d0a:	87aa                	mv	a5,a0
    80007d0c:	0007cd63          	bltz	a5,80007d26 <sys_write+0x4c>
    80007d10:	fd840793          	addi	a5,s0,-40
    80007d14:	85be                	mv	a1,a5
    80007d16:	4505                	li	a0,1
    80007d18:	ffffc097          	auipc	ra,0xffffc
    80007d1c:	7b0080e7          	jalr	1968(ra) # 800044c8 <argaddr>
    80007d20:	87aa                	mv	a5,a0
    80007d22:	0007d463          	bgez	a5,80007d2a <sys_write+0x50>
    return -1;
    80007d26:	57fd                	li	a5,-1
    80007d28:	a839                	j	80007d46 <sys_write+0x6c>

  return filewrite(f, p, n);
    80007d2a:	fe843783          	ld	a5,-24(s0)
    80007d2e:	fd843703          	ld	a4,-40(s0)
    80007d32:	fe442683          	lw	a3,-28(s0)
    80007d36:	8636                	mv	a2,a3
    80007d38:	85ba                	mv	a1,a4
    80007d3a:	853e                	mv	a0,a5
    80007d3c:	fffff097          	auipc	ra,0xfffff
    80007d40:	1aa080e7          	jalr	426(ra) # 80006ee6 <filewrite>
    80007d44:	87aa                	mv	a5,a0
}
    80007d46:	853e                	mv	a0,a5
    80007d48:	70a2                	ld	ra,40(sp)
    80007d4a:	7402                	ld	s0,32(sp)
    80007d4c:	6145                	addi	sp,sp,48
    80007d4e:	8082                	ret

0000000080007d50 <sys_close>:

uint64
sys_close(void)
{
    80007d50:	1101                	addi	sp,sp,-32
    80007d52:	ec06                	sd	ra,24(sp)
    80007d54:	e822                	sd	s0,16(sp)
    80007d56:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007d58:	fe040713          	addi	a4,s0,-32
    80007d5c:	fec40793          	addi	a5,s0,-20
    80007d60:	863a                	mv	a2,a4
    80007d62:	85be                	mv	a1,a5
    80007d64:	4501                	li	a0,0
    80007d66:	00000097          	auipc	ra,0x0
    80007d6a:	d96080e7          	jalr	-618(ra) # 80007afc <argfd>
    80007d6e:	87aa                	mv	a5,a0
    80007d70:	0007d463          	bgez	a5,80007d78 <sys_close+0x28>
    return -1;
    80007d74:	57fd                	li	a5,-1
    80007d76:	a02d                	j	80007da0 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007d78:	ffffb097          	auipc	ra,0xffffb
    80007d7c:	aa0080e7          	jalr	-1376(ra) # 80002818 <myproc>
    80007d80:	872a                	mv	a4,a0
    80007d82:	fec42783          	lw	a5,-20(s0)
    80007d86:	07e9                	addi	a5,a5,26
    80007d88:	078e                	slli	a5,a5,0x3
    80007d8a:	97ba                	add	a5,a5,a4
    80007d8c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007d90:	fe043783          	ld	a5,-32(s0)
    80007d94:	853e                	mv	a0,a5
    80007d96:	fffff097          	auipc	ra,0xfffff
    80007d9a:	e3e080e7          	jalr	-450(ra) # 80006bd4 <fileclose>
  return 0;
    80007d9e:	4781                	li	a5,0
}
    80007da0:	853e                	mv	a0,a5
    80007da2:	60e2                	ld	ra,24(sp)
    80007da4:	6442                	ld	s0,16(sp)
    80007da6:	6105                	addi	sp,sp,32
    80007da8:	8082                	ret

0000000080007daa <sys_fstat>:

uint64
sys_fstat(void)
{
    80007daa:	1101                	addi	sp,sp,-32
    80007dac:	ec06                	sd	ra,24(sp)
    80007dae:	e822                	sd	s0,16(sp)
    80007db0:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80007db2:	fe840793          	addi	a5,s0,-24
    80007db6:	863e                	mv	a2,a5
    80007db8:	4581                	li	a1,0
    80007dba:	4501                	li	a0,0
    80007dbc:	00000097          	auipc	ra,0x0
    80007dc0:	d40080e7          	jalr	-704(ra) # 80007afc <argfd>
    80007dc4:	87aa                	mv	a5,a0
    80007dc6:	0007cd63          	bltz	a5,80007de0 <sys_fstat+0x36>
    80007dca:	fe040793          	addi	a5,s0,-32
    80007dce:	85be                	mv	a1,a5
    80007dd0:	4505                	li	a0,1
    80007dd2:	ffffc097          	auipc	ra,0xffffc
    80007dd6:	6f6080e7          	jalr	1782(ra) # 800044c8 <argaddr>
    80007dda:	87aa                	mv	a5,a0
    80007ddc:	0007d463          	bgez	a5,80007de4 <sys_fstat+0x3a>
    return -1;
    80007de0:	57fd                	li	a5,-1
    80007de2:	a821                	j	80007dfa <sys_fstat+0x50>
  return filestat(f, st);
    80007de4:	fe843783          	ld	a5,-24(s0)
    80007de8:	fe043703          	ld	a4,-32(s0)
    80007dec:	85ba                	mv	a1,a4
    80007dee:	853e                	mv	a0,a5
    80007df0:	fffff097          	auipc	ra,0xfffff
    80007df4:	eec080e7          	jalr	-276(ra) # 80006cdc <filestat>
    80007df8:	87aa                	mv	a5,a0
}
    80007dfa:	853e                	mv	a0,a5
    80007dfc:	60e2                	ld	ra,24(sp)
    80007dfe:	6442                	ld	s0,16(sp)
    80007e00:	6105                	addi	sp,sp,32
    80007e02:	8082                	ret

0000000080007e04 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007e04:	7169                	addi	sp,sp,-304
    80007e06:	f606                	sd	ra,296(sp)
    80007e08:	f222                	sd	s0,288(sp)
    80007e0a:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007e0c:	ed040793          	addi	a5,s0,-304
    80007e10:	08000613          	li	a2,128
    80007e14:	85be                	mv	a1,a5
    80007e16:	4501                	li	a0,0
    80007e18:	ffffc097          	auipc	ra,0xffffc
    80007e1c:	6e4080e7          	jalr	1764(ra) # 800044fc <argstr>
    80007e20:	87aa                	mv	a5,a0
    80007e22:	0007cf63          	bltz	a5,80007e40 <sys_link+0x3c>
    80007e26:	f5040793          	addi	a5,s0,-176
    80007e2a:	08000613          	li	a2,128
    80007e2e:	85be                	mv	a1,a5
    80007e30:	4505                	li	a0,1
    80007e32:	ffffc097          	auipc	ra,0xffffc
    80007e36:	6ca080e7          	jalr	1738(ra) # 800044fc <argstr>
    80007e3a:	87aa                	mv	a5,a0
    80007e3c:	0007d463          	bgez	a5,80007e44 <sys_link+0x40>
    return -1;
    80007e40:	57fd                	li	a5,-1
    80007e42:	aab5                	j	80007fbe <sys_link+0x1ba>

  begin_op();
    80007e44:	ffffe097          	auipc	ra,0xffffe
    80007e48:	6f6080e7          	jalr	1782(ra) # 8000653a <begin_op>
  if((ip = namei(old)) == 0){
    80007e4c:	ed040793          	addi	a5,s0,-304
    80007e50:	853e                	mv	a0,a5
    80007e52:	ffffe097          	auipc	ra,0xffffe
    80007e56:	384080e7          	jalr	900(ra) # 800061d6 <namei>
    80007e5a:	fea43423          	sd	a0,-24(s0)
    80007e5e:	fe843783          	ld	a5,-24(s0)
    80007e62:	e799                	bnez	a5,80007e70 <sys_link+0x6c>
    end_op();
    80007e64:	ffffe097          	auipc	ra,0xffffe
    80007e68:	798080e7          	jalr	1944(ra) # 800065fc <end_op>
    return -1;
    80007e6c:	57fd                	li	a5,-1
    80007e6e:	aa81                	j	80007fbe <sys_link+0x1ba>
  }

  ilock(ip);
    80007e70:	fe843503          	ld	a0,-24(s0)
    80007e74:	ffffd097          	auipc	ra,0xffffd
    80007e78:	66c080e7          	jalr	1644(ra) # 800054e0 <ilock>
  if(ip->type == T_DIR){
    80007e7c:	fe843783          	ld	a5,-24(s0)
    80007e80:	04479783          	lh	a5,68(a5)
    80007e84:	0007871b          	sext.w	a4,a5
    80007e88:	4785                	li	a5,1
    80007e8a:	00f71e63          	bne	a4,a5,80007ea6 <sys_link+0xa2>
    iunlockput(ip);
    80007e8e:	fe843503          	ld	a0,-24(s0)
    80007e92:	ffffe097          	auipc	ra,0xffffe
    80007e96:	8ac080e7          	jalr	-1876(ra) # 8000573e <iunlockput>
    end_op();
    80007e9a:	ffffe097          	auipc	ra,0xffffe
    80007e9e:	762080e7          	jalr	1890(ra) # 800065fc <end_op>
    return -1;
    80007ea2:	57fd                	li	a5,-1
    80007ea4:	aa29                	j	80007fbe <sys_link+0x1ba>
  }

  ip->nlink++;
    80007ea6:	fe843783          	ld	a5,-24(s0)
    80007eaa:	04a79783          	lh	a5,74(a5)
    80007eae:	17c2                	slli	a5,a5,0x30
    80007eb0:	93c1                	srli	a5,a5,0x30
    80007eb2:	2785                	addiw	a5,a5,1
    80007eb4:	17c2                	slli	a5,a5,0x30
    80007eb6:	93c1                	srli	a5,a5,0x30
    80007eb8:	0107971b          	slliw	a4,a5,0x10
    80007ebc:	4107571b          	sraiw	a4,a4,0x10
    80007ec0:	fe843783          	ld	a5,-24(s0)
    80007ec4:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007ec8:	fe843503          	ld	a0,-24(s0)
    80007ecc:	ffffd097          	auipc	ra,0xffffd
    80007ed0:	3c4080e7          	jalr	964(ra) # 80005290 <iupdate>
  iunlock(ip);
    80007ed4:	fe843503          	ld	a0,-24(s0)
    80007ed8:	ffffd097          	auipc	ra,0xffffd
    80007edc:	73c080e7          	jalr	1852(ra) # 80005614 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007ee0:	fd040713          	addi	a4,s0,-48
    80007ee4:	f5040793          	addi	a5,s0,-176
    80007ee8:	85ba                	mv	a1,a4
    80007eea:	853e                	mv	a0,a5
    80007eec:	ffffe097          	auipc	ra,0xffffe
    80007ef0:	316080e7          	jalr	790(ra) # 80006202 <nameiparent>
    80007ef4:	fea43023          	sd	a0,-32(s0)
    80007ef8:	fe043783          	ld	a5,-32(s0)
    80007efc:	cba5                	beqz	a5,80007f6c <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007efe:	fe043503          	ld	a0,-32(s0)
    80007f02:	ffffd097          	auipc	ra,0xffffd
    80007f06:	5de080e7          	jalr	1502(ra) # 800054e0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007f0a:	fe043783          	ld	a5,-32(s0)
    80007f0e:	4398                	lw	a4,0(a5)
    80007f10:	fe843783          	ld	a5,-24(s0)
    80007f14:	439c                	lw	a5,0(a5)
    80007f16:	02f71263          	bne	a4,a5,80007f3a <sys_link+0x136>
    80007f1a:	fe843783          	ld	a5,-24(s0)
    80007f1e:	43d8                	lw	a4,4(a5)
    80007f20:	fd040793          	addi	a5,s0,-48
    80007f24:	863a                	mv	a2,a4
    80007f26:	85be                	mv	a1,a5
    80007f28:	fe043503          	ld	a0,-32(s0)
    80007f2c:	ffffe097          	auipc	ra,0xffffe
    80007f30:	f90080e7          	jalr	-112(ra) # 80005ebc <dirlink>
    80007f34:	87aa                	mv	a5,a0
    80007f36:	0007d963          	bgez	a5,80007f48 <sys_link+0x144>
    iunlockput(dp);
    80007f3a:	fe043503          	ld	a0,-32(s0)
    80007f3e:	ffffe097          	auipc	ra,0xffffe
    80007f42:	800080e7          	jalr	-2048(ra) # 8000573e <iunlockput>
    goto bad;
    80007f46:	a025                	j	80007f6e <sys_link+0x16a>
  }
  iunlockput(dp);
    80007f48:	fe043503          	ld	a0,-32(s0)
    80007f4c:	ffffd097          	auipc	ra,0xffffd
    80007f50:	7f2080e7          	jalr	2034(ra) # 8000573e <iunlockput>
  iput(ip);
    80007f54:	fe843503          	ld	a0,-24(s0)
    80007f58:	ffffd097          	auipc	ra,0xffffd
    80007f5c:	716080e7          	jalr	1814(ra) # 8000566e <iput>

  end_op();
    80007f60:	ffffe097          	auipc	ra,0xffffe
    80007f64:	69c080e7          	jalr	1692(ra) # 800065fc <end_op>

  return 0;
    80007f68:	4781                	li	a5,0
    80007f6a:	a891                	j	80007fbe <sys_link+0x1ba>
    goto bad;
    80007f6c:	0001                	nop

bad:
  ilock(ip);
    80007f6e:	fe843503          	ld	a0,-24(s0)
    80007f72:	ffffd097          	auipc	ra,0xffffd
    80007f76:	56e080e7          	jalr	1390(ra) # 800054e0 <ilock>
  ip->nlink--;
    80007f7a:	fe843783          	ld	a5,-24(s0)
    80007f7e:	04a79783          	lh	a5,74(a5)
    80007f82:	17c2                	slli	a5,a5,0x30
    80007f84:	93c1                	srli	a5,a5,0x30
    80007f86:	37fd                	addiw	a5,a5,-1
    80007f88:	17c2                	slli	a5,a5,0x30
    80007f8a:	93c1                	srli	a5,a5,0x30
    80007f8c:	0107971b          	slliw	a4,a5,0x10
    80007f90:	4107571b          	sraiw	a4,a4,0x10
    80007f94:	fe843783          	ld	a5,-24(s0)
    80007f98:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007f9c:	fe843503          	ld	a0,-24(s0)
    80007fa0:	ffffd097          	auipc	ra,0xffffd
    80007fa4:	2f0080e7          	jalr	752(ra) # 80005290 <iupdate>
  iunlockput(ip);
    80007fa8:	fe843503          	ld	a0,-24(s0)
    80007fac:	ffffd097          	auipc	ra,0xffffd
    80007fb0:	792080e7          	jalr	1938(ra) # 8000573e <iunlockput>
  end_op();
    80007fb4:	ffffe097          	auipc	ra,0xffffe
    80007fb8:	648080e7          	jalr	1608(ra) # 800065fc <end_op>
  return -1;
    80007fbc:	57fd                	li	a5,-1
}
    80007fbe:	853e                	mv	a0,a5
    80007fc0:	70b2                	ld	ra,296(sp)
    80007fc2:	7412                	ld	s0,288(sp)
    80007fc4:	6155                	addi	sp,sp,304
    80007fc6:	8082                	ret

0000000080007fc8 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007fc8:	7139                	addi	sp,sp,-64
    80007fca:	fc06                	sd	ra,56(sp)
    80007fcc:	f822                	sd	s0,48(sp)
    80007fce:	0080                	addi	s0,sp,64
    80007fd0:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007fd4:	02000793          	li	a5,32
    80007fd8:	fef42623          	sw	a5,-20(s0)
    80007fdc:	a0b1                	j	80008028 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007fde:	fd840793          	addi	a5,s0,-40
    80007fe2:	fec42683          	lw	a3,-20(s0)
    80007fe6:	4741                	li	a4,16
    80007fe8:	863e                	mv	a2,a5
    80007fea:	4581                	li	a1,0
    80007fec:	fc843503          	ld	a0,-56(s0)
    80007ff0:	ffffe097          	auipc	ra,0xffffe
    80007ff4:	a86080e7          	jalr	-1402(ra) # 80005a76 <readi>
    80007ff8:	87aa                	mv	a5,a0
    80007ffa:	873e                	mv	a4,a5
    80007ffc:	47c1                	li	a5,16
    80007ffe:	00f70a63          	beq	a4,a5,80008012 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80008002:	00003517          	auipc	a0,0x3
    80008006:	64e50513          	addi	a0,a0,1614 # 8000b650 <etext+0x650>
    8000800a:	ffff9097          	auipc	ra,0xffff9
    8000800e:	c74080e7          	jalr	-908(ra) # 80000c7e <panic>
    if(de.inum != 0)
    80008012:	fd845783          	lhu	a5,-40(s0)
    80008016:	c399                	beqz	a5,8000801c <isdirempty+0x54>
      return 0;
    80008018:	4781                	li	a5,0
    8000801a:	a839                	j	80008038 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    8000801c:	fec42783          	lw	a5,-20(s0)
    80008020:	27c1                	addiw	a5,a5,16
    80008022:	2781                	sext.w	a5,a5
    80008024:	fef42623          	sw	a5,-20(s0)
    80008028:	fc843783          	ld	a5,-56(s0)
    8000802c:	47f8                	lw	a4,76(a5)
    8000802e:	fec42783          	lw	a5,-20(s0)
    80008032:	fae7e6e3          	bltu	a5,a4,80007fde <isdirempty+0x16>
  }
  return 1;
    80008036:	4785                	li	a5,1
}
    80008038:	853e                	mv	a0,a5
    8000803a:	70e2                	ld	ra,56(sp)
    8000803c:	7442                	ld	s0,48(sp)
    8000803e:	6121                	addi	sp,sp,64
    80008040:	8082                	ret

0000000080008042 <sys_unlink>:

uint64
sys_unlink(void)
{
    80008042:	7155                	addi	sp,sp,-208
    80008044:	e586                	sd	ra,200(sp)
    80008046:	e1a2                	sd	s0,192(sp)
    80008048:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    8000804a:	f4040793          	addi	a5,s0,-192
    8000804e:	08000613          	li	a2,128
    80008052:	85be                	mv	a1,a5
    80008054:	4501                	li	a0,0
    80008056:	ffffc097          	auipc	ra,0xffffc
    8000805a:	4a6080e7          	jalr	1190(ra) # 800044fc <argstr>
    8000805e:	87aa                	mv	a5,a0
    80008060:	0007d463          	bgez	a5,80008068 <sys_unlink+0x26>
    return -1;
    80008064:	57fd                	li	a5,-1
    80008066:	a2ed                	j	80008250 <sys_unlink+0x20e>

  begin_op();
    80008068:	ffffe097          	auipc	ra,0xffffe
    8000806c:	4d2080e7          	jalr	1234(ra) # 8000653a <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80008070:	fc040713          	addi	a4,s0,-64
    80008074:	f4040793          	addi	a5,s0,-192
    80008078:	85ba                	mv	a1,a4
    8000807a:	853e                	mv	a0,a5
    8000807c:	ffffe097          	auipc	ra,0xffffe
    80008080:	186080e7          	jalr	390(ra) # 80006202 <nameiparent>
    80008084:	fea43423          	sd	a0,-24(s0)
    80008088:	fe843783          	ld	a5,-24(s0)
    8000808c:	e799                	bnez	a5,8000809a <sys_unlink+0x58>
    end_op();
    8000808e:	ffffe097          	auipc	ra,0xffffe
    80008092:	56e080e7          	jalr	1390(ra) # 800065fc <end_op>
    return -1;
    80008096:	57fd                	li	a5,-1
    80008098:	aa65                	j	80008250 <sys_unlink+0x20e>
  }

  ilock(dp);
    8000809a:	fe843503          	ld	a0,-24(s0)
    8000809e:	ffffd097          	auipc	ra,0xffffd
    800080a2:	442080e7          	jalr	1090(ra) # 800054e0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    800080a6:	fc040793          	addi	a5,s0,-64
    800080aa:	00003597          	auipc	a1,0x3
    800080ae:	5be58593          	addi	a1,a1,1470 # 8000b668 <etext+0x668>
    800080b2:	853e                	mv	a0,a5
    800080b4:	ffffe097          	auipc	ra,0xffffe
    800080b8:	cf2080e7          	jalr	-782(ra) # 80005da6 <namecmp>
    800080bc:	87aa                	mv	a5,a0
    800080be:	16078b63          	beqz	a5,80008234 <sys_unlink+0x1f2>
    800080c2:	fc040793          	addi	a5,s0,-64
    800080c6:	00003597          	auipc	a1,0x3
    800080ca:	5aa58593          	addi	a1,a1,1450 # 8000b670 <etext+0x670>
    800080ce:	853e                	mv	a0,a5
    800080d0:	ffffe097          	auipc	ra,0xffffe
    800080d4:	cd6080e7          	jalr	-810(ra) # 80005da6 <namecmp>
    800080d8:	87aa                	mv	a5,a0
    800080da:	14078d63          	beqz	a5,80008234 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    800080de:	f3c40713          	addi	a4,s0,-196
    800080e2:	fc040793          	addi	a5,s0,-64
    800080e6:	863a                	mv	a2,a4
    800080e8:	85be                	mv	a1,a5
    800080ea:	fe843503          	ld	a0,-24(s0)
    800080ee:	ffffe097          	auipc	ra,0xffffe
    800080f2:	ce6080e7          	jalr	-794(ra) # 80005dd4 <dirlookup>
    800080f6:	fea43023          	sd	a0,-32(s0)
    800080fa:	fe043783          	ld	a5,-32(s0)
    800080fe:	12078d63          	beqz	a5,80008238 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80008102:	fe043503          	ld	a0,-32(s0)
    80008106:	ffffd097          	auipc	ra,0xffffd
    8000810a:	3da080e7          	jalr	986(ra) # 800054e0 <ilock>

  if(ip->nlink < 1)
    8000810e:	fe043783          	ld	a5,-32(s0)
    80008112:	04a79783          	lh	a5,74(a5)
    80008116:	2781                	sext.w	a5,a5
    80008118:	00f04a63          	bgtz	a5,8000812c <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    8000811c:	00003517          	auipc	a0,0x3
    80008120:	55c50513          	addi	a0,a0,1372 # 8000b678 <etext+0x678>
    80008124:	ffff9097          	auipc	ra,0xffff9
    80008128:	b5a080e7          	jalr	-1190(ra) # 80000c7e <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    8000812c:	fe043783          	ld	a5,-32(s0)
    80008130:	04479783          	lh	a5,68(a5)
    80008134:	0007871b          	sext.w	a4,a5
    80008138:	4785                	li	a5,1
    8000813a:	02f71163          	bne	a4,a5,8000815c <sys_unlink+0x11a>
    8000813e:	fe043503          	ld	a0,-32(s0)
    80008142:	00000097          	auipc	ra,0x0
    80008146:	e86080e7          	jalr	-378(ra) # 80007fc8 <isdirempty>
    8000814a:	87aa                	mv	a5,a0
    8000814c:	eb81                	bnez	a5,8000815c <sys_unlink+0x11a>
    iunlockput(ip);
    8000814e:	fe043503          	ld	a0,-32(s0)
    80008152:	ffffd097          	auipc	ra,0xffffd
    80008156:	5ec080e7          	jalr	1516(ra) # 8000573e <iunlockput>
    goto bad;
    8000815a:	a0c5                	j	8000823a <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    8000815c:	fd040793          	addi	a5,s0,-48
    80008160:	4641                	li	a2,16
    80008162:	4581                	li	a1,0
    80008164:	853e                	mv	a0,a5
    80008166:	ffff9097          	auipc	ra,0xffff9
    8000816a:	2dc080e7          	jalr	732(ra) # 80001442 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000816e:	fd040793          	addi	a5,s0,-48
    80008172:	f3c42683          	lw	a3,-196(s0)
    80008176:	4741                	li	a4,16
    80008178:	863e                	mv	a2,a5
    8000817a:	4581                	li	a1,0
    8000817c:	fe843503          	ld	a0,-24(s0)
    80008180:	ffffe097          	auipc	ra,0xffffe
    80008184:	a80080e7          	jalr	-1408(ra) # 80005c00 <writei>
    80008188:	87aa                	mv	a5,a0
    8000818a:	873e                	mv	a4,a5
    8000818c:	47c1                	li	a5,16
    8000818e:	00f70a63          	beq	a4,a5,800081a2 <sys_unlink+0x160>
    panic("unlink: writei");
    80008192:	00003517          	auipc	a0,0x3
    80008196:	4fe50513          	addi	a0,a0,1278 # 8000b690 <etext+0x690>
    8000819a:	ffff9097          	auipc	ra,0xffff9
    8000819e:	ae4080e7          	jalr	-1308(ra) # 80000c7e <panic>
  if(ip->type == T_DIR){
    800081a2:	fe043783          	ld	a5,-32(s0)
    800081a6:	04479783          	lh	a5,68(a5)
    800081aa:	0007871b          	sext.w	a4,a5
    800081ae:	4785                	li	a5,1
    800081b0:	02f71963          	bne	a4,a5,800081e2 <sys_unlink+0x1a0>
    dp->nlink--;
    800081b4:	fe843783          	ld	a5,-24(s0)
    800081b8:	04a79783          	lh	a5,74(a5)
    800081bc:	17c2                	slli	a5,a5,0x30
    800081be:	93c1                	srli	a5,a5,0x30
    800081c0:	37fd                	addiw	a5,a5,-1
    800081c2:	17c2                	slli	a5,a5,0x30
    800081c4:	93c1                	srli	a5,a5,0x30
    800081c6:	0107971b          	slliw	a4,a5,0x10
    800081ca:	4107571b          	sraiw	a4,a4,0x10
    800081ce:	fe843783          	ld	a5,-24(s0)
    800081d2:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800081d6:	fe843503          	ld	a0,-24(s0)
    800081da:	ffffd097          	auipc	ra,0xffffd
    800081de:	0b6080e7          	jalr	182(ra) # 80005290 <iupdate>
  }
  iunlockput(dp);
    800081e2:	fe843503          	ld	a0,-24(s0)
    800081e6:	ffffd097          	auipc	ra,0xffffd
    800081ea:	558080e7          	jalr	1368(ra) # 8000573e <iunlockput>

  ip->nlink--;
    800081ee:	fe043783          	ld	a5,-32(s0)
    800081f2:	04a79783          	lh	a5,74(a5)
    800081f6:	17c2                	slli	a5,a5,0x30
    800081f8:	93c1                	srli	a5,a5,0x30
    800081fa:	37fd                	addiw	a5,a5,-1
    800081fc:	17c2                	slli	a5,a5,0x30
    800081fe:	93c1                	srli	a5,a5,0x30
    80008200:	0107971b          	slliw	a4,a5,0x10
    80008204:	4107571b          	sraiw	a4,a4,0x10
    80008208:	fe043783          	ld	a5,-32(s0)
    8000820c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008210:	fe043503          	ld	a0,-32(s0)
    80008214:	ffffd097          	auipc	ra,0xffffd
    80008218:	07c080e7          	jalr	124(ra) # 80005290 <iupdate>
  iunlockput(ip);
    8000821c:	fe043503          	ld	a0,-32(s0)
    80008220:	ffffd097          	auipc	ra,0xffffd
    80008224:	51e080e7          	jalr	1310(ra) # 8000573e <iunlockput>

  end_op();
    80008228:	ffffe097          	auipc	ra,0xffffe
    8000822c:	3d4080e7          	jalr	980(ra) # 800065fc <end_op>

  return 0;
    80008230:	4781                	li	a5,0
    80008232:	a839                	j	80008250 <sys_unlink+0x20e>
    goto bad;
    80008234:	0001                	nop
    80008236:	a011                	j	8000823a <sys_unlink+0x1f8>
    goto bad;
    80008238:	0001                	nop

bad:
  iunlockput(dp);
    8000823a:	fe843503          	ld	a0,-24(s0)
    8000823e:	ffffd097          	auipc	ra,0xffffd
    80008242:	500080e7          	jalr	1280(ra) # 8000573e <iunlockput>
  end_op();
    80008246:	ffffe097          	auipc	ra,0xffffe
    8000824a:	3b6080e7          	jalr	950(ra) # 800065fc <end_op>
  return -1;
    8000824e:	57fd                	li	a5,-1
}
    80008250:	853e                	mv	a0,a5
    80008252:	60ae                	ld	ra,200(sp)
    80008254:	640e                	ld	s0,192(sp)
    80008256:	6169                	addi	sp,sp,208
    80008258:	8082                	ret

000000008000825a <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    8000825a:	7139                	addi	sp,sp,-64
    8000825c:	fc06                	sd	ra,56(sp)
    8000825e:	f822                	sd	s0,48(sp)
    80008260:	0080                	addi	s0,sp,64
    80008262:	fca43423          	sd	a0,-56(s0)
    80008266:	87ae                	mv	a5,a1
    80008268:	8736                	mv	a4,a3
    8000826a:	fcf41323          	sh	a5,-58(s0)
    8000826e:	87b2                	mv	a5,a2
    80008270:	fcf41223          	sh	a5,-60(s0)
    80008274:	87ba                	mv	a5,a4
    80008276:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    8000827a:	fd040793          	addi	a5,s0,-48
    8000827e:	85be                	mv	a1,a5
    80008280:	fc843503          	ld	a0,-56(s0)
    80008284:	ffffe097          	auipc	ra,0xffffe
    80008288:	f7e080e7          	jalr	-130(ra) # 80006202 <nameiparent>
    8000828c:	fea43423          	sd	a0,-24(s0)
    80008290:	fe843783          	ld	a5,-24(s0)
    80008294:	e399                	bnez	a5,8000829a <create+0x40>
    return 0;
    80008296:	4781                	li	a5,0
    80008298:	a2d9                	j	8000845e <create+0x204>

  ilock(dp);
    8000829a:	fe843503          	ld	a0,-24(s0)
    8000829e:	ffffd097          	auipc	ra,0xffffd
    800082a2:	242080e7          	jalr	578(ra) # 800054e0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    800082a6:	fd040793          	addi	a5,s0,-48
    800082aa:	4601                	li	a2,0
    800082ac:	85be                	mv	a1,a5
    800082ae:	fe843503          	ld	a0,-24(s0)
    800082b2:	ffffe097          	auipc	ra,0xffffe
    800082b6:	b22080e7          	jalr	-1246(ra) # 80005dd4 <dirlookup>
    800082ba:	fea43023          	sd	a0,-32(s0)
    800082be:	fe043783          	ld	a5,-32(s0)
    800082c2:	c3ad                	beqz	a5,80008324 <create+0xca>
    iunlockput(dp);
    800082c4:	fe843503          	ld	a0,-24(s0)
    800082c8:	ffffd097          	auipc	ra,0xffffd
    800082cc:	476080e7          	jalr	1142(ra) # 8000573e <iunlockput>
    ilock(ip);
    800082d0:	fe043503          	ld	a0,-32(s0)
    800082d4:	ffffd097          	auipc	ra,0xffffd
    800082d8:	20c080e7          	jalr	524(ra) # 800054e0 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    800082dc:	fc641783          	lh	a5,-58(s0)
    800082e0:	0007871b          	sext.w	a4,a5
    800082e4:	4789                	li	a5,2
    800082e6:	02f71763          	bne	a4,a5,80008314 <create+0xba>
    800082ea:	fe043783          	ld	a5,-32(s0)
    800082ee:	04479783          	lh	a5,68(a5)
    800082f2:	0007871b          	sext.w	a4,a5
    800082f6:	4789                	li	a5,2
    800082f8:	00f70b63          	beq	a4,a5,8000830e <create+0xb4>
    800082fc:	fe043783          	ld	a5,-32(s0)
    80008300:	04479783          	lh	a5,68(a5)
    80008304:	0007871b          	sext.w	a4,a5
    80008308:	478d                	li	a5,3
    8000830a:	00f71563          	bne	a4,a5,80008314 <create+0xba>
      return ip;
    8000830e:	fe043783          	ld	a5,-32(s0)
    80008312:	a2b1                	j	8000845e <create+0x204>
    iunlockput(ip);
    80008314:	fe043503          	ld	a0,-32(s0)
    80008318:	ffffd097          	auipc	ra,0xffffd
    8000831c:	426080e7          	jalr	1062(ra) # 8000573e <iunlockput>
    return 0;
    80008320:	4781                	li	a5,0
    80008322:	aa35                	j	8000845e <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    80008324:	fe843783          	ld	a5,-24(s0)
    80008328:	439c                	lw	a5,0(a5)
    8000832a:	fc641703          	lh	a4,-58(s0)
    8000832e:	85ba                	mv	a1,a4
    80008330:	853e                	mv	a0,a5
    80008332:	ffffd097          	auipc	ra,0xffffd
    80008336:	e62080e7          	jalr	-414(ra) # 80005194 <ialloc>
    8000833a:	fea43023          	sd	a0,-32(s0)
    8000833e:	fe043783          	ld	a5,-32(s0)
    80008342:	eb89                	bnez	a5,80008354 <create+0xfa>
    panic("create: ialloc");
    80008344:	00003517          	auipc	a0,0x3
    80008348:	35c50513          	addi	a0,a0,860 # 8000b6a0 <etext+0x6a0>
    8000834c:	ffff9097          	auipc	ra,0xffff9
    80008350:	932080e7          	jalr	-1742(ra) # 80000c7e <panic>

  ilock(ip);
    80008354:	fe043503          	ld	a0,-32(s0)
    80008358:	ffffd097          	auipc	ra,0xffffd
    8000835c:	188080e7          	jalr	392(ra) # 800054e0 <ilock>
  ip->major = major;
    80008360:	fe043783          	ld	a5,-32(s0)
    80008364:	fc445703          	lhu	a4,-60(s0)
    80008368:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000836c:	fe043783          	ld	a5,-32(s0)
    80008370:	fc245703          	lhu	a4,-62(s0)
    80008374:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008378:	fe043783          	ld	a5,-32(s0)
    8000837c:	4705                	li	a4,1
    8000837e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008382:	fe043503          	ld	a0,-32(s0)
    80008386:	ffffd097          	auipc	ra,0xffffd
    8000838a:	f0a080e7          	jalr	-246(ra) # 80005290 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    8000838e:	fc641783          	lh	a5,-58(s0)
    80008392:	0007871b          	sext.w	a4,a5
    80008396:	4785                	li	a5,1
    80008398:	08f71363          	bne	a4,a5,8000841e <create+0x1c4>
    dp->nlink++;  // for ".."
    8000839c:	fe843783          	ld	a5,-24(s0)
    800083a0:	04a79783          	lh	a5,74(a5)
    800083a4:	17c2                	slli	a5,a5,0x30
    800083a6:	93c1                	srli	a5,a5,0x30
    800083a8:	2785                	addiw	a5,a5,1
    800083aa:	17c2                	slli	a5,a5,0x30
    800083ac:	93c1                	srli	a5,a5,0x30
    800083ae:	0107971b          	slliw	a4,a5,0x10
    800083b2:	4107571b          	sraiw	a4,a4,0x10
    800083b6:	fe843783          	ld	a5,-24(s0)
    800083ba:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800083be:	fe843503          	ld	a0,-24(s0)
    800083c2:	ffffd097          	auipc	ra,0xffffd
    800083c6:	ece080e7          	jalr	-306(ra) # 80005290 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    800083ca:	fe043783          	ld	a5,-32(s0)
    800083ce:	43dc                	lw	a5,4(a5)
    800083d0:	863e                	mv	a2,a5
    800083d2:	00003597          	auipc	a1,0x3
    800083d6:	29658593          	addi	a1,a1,662 # 8000b668 <etext+0x668>
    800083da:	fe043503          	ld	a0,-32(s0)
    800083de:	ffffe097          	auipc	ra,0xffffe
    800083e2:	ade080e7          	jalr	-1314(ra) # 80005ebc <dirlink>
    800083e6:	87aa                	mv	a5,a0
    800083e8:	0207c363          	bltz	a5,8000840e <create+0x1b4>
    800083ec:	fe843783          	ld	a5,-24(s0)
    800083f0:	43dc                	lw	a5,4(a5)
    800083f2:	863e                	mv	a2,a5
    800083f4:	00003597          	auipc	a1,0x3
    800083f8:	27c58593          	addi	a1,a1,636 # 8000b670 <etext+0x670>
    800083fc:	fe043503          	ld	a0,-32(s0)
    80008400:	ffffe097          	auipc	ra,0xffffe
    80008404:	abc080e7          	jalr	-1348(ra) # 80005ebc <dirlink>
    80008408:	87aa                	mv	a5,a0
    8000840a:	0007da63          	bgez	a5,8000841e <create+0x1c4>
      panic("create dots");
    8000840e:	00003517          	auipc	a0,0x3
    80008412:	2a250513          	addi	a0,a0,674 # 8000b6b0 <etext+0x6b0>
    80008416:	ffff9097          	auipc	ra,0xffff9
    8000841a:	868080e7          	jalr	-1944(ra) # 80000c7e <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000841e:	fe043783          	ld	a5,-32(s0)
    80008422:	43d8                	lw	a4,4(a5)
    80008424:	fd040793          	addi	a5,s0,-48
    80008428:	863a                	mv	a2,a4
    8000842a:	85be                	mv	a1,a5
    8000842c:	fe843503          	ld	a0,-24(s0)
    80008430:	ffffe097          	auipc	ra,0xffffe
    80008434:	a8c080e7          	jalr	-1396(ra) # 80005ebc <dirlink>
    80008438:	87aa                	mv	a5,a0
    8000843a:	0007da63          	bgez	a5,8000844e <create+0x1f4>
    panic("create: dirlink");
    8000843e:	00003517          	auipc	a0,0x3
    80008442:	28250513          	addi	a0,a0,642 # 8000b6c0 <etext+0x6c0>
    80008446:	ffff9097          	auipc	ra,0xffff9
    8000844a:	838080e7          	jalr	-1992(ra) # 80000c7e <panic>

  iunlockput(dp);
    8000844e:	fe843503          	ld	a0,-24(s0)
    80008452:	ffffd097          	auipc	ra,0xffffd
    80008456:	2ec080e7          	jalr	748(ra) # 8000573e <iunlockput>

  return ip;
    8000845a:	fe043783          	ld	a5,-32(s0)
}
    8000845e:	853e                	mv	a0,a5
    80008460:	70e2                	ld	ra,56(sp)
    80008462:	7442                	ld	s0,48(sp)
    80008464:	6121                	addi	sp,sp,64
    80008466:	8082                	ret

0000000080008468 <sys_open>:

uint64
sys_open(void)
{
    80008468:	7131                	addi	sp,sp,-192
    8000846a:	fd06                	sd	ra,184(sp)
    8000846c:	f922                	sd	s0,176(sp)
    8000846e:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80008470:	f5040793          	addi	a5,s0,-176
    80008474:	08000613          	li	a2,128
    80008478:	85be                	mv	a1,a5
    8000847a:	4501                	li	a0,0
    8000847c:	ffffc097          	auipc	ra,0xffffc
    80008480:	080080e7          	jalr	128(ra) # 800044fc <argstr>
    80008484:	87aa                	mv	a5,a0
    80008486:	fef42223          	sw	a5,-28(s0)
    8000848a:	fe442783          	lw	a5,-28(s0)
    8000848e:	2781                	sext.w	a5,a5
    80008490:	0007cd63          	bltz	a5,800084aa <sys_open+0x42>
    80008494:	f4c40793          	addi	a5,s0,-180
    80008498:	85be                	mv	a1,a5
    8000849a:	4505                	li	a0,1
    8000849c:	ffffc097          	auipc	ra,0xffffc
    800084a0:	ff4080e7          	jalr	-12(ra) # 80004490 <argint>
    800084a4:	87aa                	mv	a5,a0
    800084a6:	0007d463          	bgez	a5,800084ae <sys_open+0x46>
    return -1;
    800084aa:	57fd                	li	a5,-1
    800084ac:	a429                	j	800086b6 <sys_open+0x24e>

  begin_op();
    800084ae:	ffffe097          	auipc	ra,0xffffe
    800084b2:	08c080e7          	jalr	140(ra) # 8000653a <begin_op>

  if(omode & O_CREATE){
    800084b6:	f4c42783          	lw	a5,-180(s0)
    800084ba:	2007f793          	andi	a5,a5,512
    800084be:	2781                	sext.w	a5,a5
    800084c0:	c795                	beqz	a5,800084ec <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    800084c2:	f5040793          	addi	a5,s0,-176
    800084c6:	4681                	li	a3,0
    800084c8:	4601                	li	a2,0
    800084ca:	4589                	li	a1,2
    800084cc:	853e                	mv	a0,a5
    800084ce:	00000097          	auipc	ra,0x0
    800084d2:	d8c080e7          	jalr	-628(ra) # 8000825a <create>
    800084d6:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800084da:	fe843783          	ld	a5,-24(s0)
    800084de:	e7bd                	bnez	a5,8000854c <sys_open+0xe4>
      end_op();
    800084e0:	ffffe097          	auipc	ra,0xffffe
    800084e4:	11c080e7          	jalr	284(ra) # 800065fc <end_op>
      return -1;
    800084e8:	57fd                	li	a5,-1
    800084ea:	a2f1                	j	800086b6 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    800084ec:	f5040793          	addi	a5,s0,-176
    800084f0:	853e                	mv	a0,a5
    800084f2:	ffffe097          	auipc	ra,0xffffe
    800084f6:	ce4080e7          	jalr	-796(ra) # 800061d6 <namei>
    800084fa:	fea43423          	sd	a0,-24(s0)
    800084fe:	fe843783          	ld	a5,-24(s0)
    80008502:	e799                	bnez	a5,80008510 <sys_open+0xa8>
      end_op();
    80008504:	ffffe097          	auipc	ra,0xffffe
    80008508:	0f8080e7          	jalr	248(ra) # 800065fc <end_op>
      return -1;
    8000850c:	57fd                	li	a5,-1
    8000850e:	a265                	j	800086b6 <sys_open+0x24e>
    }
    ilock(ip);
    80008510:	fe843503          	ld	a0,-24(s0)
    80008514:	ffffd097          	auipc	ra,0xffffd
    80008518:	fcc080e7          	jalr	-52(ra) # 800054e0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000851c:	fe843783          	ld	a5,-24(s0)
    80008520:	04479783          	lh	a5,68(a5)
    80008524:	0007871b          	sext.w	a4,a5
    80008528:	4785                	li	a5,1
    8000852a:	02f71163          	bne	a4,a5,8000854c <sys_open+0xe4>
    8000852e:	f4c42783          	lw	a5,-180(s0)
    80008532:	cf89                	beqz	a5,8000854c <sys_open+0xe4>
      iunlockput(ip);
    80008534:	fe843503          	ld	a0,-24(s0)
    80008538:	ffffd097          	auipc	ra,0xffffd
    8000853c:	206080e7          	jalr	518(ra) # 8000573e <iunlockput>
      end_op();
    80008540:	ffffe097          	auipc	ra,0xffffe
    80008544:	0bc080e7          	jalr	188(ra) # 800065fc <end_op>
      return -1;
    80008548:	57fd                	li	a5,-1
    8000854a:	a2b5                	j	800086b6 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    8000854c:	fe843783          	ld	a5,-24(s0)
    80008550:	04479783          	lh	a5,68(a5)
    80008554:	0007871b          	sext.w	a4,a5
    80008558:	478d                	li	a5,3
    8000855a:	02f71e63          	bne	a4,a5,80008596 <sys_open+0x12e>
    8000855e:	fe843783          	ld	a5,-24(s0)
    80008562:	04679783          	lh	a5,70(a5)
    80008566:	2781                	sext.w	a5,a5
    80008568:	0007cb63          	bltz	a5,8000857e <sys_open+0x116>
    8000856c:	fe843783          	ld	a5,-24(s0)
    80008570:	04679783          	lh	a5,70(a5)
    80008574:	0007871b          	sext.w	a4,a5
    80008578:	47a5                	li	a5,9
    8000857a:	00e7de63          	bge	a5,a4,80008596 <sys_open+0x12e>
    iunlockput(ip);
    8000857e:	fe843503          	ld	a0,-24(s0)
    80008582:	ffffd097          	auipc	ra,0xffffd
    80008586:	1bc080e7          	jalr	444(ra) # 8000573e <iunlockput>
    end_op();
    8000858a:	ffffe097          	auipc	ra,0xffffe
    8000858e:	072080e7          	jalr	114(ra) # 800065fc <end_op>
    return -1;
    80008592:	57fd                	li	a5,-1
    80008594:	a20d                	j	800086b6 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008596:	ffffe097          	auipc	ra,0xffffe
    8000859a:	554080e7          	jalr	1364(ra) # 80006aea <filealloc>
    8000859e:	fca43c23          	sd	a0,-40(s0)
    800085a2:	fd843783          	ld	a5,-40(s0)
    800085a6:	cf99                	beqz	a5,800085c4 <sys_open+0x15c>
    800085a8:	fd843503          	ld	a0,-40(s0)
    800085ac:	fffff097          	auipc	ra,0xfffff
    800085b0:	5e8080e7          	jalr	1512(ra) # 80007b94 <fdalloc>
    800085b4:	87aa                	mv	a5,a0
    800085b6:	fcf42a23          	sw	a5,-44(s0)
    800085ba:	fd442783          	lw	a5,-44(s0)
    800085be:	2781                	sext.w	a5,a5
    800085c0:	0207d763          	bgez	a5,800085ee <sys_open+0x186>
    if(f)
    800085c4:	fd843783          	ld	a5,-40(s0)
    800085c8:	c799                	beqz	a5,800085d6 <sys_open+0x16e>
      fileclose(f);
    800085ca:	fd843503          	ld	a0,-40(s0)
    800085ce:	ffffe097          	auipc	ra,0xffffe
    800085d2:	606080e7          	jalr	1542(ra) # 80006bd4 <fileclose>
    iunlockput(ip);
    800085d6:	fe843503          	ld	a0,-24(s0)
    800085da:	ffffd097          	auipc	ra,0xffffd
    800085de:	164080e7          	jalr	356(ra) # 8000573e <iunlockput>
    end_op();
    800085e2:	ffffe097          	auipc	ra,0xffffe
    800085e6:	01a080e7          	jalr	26(ra) # 800065fc <end_op>
    return -1;
    800085ea:	57fd                	li	a5,-1
    800085ec:	a0e9                	j	800086b6 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    800085ee:	fe843783          	ld	a5,-24(s0)
    800085f2:	04479783          	lh	a5,68(a5)
    800085f6:	0007871b          	sext.w	a4,a5
    800085fa:	478d                	li	a5,3
    800085fc:	00f71f63          	bne	a4,a5,8000861a <sys_open+0x1b2>
    f->type = FD_DEVICE;
    80008600:	fd843783          	ld	a5,-40(s0)
    80008604:	470d                	li	a4,3
    80008606:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    80008608:	fe843783          	ld	a5,-24(s0)
    8000860c:	04679703          	lh	a4,70(a5)
    80008610:	fd843783          	ld	a5,-40(s0)
    80008614:	02e79223          	sh	a4,36(a5)
    80008618:	a809                	j	8000862a <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    8000861a:	fd843783          	ld	a5,-40(s0)
    8000861e:	4709                	li	a4,2
    80008620:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008622:	fd843783          	ld	a5,-40(s0)
    80008626:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    8000862a:	fd843783          	ld	a5,-40(s0)
    8000862e:	fe843703          	ld	a4,-24(s0)
    80008632:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    80008634:	f4c42783          	lw	a5,-180(s0)
    80008638:	8b85                	andi	a5,a5,1
    8000863a:	2781                	sext.w	a5,a5
    8000863c:	0017b793          	seqz	a5,a5
    80008640:	0ff7f793          	andi	a5,a5,255
    80008644:	873e                	mv	a4,a5
    80008646:	fd843783          	ld	a5,-40(s0)
    8000864a:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8000864e:	f4c42783          	lw	a5,-180(s0)
    80008652:	8b85                	andi	a5,a5,1
    80008654:	2781                	sext.w	a5,a5
    80008656:	e791                	bnez	a5,80008662 <sys_open+0x1fa>
    80008658:	f4c42783          	lw	a5,-180(s0)
    8000865c:	8b89                	andi	a5,a5,2
    8000865e:	2781                	sext.w	a5,a5
    80008660:	c399                	beqz	a5,80008666 <sys_open+0x1fe>
    80008662:	4785                	li	a5,1
    80008664:	a011                	j	80008668 <sys_open+0x200>
    80008666:	4781                	li	a5,0
    80008668:	0ff7f713          	andi	a4,a5,255
    8000866c:	fd843783          	ld	a5,-40(s0)
    80008670:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008674:	f4c42783          	lw	a5,-180(s0)
    80008678:	4007f793          	andi	a5,a5,1024
    8000867c:	2781                	sext.w	a5,a5
    8000867e:	c385                	beqz	a5,8000869e <sys_open+0x236>
    80008680:	fe843783          	ld	a5,-24(s0)
    80008684:	04479783          	lh	a5,68(a5)
    80008688:	0007871b          	sext.w	a4,a5
    8000868c:	4789                	li	a5,2
    8000868e:	00f71863          	bne	a4,a5,8000869e <sys_open+0x236>
    itrunc(ip);
    80008692:	fe843503          	ld	a0,-24(s0)
    80008696:	ffffd097          	auipc	ra,0xffffd
    8000869a:	232080e7          	jalr	562(ra) # 800058c8 <itrunc>
  }

  iunlock(ip);
    8000869e:	fe843503          	ld	a0,-24(s0)
    800086a2:	ffffd097          	auipc	ra,0xffffd
    800086a6:	f72080e7          	jalr	-142(ra) # 80005614 <iunlock>
  end_op();
    800086aa:	ffffe097          	auipc	ra,0xffffe
    800086ae:	f52080e7          	jalr	-174(ra) # 800065fc <end_op>

  return fd;
    800086b2:	fd442783          	lw	a5,-44(s0)
}
    800086b6:	853e                	mv	a0,a5
    800086b8:	70ea                	ld	ra,184(sp)
    800086ba:	744a                	ld	s0,176(sp)
    800086bc:	6129                	addi	sp,sp,192
    800086be:	8082                	ret

00000000800086c0 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800086c0:	7135                	addi	sp,sp,-160
    800086c2:	ed06                	sd	ra,152(sp)
    800086c4:	e922                	sd	s0,144(sp)
    800086c6:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800086c8:	ffffe097          	auipc	ra,0xffffe
    800086cc:	e72080e7          	jalr	-398(ra) # 8000653a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800086d0:	f6840793          	addi	a5,s0,-152
    800086d4:	08000613          	li	a2,128
    800086d8:	85be                	mv	a1,a5
    800086da:	4501                	li	a0,0
    800086dc:	ffffc097          	auipc	ra,0xffffc
    800086e0:	e20080e7          	jalr	-480(ra) # 800044fc <argstr>
    800086e4:	87aa                	mv	a5,a0
    800086e6:	0207c163          	bltz	a5,80008708 <sys_mkdir+0x48>
    800086ea:	f6840793          	addi	a5,s0,-152
    800086ee:	4681                	li	a3,0
    800086f0:	4601                	li	a2,0
    800086f2:	4585                	li	a1,1
    800086f4:	853e                	mv	a0,a5
    800086f6:	00000097          	auipc	ra,0x0
    800086fa:	b64080e7          	jalr	-1180(ra) # 8000825a <create>
    800086fe:	fea43423          	sd	a0,-24(s0)
    80008702:	fe843783          	ld	a5,-24(s0)
    80008706:	e799                	bnez	a5,80008714 <sys_mkdir+0x54>
    end_op();
    80008708:	ffffe097          	auipc	ra,0xffffe
    8000870c:	ef4080e7          	jalr	-268(ra) # 800065fc <end_op>
    return -1;
    80008710:	57fd                	li	a5,-1
    80008712:	a821                	j	8000872a <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80008714:	fe843503          	ld	a0,-24(s0)
    80008718:	ffffd097          	auipc	ra,0xffffd
    8000871c:	026080e7          	jalr	38(ra) # 8000573e <iunlockput>
  end_op();
    80008720:	ffffe097          	auipc	ra,0xffffe
    80008724:	edc080e7          	jalr	-292(ra) # 800065fc <end_op>
  return 0;
    80008728:	4781                	li	a5,0
}
    8000872a:	853e                	mv	a0,a5
    8000872c:	60ea                	ld	ra,152(sp)
    8000872e:	644a                	ld	s0,144(sp)
    80008730:	610d                	addi	sp,sp,160
    80008732:	8082                	ret

0000000080008734 <sys_mknod>:

uint64
sys_mknod(void)
{
    80008734:	7135                	addi	sp,sp,-160
    80008736:	ed06                	sd	ra,152(sp)
    80008738:	e922                	sd	s0,144(sp)
    8000873a:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    8000873c:	ffffe097          	auipc	ra,0xffffe
    80008740:	dfe080e7          	jalr	-514(ra) # 8000653a <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008744:	f6840793          	addi	a5,s0,-152
    80008748:	08000613          	li	a2,128
    8000874c:	85be                	mv	a1,a5
    8000874e:	4501                	li	a0,0
    80008750:	ffffc097          	auipc	ra,0xffffc
    80008754:	dac080e7          	jalr	-596(ra) # 800044fc <argstr>
    80008758:	87aa                	mv	a5,a0
    8000875a:	0607c263          	bltz	a5,800087be <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    8000875e:	f6440793          	addi	a5,s0,-156
    80008762:	85be                	mv	a1,a5
    80008764:	4505                	li	a0,1
    80008766:	ffffc097          	auipc	ra,0xffffc
    8000876a:	d2a080e7          	jalr	-726(ra) # 80004490 <argint>
    8000876e:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008770:	0407c763          	bltz	a5,800087be <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    80008774:	f6040793          	addi	a5,s0,-160
    80008778:	85be                	mv	a1,a5
    8000877a:	4509                	li	a0,2
    8000877c:	ffffc097          	auipc	ra,0xffffc
    80008780:	d14080e7          	jalr	-748(ra) # 80004490 <argint>
    80008784:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    80008786:	0207cc63          	bltz	a5,800087be <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000878a:	f6442783          	lw	a5,-156(s0)
    8000878e:	0107971b          	slliw	a4,a5,0x10
    80008792:	4107571b          	sraiw	a4,a4,0x10
    80008796:	f6042783          	lw	a5,-160(s0)
    8000879a:	0107969b          	slliw	a3,a5,0x10
    8000879e:	4106d69b          	sraiw	a3,a3,0x10
    800087a2:	f6840793          	addi	a5,s0,-152
    800087a6:	863a                	mv	a2,a4
    800087a8:	458d                	li	a1,3
    800087aa:	853e                	mv	a0,a5
    800087ac:	00000097          	auipc	ra,0x0
    800087b0:	aae080e7          	jalr	-1362(ra) # 8000825a <create>
    800087b4:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    800087b8:	fe843783          	ld	a5,-24(s0)
    800087bc:	e799                	bnez	a5,800087ca <sys_mknod+0x96>
    end_op();
    800087be:	ffffe097          	auipc	ra,0xffffe
    800087c2:	e3e080e7          	jalr	-450(ra) # 800065fc <end_op>
    return -1;
    800087c6:	57fd                	li	a5,-1
    800087c8:	a821                	j	800087e0 <sys_mknod+0xac>
  }
  iunlockput(ip);
    800087ca:	fe843503          	ld	a0,-24(s0)
    800087ce:	ffffd097          	auipc	ra,0xffffd
    800087d2:	f70080e7          	jalr	-144(ra) # 8000573e <iunlockput>
  end_op();
    800087d6:	ffffe097          	auipc	ra,0xffffe
    800087da:	e26080e7          	jalr	-474(ra) # 800065fc <end_op>
  return 0;
    800087de:	4781                	li	a5,0
}
    800087e0:	853e                	mv	a0,a5
    800087e2:	60ea                	ld	ra,152(sp)
    800087e4:	644a                	ld	s0,144(sp)
    800087e6:	610d                	addi	sp,sp,160
    800087e8:	8082                	ret

00000000800087ea <sys_chdir>:

uint64
sys_chdir(void)
{
    800087ea:	7135                	addi	sp,sp,-160
    800087ec:	ed06                	sd	ra,152(sp)
    800087ee:	e922                	sd	s0,144(sp)
    800087f0:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800087f2:	ffffa097          	auipc	ra,0xffffa
    800087f6:	026080e7          	jalr	38(ra) # 80002818 <myproc>
    800087fa:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800087fe:	ffffe097          	auipc	ra,0xffffe
    80008802:	d3c080e7          	jalr	-708(ra) # 8000653a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008806:	f6040793          	addi	a5,s0,-160
    8000880a:	08000613          	li	a2,128
    8000880e:	85be                	mv	a1,a5
    80008810:	4501                	li	a0,0
    80008812:	ffffc097          	auipc	ra,0xffffc
    80008816:	cea080e7          	jalr	-790(ra) # 800044fc <argstr>
    8000881a:	87aa                	mv	a5,a0
    8000881c:	0007ce63          	bltz	a5,80008838 <sys_chdir+0x4e>
    80008820:	f6040793          	addi	a5,s0,-160
    80008824:	853e                	mv	a0,a5
    80008826:	ffffe097          	auipc	ra,0xffffe
    8000882a:	9b0080e7          	jalr	-1616(ra) # 800061d6 <namei>
    8000882e:	fea43023          	sd	a0,-32(s0)
    80008832:	fe043783          	ld	a5,-32(s0)
    80008836:	e799                	bnez	a5,80008844 <sys_chdir+0x5a>
    end_op();
    80008838:	ffffe097          	auipc	ra,0xffffe
    8000883c:	dc4080e7          	jalr	-572(ra) # 800065fc <end_op>
    return -1;
    80008840:	57fd                	li	a5,-1
    80008842:	a0b5                	j	800088ae <sys_chdir+0xc4>
  }
  ilock(ip);
    80008844:	fe043503          	ld	a0,-32(s0)
    80008848:	ffffd097          	auipc	ra,0xffffd
    8000884c:	c98080e7          	jalr	-872(ra) # 800054e0 <ilock>
  if(ip->type != T_DIR){
    80008850:	fe043783          	ld	a5,-32(s0)
    80008854:	04479783          	lh	a5,68(a5)
    80008858:	0007871b          	sext.w	a4,a5
    8000885c:	4785                	li	a5,1
    8000885e:	00f70e63          	beq	a4,a5,8000887a <sys_chdir+0x90>
    iunlockput(ip);
    80008862:	fe043503          	ld	a0,-32(s0)
    80008866:	ffffd097          	auipc	ra,0xffffd
    8000886a:	ed8080e7          	jalr	-296(ra) # 8000573e <iunlockput>
    end_op();
    8000886e:	ffffe097          	auipc	ra,0xffffe
    80008872:	d8e080e7          	jalr	-626(ra) # 800065fc <end_op>
    return -1;
    80008876:	57fd                	li	a5,-1
    80008878:	a81d                	j	800088ae <sys_chdir+0xc4>
  }
  iunlock(ip);
    8000887a:	fe043503          	ld	a0,-32(s0)
    8000887e:	ffffd097          	auipc	ra,0xffffd
    80008882:	d96080e7          	jalr	-618(ra) # 80005614 <iunlock>
  iput(p->cwd);
    80008886:	fe843783          	ld	a5,-24(s0)
    8000888a:	1507b783          	ld	a5,336(a5)
    8000888e:	853e                	mv	a0,a5
    80008890:	ffffd097          	auipc	ra,0xffffd
    80008894:	dde080e7          	jalr	-546(ra) # 8000566e <iput>
  end_op();
    80008898:	ffffe097          	auipc	ra,0xffffe
    8000889c:	d64080e7          	jalr	-668(ra) # 800065fc <end_op>
  p->cwd = ip;
    800088a0:	fe843783          	ld	a5,-24(s0)
    800088a4:	fe043703          	ld	a4,-32(s0)
    800088a8:	14e7b823          	sd	a4,336(a5)
  return 0;
    800088ac:	4781                	li	a5,0
}
    800088ae:	853e                	mv	a0,a5
    800088b0:	60ea                	ld	ra,152(sp)
    800088b2:	644a                	ld	s0,144(sp)
    800088b4:	610d                	addi	sp,sp,160
    800088b6:	8082                	ret

00000000800088b8 <sys_exec>:

uint64
sys_exec(void)
{
    800088b8:	7161                	addi	sp,sp,-432
    800088ba:	f706                	sd	ra,424(sp)
    800088bc:	f322                	sd	s0,416(sp)
    800088be:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    800088c0:	f6840793          	addi	a5,s0,-152
    800088c4:	08000613          	li	a2,128
    800088c8:	85be                	mv	a1,a5
    800088ca:	4501                	li	a0,0
    800088cc:	ffffc097          	auipc	ra,0xffffc
    800088d0:	c30080e7          	jalr	-976(ra) # 800044fc <argstr>
    800088d4:	87aa                	mv	a5,a0
    800088d6:	0007cd63          	bltz	a5,800088f0 <sys_exec+0x38>
    800088da:	e6040793          	addi	a5,s0,-416
    800088de:	85be                	mv	a1,a5
    800088e0:	4505                	li	a0,1
    800088e2:	ffffc097          	auipc	ra,0xffffc
    800088e6:	be6080e7          	jalr	-1050(ra) # 800044c8 <argaddr>
    800088ea:	87aa                	mv	a5,a0
    800088ec:	0007d463          	bgez	a5,800088f4 <sys_exec+0x3c>
    return -1;
    800088f0:	57fd                	li	a5,-1
    800088f2:	a249                	j	80008a74 <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    800088f4:	e6840793          	addi	a5,s0,-408
    800088f8:	10000613          	li	a2,256
    800088fc:	4581                	li	a1,0
    800088fe:	853e                	mv	a0,a5
    80008900:	ffff9097          	auipc	ra,0xffff9
    80008904:	b42080e7          	jalr	-1214(ra) # 80001442 <memset>
  for(i=0;; i++){
    80008908:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    8000890c:	fec42783          	lw	a5,-20(s0)
    80008910:	873e                	mv	a4,a5
    80008912:	47fd                	li	a5,31
    80008914:	10e7e463          	bltu	a5,a4,80008a1c <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008918:	fec42783          	lw	a5,-20(s0)
    8000891c:	00379713          	slli	a4,a5,0x3
    80008920:	e6043783          	ld	a5,-416(s0)
    80008924:	97ba                	add	a5,a5,a4
    80008926:	e5840713          	addi	a4,s0,-424
    8000892a:	85ba                	mv	a1,a4
    8000892c:	853e                	mv	a0,a5
    8000892e:	ffffc097          	auipc	ra,0xffffc
    80008932:	9e4080e7          	jalr	-1564(ra) # 80004312 <fetchaddr>
    80008936:	87aa                	mv	a5,a0
    80008938:	0e07c463          	bltz	a5,80008a20 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    8000893c:	e5843783          	ld	a5,-424(s0)
    80008940:	eb95                	bnez	a5,80008974 <sys_exec+0xbc>
      argv[i] = 0;
    80008942:	fec42783          	lw	a5,-20(s0)
    80008946:	078e                	slli	a5,a5,0x3
    80008948:	ff040713          	addi	a4,s0,-16
    8000894c:	97ba                	add	a5,a5,a4
    8000894e:	e607bc23          	sd	zero,-392(a5)
      break;
    80008952:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008954:	e6840713          	addi	a4,s0,-408
    80008958:	f6840793          	addi	a5,s0,-152
    8000895c:	85ba                	mv	a1,a4
    8000895e:	853e                	mv	a0,a5
    80008960:	fffff097          	auipc	ra,0xfffff
    80008964:	c1a080e7          	jalr	-998(ra) # 8000757a <exec>
    80008968:	87aa                	mv	a5,a0
    8000896a:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000896e:	fe042623          	sw	zero,-20(s0)
    80008972:	a059                	j	800089f8 <sys_exec+0x140>
    argv[i] = kalloc();
    80008974:	ffff8097          	auipc	ra,0xffff8
    80008978:	7a6080e7          	jalr	1958(ra) # 8000111a <kalloc>
    8000897c:	872a                	mv	a4,a0
    8000897e:	fec42783          	lw	a5,-20(s0)
    80008982:	078e                	slli	a5,a5,0x3
    80008984:	ff040693          	addi	a3,s0,-16
    80008988:	97b6                	add	a5,a5,a3
    8000898a:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    8000898e:	fec42783          	lw	a5,-20(s0)
    80008992:	078e                	slli	a5,a5,0x3
    80008994:	ff040713          	addi	a4,s0,-16
    80008998:	97ba                	add	a5,a5,a4
    8000899a:	e787b783          	ld	a5,-392(a5)
    8000899e:	c3d9                	beqz	a5,80008a24 <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    800089a0:	e5843703          	ld	a4,-424(s0)
    800089a4:	fec42783          	lw	a5,-20(s0)
    800089a8:	078e                	slli	a5,a5,0x3
    800089aa:	ff040693          	addi	a3,s0,-16
    800089ae:	97b6                	add	a5,a5,a3
    800089b0:	e787b783          	ld	a5,-392(a5)
    800089b4:	6605                	lui	a2,0x1
    800089b6:	85be                	mv	a1,a5
    800089b8:	853a                	mv	a0,a4
    800089ba:	ffffc097          	auipc	ra,0xffffc
    800089be:	9c6080e7          	jalr	-1594(ra) # 80004380 <fetchstr>
    800089c2:	87aa                	mv	a5,a0
    800089c4:	0607c263          	bltz	a5,80008a28 <sys_exec+0x170>
  for(i=0;; i++){
    800089c8:	fec42783          	lw	a5,-20(s0)
    800089cc:	2785                	addiw	a5,a5,1
    800089ce:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800089d2:	bf2d                	j	8000890c <sys_exec+0x54>
    kfree(argv[i]);
    800089d4:	fec42783          	lw	a5,-20(s0)
    800089d8:	078e                	slli	a5,a5,0x3
    800089da:	ff040713          	addi	a4,s0,-16
    800089de:	97ba                	add	a5,a5,a4
    800089e0:	e787b783          	ld	a5,-392(a5)
    800089e4:	853e                	mv	a0,a5
    800089e6:	ffff8097          	auipc	ra,0xffff8
    800089ea:	690080e7          	jalr	1680(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800089ee:	fec42783          	lw	a5,-20(s0)
    800089f2:	2785                	addiw	a5,a5,1
    800089f4:	fef42623          	sw	a5,-20(s0)
    800089f8:	fec42783          	lw	a5,-20(s0)
    800089fc:	873e                	mv	a4,a5
    800089fe:	47fd                	li	a5,31
    80008a00:	00e7eb63          	bltu	a5,a4,80008a16 <sys_exec+0x15e>
    80008a04:	fec42783          	lw	a5,-20(s0)
    80008a08:	078e                	slli	a5,a5,0x3
    80008a0a:	ff040713          	addi	a4,s0,-16
    80008a0e:	97ba                	add	a5,a5,a4
    80008a10:	e787b783          	ld	a5,-392(a5)
    80008a14:	f3e1                	bnez	a5,800089d4 <sys_exec+0x11c>

  return ret;
    80008a16:	fe842783          	lw	a5,-24(s0)
    80008a1a:	a8a9                	j	80008a74 <sys_exec+0x1bc>
      goto bad;
    80008a1c:	0001                	nop
    80008a1e:	a031                	j	80008a2a <sys_exec+0x172>
      goto bad;
    80008a20:	0001                	nop
    80008a22:	a021                	j	80008a2a <sys_exec+0x172>
      goto bad;
    80008a24:	0001                	nop
    80008a26:	a011                	j	80008a2a <sys_exec+0x172>
      goto bad;
    80008a28:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008a2a:	fe042623          	sw	zero,-20(s0)
    80008a2e:	a01d                	j	80008a54 <sys_exec+0x19c>
    kfree(argv[i]);
    80008a30:	fec42783          	lw	a5,-20(s0)
    80008a34:	078e                	slli	a5,a5,0x3
    80008a36:	ff040713          	addi	a4,s0,-16
    80008a3a:	97ba                	add	a5,a5,a4
    80008a3c:	e787b783          	ld	a5,-392(a5)
    80008a40:	853e                	mv	a0,a5
    80008a42:	ffff8097          	auipc	ra,0xffff8
    80008a46:	634080e7          	jalr	1588(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008a4a:	fec42783          	lw	a5,-20(s0)
    80008a4e:	2785                	addiw	a5,a5,1
    80008a50:	fef42623          	sw	a5,-20(s0)
    80008a54:	fec42783          	lw	a5,-20(s0)
    80008a58:	873e                	mv	a4,a5
    80008a5a:	47fd                	li	a5,31
    80008a5c:	00e7eb63          	bltu	a5,a4,80008a72 <sys_exec+0x1ba>
    80008a60:	fec42783          	lw	a5,-20(s0)
    80008a64:	078e                	slli	a5,a5,0x3
    80008a66:	ff040713          	addi	a4,s0,-16
    80008a6a:	97ba                	add	a5,a5,a4
    80008a6c:	e787b783          	ld	a5,-392(a5)
    80008a70:	f3e1                	bnez	a5,80008a30 <sys_exec+0x178>
  return -1;
    80008a72:	57fd                	li	a5,-1
}
    80008a74:	853e                	mv	a0,a5
    80008a76:	70ba                	ld	ra,424(sp)
    80008a78:	741a                	ld	s0,416(sp)
    80008a7a:	615d                	addi	sp,sp,432
    80008a7c:	8082                	ret

0000000080008a7e <sys_pipe>:

uint64
sys_pipe(void)
{
    80008a7e:	7139                	addi	sp,sp,-64
    80008a80:	fc06                	sd	ra,56(sp)
    80008a82:	f822                	sd	s0,48(sp)
    80008a84:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008a86:	ffffa097          	auipc	ra,0xffffa
    80008a8a:	d92080e7          	jalr	-622(ra) # 80002818 <myproc>
    80008a8e:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80008a92:	fe040793          	addi	a5,s0,-32
    80008a96:	85be                	mv	a1,a5
    80008a98:	4501                	li	a0,0
    80008a9a:	ffffc097          	auipc	ra,0xffffc
    80008a9e:	a2e080e7          	jalr	-1490(ra) # 800044c8 <argaddr>
    80008aa2:	87aa                	mv	a5,a0
    80008aa4:	0007d463          	bgez	a5,80008aac <sys_pipe+0x2e>
    return -1;
    80008aa8:	57fd                	li	a5,-1
    80008aaa:	a215                	j	80008bce <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    80008aac:	fd040713          	addi	a4,s0,-48
    80008ab0:	fd840793          	addi	a5,s0,-40
    80008ab4:	85ba                	mv	a1,a4
    80008ab6:	853e                	mv	a0,a5
    80008ab8:	ffffe097          	auipc	ra,0xffffe
    80008abc:	632080e7          	jalr	1586(ra) # 800070ea <pipealloc>
    80008ac0:	87aa                	mv	a5,a0
    80008ac2:	0007d463          	bgez	a5,80008aca <sys_pipe+0x4c>
    return -1;
    80008ac6:	57fd                	li	a5,-1
    80008ac8:	a219                	j	80008bce <sys_pipe+0x150>
  fd0 = -1;
    80008aca:	57fd                	li	a5,-1
    80008acc:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008ad0:	fd843783          	ld	a5,-40(s0)
    80008ad4:	853e                	mv	a0,a5
    80008ad6:	fffff097          	auipc	ra,0xfffff
    80008ada:	0be080e7          	jalr	190(ra) # 80007b94 <fdalloc>
    80008ade:	87aa                	mv	a5,a0
    80008ae0:	fcf42623          	sw	a5,-52(s0)
    80008ae4:	fcc42783          	lw	a5,-52(s0)
    80008ae8:	0207c063          	bltz	a5,80008b08 <sys_pipe+0x8a>
    80008aec:	fd043783          	ld	a5,-48(s0)
    80008af0:	853e                	mv	a0,a5
    80008af2:	fffff097          	auipc	ra,0xfffff
    80008af6:	0a2080e7          	jalr	162(ra) # 80007b94 <fdalloc>
    80008afa:	87aa                	mv	a5,a0
    80008afc:	fcf42423          	sw	a5,-56(s0)
    80008b00:	fc842783          	lw	a5,-56(s0)
    80008b04:	0207df63          	bgez	a5,80008b42 <sys_pipe+0xc4>
    if(fd0 >= 0)
    80008b08:	fcc42783          	lw	a5,-52(s0)
    80008b0c:	0007cb63          	bltz	a5,80008b22 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80008b10:	fcc42783          	lw	a5,-52(s0)
    80008b14:	fe843703          	ld	a4,-24(s0)
    80008b18:	07e9                	addi	a5,a5,26
    80008b1a:	078e                	slli	a5,a5,0x3
    80008b1c:	97ba                	add	a5,a5,a4
    80008b1e:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008b22:	fd843783          	ld	a5,-40(s0)
    80008b26:	853e                	mv	a0,a5
    80008b28:	ffffe097          	auipc	ra,0xffffe
    80008b2c:	0ac080e7          	jalr	172(ra) # 80006bd4 <fileclose>
    fileclose(wf);
    80008b30:	fd043783          	ld	a5,-48(s0)
    80008b34:	853e                	mv	a0,a5
    80008b36:	ffffe097          	auipc	ra,0xffffe
    80008b3a:	09e080e7          	jalr	158(ra) # 80006bd4 <fileclose>
    return -1;
    80008b3e:	57fd                	li	a5,-1
    80008b40:	a079                	j	80008bce <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b42:	fe843783          	ld	a5,-24(s0)
    80008b46:	6bbc                	ld	a5,80(a5)
    80008b48:	fe043703          	ld	a4,-32(s0)
    80008b4c:	fcc40613          	addi	a2,s0,-52
    80008b50:	4691                	li	a3,4
    80008b52:	85ba                	mv	a1,a4
    80008b54:	853e                	mv	a0,a5
    80008b56:	ffff9097          	auipc	ra,0xffff9
    80008b5a:	790080e7          	jalr	1936(ra) # 800022e6 <copyout>
    80008b5e:	87aa                	mv	a5,a0
    80008b60:	0207c463          	bltz	a5,80008b88 <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008b64:	fe843783          	ld	a5,-24(s0)
    80008b68:	6bb8                	ld	a4,80(a5)
    80008b6a:	fe043783          	ld	a5,-32(s0)
    80008b6e:	0791                	addi	a5,a5,4
    80008b70:	fc840613          	addi	a2,s0,-56
    80008b74:	4691                	li	a3,4
    80008b76:	85be                	mv	a1,a5
    80008b78:	853a                	mv	a0,a4
    80008b7a:	ffff9097          	auipc	ra,0xffff9
    80008b7e:	76c080e7          	jalr	1900(ra) # 800022e6 <copyout>
    80008b82:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b84:	0407d463          	bgez	a5,80008bcc <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    80008b88:	fcc42783          	lw	a5,-52(s0)
    80008b8c:	fe843703          	ld	a4,-24(s0)
    80008b90:	07e9                	addi	a5,a5,26
    80008b92:	078e                	slli	a5,a5,0x3
    80008b94:	97ba                	add	a5,a5,a4
    80008b96:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008b9a:	fc842783          	lw	a5,-56(s0)
    80008b9e:	fe843703          	ld	a4,-24(s0)
    80008ba2:	07e9                	addi	a5,a5,26
    80008ba4:	078e                	slli	a5,a5,0x3
    80008ba6:	97ba                	add	a5,a5,a4
    80008ba8:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008bac:	fd843783          	ld	a5,-40(s0)
    80008bb0:	853e                	mv	a0,a5
    80008bb2:	ffffe097          	auipc	ra,0xffffe
    80008bb6:	022080e7          	jalr	34(ra) # 80006bd4 <fileclose>
    fileclose(wf);
    80008bba:	fd043783          	ld	a5,-48(s0)
    80008bbe:	853e                	mv	a0,a5
    80008bc0:	ffffe097          	auipc	ra,0xffffe
    80008bc4:	014080e7          	jalr	20(ra) # 80006bd4 <fileclose>
    return -1;
    80008bc8:	57fd                	li	a5,-1
    80008bca:	a011                	j	80008bce <sys_pipe+0x150>
  }
  return 0;
    80008bcc:	4781                	li	a5,0
}
    80008bce:	853e                	mv	a0,a5
    80008bd0:	70e2                	ld	ra,56(sp)
    80008bd2:	7442                	ld	s0,48(sp)
    80008bd4:	6121                	addi	sp,sp,64
    80008bd6:	8082                	ret
	...

0000000080008be0 <kernelvec>:
    80008be0:	7111                	addi	sp,sp,-256
    80008be2:	e006                	sd	ra,0(sp)
    80008be4:	e40a                	sd	sp,8(sp)
    80008be6:	e80e                	sd	gp,16(sp)
    80008be8:	ec12                	sd	tp,24(sp)
    80008bea:	f016                	sd	t0,32(sp)
    80008bec:	f41a                	sd	t1,40(sp)
    80008bee:	f81e                	sd	t2,48(sp)
    80008bf0:	fc22                	sd	s0,56(sp)
    80008bf2:	e0a6                	sd	s1,64(sp)
    80008bf4:	e4aa                	sd	a0,72(sp)
    80008bf6:	e8ae                	sd	a1,80(sp)
    80008bf8:	ecb2                	sd	a2,88(sp)
    80008bfa:	f0b6                	sd	a3,96(sp)
    80008bfc:	f4ba                	sd	a4,104(sp)
    80008bfe:	f8be                	sd	a5,112(sp)
    80008c00:	fcc2                	sd	a6,120(sp)
    80008c02:	e146                	sd	a7,128(sp)
    80008c04:	e54a                	sd	s2,136(sp)
    80008c06:	e94e                	sd	s3,144(sp)
    80008c08:	ed52                	sd	s4,152(sp)
    80008c0a:	f156                	sd	s5,160(sp)
    80008c0c:	f55a                	sd	s6,168(sp)
    80008c0e:	f95e                	sd	s7,176(sp)
    80008c10:	fd62                	sd	s8,184(sp)
    80008c12:	e1e6                	sd	s9,192(sp)
    80008c14:	e5ea                	sd	s10,200(sp)
    80008c16:	e9ee                	sd	s11,208(sp)
    80008c18:	edf2                	sd	t3,216(sp)
    80008c1a:	f1f6                	sd	t4,224(sp)
    80008c1c:	f5fa                	sd	t5,232(sp)
    80008c1e:	f9fe                	sd	t6,240(sp)
    80008c20:	c3efb0ef          	jal	ra,8000405e <kerneltrap>
    80008c24:	6082                	ld	ra,0(sp)
    80008c26:	6122                	ld	sp,8(sp)
    80008c28:	61c2                	ld	gp,16(sp)
    80008c2a:	7282                	ld	t0,32(sp)
    80008c2c:	7322                	ld	t1,40(sp)
    80008c2e:	73c2                	ld	t2,48(sp)
    80008c30:	7462                	ld	s0,56(sp)
    80008c32:	6486                	ld	s1,64(sp)
    80008c34:	6526                	ld	a0,72(sp)
    80008c36:	65c6                	ld	a1,80(sp)
    80008c38:	6666                	ld	a2,88(sp)
    80008c3a:	7686                	ld	a3,96(sp)
    80008c3c:	7726                	ld	a4,104(sp)
    80008c3e:	77c6                	ld	a5,112(sp)
    80008c40:	7866                	ld	a6,120(sp)
    80008c42:	688a                	ld	a7,128(sp)
    80008c44:	692a                	ld	s2,136(sp)
    80008c46:	69ca                	ld	s3,144(sp)
    80008c48:	6a6a                	ld	s4,152(sp)
    80008c4a:	7a8a                	ld	s5,160(sp)
    80008c4c:	7b2a                	ld	s6,168(sp)
    80008c4e:	7bca                	ld	s7,176(sp)
    80008c50:	7c6a                	ld	s8,184(sp)
    80008c52:	6c8e                	ld	s9,192(sp)
    80008c54:	6d2e                	ld	s10,200(sp)
    80008c56:	6dce                	ld	s11,208(sp)
    80008c58:	6e6e                	ld	t3,216(sp)
    80008c5a:	7e8e                	ld	t4,224(sp)
    80008c5c:	7f2e                	ld	t5,232(sp)
    80008c5e:	7fce                	ld	t6,240(sp)
    80008c60:	6111                	addi	sp,sp,256
    80008c62:	10200073          	sret
    80008c66:	00000013          	nop
    80008c6a:	00000013          	nop
    80008c6e:	0001                	nop

0000000080008c70 <timervec>:
    80008c70:	34051573          	csrrw	a0,mscratch,a0
    80008c74:	e10c                	sd	a1,0(a0)
    80008c76:	e510                	sd	a2,8(a0)
    80008c78:	e914                	sd	a3,16(a0)
    80008c7a:	6d0c                	ld	a1,24(a0)
    80008c7c:	7110                	ld	a2,32(a0)
    80008c7e:	6194                	ld	a3,0(a1)
    80008c80:	96b2                	add	a3,a3,a2
    80008c82:	e194                	sd	a3,0(a1)
    80008c84:	4589                	li	a1,2
    80008c86:	14459073          	csrw	sip,a1
    80008c8a:	6914                	ld	a3,16(a0)
    80008c8c:	6510                	ld	a2,8(a0)
    80008c8e:	610c                	ld	a1,0(a0)
    80008c90:	34051573          	csrrw	a0,mscratch,a0
    80008c94:	30200073          	mret
	...

0000000080008c9a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008c9a:	1141                	addi	sp,sp,-16
    80008c9c:	e422                	sd	s0,8(sp)
    80008c9e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008ca0:	0c0007b7          	lui	a5,0xc000
    80008ca4:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008ca8:	4705                	li	a4,1
    80008caa:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008cac:	0c0007b7          	lui	a5,0xc000
    80008cb0:	0791                	addi	a5,a5,4
    80008cb2:	4705                	li	a4,1
    80008cb4:	c398                	sw	a4,0(a5)
}
    80008cb6:	0001                	nop
    80008cb8:	6422                	ld	s0,8(sp)
    80008cba:	0141                	addi	sp,sp,16
    80008cbc:	8082                	ret

0000000080008cbe <plicinithart>:

void
plicinithart(void)
{
    80008cbe:	1101                	addi	sp,sp,-32
    80008cc0:	ec06                	sd	ra,24(sp)
    80008cc2:	e822                	sd	s0,16(sp)
    80008cc4:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008cc6:	ffffa097          	auipc	ra,0xffffa
    80008cca:	af0080e7          	jalr	-1296(ra) # 800027b6 <cpuid>
    80008cce:	87aa                	mv	a5,a0
    80008cd0:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008cd4:	fec42783          	lw	a5,-20(s0)
    80008cd8:	0087979b          	slliw	a5,a5,0x8
    80008cdc:	2781                	sext.w	a5,a5
    80008cde:	873e                	mv	a4,a5
    80008ce0:	0c0027b7          	lui	a5,0xc002
    80008ce4:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008ce8:	97ba                	add	a5,a5,a4
    80008cea:	873e                	mv	a4,a5
    80008cec:	40200793          	li	a5,1026
    80008cf0:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008cf2:	fec42783          	lw	a5,-20(s0)
    80008cf6:	00d7979b          	slliw	a5,a5,0xd
    80008cfa:	2781                	sext.w	a5,a5
    80008cfc:	873e                	mv	a4,a5
    80008cfe:	0c2017b7          	lui	a5,0xc201
    80008d02:	97ba                	add	a5,a5,a4
    80008d04:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008d08:	0001                	nop
    80008d0a:	60e2                	ld	ra,24(sp)
    80008d0c:	6442                	ld	s0,16(sp)
    80008d0e:	6105                	addi	sp,sp,32
    80008d10:	8082                	ret

0000000080008d12 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008d12:	1101                	addi	sp,sp,-32
    80008d14:	ec06                	sd	ra,24(sp)
    80008d16:	e822                	sd	s0,16(sp)
    80008d18:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008d1a:	ffffa097          	auipc	ra,0xffffa
    80008d1e:	a9c080e7          	jalr	-1380(ra) # 800027b6 <cpuid>
    80008d22:	87aa                	mv	a5,a0
    80008d24:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008d28:	fec42783          	lw	a5,-20(s0)
    80008d2c:	00d7979b          	slliw	a5,a5,0xd
    80008d30:	2781                	sext.w	a5,a5
    80008d32:	873e                	mv	a4,a5
    80008d34:	0c2017b7          	lui	a5,0xc201
    80008d38:	0791                	addi	a5,a5,4
    80008d3a:	97ba                	add	a5,a5,a4
    80008d3c:	439c                	lw	a5,0(a5)
    80008d3e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008d42:	fe842783          	lw	a5,-24(s0)
}
    80008d46:	853e                	mv	a0,a5
    80008d48:	60e2                	ld	ra,24(sp)
    80008d4a:	6442                	ld	s0,16(sp)
    80008d4c:	6105                	addi	sp,sp,32
    80008d4e:	8082                	ret

0000000080008d50 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008d50:	7179                	addi	sp,sp,-48
    80008d52:	f406                	sd	ra,40(sp)
    80008d54:	f022                	sd	s0,32(sp)
    80008d56:	1800                	addi	s0,sp,48
    80008d58:	87aa                	mv	a5,a0
    80008d5a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008d5e:	ffffa097          	auipc	ra,0xffffa
    80008d62:	a58080e7          	jalr	-1448(ra) # 800027b6 <cpuid>
    80008d66:	87aa                	mv	a5,a0
    80008d68:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008d6c:	fec42783          	lw	a5,-20(s0)
    80008d70:	00d7979b          	slliw	a5,a5,0xd
    80008d74:	2781                	sext.w	a5,a5
    80008d76:	873e                	mv	a4,a5
    80008d78:	0c2017b7          	lui	a5,0xc201
    80008d7c:	0791                	addi	a5,a5,4
    80008d7e:	97ba                	add	a5,a5,a4
    80008d80:	873e                	mv	a4,a5
    80008d82:	fdc42783          	lw	a5,-36(s0)
    80008d86:	c31c                	sw	a5,0(a4)
}
    80008d88:	0001                	nop
    80008d8a:	70a2                	ld	ra,40(sp)
    80008d8c:	7402                	ld	s0,32(sp)
    80008d8e:	6145                	addi	sp,sp,48
    80008d90:	8082                	ret

0000000080008d92 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80008d92:	7179                	addi	sp,sp,-48
    80008d94:	f406                	sd	ra,40(sp)
    80008d96:	f022                	sd	s0,32(sp)
    80008d98:	1800                	addi	s0,sp,48
  uint32 status = 0;
    80008d9a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    80008d9e:	00003597          	auipc	a1,0x3
    80008da2:	93258593          	addi	a1,a1,-1742 # 8000b6d0 <etext+0x6d0>
    80008da6:	0001f517          	auipc	a0,0x1f
    80008daa:	38250513          	addi	a0,a0,898 # 80028128 <disk+0x2128>
    80008dae:	ffff8097          	auipc	ra,0xffff8
    80008db2:	490080e7          	jalr	1168(ra) # 8000123e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008db6:	100017b7          	lui	a5,0x10001
    80008dba:	439c                	lw	a5,0(a5)
    80008dbc:	2781                	sext.w	a5,a5
    80008dbe:	873e                	mv	a4,a5
    80008dc0:	747277b7          	lui	a5,0x74727
    80008dc4:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008dc8:	04f71063          	bne	a4,a5,80008e08 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008dcc:	100017b7          	lui	a5,0x10001
    80008dd0:	0791                	addi	a5,a5,4
    80008dd2:	439c                	lw	a5,0(a5)
    80008dd4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008dd6:	873e                	mv	a4,a5
    80008dd8:	4785                	li	a5,1
    80008dda:	02f71763          	bne	a4,a5,80008e08 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008dde:	100017b7          	lui	a5,0x10001
    80008de2:	07a1                	addi	a5,a5,8
    80008de4:	439c                	lw	a5,0(a5)
    80008de6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008de8:	873e                	mv	a4,a5
    80008dea:	4789                	li	a5,2
    80008dec:	00f71e63          	bne	a4,a5,80008e08 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008df0:	100017b7          	lui	a5,0x10001
    80008df4:	07b1                	addi	a5,a5,12
    80008df6:	439c                	lw	a5,0(a5)
    80008df8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008dfa:	873e                	mv	a4,a5
    80008dfc:	554d47b7          	lui	a5,0x554d4
    80008e00:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008e04:	00f70a63          	beq	a4,a5,80008e18 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008e08:	00003517          	auipc	a0,0x3
    80008e0c:	8d850513          	addi	a0,a0,-1832 # 8000b6e0 <etext+0x6e0>
    80008e10:	ffff8097          	auipc	ra,0xffff8
    80008e14:	e6e080e7          	jalr	-402(ra) # 80000c7e <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008e18:	fe842783          	lw	a5,-24(s0)
    80008e1c:	0017e793          	ori	a5,a5,1
    80008e20:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008e24:	100017b7          	lui	a5,0x10001
    80008e28:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008e2c:	fe842703          	lw	a4,-24(s0)
    80008e30:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    80008e32:	fe842783          	lw	a5,-24(s0)
    80008e36:	0027e793          	ori	a5,a5,2
    80008e3a:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008e3e:	100017b7          	lui	a5,0x10001
    80008e42:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008e46:	fe842703          	lw	a4,-24(s0)
    80008e4a:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008e4c:	100017b7          	lui	a5,0x10001
    80008e50:	07c1                	addi	a5,a5,16
    80008e52:	439c                	lw	a5,0(a5)
    80008e54:	2781                	sext.w	a5,a5
    80008e56:	1782                	slli	a5,a5,0x20
    80008e58:	9381                	srli	a5,a5,0x20
    80008e5a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008e5e:	fe043783          	ld	a5,-32(s0)
    80008e62:	fdf7f793          	andi	a5,a5,-33
    80008e66:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008e6a:	fe043783          	ld	a5,-32(s0)
    80008e6e:	f7f7f793          	andi	a5,a5,-129
    80008e72:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008e76:	fe043703          	ld	a4,-32(s0)
    80008e7a:	77fd                	lui	a5,0xfffff
    80008e7c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd67ff>
    80008e80:	8ff9                	and	a5,a5,a4
    80008e82:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008e86:	fe043703          	ld	a4,-32(s0)
    80008e8a:	77fd                	lui	a5,0xfffff
    80008e8c:	17fd                	addi	a5,a5,-1
    80008e8e:	8ff9                	and	a5,a5,a4
    80008e90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008e94:	fe043703          	ld	a4,-32(s0)
    80008e98:	f80007b7          	lui	a5,0xf8000
    80008e9c:	17fd                	addi	a5,a5,-1
    80008e9e:	8ff9                	and	a5,a5,a4
    80008ea0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008ea4:	fe043703          	ld	a4,-32(s0)
    80008ea8:	e00007b7          	lui	a5,0xe0000
    80008eac:	17fd                	addi	a5,a5,-1
    80008eae:	8ff9                	and	a5,a5,a4
    80008eb0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008eb4:	fe043703          	ld	a4,-32(s0)
    80008eb8:	f00007b7          	lui	a5,0xf0000
    80008ebc:	17fd                	addi	a5,a5,-1
    80008ebe:	8ff9                	and	a5,a5,a4
    80008ec0:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008ec4:	100017b7          	lui	a5,0x10001
    80008ec8:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008ecc:	fe043703          	ld	a4,-32(s0)
    80008ed0:	2701                	sext.w	a4,a4
    80008ed2:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008ed4:	fe842783          	lw	a5,-24(s0)
    80008ed8:	0087e793          	ori	a5,a5,8
    80008edc:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008ee0:	100017b7          	lui	a5,0x10001
    80008ee4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ee8:	fe842703          	lw	a4,-24(s0)
    80008eec:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008eee:	fe842783          	lw	a5,-24(s0)
    80008ef2:	0047e793          	ori	a5,a5,4
    80008ef6:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008efa:	100017b7          	lui	a5,0x10001
    80008efe:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008f02:	fe842703          	lw	a4,-24(s0)
    80008f06:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80008f08:	100017b7          	lui	a5,0x10001
    80008f0c:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    80008f10:	6705                	lui	a4,0x1
    80008f12:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008f14:	100017b7          	lui	a5,0x10001
    80008f18:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008f1c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008f20:	100017b7          	lui	a5,0x10001
    80008f24:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008f28:	439c                	lw	a5,0(a5)
    80008f2a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008f2e:	fdc42783          	lw	a5,-36(s0)
    80008f32:	2781                	sext.w	a5,a5
    80008f34:	eb89                	bnez	a5,80008f46 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    80008f36:	00002517          	auipc	a0,0x2
    80008f3a:	7ca50513          	addi	a0,a0,1994 # 8000b700 <etext+0x700>
    80008f3e:	ffff8097          	auipc	ra,0xffff8
    80008f42:	d40080e7          	jalr	-704(ra) # 80000c7e <panic>
  if(max < NUM)
    80008f46:	fdc42783          	lw	a5,-36(s0)
    80008f4a:	0007871b          	sext.w	a4,a5
    80008f4e:	479d                	li	a5,7
    80008f50:	00e7ea63          	bltu	a5,a4,80008f64 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    80008f54:	00002517          	auipc	a0,0x2
    80008f58:	7cc50513          	addi	a0,a0,1996 # 8000b720 <etext+0x720>
    80008f5c:	ffff8097          	auipc	ra,0xffff8
    80008f60:	d22080e7          	jalr	-734(ra) # 80000c7e <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008f64:	100017b7          	lui	a5,0x10001
    80008f68:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008f6c:	4721                	li	a4,8
    80008f6e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80008f70:	6609                	lui	a2,0x2
    80008f72:	4581                	li	a1,0
    80008f74:	0001d517          	auipc	a0,0x1d
    80008f78:	08c50513          	addi	a0,a0,140 # 80026000 <disk>
    80008f7c:	ffff8097          	auipc	ra,0xffff8
    80008f80:	4c6080e7          	jalr	1222(ra) # 80001442 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80008f84:	0001d797          	auipc	a5,0x1d
    80008f88:	07c78793          	addi	a5,a5,124 # 80026000 <disk>
    80008f8c:	00c7d713          	srli	a4,a5,0xc
    80008f90:	100017b7          	lui	a5,0x10001
    80008f94:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80008f98:	2701                	sext.w	a4,a4
    80008f9a:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    80008f9c:	0001d717          	auipc	a4,0x1d
    80008fa0:	06470713          	addi	a4,a4,100 # 80026000 <disk>
    80008fa4:	6789                	lui	a5,0x2
    80008fa6:	97ba                	add	a5,a5,a4
    80008fa8:	0001d717          	auipc	a4,0x1d
    80008fac:	05870713          	addi	a4,a4,88 # 80026000 <disk>
    80008fb0:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80008fb2:	0001d717          	auipc	a4,0x1d
    80008fb6:	0ce70713          	addi	a4,a4,206 # 80026080 <disk+0x80>
    80008fba:	0001d697          	auipc	a3,0x1d
    80008fbe:	04668693          	addi	a3,a3,70 # 80026000 <disk>
    80008fc2:	6789                	lui	a5,0x2
    80008fc4:	97b6                	add	a5,a5,a3
    80008fc6:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80008fc8:	0001e717          	auipc	a4,0x1e
    80008fcc:	03870713          	addi	a4,a4,56 # 80027000 <disk+0x1000>
    80008fd0:	0001d697          	auipc	a3,0x1d
    80008fd4:	03068693          	addi	a3,a3,48 # 80026000 <disk>
    80008fd8:	6789                	lui	a5,0x2
    80008fda:	97b6                	add	a5,a5,a3
    80008fdc:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008fde:	fe042623          	sw	zero,-20(s0)
    80008fe2:	a015                	j	80009006 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80008fe4:	0001d717          	auipc	a4,0x1d
    80008fe8:	01c70713          	addi	a4,a4,28 # 80026000 <disk>
    80008fec:	fec42783          	lw	a5,-20(s0)
    80008ff0:	97ba                	add	a5,a5,a4
    80008ff2:	6709                	lui	a4,0x2
    80008ff4:	97ba                	add	a5,a5,a4
    80008ff6:	4705                	li	a4,1
    80008ff8:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    80008ffc:	fec42783          	lw	a5,-20(s0)
    80009000:	2785                	addiw	a5,a5,1
    80009002:	fef42623          	sw	a5,-20(s0)
    80009006:	fec42783          	lw	a5,-20(s0)
    8000900a:	0007871b          	sext.w	a4,a5
    8000900e:	479d                	li	a5,7
    80009010:	fce7dae3          	bge	a5,a4,80008fe4 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80009014:	0001                	nop
    80009016:	0001                	nop
    80009018:	70a2                	ld	ra,40(sp)
    8000901a:	7402                	ld	s0,32(sp)
    8000901c:	6145                	addi	sp,sp,48
    8000901e:	8082                	ret

0000000080009020 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80009020:	1101                	addi	sp,sp,-32
    80009022:	ec22                	sd	s0,24(sp)
    80009024:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80009026:	fe042623          	sw	zero,-20(s0)
    8000902a:	a081                	j	8000906a <alloc_desc+0x4a>
    if(disk.free[i]){
    8000902c:	0001d717          	auipc	a4,0x1d
    80009030:	fd470713          	addi	a4,a4,-44 # 80026000 <disk>
    80009034:	fec42783          	lw	a5,-20(s0)
    80009038:	97ba                	add	a5,a5,a4
    8000903a:	6709                	lui	a4,0x2
    8000903c:	97ba                	add	a5,a5,a4
    8000903e:	0187c783          	lbu	a5,24(a5)
    80009042:	cf99                	beqz	a5,80009060 <alloc_desc+0x40>
      disk.free[i] = 0;
    80009044:	0001d717          	auipc	a4,0x1d
    80009048:	fbc70713          	addi	a4,a4,-68 # 80026000 <disk>
    8000904c:	fec42783          	lw	a5,-20(s0)
    80009050:	97ba                	add	a5,a5,a4
    80009052:	6709                	lui	a4,0x2
    80009054:	97ba                	add	a5,a5,a4
    80009056:	00078c23          	sb	zero,24(a5)
      return i;
    8000905a:	fec42783          	lw	a5,-20(s0)
    8000905e:	a831                	j	8000907a <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    80009060:	fec42783          	lw	a5,-20(s0)
    80009064:	2785                	addiw	a5,a5,1
    80009066:	fef42623          	sw	a5,-20(s0)
    8000906a:	fec42783          	lw	a5,-20(s0)
    8000906e:	0007871b          	sext.w	a4,a5
    80009072:	479d                	li	a5,7
    80009074:	fae7dce3          	bge	a5,a4,8000902c <alloc_desc+0xc>
    }
  }
  return -1;
    80009078:	57fd                	li	a5,-1
}
    8000907a:	853e                	mv	a0,a5
    8000907c:	6462                	ld	s0,24(sp)
    8000907e:	6105                	addi	sp,sp,32
    80009080:	8082                	ret

0000000080009082 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80009082:	1101                	addi	sp,sp,-32
    80009084:	ec06                	sd	ra,24(sp)
    80009086:	e822                	sd	s0,16(sp)
    80009088:	1000                	addi	s0,sp,32
    8000908a:	87aa                	mv	a5,a0
    8000908c:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80009090:	fec42783          	lw	a5,-20(s0)
    80009094:	0007871b          	sext.w	a4,a5
    80009098:	479d                	li	a5,7
    8000909a:	00e7da63          	bge	a5,a4,800090ae <free_desc+0x2c>
    panic("free_desc 1");
    8000909e:	00002517          	auipc	a0,0x2
    800090a2:	6a250513          	addi	a0,a0,1698 # 8000b740 <etext+0x740>
    800090a6:	ffff8097          	auipc	ra,0xffff8
    800090aa:	bd8080e7          	jalr	-1064(ra) # 80000c7e <panic>
  if(disk.free[i])
    800090ae:	0001d717          	auipc	a4,0x1d
    800090b2:	f5270713          	addi	a4,a4,-174 # 80026000 <disk>
    800090b6:	fec42783          	lw	a5,-20(s0)
    800090ba:	97ba                	add	a5,a5,a4
    800090bc:	6709                	lui	a4,0x2
    800090be:	97ba                	add	a5,a5,a4
    800090c0:	0187c783          	lbu	a5,24(a5)
    800090c4:	cb89                	beqz	a5,800090d6 <free_desc+0x54>
    panic("free_desc 2");
    800090c6:	00002517          	auipc	a0,0x2
    800090ca:	68a50513          	addi	a0,a0,1674 # 8000b750 <etext+0x750>
    800090ce:	ffff8097          	auipc	ra,0xffff8
    800090d2:	bb0080e7          	jalr	-1104(ra) # 80000c7e <panic>
  disk.desc[i].addr = 0;
    800090d6:	0001d717          	auipc	a4,0x1d
    800090da:	f2a70713          	addi	a4,a4,-214 # 80026000 <disk>
    800090de:	6789                	lui	a5,0x2
    800090e0:	97ba                	add	a5,a5,a4
    800090e2:	6398                	ld	a4,0(a5)
    800090e4:	fec42783          	lw	a5,-20(s0)
    800090e8:	0792                	slli	a5,a5,0x4
    800090ea:	97ba                	add	a5,a5,a4
    800090ec:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    800090f0:	0001d717          	auipc	a4,0x1d
    800090f4:	f1070713          	addi	a4,a4,-240 # 80026000 <disk>
    800090f8:	6789                	lui	a5,0x2
    800090fa:	97ba                	add	a5,a5,a4
    800090fc:	6398                	ld	a4,0(a5)
    800090fe:	fec42783          	lw	a5,-20(s0)
    80009102:	0792                	slli	a5,a5,0x4
    80009104:	97ba                	add	a5,a5,a4
    80009106:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    8000910a:	0001d717          	auipc	a4,0x1d
    8000910e:	ef670713          	addi	a4,a4,-266 # 80026000 <disk>
    80009112:	6789                	lui	a5,0x2
    80009114:	97ba                	add	a5,a5,a4
    80009116:	6398                	ld	a4,0(a5)
    80009118:	fec42783          	lw	a5,-20(s0)
    8000911c:	0792                	slli	a5,a5,0x4
    8000911e:	97ba                	add	a5,a5,a4
    80009120:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    80009124:	0001d717          	auipc	a4,0x1d
    80009128:	edc70713          	addi	a4,a4,-292 # 80026000 <disk>
    8000912c:	6789                	lui	a5,0x2
    8000912e:	97ba                	add	a5,a5,a4
    80009130:	6398                	ld	a4,0(a5)
    80009132:	fec42783          	lw	a5,-20(s0)
    80009136:	0792                	slli	a5,a5,0x4
    80009138:	97ba                	add	a5,a5,a4
    8000913a:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    8000913e:	0001d717          	auipc	a4,0x1d
    80009142:	ec270713          	addi	a4,a4,-318 # 80026000 <disk>
    80009146:	fec42783          	lw	a5,-20(s0)
    8000914a:	97ba                	add	a5,a5,a4
    8000914c:	6709                	lui	a4,0x2
    8000914e:	97ba                	add	a5,a5,a4
    80009150:	4705                	li	a4,1
    80009152:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80009156:	0001f517          	auipc	a0,0x1f
    8000915a:	ec250513          	addi	a0,a0,-318 # 80028018 <disk+0x2018>
    8000915e:	ffffa097          	auipc	ra,0xffffa
    80009162:	6f0080e7          	jalr	1776(ra) # 8000384e <wakeup>
}
    80009166:	0001                	nop
    80009168:	60e2                	ld	ra,24(sp)
    8000916a:	6442                	ld	s0,16(sp)
    8000916c:	6105                	addi	sp,sp,32
    8000916e:	8082                	ret

0000000080009170 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80009170:	7179                	addi	sp,sp,-48
    80009172:	f406                	sd	ra,40(sp)
    80009174:	f022                	sd	s0,32(sp)
    80009176:	1800                	addi	s0,sp,48
    80009178:	87aa                	mv	a5,a0
    8000917a:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    8000917e:	0001d717          	auipc	a4,0x1d
    80009182:	e8270713          	addi	a4,a4,-382 # 80026000 <disk>
    80009186:	6789                	lui	a5,0x2
    80009188:	97ba                	add	a5,a5,a4
    8000918a:	6398                	ld	a4,0(a5)
    8000918c:	fdc42783          	lw	a5,-36(s0)
    80009190:	0792                	slli	a5,a5,0x4
    80009192:	97ba                	add	a5,a5,a4
    80009194:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80009198:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    8000919c:	0001d717          	auipc	a4,0x1d
    800091a0:	e6470713          	addi	a4,a4,-412 # 80026000 <disk>
    800091a4:	6789                	lui	a5,0x2
    800091a6:	97ba                	add	a5,a5,a4
    800091a8:	6398                	ld	a4,0(a5)
    800091aa:	fdc42783          	lw	a5,-36(s0)
    800091ae:	0792                	slli	a5,a5,0x4
    800091b0:	97ba                	add	a5,a5,a4
    800091b2:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    800091b6:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    800091ba:	fdc42783          	lw	a5,-36(s0)
    800091be:	853e                	mv	a0,a5
    800091c0:	00000097          	auipc	ra,0x0
    800091c4:	ec2080e7          	jalr	-318(ra) # 80009082 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800091c8:	fec42783          	lw	a5,-20(s0)
    800091cc:	8b85                	andi	a5,a5,1
    800091ce:	2781                	sext.w	a5,a5
    800091d0:	c791                	beqz	a5,800091dc <free_chain+0x6c>
      i = nxt;
    800091d2:	fe842783          	lw	a5,-24(s0)
    800091d6:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    800091da:	b755                	j	8000917e <free_chain+0xe>
    else
      break;
    800091dc:	0001                	nop
  }
}
    800091de:	0001                	nop
    800091e0:	70a2                	ld	ra,40(sp)
    800091e2:	7402                	ld	s0,32(sp)
    800091e4:	6145                	addi	sp,sp,48
    800091e6:	8082                	ret

00000000800091e8 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    800091e8:	7139                	addi	sp,sp,-64
    800091ea:	fc06                	sd	ra,56(sp)
    800091ec:	f822                	sd	s0,48(sp)
    800091ee:	f426                	sd	s1,40(sp)
    800091f0:	0080                	addi	s0,sp,64
    800091f2:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    800091f6:	fc042e23          	sw	zero,-36(s0)
    800091fa:	a895                	j	8000926e <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    800091fc:	fdc42783          	lw	a5,-36(s0)
    80009200:	078a                	slli	a5,a5,0x2
    80009202:	fc843703          	ld	a4,-56(s0)
    80009206:	00f704b3          	add	s1,a4,a5
    8000920a:	00000097          	auipc	ra,0x0
    8000920e:	e16080e7          	jalr	-490(ra) # 80009020 <alloc_desc>
    80009212:	87aa                	mv	a5,a0
    80009214:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009216:	fdc42783          	lw	a5,-36(s0)
    8000921a:	078a                	slli	a5,a5,0x2
    8000921c:	fc843703          	ld	a4,-56(s0)
    80009220:	97ba                	add	a5,a5,a4
    80009222:	439c                	lw	a5,0(a5)
    80009224:	0407d063          	bgez	a5,80009264 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    80009228:	fc042c23          	sw	zero,-40(s0)
    8000922c:	a015                	j	80009250 <alloc3_desc+0x68>
        free_desc(idx[j]);
    8000922e:	fd842783          	lw	a5,-40(s0)
    80009232:	078a                	slli	a5,a5,0x2
    80009234:	fc843703          	ld	a4,-56(s0)
    80009238:	97ba                	add	a5,a5,a4
    8000923a:	439c                	lw	a5,0(a5)
    8000923c:	853e                	mv	a0,a5
    8000923e:	00000097          	auipc	ra,0x0
    80009242:	e44080e7          	jalr	-444(ra) # 80009082 <free_desc>
      for(int j = 0; j < i; j++)
    80009246:	fd842783          	lw	a5,-40(s0)
    8000924a:	2785                	addiw	a5,a5,1
    8000924c:	fcf42c23          	sw	a5,-40(s0)
    80009250:	fd842703          	lw	a4,-40(s0)
    80009254:	fdc42783          	lw	a5,-36(s0)
    80009258:	2701                	sext.w	a4,a4
    8000925a:	2781                	sext.w	a5,a5
    8000925c:	fcf749e3          	blt	a4,a5,8000922e <alloc3_desc+0x46>
      return -1;
    80009260:	57fd                	li	a5,-1
    80009262:	a831                	j	8000927e <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    80009264:	fdc42783          	lw	a5,-36(s0)
    80009268:	2785                	addiw	a5,a5,1
    8000926a:	fcf42e23          	sw	a5,-36(s0)
    8000926e:	fdc42783          	lw	a5,-36(s0)
    80009272:	0007871b          	sext.w	a4,a5
    80009276:	4789                	li	a5,2
    80009278:	f8e7d2e3          	bge	a5,a4,800091fc <alloc3_desc+0x14>
    }
  }
  return 0;
    8000927c:	4781                	li	a5,0
}
    8000927e:	853e                	mv	a0,a5
    80009280:	70e2                	ld	ra,56(sp)
    80009282:	7442                	ld	s0,48(sp)
    80009284:	74a2                	ld	s1,40(sp)
    80009286:	6121                	addi	sp,sp,64
    80009288:	8082                	ret

000000008000928a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000928a:	7139                	addi	sp,sp,-64
    8000928c:	fc06                	sd	ra,56(sp)
    8000928e:	f822                	sd	s0,48(sp)
    80009290:	0080                	addi	s0,sp,64
    80009292:	fca43423          	sd	a0,-56(s0)
    80009296:	87ae                	mv	a5,a1
    80009298:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000929c:	fc843783          	ld	a5,-56(s0)
    800092a0:	47dc                	lw	a5,12(a5)
    800092a2:	0017979b          	slliw	a5,a5,0x1
    800092a6:	2781                	sext.w	a5,a5
    800092a8:	1782                	slli	a5,a5,0x20
    800092aa:	9381                	srli	a5,a5,0x20
    800092ac:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    800092b0:	0001f517          	auipc	a0,0x1f
    800092b4:	e7850513          	addi	a0,a0,-392 # 80028128 <disk+0x2128>
    800092b8:	ffff8097          	auipc	ra,0xffff8
    800092bc:	fb6080e7          	jalr	-74(ra) # 8000126e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    800092c0:	fd040793          	addi	a5,s0,-48
    800092c4:	853e                	mv	a0,a5
    800092c6:	00000097          	auipc	ra,0x0
    800092ca:	f22080e7          	jalr	-222(ra) # 800091e8 <alloc3_desc>
    800092ce:	87aa                	mv	a5,a0
    800092d0:	cf91                	beqz	a5,800092ec <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    800092d2:	0001f597          	auipc	a1,0x1f
    800092d6:	e5658593          	addi	a1,a1,-426 # 80028128 <disk+0x2128>
    800092da:	0001f517          	auipc	a0,0x1f
    800092de:	d3e50513          	addi	a0,a0,-706 # 80028018 <disk+0x2018>
    800092e2:	ffffa097          	auipc	ra,0xffffa
    800092e6:	4f0080e7          	jalr	1264(ra) # 800037d2 <sleep>
    if(alloc3_desc(idx) == 0) {
    800092ea:	bfd9                	j	800092c0 <virtio_disk_rw+0x36>
      break;
    800092ec:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    800092ee:	fd042783          	lw	a5,-48(s0)
    800092f2:	20078793          	addi	a5,a5,512
    800092f6:	00479713          	slli	a4,a5,0x4
    800092fa:	0001d797          	auipc	a5,0x1d
    800092fe:	d0678793          	addi	a5,a5,-762 # 80026000 <disk>
    80009302:	97ba                	add	a5,a5,a4
    80009304:	0a878793          	addi	a5,a5,168
    80009308:	fef43023          	sd	a5,-32(s0)

  if(write)
    8000930c:	fc442783          	lw	a5,-60(s0)
    80009310:	2781                	sext.w	a5,a5
    80009312:	c791                	beqz	a5,8000931e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009314:	fe043783          	ld	a5,-32(s0)
    80009318:	4705                	li	a4,1
    8000931a:	c398                	sw	a4,0(a5)
    8000931c:	a029                	j	80009326 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000931e:	fe043783          	ld	a5,-32(s0)
    80009322:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009326:	fe043783          	ld	a5,-32(s0)
    8000932a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000932e:	fe043783          	ld	a5,-32(s0)
    80009332:	fe843703          	ld	a4,-24(s0)
    80009336:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80009338:	0001d717          	auipc	a4,0x1d
    8000933c:	cc870713          	addi	a4,a4,-824 # 80026000 <disk>
    80009340:	6789                	lui	a5,0x2
    80009342:	97ba                	add	a5,a5,a4
    80009344:	6398                	ld	a4,0(a5)
    80009346:	fd042783          	lw	a5,-48(s0)
    8000934a:	0792                	slli	a5,a5,0x4
    8000934c:	97ba                	add	a5,a5,a4
    8000934e:	fe043703          	ld	a4,-32(s0)
    80009352:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009354:	0001d717          	auipc	a4,0x1d
    80009358:	cac70713          	addi	a4,a4,-852 # 80026000 <disk>
    8000935c:	6789                	lui	a5,0x2
    8000935e:	97ba                	add	a5,a5,a4
    80009360:	6398                	ld	a4,0(a5)
    80009362:	fd042783          	lw	a5,-48(s0)
    80009366:	0792                	slli	a5,a5,0x4
    80009368:	97ba                	add	a5,a5,a4
    8000936a:	4741                	li	a4,16
    8000936c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8000936e:	0001d717          	auipc	a4,0x1d
    80009372:	c9270713          	addi	a4,a4,-878 # 80026000 <disk>
    80009376:	6789                	lui	a5,0x2
    80009378:	97ba                	add	a5,a5,a4
    8000937a:	6398                	ld	a4,0(a5)
    8000937c:	fd042783          	lw	a5,-48(s0)
    80009380:	0792                	slli	a5,a5,0x4
    80009382:	97ba                	add	a5,a5,a4
    80009384:	4705                	li	a4,1
    80009386:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    8000938a:	fd442683          	lw	a3,-44(s0)
    8000938e:	0001d717          	auipc	a4,0x1d
    80009392:	c7270713          	addi	a4,a4,-910 # 80026000 <disk>
    80009396:	6789                	lui	a5,0x2
    80009398:	97ba                	add	a5,a5,a4
    8000939a:	6398                	ld	a4,0(a5)
    8000939c:	fd042783          	lw	a5,-48(s0)
    800093a0:	0792                	slli	a5,a5,0x4
    800093a2:	97ba                	add	a5,a5,a4
    800093a4:	03069713          	slli	a4,a3,0x30
    800093a8:	9341                	srli	a4,a4,0x30
    800093aa:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    800093ae:	fc843783          	ld	a5,-56(s0)
    800093b2:	05878693          	addi	a3,a5,88
    800093b6:	0001d717          	auipc	a4,0x1d
    800093ba:	c4a70713          	addi	a4,a4,-950 # 80026000 <disk>
    800093be:	6789                	lui	a5,0x2
    800093c0:	97ba                	add	a5,a5,a4
    800093c2:	6398                	ld	a4,0(a5)
    800093c4:	fd442783          	lw	a5,-44(s0)
    800093c8:	0792                	slli	a5,a5,0x4
    800093ca:	97ba                	add	a5,a5,a4
    800093cc:	8736                	mv	a4,a3
    800093ce:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    800093d0:	0001d717          	auipc	a4,0x1d
    800093d4:	c3070713          	addi	a4,a4,-976 # 80026000 <disk>
    800093d8:	6789                	lui	a5,0x2
    800093da:	97ba                	add	a5,a5,a4
    800093dc:	6398                	ld	a4,0(a5)
    800093de:	fd442783          	lw	a5,-44(s0)
    800093e2:	0792                	slli	a5,a5,0x4
    800093e4:	97ba                	add	a5,a5,a4
    800093e6:	40000713          	li	a4,1024
    800093ea:	c798                	sw	a4,8(a5)
  if(write)
    800093ec:	fc442783          	lw	a5,-60(s0)
    800093f0:	2781                	sext.w	a5,a5
    800093f2:	cf99                	beqz	a5,80009410 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    800093f4:	0001d717          	auipc	a4,0x1d
    800093f8:	c0c70713          	addi	a4,a4,-1012 # 80026000 <disk>
    800093fc:	6789                	lui	a5,0x2
    800093fe:	97ba                	add	a5,a5,a4
    80009400:	6398                	ld	a4,0(a5)
    80009402:	fd442783          	lw	a5,-44(s0)
    80009406:	0792                	slli	a5,a5,0x4
    80009408:	97ba                	add	a5,a5,a4
    8000940a:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    8000940e:	a839                	j	8000942c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009410:	0001d717          	auipc	a4,0x1d
    80009414:	bf070713          	addi	a4,a4,-1040 # 80026000 <disk>
    80009418:	6789                	lui	a5,0x2
    8000941a:	97ba                	add	a5,a5,a4
    8000941c:	6398                	ld	a4,0(a5)
    8000941e:	fd442783          	lw	a5,-44(s0)
    80009422:	0792                	slli	a5,a5,0x4
    80009424:	97ba                	add	a5,a5,a4
    80009426:	4709                	li	a4,2
    80009428:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000942c:	0001d717          	auipc	a4,0x1d
    80009430:	bd470713          	addi	a4,a4,-1068 # 80026000 <disk>
    80009434:	6789                	lui	a5,0x2
    80009436:	97ba                	add	a5,a5,a4
    80009438:	6398                	ld	a4,0(a5)
    8000943a:	fd442783          	lw	a5,-44(s0)
    8000943e:	0792                	slli	a5,a5,0x4
    80009440:	97ba                	add	a5,a5,a4
    80009442:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    80009446:	0001d697          	auipc	a3,0x1d
    8000944a:	bba68693          	addi	a3,a3,-1094 # 80026000 <disk>
    8000944e:	6789                	lui	a5,0x2
    80009450:	97b6                	add	a5,a5,a3
    80009452:	6394                	ld	a3,0(a5)
    80009454:	fd442783          	lw	a5,-44(s0)
    80009458:	0792                	slli	a5,a5,0x4
    8000945a:	97b6                	add	a5,a5,a3
    8000945c:	00176713          	ori	a4,a4,1
    80009460:	1742                	slli	a4,a4,0x30
    80009462:	9341                	srli	a4,a4,0x30
    80009464:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    80009468:	fd842683          	lw	a3,-40(s0)
    8000946c:	0001d717          	auipc	a4,0x1d
    80009470:	b9470713          	addi	a4,a4,-1132 # 80026000 <disk>
    80009474:	6789                	lui	a5,0x2
    80009476:	97ba                	add	a5,a5,a4
    80009478:	6398                	ld	a4,0(a5)
    8000947a:	fd442783          	lw	a5,-44(s0)
    8000947e:	0792                	slli	a5,a5,0x4
    80009480:	97ba                	add	a5,a5,a4
    80009482:	03069713          	slli	a4,a3,0x30
    80009486:	9341                	srli	a4,a4,0x30
    80009488:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000948c:	fd042783          	lw	a5,-48(s0)
    80009490:	0001d717          	auipc	a4,0x1d
    80009494:	b7070713          	addi	a4,a4,-1168 # 80026000 <disk>
    80009498:	20078793          	addi	a5,a5,512
    8000949c:	0792                	slli	a5,a5,0x4
    8000949e:	97ba                	add	a5,a5,a4
    800094a0:	577d                	li	a4,-1
    800094a2:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    800094a6:	fd042783          	lw	a5,-48(s0)
    800094aa:	20078793          	addi	a5,a5,512
    800094ae:	00479713          	slli	a4,a5,0x4
    800094b2:	0001d797          	auipc	a5,0x1d
    800094b6:	b4e78793          	addi	a5,a5,-1202 # 80026000 <disk>
    800094ba:	97ba                	add	a5,a5,a4
    800094bc:	03078693          	addi	a3,a5,48
    800094c0:	0001d717          	auipc	a4,0x1d
    800094c4:	b4070713          	addi	a4,a4,-1216 # 80026000 <disk>
    800094c8:	6789                	lui	a5,0x2
    800094ca:	97ba                	add	a5,a5,a4
    800094cc:	6398                	ld	a4,0(a5)
    800094ce:	fd842783          	lw	a5,-40(s0)
    800094d2:	0792                	slli	a5,a5,0x4
    800094d4:	97ba                	add	a5,a5,a4
    800094d6:	8736                	mv	a4,a3
    800094d8:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    800094da:	0001d717          	auipc	a4,0x1d
    800094de:	b2670713          	addi	a4,a4,-1242 # 80026000 <disk>
    800094e2:	6789                	lui	a5,0x2
    800094e4:	97ba                	add	a5,a5,a4
    800094e6:	6398                	ld	a4,0(a5)
    800094e8:	fd842783          	lw	a5,-40(s0)
    800094ec:	0792                	slli	a5,a5,0x4
    800094ee:	97ba                	add	a5,a5,a4
    800094f0:	4705                	li	a4,1
    800094f2:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    800094f4:	0001d717          	auipc	a4,0x1d
    800094f8:	b0c70713          	addi	a4,a4,-1268 # 80026000 <disk>
    800094fc:	6789                	lui	a5,0x2
    800094fe:	97ba                	add	a5,a5,a4
    80009500:	6398                	ld	a4,0(a5)
    80009502:	fd842783          	lw	a5,-40(s0)
    80009506:	0792                	slli	a5,a5,0x4
    80009508:	97ba                	add	a5,a5,a4
    8000950a:	4709                	li	a4,2
    8000950c:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    80009510:	0001d717          	auipc	a4,0x1d
    80009514:	af070713          	addi	a4,a4,-1296 # 80026000 <disk>
    80009518:	6789                	lui	a5,0x2
    8000951a:	97ba                	add	a5,a5,a4
    8000951c:	6398                	ld	a4,0(a5)
    8000951e:	fd842783          	lw	a5,-40(s0)
    80009522:	0792                	slli	a5,a5,0x4
    80009524:	97ba                	add	a5,a5,a4
    80009526:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000952a:	fc843783          	ld	a5,-56(s0)
    8000952e:	4705                	li	a4,1
    80009530:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    80009532:	fd042783          	lw	a5,-48(s0)
    80009536:	0001d717          	auipc	a4,0x1d
    8000953a:	aca70713          	addi	a4,a4,-1334 # 80026000 <disk>
    8000953e:	20078793          	addi	a5,a5,512
    80009542:	0792                	slli	a5,a5,0x4
    80009544:	97ba                	add	a5,a5,a4
    80009546:	fc843703          	ld	a4,-56(s0)
    8000954a:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    8000954c:	fd042603          	lw	a2,-48(s0)
    80009550:	0001d717          	auipc	a4,0x1d
    80009554:	ab070713          	addi	a4,a4,-1360 # 80026000 <disk>
    80009558:	6789                	lui	a5,0x2
    8000955a:	97ba                	add	a5,a5,a4
    8000955c:	6794                	ld	a3,8(a5)
    8000955e:	0001d717          	auipc	a4,0x1d
    80009562:	aa270713          	addi	a4,a4,-1374 # 80026000 <disk>
    80009566:	6789                	lui	a5,0x2
    80009568:	97ba                	add	a5,a5,a4
    8000956a:	679c                	ld	a5,8(a5)
    8000956c:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009570:	2781                	sext.w	a5,a5
    80009572:	8b9d                	andi	a5,a5,7
    80009574:	2781                	sext.w	a5,a5
    80009576:	03061713          	slli	a4,a2,0x30
    8000957a:	9341                	srli	a4,a4,0x30
    8000957c:	0786                	slli	a5,a5,0x1
    8000957e:	97b6                	add	a5,a5,a3
    80009580:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009584:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009588:	0001d717          	auipc	a4,0x1d
    8000958c:	a7870713          	addi	a4,a4,-1416 # 80026000 <disk>
    80009590:	6789                	lui	a5,0x2
    80009592:	97ba                	add	a5,a5,a4
    80009594:	679c                	ld	a5,8(a5)
    80009596:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000959a:	0001d697          	auipc	a3,0x1d
    8000959e:	a6668693          	addi	a3,a3,-1434 # 80026000 <disk>
    800095a2:	6789                	lui	a5,0x2
    800095a4:	97b6                	add	a5,a5,a3
    800095a6:	679c                	ld	a5,8(a5)
    800095a8:	2705                	addiw	a4,a4,1
    800095aa:	1742                	slli	a4,a4,0x30
    800095ac:	9341                	srli	a4,a4,0x30
    800095ae:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    800095b2:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    800095b6:	100017b7          	lui	a5,0x10001
    800095ba:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    800095be:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    800095c2:	a819                	j	800095d8 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    800095c4:	0001f597          	auipc	a1,0x1f
    800095c8:	b6458593          	addi	a1,a1,-1180 # 80028128 <disk+0x2128>
    800095cc:	fc843503          	ld	a0,-56(s0)
    800095d0:	ffffa097          	auipc	ra,0xffffa
    800095d4:	202080e7          	jalr	514(ra) # 800037d2 <sleep>
  while(b->disk == 1) {
    800095d8:	fc843783          	ld	a5,-56(s0)
    800095dc:	43dc                	lw	a5,4(a5)
    800095de:	873e                	mv	a4,a5
    800095e0:	4785                	li	a5,1
    800095e2:	fef701e3          	beq	a4,a5,800095c4 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    800095e6:	fd042783          	lw	a5,-48(s0)
    800095ea:	0001d717          	auipc	a4,0x1d
    800095ee:	a1670713          	addi	a4,a4,-1514 # 80026000 <disk>
    800095f2:	20078793          	addi	a5,a5,512
    800095f6:	0792                	slli	a5,a5,0x4
    800095f8:	97ba                	add	a5,a5,a4
    800095fa:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    800095fe:	fd042783          	lw	a5,-48(s0)
    80009602:	853e                	mv	a0,a5
    80009604:	00000097          	auipc	ra,0x0
    80009608:	b6c080e7          	jalr	-1172(ra) # 80009170 <free_chain>

  release(&disk.vdisk_lock);
    8000960c:	0001f517          	auipc	a0,0x1f
    80009610:	b1c50513          	addi	a0,a0,-1252 # 80028128 <disk+0x2128>
    80009614:	ffff8097          	auipc	ra,0xffff8
    80009618:	cbe080e7          	jalr	-834(ra) # 800012d2 <release>
}
    8000961c:	0001                	nop
    8000961e:	70e2                	ld	ra,56(sp)
    80009620:	7442                	ld	s0,48(sp)
    80009622:	6121                	addi	sp,sp,64
    80009624:	8082                	ret

0000000080009626 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80009626:	1101                	addi	sp,sp,-32
    80009628:	ec06                	sd	ra,24(sp)
    8000962a:	e822                	sd	s0,16(sp)
    8000962c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000962e:	0001f517          	auipc	a0,0x1f
    80009632:	afa50513          	addi	a0,a0,-1286 # 80028128 <disk+0x2128>
    80009636:	ffff8097          	auipc	ra,0xffff8
    8000963a:	c38080e7          	jalr	-968(ra) # 8000126e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000963e:	100017b7          	lui	a5,0x10001
    80009642:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    80009646:	439c                	lw	a5,0(a5)
    80009648:	0007871b          	sext.w	a4,a5
    8000964c:	100017b7          	lui	a5,0x10001
    80009650:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    80009654:	8b0d                	andi	a4,a4,3
    80009656:	2701                	sext.w	a4,a4
    80009658:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    8000965a:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    8000965e:	a855                	j	80009712 <virtio_disk_intr+0xec>
    __sync_synchronize();
    80009660:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80009664:	0001d717          	auipc	a4,0x1d
    80009668:	99c70713          	addi	a4,a4,-1636 # 80026000 <disk>
    8000966c:	6789                	lui	a5,0x2
    8000966e:	97ba                	add	a5,a5,a4
    80009670:	6b98                	ld	a4,16(a5)
    80009672:	0001d697          	auipc	a3,0x1d
    80009676:	98e68693          	addi	a3,a3,-1650 # 80026000 <disk>
    8000967a:	6789                	lui	a5,0x2
    8000967c:	97b6                	add	a5,a5,a3
    8000967e:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009682:	2781                	sext.w	a5,a5
    80009684:	8b9d                	andi	a5,a5,7
    80009686:	2781                	sext.w	a5,a5
    80009688:	078e                	slli	a5,a5,0x3
    8000968a:	97ba                	add	a5,a5,a4
    8000968c:	43dc                	lw	a5,4(a5)
    8000968e:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009692:	0001d717          	auipc	a4,0x1d
    80009696:	96e70713          	addi	a4,a4,-1682 # 80026000 <disk>
    8000969a:	fec42783          	lw	a5,-20(s0)
    8000969e:	20078793          	addi	a5,a5,512
    800096a2:	0792                	slli	a5,a5,0x4
    800096a4:	97ba                	add	a5,a5,a4
    800096a6:	0307c783          	lbu	a5,48(a5)
    800096aa:	cb89                	beqz	a5,800096bc <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    800096ac:	00002517          	auipc	a0,0x2
    800096b0:	0b450513          	addi	a0,a0,180 # 8000b760 <etext+0x760>
    800096b4:	ffff7097          	auipc	ra,0xffff7
    800096b8:	5ca080e7          	jalr	1482(ra) # 80000c7e <panic>

    struct buf *b = disk.info[id].b;
    800096bc:	0001d717          	auipc	a4,0x1d
    800096c0:	94470713          	addi	a4,a4,-1724 # 80026000 <disk>
    800096c4:	fec42783          	lw	a5,-20(s0)
    800096c8:	20078793          	addi	a5,a5,512
    800096cc:	0792                	slli	a5,a5,0x4
    800096ce:	97ba                	add	a5,a5,a4
    800096d0:	779c                	ld	a5,40(a5)
    800096d2:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    800096d6:	fe043783          	ld	a5,-32(s0)
    800096da:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    800096de:	fe043503          	ld	a0,-32(s0)
    800096e2:	ffffa097          	auipc	ra,0xffffa
    800096e6:	16c080e7          	jalr	364(ra) # 8000384e <wakeup>

    disk.used_idx += 1;
    800096ea:	0001d717          	auipc	a4,0x1d
    800096ee:	91670713          	addi	a4,a4,-1770 # 80026000 <disk>
    800096f2:	6789                	lui	a5,0x2
    800096f4:	97ba                	add	a5,a5,a4
    800096f6:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    800096fa:	2785                	addiw	a5,a5,1
    800096fc:	03079713          	slli	a4,a5,0x30
    80009700:	9341                	srli	a4,a4,0x30
    80009702:	0001d697          	auipc	a3,0x1d
    80009706:	8fe68693          	addi	a3,a3,-1794 # 80026000 <disk>
    8000970a:	6789                	lui	a5,0x2
    8000970c:	97b6                	add	a5,a5,a3
    8000970e:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    80009712:	0001d717          	auipc	a4,0x1d
    80009716:	8ee70713          	addi	a4,a4,-1810 # 80026000 <disk>
    8000971a:	6789                	lui	a5,0x2
    8000971c:	97ba                	add	a5,a5,a4
    8000971e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009722:	0001d717          	auipc	a4,0x1d
    80009726:	8de70713          	addi	a4,a4,-1826 # 80026000 <disk>
    8000972a:	6789                	lui	a5,0x2
    8000972c:	97ba                	add	a5,a5,a4
    8000972e:	6b9c                	ld	a5,16(a5)
    80009730:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009734:	0006871b          	sext.w	a4,a3
    80009738:	2781                	sext.w	a5,a5
    8000973a:	f2f713e3          	bne	a4,a5,80009660 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000973e:	0001f517          	auipc	a0,0x1f
    80009742:	9ea50513          	addi	a0,a0,-1558 # 80028128 <disk+0x2128>
    80009746:	ffff8097          	auipc	ra,0xffff8
    8000974a:	b8c080e7          	jalr	-1140(ra) # 800012d2 <release>
}
    8000974e:	0001                	nop
    80009750:	60e2                	ld	ra,24(sp)
    80009752:	6442                	ld	s0,16(sp)
    80009754:	6105                	addi	sp,sp,32
    80009756:	8082                	ret
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
