
user/_public_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <random>:

#define N  1000

uint64 seed = 0x5bd1e995;

int random() {
       0:	7179                	addi	sp,sp,-48
       2:	f422                	sd	s0,40(sp)
       4:	1800                	addi	s0,sp,48
    uint64 a = 16807;
       6:	6791                	lui	a5,0x4
       8:	1a778793          	addi	a5,a5,423 # 41a7 <__global_pointer$+0x28af>
       c:	fef43023          	sd	a5,-32(s0)
    uint64 m = 2147483647L;
      10:	800007b7          	lui	a5,0x80000
      14:	fff7c793          	not	a5,a5
      18:	fcf43c23          	sd	a5,-40(s0)
    seed = (a * seed) % m;
      1c:	00001797          	auipc	a5,0x1
      20:	0f478793          	addi	a5,a5,244 # 1110 <seed>
      24:	6398                	ld	a4,0(a5)
      26:	fe043783          	ld	a5,-32(s0)
      2a:	02f70733          	mul	a4,a4,a5
      2e:	fd843783          	ld	a5,-40(s0)
      32:	02f77733          	remu	a4,a4,a5
      36:	00001797          	auipc	a5,0x1
      3a:	0da78793          	addi	a5,a5,218 # 1110 <seed>
      3e:	e398                	sd	a4,0(a5)
    uint64 t = seed * 10;
      40:	00001797          	auipc	a5,0x1
      44:	0d078793          	addi	a5,a5,208 # 1110 <seed>
      48:	6398                	ld	a4,0(a5)
      4a:	87ba                	mv	a5,a4
      4c:	078a                	slli	a5,a5,0x2
      4e:	97ba                	add	a5,a5,a4
      50:	0786                	slli	a5,a5,0x1
      52:	fef43423          	sd	a5,-24(s0)
    while (t < m) {
      56:	a809                	j	68 <random+0x68>
        t *= 10;
      58:	fe843703          	ld	a4,-24(s0)
      5c:	87ba                	mv	a5,a4
      5e:	078a                	slli	a5,a5,0x2
      60:	97ba                	add	a5,a5,a4
      62:	0786                	slli	a5,a5,0x1
      64:	fef43423          	sd	a5,-24(s0)
    while (t < m) {
      68:	fe843703          	ld	a4,-24(s0)
      6c:	fd843783          	ld	a5,-40(s0)
      70:	fef764e3          	bltu	a4,a5,58 <random+0x58>
    }
    return t / m;
      74:	fe843703          	ld	a4,-24(s0)
      78:	fd843783          	ld	a5,-40(s0)
      7c:	02f757b3          	divu	a5,a4,a5
      80:	2781                	sext.w	a5,a5
}
      82:	853e                	mv	a0,a5
      84:	7422                	ld	s0,40(sp)
      86:	6145                	addi	sp,sp,48
      88:	8082                	ret

000000000000008a <do_work>:

int do_work(int length) {
      8a:	7179                	addi	sp,sp,-48
      8c:	f422                	sd	s0,40(sp)
      8e:	1800                	addi	s0,sp,48
      90:	87aa                	mv	a5,a0
      92:	fcf42e23          	sw	a5,-36(s0)
    int ret = 0;
      96:	fe042623          	sw	zero,-20(s0)
    for (int i = 0; i < length; i++) {
      9a:	fe042423          	sw	zero,-24(s0)
      9e:	a099                	j	e4 <do_work+0x5a>
        for (int j = 0; j < length; j++) {
      a0:	fe042223          	sw	zero,-28(s0)
      a4:	a01d                	j	ca <do_work+0x40>
            ret += (j % 2) ? +1 : -1;
      a6:	fe442783          	lw	a5,-28(s0)
      aa:	8b85                	andi	a5,a5,1
      ac:	2781                	sext.w	a5,a5
      ae:	c399                	beqz	a5,b4 <do_work+0x2a>
      b0:	4785                	li	a5,1
      b2:	a011                	j	b6 <do_work+0x2c>
      b4:	57fd                	li	a5,-1
      b6:	fec42703          	lw	a4,-20(s0)
      ba:	9fb9                	addw	a5,a5,a4
      bc:	fef42623          	sw	a5,-20(s0)
        for (int j = 0; j < length; j++) {
      c0:	fe442783          	lw	a5,-28(s0)
      c4:	2785                	addiw	a5,a5,1
      c6:	fef42223          	sw	a5,-28(s0)
      ca:	fe442703          	lw	a4,-28(s0)
      ce:	fdc42783          	lw	a5,-36(s0)
      d2:	2701                	sext.w	a4,a4
      d4:	2781                	sext.w	a5,a5
      d6:	fcf748e3          	blt	a4,a5,a6 <do_work+0x1c>
    for (int i = 0; i < length; i++) {
      da:	fe842783          	lw	a5,-24(s0)
      de:	2785                	addiw	a5,a5,1
      e0:	fef42423          	sw	a5,-24(s0)
      e4:	fe842703          	lw	a4,-24(s0)
      e8:	fdc42783          	lw	a5,-36(s0)
      ec:	2701                	sext.w	a4,a4
      ee:	2781                	sext.w	a5,a5
      f0:	faf748e3          	blt	a4,a5,a0 <do_work+0x16>
        }
    }
    return ret;
      f4:	fec42783          	lw	a5,-20(s0)
}
      f8:	853e                	mv	a0,a5
      fa:	7422                	ld	s0,40(sp)
      fc:	6145                	addi	sp,sp,48
      fe:	8082                	ret

0000000000000100 <p1>:

void p1(int id, int length) {
     100:	7179                	addi	sp,sp,-48
     102:	f406                	sd	ra,40(sp)
     104:	f022                	sd	s0,32(sp)
     106:	1800                	addi	s0,sp,48
     108:	87aa                	mv	a5,a0
     10a:	872e                	mv	a4,a1
     10c:	fcf42e23          	sw	a5,-36(s0)
     110:	87ba                	mv	a5,a4
     112:	fcf42c23          	sw	a5,-40(s0)
    for (int i = 0; i < length; i++) {
     116:	fe042623          	sw	zero,-20(s0)
     11a:	a081                	j	15a <p1+0x5a>
        sleep(1);
     11c:	4505                	li	a0,1
     11e:	00000097          	auipc	ra,0x0
     122:	7ba080e7          	jalr	1978(ra) # 8d8 <sleep>

        do_work(length);
     126:	fd842783          	lw	a5,-40(s0)
     12a:	853e                	mv	a0,a5
     12c:	00000097          	auipc	ra,0x0
     130:	f5e080e7          	jalr	-162(ra) # 8a <do_work>
        printf("P%d iteration=%d\n", id, i);
     134:	fec42703          	lw	a4,-20(s0)
     138:	fdc42783          	lw	a5,-36(s0)
     13c:	863a                	mv	a2,a4
     13e:	85be                	mv	a1,a5
     140:	00001517          	auipc	a0,0x1
     144:	f7050513          	addi	a0,a0,-144 # 10b0 <malloc+0x140>
     148:	00001097          	auipc	ra,0x1
     14c:	c36080e7          	jalr	-970(ra) # d7e <printf>
    for (int i = 0; i < length; i++) {
     150:	fec42783          	lw	a5,-20(s0)
     154:	2785                	addiw	a5,a5,1
     156:	fef42623          	sw	a5,-20(s0)
     15a:	fec42703          	lw	a4,-20(s0)
     15e:	fd842783          	lw	a5,-40(s0)
     162:	2701                	sext.w	a4,a4
     164:	2781                	sext.w	a5,a5
     166:	faf74be3          	blt	a4,a5,11c <p1+0x1c>
    }
    printf("P%d FINISHED!\n", id);
     16a:	fdc42783          	lw	a5,-36(s0)
     16e:	85be                	mv	a1,a5
     170:	00001517          	auipc	a0,0x1
     174:	f5850513          	addi	a0,a0,-168 # 10c8 <malloc+0x158>
     178:	00001097          	auipc	ra,0x1
     17c:	c06080e7          	jalr	-1018(ra) # d7e <printf>
}
     180:	0001                	nop
     182:	70a2                	ld	ra,40(sp)
     184:	7402                	ld	s0,32(sp)
     186:	6145                	addi	sp,sp,48
     188:	8082                	ret

000000000000018a <p2>:

void p2(int id, int length) {
     18a:	7179                	addi	sp,sp,-48
     18c:	f406                	sd	ra,40(sp)
     18e:	f022                	sd	s0,32(sp)
     190:	1800                	addi	s0,sp,48
     192:	87aa                	mv	a5,a0
     194:	872e                	mv	a4,a1
     196:	fcf42e23          	sw	a5,-36(s0)
     19a:	87ba                	mv	a5,a4
     19c:	fcf42c23          	sw	a5,-40(s0)
    for (int i = 0; i < length; i++) {
     1a0:	fe042623          	sw	zero,-20(s0)
     1a4:	a889                	j	1f6 <p2+0x6c>
        sleep(random());
     1a6:	00000097          	auipc	ra,0x0
     1aa:	e5a080e7          	jalr	-422(ra) # 0 <random>
     1ae:	87aa                	mv	a5,a0
     1b0:	853e                	mv	a0,a5
     1b2:	00000097          	auipc	ra,0x0
     1b6:	726080e7          	jalr	1830(ra) # 8d8 <sleep>

        do_work(length / 10);
     1ba:	fd842703          	lw	a4,-40(s0)
     1be:	47a9                	li	a5,10
     1c0:	02f747bb          	divw	a5,a4,a5
     1c4:	2781                	sext.w	a5,a5
     1c6:	853e                	mv	a0,a5
     1c8:	00000097          	auipc	ra,0x0
     1cc:	ec2080e7          	jalr	-318(ra) # 8a <do_work>
        printf("P%d iteration=%d\n", id, i);
     1d0:	fec42703          	lw	a4,-20(s0)
     1d4:	fdc42783          	lw	a5,-36(s0)
     1d8:	863a                	mv	a2,a4
     1da:	85be                	mv	a1,a5
     1dc:	00001517          	auipc	a0,0x1
     1e0:	ed450513          	addi	a0,a0,-300 # 10b0 <malloc+0x140>
     1e4:	00001097          	auipc	ra,0x1
     1e8:	b9a080e7          	jalr	-1126(ra) # d7e <printf>
    for (int i = 0; i < length; i++) {
     1ec:	fec42783          	lw	a5,-20(s0)
     1f0:	2785                	addiw	a5,a5,1
     1f2:	fef42623          	sw	a5,-20(s0)
     1f6:	fec42703          	lw	a4,-20(s0)
     1fa:	fd842783          	lw	a5,-40(s0)
     1fe:	2701                	sext.w	a4,a4
     200:	2781                	sext.w	a5,a5
     202:	faf742e3          	blt	a4,a5,1a6 <p2+0x1c>
    }
    printf("P%d FINISHED!\n", id);
     206:	fdc42783          	lw	a5,-36(s0)
     20a:	85be                	mv	a1,a5
     20c:	00001517          	auipc	a0,0x1
     210:	ebc50513          	addi	a0,a0,-324 # 10c8 <malloc+0x158>
     214:	00001097          	auipc	ra,0x1
     218:	b6a080e7          	jalr	-1174(ra) # d7e <printf>
}
     21c:	0001                	nop
     21e:	70a2                	ld	ra,40(sp)
     220:	7402                	ld	s0,32(sp)
     222:	6145                	addi	sp,sp,48
     224:	8082                	ret

0000000000000226 <main>:

int
main(int argc, char *argv[])
{
     226:	7139                	addi	sp,sp,-64
     228:	fc06                	sd	ra,56(sp)
     22a:	f822                	sd	s0,48(sp)
     22c:	0080                	addi	s0,sp,64
     22e:	87aa                	mv	a5,a0
     230:	fcb43023          	sd	a1,-64(s0)
     234:	fcf42623          	sw	a5,-52(s0)
    int proc_num = 8;
     238:	47a1                	li	a5,8
     23a:	fef42623          	sw	a5,-20(s0)
    int length = 100;
     23e:	06400793          	li	a5,100
     242:	fef42423          	sw	a5,-24(s0)

    for (int i = 1; i < argc; i++) {
     246:	4785                	li	a5,1
     248:	fef42223          	sw	a5,-28(s0)
     24c:	a0ad                	j	2b6 <main+0x90>
        switch (i) {
     24e:	fe442783          	lw	a5,-28(s0)
     252:	0007871b          	sext.w	a4,a5
     256:	4785                	li	a5,1
     258:	00f70a63          	beq	a4,a5,26c <main+0x46>
     25c:	fe442783          	lw	a5,-28(s0)
     260:	0007871b          	sext.w	a4,a5
     264:	4789                	li	a5,2
     266:	02f70363          	beq	a4,a5,28c <main+0x66>
                break;
            case 2:
                length = atoi(argv[i]);
                break;
            default:
                break;
     26a:	a089                	j	2ac <main+0x86>
                proc_num = atoi(argv[i]);
     26c:	fe442783          	lw	a5,-28(s0)
     270:	078e                	slli	a5,a5,0x3
     272:	fc043703          	ld	a4,-64(s0)
     276:	97ba                	add	a5,a5,a4
     278:	639c                	ld	a5,0(a5)
     27a:	853e                	mv	a0,a5
     27c:	00000097          	auipc	ra,0x0
     280:	3d4080e7          	jalr	980(ra) # 650 <atoi>
     284:	87aa                	mv	a5,a0
     286:	fef42623          	sw	a5,-20(s0)
                break;
     28a:	a00d                	j	2ac <main+0x86>
                length = atoi(argv[i]);
     28c:	fe442783          	lw	a5,-28(s0)
     290:	078e                	slli	a5,a5,0x3
     292:	fc043703          	ld	a4,-64(s0)
     296:	97ba                	add	a5,a5,a4
     298:	639c                	ld	a5,0(a5)
     29a:	853e                	mv	a0,a5
     29c:	00000097          	auipc	ra,0x0
     2a0:	3b4080e7          	jalr	948(ra) # 650 <atoi>
     2a4:	87aa                	mv	a5,a0
     2a6:	fef42423          	sw	a5,-24(s0)
                break;
     2aa:	0001                	nop
    for (int i = 1; i < argc; i++) {
     2ac:	fe442783          	lw	a5,-28(s0)
     2b0:	2785                	addiw	a5,a5,1
     2b2:	fef42223          	sw	a5,-28(s0)
     2b6:	fe442703          	lw	a4,-28(s0)
     2ba:	fcc42783          	lw	a5,-52(s0)
     2be:	2701                	sext.w	a4,a4
     2c0:	2781                	sext.w	a5,a5
     2c2:	f8f746e3          	blt	a4,a5,24e <main+0x28>
        }
    }

    printf("proc_num=%d length=%d\n", proc_num, length);
     2c6:	fe842703          	lw	a4,-24(s0)
     2ca:	fec42783          	lw	a5,-20(s0)
     2ce:	863a                	mv	a2,a4
     2d0:	85be                	mv	a1,a5
     2d2:	00001517          	auipc	a0,0x1
     2d6:	e0650513          	addi	a0,a0,-506 # 10d8 <malloc+0x168>
     2da:	00001097          	auipc	ra,0x1
     2de:	aa4080e7          	jalr	-1372(ra) # d7e <printf>

    for (int i = 0; i < proc_num; i++) {
     2e2:	fe042023          	sw	zero,-32(s0)
     2e6:	a069                	j	370 <main+0x14a>
        int pid = fork();
     2e8:	00000097          	auipc	ra,0x0
     2ec:	558080e7          	jalr	1368(ra) # 840 <fork>
     2f0:	87aa                	mv	a5,a0
     2f2:	fcf42c23          	sw	a5,-40(s0)
        if(pid < 0)
     2f6:	fd842783          	lw	a5,-40(s0)
     2fa:	2781                	sext.w	a5,a5
     2fc:	0807c363          	bltz	a5,382 <main+0x15c>
            break;
        if(pid == 0) {
     300:	fd842783          	lw	a5,-40(s0)
     304:	2781                	sext.w	a5,a5
     306:	e3a5                	bnez	a5,366 <main+0x140>
            if (i < proc_num / 3) {
     308:	fec42703          	lw	a4,-20(s0)
     30c:	478d                	li	a5,3
     30e:	02f747bb          	divw	a5,a4,a5
     312:	0007871b          	sext.w	a4,a5
     316:	fe042783          	lw	a5,-32(s0)
     31a:	2781                	sext.w	a5,a5
     31c:	00e7dd63          	bge	a5,a4,336 <main+0x110>
                p1(i, length);
     320:	fe842703          	lw	a4,-24(s0)
     324:	fe042783          	lw	a5,-32(s0)
     328:	85ba                	mv	a1,a4
     32a:	853e                	mv	a0,a5
     32c:	00000097          	auipc	ra,0x0
     330:	dd4080e7          	jalr	-556(ra) # 100 <p1>
     334:	a025                	j	35c <main+0x136>
            } else {
                p2(i, length / 4);
     336:	fe842783          	lw	a5,-24(s0)
     33a:	41f7d71b          	sraiw	a4,a5,0x1f
     33e:	01e7571b          	srliw	a4,a4,0x1e
     342:	9fb9                	addw	a5,a5,a4
     344:	4027d79b          	sraiw	a5,a5,0x2
     348:	0007871b          	sext.w	a4,a5
     34c:	fe042783          	lw	a5,-32(s0)
     350:	85ba                	mv	a1,a4
     352:	853e                	mv	a0,a5
     354:	00000097          	auipc	ra,0x0
     358:	e36080e7          	jalr	-458(ra) # 18a <p2>
            }
            exit(0);
     35c:	4501                	li	a0,0
     35e:	00000097          	auipc	ra,0x0
     362:	4ea080e7          	jalr	1258(ra) # 848 <exit>
    for (int i = 0; i < proc_num; i++) {
     366:	fe042783          	lw	a5,-32(s0)
     36a:	2785                	addiw	a5,a5,1
     36c:	fef42023          	sw	a5,-32(s0)
     370:	fe042703          	lw	a4,-32(s0)
     374:	fec42783          	lw	a5,-20(s0)
     378:	2701                	sext.w	a4,a4
     37a:	2781                	sext.w	a5,a5
     37c:	f6f746e3          	blt	a4,a5,2e8 <main+0xc2>
     380:	a011                	j	384 <main+0x15e>
            break;
     382:	0001                	nop
        }
    }

    for (int i = 0; i < proc_num; i++) {
     384:	fc042e23          	sw	zero,-36(s0)
     388:	a819                	j	39e <main+0x178>
        wait(0);
     38a:	4501                	li	a0,0
     38c:	00000097          	auipc	ra,0x0
     390:	4c4080e7          	jalr	1220(ra) # 850 <wait>
    for (int i = 0; i < proc_num; i++) {
     394:	fdc42783          	lw	a5,-36(s0)
     398:	2785                	addiw	a5,a5,1
     39a:	fcf42e23          	sw	a5,-36(s0)
     39e:	fdc42703          	lw	a4,-36(s0)
     3a2:	fec42783          	lw	a5,-20(s0)
     3a6:	2701                	sext.w	a4,a4
     3a8:	2781                	sext.w	a5,a5
     3aa:	fef740e3          	blt	a4,a5,38a <main+0x164>
    }

    exit(0);
     3ae:	4501                	li	a0,0
     3b0:	00000097          	auipc	ra,0x0
     3b4:	498080e7          	jalr	1176(ra) # 848 <exit>

00000000000003b8 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     3b8:	7179                	addi	sp,sp,-48
     3ba:	f422                	sd	s0,40(sp)
     3bc:	1800                	addi	s0,sp,48
     3be:	fca43c23          	sd	a0,-40(s0)
     3c2:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     3c6:	fd843783          	ld	a5,-40(s0)
     3ca:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     3ce:	0001                	nop
     3d0:	fd043703          	ld	a4,-48(s0)
     3d4:	00170793          	addi	a5,a4,1
     3d8:	fcf43823          	sd	a5,-48(s0)
     3dc:	fd843783          	ld	a5,-40(s0)
     3e0:	00178693          	addi	a3,a5,1
     3e4:	fcd43c23          	sd	a3,-40(s0)
     3e8:	00074703          	lbu	a4,0(a4)
     3ec:	00e78023          	sb	a4,0(a5)
     3f0:	0007c783          	lbu	a5,0(a5)
     3f4:	fff1                	bnez	a5,3d0 <strcpy+0x18>
    ;
  return os;
     3f6:	fe843783          	ld	a5,-24(s0)
}
     3fa:	853e                	mv	a0,a5
     3fc:	7422                	ld	s0,40(sp)
     3fe:	6145                	addi	sp,sp,48
     400:	8082                	ret

0000000000000402 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     402:	1101                	addi	sp,sp,-32
     404:	ec22                	sd	s0,24(sp)
     406:	1000                	addi	s0,sp,32
     408:	fea43423          	sd	a0,-24(s0)
     40c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     410:	a819                	j	426 <strcmp+0x24>
    p++, q++;
     412:	fe843783          	ld	a5,-24(s0)
     416:	0785                	addi	a5,a5,1
     418:	fef43423          	sd	a5,-24(s0)
     41c:	fe043783          	ld	a5,-32(s0)
     420:	0785                	addi	a5,a5,1
     422:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     426:	fe843783          	ld	a5,-24(s0)
     42a:	0007c783          	lbu	a5,0(a5)
     42e:	cb99                	beqz	a5,444 <strcmp+0x42>
     430:	fe843783          	ld	a5,-24(s0)
     434:	0007c703          	lbu	a4,0(a5)
     438:	fe043783          	ld	a5,-32(s0)
     43c:	0007c783          	lbu	a5,0(a5)
     440:	fcf709e3          	beq	a4,a5,412 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     444:	fe843783          	ld	a5,-24(s0)
     448:	0007c783          	lbu	a5,0(a5)
     44c:	0007871b          	sext.w	a4,a5
     450:	fe043783          	ld	a5,-32(s0)
     454:	0007c783          	lbu	a5,0(a5)
     458:	2781                	sext.w	a5,a5
     45a:	40f707bb          	subw	a5,a4,a5
     45e:	2781                	sext.w	a5,a5
}
     460:	853e                	mv	a0,a5
     462:	6462                	ld	s0,24(sp)
     464:	6105                	addi	sp,sp,32
     466:	8082                	ret

0000000000000468 <strlen>:

uint
strlen(const char *s)
{
     468:	7179                	addi	sp,sp,-48
     46a:	f422                	sd	s0,40(sp)
     46c:	1800                	addi	s0,sp,48
     46e:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     472:	fe042623          	sw	zero,-20(s0)
     476:	a031                	j	482 <strlen+0x1a>
     478:	fec42783          	lw	a5,-20(s0)
     47c:	2785                	addiw	a5,a5,1
     47e:	fef42623          	sw	a5,-20(s0)
     482:	fec42783          	lw	a5,-20(s0)
     486:	fd843703          	ld	a4,-40(s0)
     48a:	97ba                	add	a5,a5,a4
     48c:	0007c783          	lbu	a5,0(a5)
     490:	f7e5                	bnez	a5,478 <strlen+0x10>
    ;
  return n;
     492:	fec42783          	lw	a5,-20(s0)
}
     496:	853e                	mv	a0,a5
     498:	7422                	ld	s0,40(sp)
     49a:	6145                	addi	sp,sp,48
     49c:	8082                	ret

000000000000049e <memset>:

void*
memset(void *dst, int c, uint n)
{
     49e:	7179                	addi	sp,sp,-48
     4a0:	f422                	sd	s0,40(sp)
     4a2:	1800                	addi	s0,sp,48
     4a4:	fca43c23          	sd	a0,-40(s0)
     4a8:	87ae                	mv	a5,a1
     4aa:	8732                	mv	a4,a2
     4ac:	fcf42a23          	sw	a5,-44(s0)
     4b0:	87ba                	mv	a5,a4
     4b2:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     4b6:	fd843783          	ld	a5,-40(s0)
     4ba:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     4be:	fe042623          	sw	zero,-20(s0)
     4c2:	a00d                	j	4e4 <memset+0x46>
    cdst[i] = c;
     4c4:	fec42783          	lw	a5,-20(s0)
     4c8:	fe043703          	ld	a4,-32(s0)
     4cc:	97ba                	add	a5,a5,a4
     4ce:	fd442703          	lw	a4,-44(s0)
     4d2:	0ff77713          	andi	a4,a4,255
     4d6:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     4da:	fec42783          	lw	a5,-20(s0)
     4de:	2785                	addiw	a5,a5,1
     4e0:	fef42623          	sw	a5,-20(s0)
     4e4:	fec42703          	lw	a4,-20(s0)
     4e8:	fd042783          	lw	a5,-48(s0)
     4ec:	2781                	sext.w	a5,a5
     4ee:	fcf76be3          	bltu	a4,a5,4c4 <memset+0x26>
  }
  return dst;
     4f2:	fd843783          	ld	a5,-40(s0)
}
     4f6:	853e                	mv	a0,a5
     4f8:	7422                	ld	s0,40(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <strchr>:

char*
strchr(const char *s, char c)
{
     4fe:	1101                	addi	sp,sp,-32
     500:	ec22                	sd	s0,24(sp)
     502:	1000                	addi	s0,sp,32
     504:	fea43423          	sd	a0,-24(s0)
     508:	87ae                	mv	a5,a1
     50a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     50e:	a01d                	j	534 <strchr+0x36>
    if(*s == c)
     510:	fe843783          	ld	a5,-24(s0)
     514:	0007c703          	lbu	a4,0(a5)
     518:	fe744783          	lbu	a5,-25(s0)
     51c:	0ff7f793          	andi	a5,a5,255
     520:	00e79563          	bne	a5,a4,52a <strchr+0x2c>
      return (char*)s;
     524:	fe843783          	ld	a5,-24(s0)
     528:	a821                	j	540 <strchr+0x42>
  for(; *s; s++)
     52a:	fe843783          	ld	a5,-24(s0)
     52e:	0785                	addi	a5,a5,1
     530:	fef43423          	sd	a5,-24(s0)
     534:	fe843783          	ld	a5,-24(s0)
     538:	0007c783          	lbu	a5,0(a5)
     53c:	fbf1                	bnez	a5,510 <strchr+0x12>
  return 0;
     53e:	4781                	li	a5,0
}
     540:	853e                	mv	a0,a5
     542:	6462                	ld	s0,24(sp)
     544:	6105                	addi	sp,sp,32
     546:	8082                	ret

0000000000000548 <gets>:

char*
gets(char *buf, int max)
{
     548:	7179                	addi	sp,sp,-48
     54a:	f406                	sd	ra,40(sp)
     54c:	f022                	sd	s0,32(sp)
     54e:	1800                	addi	s0,sp,48
     550:	fca43c23          	sd	a0,-40(s0)
     554:	87ae                	mv	a5,a1
     556:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     55a:	fe042623          	sw	zero,-20(s0)
     55e:	a8a1                	j	5b6 <gets+0x6e>
    cc = read(0, &c, 1);
     560:	fe740793          	addi	a5,s0,-25
     564:	4605                	li	a2,1
     566:	85be                	mv	a1,a5
     568:	4501                	li	a0,0
     56a:	00000097          	auipc	ra,0x0
     56e:	2f6080e7          	jalr	758(ra) # 860 <read>
     572:	87aa                	mv	a5,a0
     574:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     578:	fe842783          	lw	a5,-24(s0)
     57c:	2781                	sext.w	a5,a5
     57e:	04f05763          	blez	a5,5cc <gets+0x84>
      break;
    buf[i++] = c;
     582:	fec42783          	lw	a5,-20(s0)
     586:	0017871b          	addiw	a4,a5,1
     58a:	fee42623          	sw	a4,-20(s0)
     58e:	873e                	mv	a4,a5
     590:	fd843783          	ld	a5,-40(s0)
     594:	97ba                	add	a5,a5,a4
     596:	fe744703          	lbu	a4,-25(s0)
     59a:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     59e:	fe744783          	lbu	a5,-25(s0)
     5a2:	873e                	mv	a4,a5
     5a4:	47a9                	li	a5,10
     5a6:	02f70463          	beq	a4,a5,5ce <gets+0x86>
     5aa:	fe744783          	lbu	a5,-25(s0)
     5ae:	873e                	mv	a4,a5
     5b0:	47b5                	li	a5,13
     5b2:	00f70e63          	beq	a4,a5,5ce <gets+0x86>
  for(i=0; i+1 < max; ){
     5b6:	fec42783          	lw	a5,-20(s0)
     5ba:	2785                	addiw	a5,a5,1
     5bc:	0007871b          	sext.w	a4,a5
     5c0:	fd442783          	lw	a5,-44(s0)
     5c4:	2781                	sext.w	a5,a5
     5c6:	f8f74de3          	blt	a4,a5,560 <gets+0x18>
     5ca:	a011                	j	5ce <gets+0x86>
      break;
     5cc:	0001                	nop
      break;
  }
  buf[i] = '\0';
     5ce:	fec42783          	lw	a5,-20(s0)
     5d2:	fd843703          	ld	a4,-40(s0)
     5d6:	97ba                	add	a5,a5,a4
     5d8:	00078023          	sb	zero,0(a5)
  return buf;
     5dc:	fd843783          	ld	a5,-40(s0)
}
     5e0:	853e                	mv	a0,a5
     5e2:	70a2                	ld	ra,40(sp)
     5e4:	7402                	ld	s0,32(sp)
     5e6:	6145                	addi	sp,sp,48
     5e8:	8082                	ret

00000000000005ea <stat>:

int
stat(const char *n, struct stat *st)
{
     5ea:	7179                	addi	sp,sp,-48
     5ec:	f406                	sd	ra,40(sp)
     5ee:	f022                	sd	s0,32(sp)
     5f0:	1800                	addi	s0,sp,48
     5f2:	fca43c23          	sd	a0,-40(s0)
     5f6:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     5fa:	4581                	li	a1,0
     5fc:	fd843503          	ld	a0,-40(s0)
     600:	00000097          	auipc	ra,0x0
     604:	288080e7          	jalr	648(ra) # 888 <open>
     608:	87aa                	mv	a5,a0
     60a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     60e:	fec42783          	lw	a5,-20(s0)
     612:	2781                	sext.w	a5,a5
     614:	0007d463          	bgez	a5,61c <stat+0x32>
    return -1;
     618:	57fd                	li	a5,-1
     61a:	a035                	j	646 <stat+0x5c>
  r = fstat(fd, st);
     61c:	fec42783          	lw	a5,-20(s0)
     620:	fd043583          	ld	a1,-48(s0)
     624:	853e                	mv	a0,a5
     626:	00000097          	auipc	ra,0x0
     62a:	27a080e7          	jalr	634(ra) # 8a0 <fstat>
     62e:	87aa                	mv	a5,a0
     630:	fef42423          	sw	a5,-24(s0)
  close(fd);
     634:	fec42783          	lw	a5,-20(s0)
     638:	853e                	mv	a0,a5
     63a:	00000097          	auipc	ra,0x0
     63e:	236080e7          	jalr	566(ra) # 870 <close>
  return r;
     642:	fe842783          	lw	a5,-24(s0)
}
     646:	853e                	mv	a0,a5
     648:	70a2                	ld	ra,40(sp)
     64a:	7402                	ld	s0,32(sp)
     64c:	6145                	addi	sp,sp,48
     64e:	8082                	ret

0000000000000650 <atoi>:

int
atoi(const char *s)
{
     650:	7179                	addi	sp,sp,-48
     652:	f422                	sd	s0,40(sp)
     654:	1800                	addi	s0,sp,48
     656:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     65a:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     65e:	a815                	j	692 <atoi+0x42>
    n = n*10 + *s++ - '0';
     660:	fec42703          	lw	a4,-20(s0)
     664:	87ba                	mv	a5,a4
     666:	0027979b          	slliw	a5,a5,0x2
     66a:	9fb9                	addw	a5,a5,a4
     66c:	0017979b          	slliw	a5,a5,0x1
     670:	0007871b          	sext.w	a4,a5
     674:	fd843783          	ld	a5,-40(s0)
     678:	00178693          	addi	a3,a5,1
     67c:	fcd43c23          	sd	a3,-40(s0)
     680:	0007c783          	lbu	a5,0(a5)
     684:	2781                	sext.w	a5,a5
     686:	9fb9                	addw	a5,a5,a4
     688:	2781                	sext.w	a5,a5
     68a:	fd07879b          	addiw	a5,a5,-48
     68e:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     692:	fd843783          	ld	a5,-40(s0)
     696:	0007c783          	lbu	a5,0(a5)
     69a:	873e                	mv	a4,a5
     69c:	02f00793          	li	a5,47
     6a0:	00e7fb63          	bgeu	a5,a4,6b6 <atoi+0x66>
     6a4:	fd843783          	ld	a5,-40(s0)
     6a8:	0007c783          	lbu	a5,0(a5)
     6ac:	873e                	mv	a4,a5
     6ae:	03900793          	li	a5,57
     6b2:	fae7f7e3          	bgeu	a5,a4,660 <atoi+0x10>
  return n;
     6b6:	fec42783          	lw	a5,-20(s0)
}
     6ba:	853e                	mv	a0,a5
     6bc:	7422                	ld	s0,40(sp)
     6be:	6145                	addi	sp,sp,48
     6c0:	8082                	ret

00000000000006c2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     6c2:	7139                	addi	sp,sp,-64
     6c4:	fc22                	sd	s0,56(sp)
     6c6:	0080                	addi	s0,sp,64
     6c8:	fca43c23          	sd	a0,-40(s0)
     6cc:	fcb43823          	sd	a1,-48(s0)
     6d0:	87b2                	mv	a5,a2
     6d2:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     6d6:	fd843783          	ld	a5,-40(s0)
     6da:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     6de:	fd043783          	ld	a5,-48(s0)
     6e2:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     6e6:	fe043703          	ld	a4,-32(s0)
     6ea:	fe843783          	ld	a5,-24(s0)
     6ee:	02e7fc63          	bgeu	a5,a4,726 <memmove+0x64>
    while(n-- > 0)
     6f2:	a00d                	j	714 <memmove+0x52>
      *dst++ = *src++;
     6f4:	fe043703          	ld	a4,-32(s0)
     6f8:	00170793          	addi	a5,a4,1
     6fc:	fef43023          	sd	a5,-32(s0)
     700:	fe843783          	ld	a5,-24(s0)
     704:	00178693          	addi	a3,a5,1
     708:	fed43423          	sd	a3,-24(s0)
     70c:	00074703          	lbu	a4,0(a4)
     710:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     714:	fcc42783          	lw	a5,-52(s0)
     718:	fff7871b          	addiw	a4,a5,-1
     71c:	fce42623          	sw	a4,-52(s0)
     720:	fcf04ae3          	bgtz	a5,6f4 <memmove+0x32>
     724:	a891                	j	778 <memmove+0xb6>
  } else {
    dst += n;
     726:	fcc42783          	lw	a5,-52(s0)
     72a:	fe843703          	ld	a4,-24(s0)
     72e:	97ba                	add	a5,a5,a4
     730:	fef43423          	sd	a5,-24(s0)
    src += n;
     734:	fcc42783          	lw	a5,-52(s0)
     738:	fe043703          	ld	a4,-32(s0)
     73c:	97ba                	add	a5,a5,a4
     73e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     742:	a01d                	j	768 <memmove+0xa6>
      *--dst = *--src;
     744:	fe043783          	ld	a5,-32(s0)
     748:	17fd                	addi	a5,a5,-1
     74a:	fef43023          	sd	a5,-32(s0)
     74e:	fe843783          	ld	a5,-24(s0)
     752:	17fd                	addi	a5,a5,-1
     754:	fef43423          	sd	a5,-24(s0)
     758:	fe043783          	ld	a5,-32(s0)
     75c:	0007c703          	lbu	a4,0(a5)
     760:	fe843783          	ld	a5,-24(s0)
     764:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     768:	fcc42783          	lw	a5,-52(s0)
     76c:	fff7871b          	addiw	a4,a5,-1
     770:	fce42623          	sw	a4,-52(s0)
     774:	fcf048e3          	bgtz	a5,744 <memmove+0x82>
  }
  return vdst;
     778:	fd843783          	ld	a5,-40(s0)
}
     77c:	853e                	mv	a0,a5
     77e:	7462                	ld	s0,56(sp)
     780:	6121                	addi	sp,sp,64
     782:	8082                	ret

0000000000000784 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     784:	7139                	addi	sp,sp,-64
     786:	fc22                	sd	s0,56(sp)
     788:	0080                	addi	s0,sp,64
     78a:	fca43c23          	sd	a0,-40(s0)
     78e:	fcb43823          	sd	a1,-48(s0)
     792:	87b2                	mv	a5,a2
     794:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     798:	fd843783          	ld	a5,-40(s0)
     79c:	fef43423          	sd	a5,-24(s0)
     7a0:	fd043783          	ld	a5,-48(s0)
     7a4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7a8:	a0a1                	j	7f0 <memcmp+0x6c>
    if (*p1 != *p2) {
     7aa:	fe843783          	ld	a5,-24(s0)
     7ae:	0007c703          	lbu	a4,0(a5)
     7b2:	fe043783          	ld	a5,-32(s0)
     7b6:	0007c783          	lbu	a5,0(a5)
     7ba:	02f70163          	beq	a4,a5,7dc <memcmp+0x58>
      return *p1 - *p2;
     7be:	fe843783          	ld	a5,-24(s0)
     7c2:	0007c783          	lbu	a5,0(a5)
     7c6:	0007871b          	sext.w	a4,a5
     7ca:	fe043783          	ld	a5,-32(s0)
     7ce:	0007c783          	lbu	a5,0(a5)
     7d2:	2781                	sext.w	a5,a5
     7d4:	40f707bb          	subw	a5,a4,a5
     7d8:	2781                	sext.w	a5,a5
     7da:	a01d                	j	800 <memcmp+0x7c>
    }
    p1++;
     7dc:	fe843783          	ld	a5,-24(s0)
     7e0:	0785                	addi	a5,a5,1
     7e2:	fef43423          	sd	a5,-24(s0)
    p2++;
     7e6:	fe043783          	ld	a5,-32(s0)
     7ea:	0785                	addi	a5,a5,1
     7ec:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7f0:	fcc42783          	lw	a5,-52(s0)
     7f4:	fff7871b          	addiw	a4,a5,-1
     7f8:	fce42623          	sw	a4,-52(s0)
     7fc:	f7dd                	bnez	a5,7aa <memcmp+0x26>
  }
  return 0;
     7fe:	4781                	li	a5,0
}
     800:	853e                	mv	a0,a5
     802:	7462                	ld	s0,56(sp)
     804:	6121                	addi	sp,sp,64
     806:	8082                	ret

0000000000000808 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     808:	7179                	addi	sp,sp,-48
     80a:	f406                	sd	ra,40(sp)
     80c:	f022                	sd	s0,32(sp)
     80e:	1800                	addi	s0,sp,48
     810:	fea43423          	sd	a0,-24(s0)
     814:	feb43023          	sd	a1,-32(s0)
     818:	87b2                	mv	a5,a2
     81a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     81e:	fdc42783          	lw	a5,-36(s0)
     822:	863e                	mv	a2,a5
     824:	fe043583          	ld	a1,-32(s0)
     828:	fe843503          	ld	a0,-24(s0)
     82c:	00000097          	auipc	ra,0x0
     830:	e96080e7          	jalr	-362(ra) # 6c2 <memmove>
     834:	87aa                	mv	a5,a0
}
     836:	853e                	mv	a0,a5
     838:	70a2                	ld	ra,40(sp)
     83a:	7402                	ld	s0,32(sp)
     83c:	6145                	addi	sp,sp,48
     83e:	8082                	ret

0000000000000840 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     840:	4885                	li	a7,1
 ecall
     842:	00000073          	ecall
 ret
     846:	8082                	ret

0000000000000848 <exit>:
.global exit
exit:
 li a7, SYS_exit
     848:	4889                	li	a7,2
 ecall
     84a:	00000073          	ecall
 ret
     84e:	8082                	ret

0000000000000850 <wait>:
.global wait
wait:
 li a7, SYS_wait
     850:	488d                	li	a7,3
 ecall
     852:	00000073          	ecall
 ret
     856:	8082                	ret

0000000000000858 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     858:	4891                	li	a7,4
 ecall
     85a:	00000073          	ecall
 ret
     85e:	8082                	ret

0000000000000860 <read>:
.global read
read:
 li a7, SYS_read
     860:	4895                	li	a7,5
 ecall
     862:	00000073          	ecall
 ret
     866:	8082                	ret

0000000000000868 <write>:
.global write
write:
 li a7, SYS_write
     868:	48c1                	li	a7,16
 ecall
     86a:	00000073          	ecall
 ret
     86e:	8082                	ret

0000000000000870 <close>:
.global close
close:
 li a7, SYS_close
     870:	48d5                	li	a7,21
 ecall
     872:	00000073          	ecall
 ret
     876:	8082                	ret

0000000000000878 <kill>:
.global kill
kill:
 li a7, SYS_kill
     878:	4899                	li	a7,6
 ecall
     87a:	00000073          	ecall
 ret
     87e:	8082                	ret

0000000000000880 <exec>:
.global exec
exec:
 li a7, SYS_exec
     880:	489d                	li	a7,7
 ecall
     882:	00000073          	ecall
 ret
     886:	8082                	ret

0000000000000888 <open>:
.global open
open:
 li a7, SYS_open
     888:	48bd                	li	a7,15
 ecall
     88a:	00000073          	ecall
 ret
     88e:	8082                	ret

0000000000000890 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     890:	48c5                	li	a7,17
 ecall
     892:	00000073          	ecall
 ret
     896:	8082                	ret

0000000000000898 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     898:	48c9                	li	a7,18
 ecall
     89a:	00000073          	ecall
 ret
     89e:	8082                	ret

00000000000008a0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     8a0:	48a1                	li	a7,8
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <link>:
.global link
link:
 li a7, SYS_link
     8a8:	48cd                	li	a7,19
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     8b0:	48d1                	li	a7,20
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     8b8:	48a5                	li	a7,9
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <dup>:
.global dup
dup:
 li a7, SYS_dup
     8c0:	48a9                	li	a7,10
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     8c8:	48ad                	li	a7,11
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     8d0:	48b1                	li	a7,12
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     8d8:	48b5                	li	a7,13
 ecall
     8da:	00000073          	ecall
 ret
     8de:	8082                	ret

00000000000008e0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     8e0:	48b9                	li	a7,14
 ecall
     8e2:	00000073          	ecall
 ret
     8e6:	8082                	ret

00000000000008e8 <changeSchedulingAlgorithm>:
.global changeSchedulingAlgorithm
changeSchedulingAlgorithm:
 li a7, SYS_changeSchedulingAlgorithm
     8e8:	48d9                	li	a7,22
 ecall
     8ea:	00000073          	ecall
 ret
     8ee:	8082                	ret

00000000000008f0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     8f0:	1101                	addi	sp,sp,-32
     8f2:	ec06                	sd	ra,24(sp)
     8f4:	e822                	sd	s0,16(sp)
     8f6:	1000                	addi	s0,sp,32
     8f8:	87aa                	mv	a5,a0
     8fa:	872e                	mv	a4,a1
     8fc:	fef42623          	sw	a5,-20(s0)
     900:	87ba                	mv	a5,a4
     902:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     906:	feb40713          	addi	a4,s0,-21
     90a:	fec42783          	lw	a5,-20(s0)
     90e:	4605                	li	a2,1
     910:	85ba                	mv	a1,a4
     912:	853e                	mv	a0,a5
     914:	00000097          	auipc	ra,0x0
     918:	f54080e7          	jalr	-172(ra) # 868 <write>
}
     91c:	0001                	nop
     91e:	60e2                	ld	ra,24(sp)
     920:	6442                	ld	s0,16(sp)
     922:	6105                	addi	sp,sp,32
     924:	8082                	ret

0000000000000926 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     926:	7139                	addi	sp,sp,-64
     928:	fc06                	sd	ra,56(sp)
     92a:	f822                	sd	s0,48(sp)
     92c:	0080                	addi	s0,sp,64
     92e:	87aa                	mv	a5,a0
     930:	8736                	mv	a4,a3
     932:	fcf42623          	sw	a5,-52(s0)
     936:	87ae                	mv	a5,a1
     938:	fcf42423          	sw	a5,-56(s0)
     93c:	87b2                	mv	a5,a2
     93e:	fcf42223          	sw	a5,-60(s0)
     942:	87ba                	mv	a5,a4
     944:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     948:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     94c:	fc042783          	lw	a5,-64(s0)
     950:	2781                	sext.w	a5,a5
     952:	c38d                	beqz	a5,974 <printint+0x4e>
     954:	fc842783          	lw	a5,-56(s0)
     958:	2781                	sext.w	a5,a5
     95a:	0007dd63          	bgez	a5,974 <printint+0x4e>
    neg = 1;
     95e:	4785                	li	a5,1
     960:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     964:	fc842783          	lw	a5,-56(s0)
     968:	40f007bb          	negw	a5,a5
     96c:	2781                	sext.w	a5,a5
     96e:	fef42223          	sw	a5,-28(s0)
     972:	a029                	j	97c <printint+0x56>
  } else {
    x = xx;
     974:	fc842783          	lw	a5,-56(s0)
     978:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     97c:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     980:	fc442783          	lw	a5,-60(s0)
     984:	fe442703          	lw	a4,-28(s0)
     988:	02f777bb          	remuw	a5,a4,a5
     98c:	0007861b          	sext.w	a2,a5
     990:	fec42783          	lw	a5,-20(s0)
     994:	0017871b          	addiw	a4,a5,1
     998:	fee42623          	sw	a4,-20(s0)
     99c:	00000697          	auipc	a3,0x0
     9a0:	75c68693          	addi	a3,a3,1884 # 10f8 <digits>
     9a4:	02061713          	slli	a4,a2,0x20
     9a8:	9301                	srli	a4,a4,0x20
     9aa:	9736                	add	a4,a4,a3
     9ac:	00074703          	lbu	a4,0(a4)
     9b0:	ff040693          	addi	a3,s0,-16
     9b4:	97b6                	add	a5,a5,a3
     9b6:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     9ba:	fc442783          	lw	a5,-60(s0)
     9be:	fe442703          	lw	a4,-28(s0)
     9c2:	02f757bb          	divuw	a5,a4,a5
     9c6:	fef42223          	sw	a5,-28(s0)
     9ca:	fe442783          	lw	a5,-28(s0)
     9ce:	2781                	sext.w	a5,a5
     9d0:	fbc5                	bnez	a5,980 <printint+0x5a>
  if(neg)
     9d2:	fe842783          	lw	a5,-24(s0)
     9d6:	2781                	sext.w	a5,a5
     9d8:	cf95                	beqz	a5,a14 <printint+0xee>
    buf[i++] = '-';
     9da:	fec42783          	lw	a5,-20(s0)
     9de:	0017871b          	addiw	a4,a5,1
     9e2:	fee42623          	sw	a4,-20(s0)
     9e6:	ff040713          	addi	a4,s0,-16
     9ea:	97ba                	add	a5,a5,a4
     9ec:	02d00713          	li	a4,45
     9f0:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     9f4:	a005                	j	a14 <printint+0xee>
    putc(fd, buf[i]);
     9f6:	fec42783          	lw	a5,-20(s0)
     9fa:	ff040713          	addi	a4,s0,-16
     9fe:	97ba                	add	a5,a5,a4
     a00:	fe07c703          	lbu	a4,-32(a5)
     a04:	fcc42783          	lw	a5,-52(s0)
     a08:	85ba                	mv	a1,a4
     a0a:	853e                	mv	a0,a5
     a0c:	00000097          	auipc	ra,0x0
     a10:	ee4080e7          	jalr	-284(ra) # 8f0 <putc>
  while(--i >= 0)
     a14:	fec42783          	lw	a5,-20(s0)
     a18:	37fd                	addiw	a5,a5,-1
     a1a:	fef42623          	sw	a5,-20(s0)
     a1e:	fec42783          	lw	a5,-20(s0)
     a22:	2781                	sext.w	a5,a5
     a24:	fc07d9e3          	bgez	a5,9f6 <printint+0xd0>
}
     a28:	0001                	nop
     a2a:	0001                	nop
     a2c:	70e2                	ld	ra,56(sp)
     a2e:	7442                	ld	s0,48(sp)
     a30:	6121                	addi	sp,sp,64
     a32:	8082                	ret

0000000000000a34 <printptr>:

static void
printptr(int fd, uint64 x) {
     a34:	7179                	addi	sp,sp,-48
     a36:	f406                	sd	ra,40(sp)
     a38:	f022                	sd	s0,32(sp)
     a3a:	1800                	addi	s0,sp,48
     a3c:	87aa                	mv	a5,a0
     a3e:	fcb43823          	sd	a1,-48(s0)
     a42:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     a46:	fdc42783          	lw	a5,-36(s0)
     a4a:	03000593          	li	a1,48
     a4e:	853e                	mv	a0,a5
     a50:	00000097          	auipc	ra,0x0
     a54:	ea0080e7          	jalr	-352(ra) # 8f0 <putc>
  putc(fd, 'x');
     a58:	fdc42783          	lw	a5,-36(s0)
     a5c:	07800593          	li	a1,120
     a60:	853e                	mv	a0,a5
     a62:	00000097          	auipc	ra,0x0
     a66:	e8e080e7          	jalr	-370(ra) # 8f0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a6a:	fe042623          	sw	zero,-20(s0)
     a6e:	a82d                	j	aa8 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     a70:	fd043783          	ld	a5,-48(s0)
     a74:	93f1                	srli	a5,a5,0x3c
     a76:	00000717          	auipc	a4,0x0
     a7a:	68270713          	addi	a4,a4,1666 # 10f8 <digits>
     a7e:	97ba                	add	a5,a5,a4
     a80:	0007c703          	lbu	a4,0(a5)
     a84:	fdc42783          	lw	a5,-36(s0)
     a88:	85ba                	mv	a1,a4
     a8a:	853e                	mv	a0,a5
     a8c:	00000097          	auipc	ra,0x0
     a90:	e64080e7          	jalr	-412(ra) # 8f0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a94:	fec42783          	lw	a5,-20(s0)
     a98:	2785                	addiw	a5,a5,1
     a9a:	fef42623          	sw	a5,-20(s0)
     a9e:	fd043783          	ld	a5,-48(s0)
     aa2:	0792                	slli	a5,a5,0x4
     aa4:	fcf43823          	sd	a5,-48(s0)
     aa8:	fec42783          	lw	a5,-20(s0)
     aac:	873e                	mv	a4,a5
     aae:	47bd                	li	a5,15
     ab0:	fce7f0e3          	bgeu	a5,a4,a70 <printptr+0x3c>
}
     ab4:	0001                	nop
     ab6:	0001                	nop
     ab8:	70a2                	ld	ra,40(sp)
     aba:	7402                	ld	s0,32(sp)
     abc:	6145                	addi	sp,sp,48
     abe:	8082                	ret

0000000000000ac0 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     ac0:	715d                	addi	sp,sp,-80
     ac2:	e486                	sd	ra,72(sp)
     ac4:	e0a2                	sd	s0,64(sp)
     ac6:	0880                	addi	s0,sp,80
     ac8:	87aa                	mv	a5,a0
     aca:	fcb43023          	sd	a1,-64(s0)
     ace:	fac43c23          	sd	a2,-72(s0)
     ad2:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     ad6:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ada:	fe042223          	sw	zero,-28(s0)
     ade:	a42d                	j	d08 <vprintf+0x248>
    c = fmt[i] & 0xff;
     ae0:	fe442783          	lw	a5,-28(s0)
     ae4:	fc043703          	ld	a4,-64(s0)
     ae8:	97ba                	add	a5,a5,a4
     aea:	0007c783          	lbu	a5,0(a5)
     aee:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     af2:	fe042783          	lw	a5,-32(s0)
     af6:	2781                	sext.w	a5,a5
     af8:	eb9d                	bnez	a5,b2e <vprintf+0x6e>
      if(c == '%'){
     afa:	fdc42783          	lw	a5,-36(s0)
     afe:	0007871b          	sext.w	a4,a5
     b02:	02500793          	li	a5,37
     b06:	00f71763          	bne	a4,a5,b14 <vprintf+0x54>
        state = '%';
     b0a:	02500793          	li	a5,37
     b0e:	fef42023          	sw	a5,-32(s0)
     b12:	a2f5                	j	cfe <vprintf+0x23e>
      } else {
        putc(fd, c);
     b14:	fdc42783          	lw	a5,-36(s0)
     b18:	0ff7f713          	andi	a4,a5,255
     b1c:	fcc42783          	lw	a5,-52(s0)
     b20:	85ba                	mv	a1,a4
     b22:	853e                	mv	a0,a5
     b24:	00000097          	auipc	ra,0x0
     b28:	dcc080e7          	jalr	-564(ra) # 8f0 <putc>
     b2c:	aac9                	j	cfe <vprintf+0x23e>
      }
    } else if(state == '%'){
     b2e:	fe042783          	lw	a5,-32(s0)
     b32:	0007871b          	sext.w	a4,a5
     b36:	02500793          	li	a5,37
     b3a:	1cf71263          	bne	a4,a5,cfe <vprintf+0x23e>
      if(c == 'd'){
     b3e:	fdc42783          	lw	a5,-36(s0)
     b42:	0007871b          	sext.w	a4,a5
     b46:	06400793          	li	a5,100
     b4a:	02f71463          	bne	a4,a5,b72 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     b4e:	fb843783          	ld	a5,-72(s0)
     b52:	00878713          	addi	a4,a5,8
     b56:	fae43c23          	sd	a4,-72(s0)
     b5a:	4398                	lw	a4,0(a5)
     b5c:	fcc42783          	lw	a5,-52(s0)
     b60:	4685                	li	a3,1
     b62:	4629                	li	a2,10
     b64:	85ba                	mv	a1,a4
     b66:	853e                	mv	a0,a5
     b68:	00000097          	auipc	ra,0x0
     b6c:	dbe080e7          	jalr	-578(ra) # 926 <printint>
     b70:	a269                	j	cfa <vprintf+0x23a>
      } else if(c == 'l') {
     b72:	fdc42783          	lw	a5,-36(s0)
     b76:	0007871b          	sext.w	a4,a5
     b7a:	06c00793          	li	a5,108
     b7e:	02f71663          	bne	a4,a5,baa <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     b82:	fb843783          	ld	a5,-72(s0)
     b86:	00878713          	addi	a4,a5,8
     b8a:	fae43c23          	sd	a4,-72(s0)
     b8e:	639c                	ld	a5,0(a5)
     b90:	0007871b          	sext.w	a4,a5
     b94:	fcc42783          	lw	a5,-52(s0)
     b98:	4681                	li	a3,0
     b9a:	4629                	li	a2,10
     b9c:	85ba                	mv	a1,a4
     b9e:	853e                	mv	a0,a5
     ba0:	00000097          	auipc	ra,0x0
     ba4:	d86080e7          	jalr	-634(ra) # 926 <printint>
     ba8:	aa89                	j	cfa <vprintf+0x23a>
      } else if(c == 'x') {
     baa:	fdc42783          	lw	a5,-36(s0)
     bae:	0007871b          	sext.w	a4,a5
     bb2:	07800793          	li	a5,120
     bb6:	02f71463          	bne	a4,a5,bde <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     bba:	fb843783          	ld	a5,-72(s0)
     bbe:	00878713          	addi	a4,a5,8
     bc2:	fae43c23          	sd	a4,-72(s0)
     bc6:	4398                	lw	a4,0(a5)
     bc8:	fcc42783          	lw	a5,-52(s0)
     bcc:	4681                	li	a3,0
     bce:	4641                	li	a2,16
     bd0:	85ba                	mv	a1,a4
     bd2:	853e                	mv	a0,a5
     bd4:	00000097          	auipc	ra,0x0
     bd8:	d52080e7          	jalr	-686(ra) # 926 <printint>
     bdc:	aa39                	j	cfa <vprintf+0x23a>
      } else if(c == 'p') {
     bde:	fdc42783          	lw	a5,-36(s0)
     be2:	0007871b          	sext.w	a4,a5
     be6:	07000793          	li	a5,112
     bea:	02f71263          	bne	a4,a5,c0e <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     bee:	fb843783          	ld	a5,-72(s0)
     bf2:	00878713          	addi	a4,a5,8
     bf6:	fae43c23          	sd	a4,-72(s0)
     bfa:	6398                	ld	a4,0(a5)
     bfc:	fcc42783          	lw	a5,-52(s0)
     c00:	85ba                	mv	a1,a4
     c02:	853e                	mv	a0,a5
     c04:	00000097          	auipc	ra,0x0
     c08:	e30080e7          	jalr	-464(ra) # a34 <printptr>
     c0c:	a0fd                	j	cfa <vprintf+0x23a>
      } else if(c == 's'){
     c0e:	fdc42783          	lw	a5,-36(s0)
     c12:	0007871b          	sext.w	a4,a5
     c16:	07300793          	li	a5,115
     c1a:	04f71c63          	bne	a4,a5,c72 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c1e:	fb843783          	ld	a5,-72(s0)
     c22:	00878713          	addi	a4,a5,8
     c26:	fae43c23          	sd	a4,-72(s0)
     c2a:	639c                	ld	a5,0(a5)
     c2c:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c30:	fe843783          	ld	a5,-24(s0)
     c34:	eb8d                	bnez	a5,c66 <vprintf+0x1a6>
          s = "(null)";
     c36:	00000797          	auipc	a5,0x0
     c3a:	4ba78793          	addi	a5,a5,1210 # 10f0 <malloc+0x180>
     c3e:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c42:	a015                	j	c66 <vprintf+0x1a6>
          putc(fd, *s);
     c44:	fe843783          	ld	a5,-24(s0)
     c48:	0007c703          	lbu	a4,0(a5)
     c4c:	fcc42783          	lw	a5,-52(s0)
     c50:	85ba                	mv	a1,a4
     c52:	853e                	mv	a0,a5
     c54:	00000097          	auipc	ra,0x0
     c58:	c9c080e7          	jalr	-868(ra) # 8f0 <putc>
          s++;
     c5c:	fe843783          	ld	a5,-24(s0)
     c60:	0785                	addi	a5,a5,1
     c62:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c66:	fe843783          	ld	a5,-24(s0)
     c6a:	0007c783          	lbu	a5,0(a5)
     c6e:	fbf9                	bnez	a5,c44 <vprintf+0x184>
     c70:	a069                	j	cfa <vprintf+0x23a>
        }
      } else if(c == 'c'){
     c72:	fdc42783          	lw	a5,-36(s0)
     c76:	0007871b          	sext.w	a4,a5
     c7a:	06300793          	li	a5,99
     c7e:	02f71463          	bne	a4,a5,ca6 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     c82:	fb843783          	ld	a5,-72(s0)
     c86:	00878713          	addi	a4,a5,8
     c8a:	fae43c23          	sd	a4,-72(s0)
     c8e:	439c                	lw	a5,0(a5)
     c90:	0ff7f713          	andi	a4,a5,255
     c94:	fcc42783          	lw	a5,-52(s0)
     c98:	85ba                	mv	a1,a4
     c9a:	853e                	mv	a0,a5
     c9c:	00000097          	auipc	ra,0x0
     ca0:	c54080e7          	jalr	-940(ra) # 8f0 <putc>
     ca4:	a899                	j	cfa <vprintf+0x23a>
      } else if(c == '%'){
     ca6:	fdc42783          	lw	a5,-36(s0)
     caa:	0007871b          	sext.w	a4,a5
     cae:	02500793          	li	a5,37
     cb2:	00f71f63          	bne	a4,a5,cd0 <vprintf+0x210>
        putc(fd, c);
     cb6:	fdc42783          	lw	a5,-36(s0)
     cba:	0ff7f713          	andi	a4,a5,255
     cbe:	fcc42783          	lw	a5,-52(s0)
     cc2:	85ba                	mv	a1,a4
     cc4:	853e                	mv	a0,a5
     cc6:	00000097          	auipc	ra,0x0
     cca:	c2a080e7          	jalr	-982(ra) # 8f0 <putc>
     cce:	a035                	j	cfa <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     cd0:	fcc42783          	lw	a5,-52(s0)
     cd4:	02500593          	li	a1,37
     cd8:	853e                	mv	a0,a5
     cda:	00000097          	auipc	ra,0x0
     cde:	c16080e7          	jalr	-1002(ra) # 8f0 <putc>
        putc(fd, c);
     ce2:	fdc42783          	lw	a5,-36(s0)
     ce6:	0ff7f713          	andi	a4,a5,255
     cea:	fcc42783          	lw	a5,-52(s0)
     cee:	85ba                	mv	a1,a4
     cf0:	853e                	mv	a0,a5
     cf2:	00000097          	auipc	ra,0x0
     cf6:	bfe080e7          	jalr	-1026(ra) # 8f0 <putc>
      }
      state = 0;
     cfa:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     cfe:	fe442783          	lw	a5,-28(s0)
     d02:	2785                	addiw	a5,a5,1
     d04:	fef42223          	sw	a5,-28(s0)
     d08:	fe442783          	lw	a5,-28(s0)
     d0c:	fc043703          	ld	a4,-64(s0)
     d10:	97ba                	add	a5,a5,a4
     d12:	0007c783          	lbu	a5,0(a5)
     d16:	dc0795e3          	bnez	a5,ae0 <vprintf+0x20>
    }
  }
}
     d1a:	0001                	nop
     d1c:	0001                	nop
     d1e:	60a6                	ld	ra,72(sp)
     d20:	6406                	ld	s0,64(sp)
     d22:	6161                	addi	sp,sp,80
     d24:	8082                	ret

0000000000000d26 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d26:	7159                	addi	sp,sp,-112
     d28:	fc06                	sd	ra,56(sp)
     d2a:	f822                	sd	s0,48(sp)
     d2c:	0080                	addi	s0,sp,64
     d2e:	fcb43823          	sd	a1,-48(s0)
     d32:	e010                	sd	a2,0(s0)
     d34:	e414                	sd	a3,8(s0)
     d36:	e818                	sd	a4,16(s0)
     d38:	ec1c                	sd	a5,24(s0)
     d3a:	03043023          	sd	a6,32(s0)
     d3e:	03143423          	sd	a7,40(s0)
     d42:	87aa                	mv	a5,a0
     d44:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     d48:	03040793          	addi	a5,s0,48
     d4c:	fcf43423          	sd	a5,-56(s0)
     d50:	fc843783          	ld	a5,-56(s0)
     d54:	fd078793          	addi	a5,a5,-48
     d58:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     d5c:	fe843703          	ld	a4,-24(s0)
     d60:	fdc42783          	lw	a5,-36(s0)
     d64:	863a                	mv	a2,a4
     d66:	fd043583          	ld	a1,-48(s0)
     d6a:	853e                	mv	a0,a5
     d6c:	00000097          	auipc	ra,0x0
     d70:	d54080e7          	jalr	-684(ra) # ac0 <vprintf>
}
     d74:	0001                	nop
     d76:	70e2                	ld	ra,56(sp)
     d78:	7442                	ld	s0,48(sp)
     d7a:	6165                	addi	sp,sp,112
     d7c:	8082                	ret

0000000000000d7e <printf>:

void
printf(const char *fmt, ...)
{
     d7e:	7159                	addi	sp,sp,-112
     d80:	f406                	sd	ra,40(sp)
     d82:	f022                	sd	s0,32(sp)
     d84:	1800                	addi	s0,sp,48
     d86:	fca43c23          	sd	a0,-40(s0)
     d8a:	e40c                	sd	a1,8(s0)
     d8c:	e810                	sd	a2,16(s0)
     d8e:	ec14                	sd	a3,24(s0)
     d90:	f018                	sd	a4,32(s0)
     d92:	f41c                	sd	a5,40(s0)
     d94:	03043823          	sd	a6,48(s0)
     d98:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     d9c:	04040793          	addi	a5,s0,64
     da0:	fcf43823          	sd	a5,-48(s0)
     da4:	fd043783          	ld	a5,-48(s0)
     da8:	fc878793          	addi	a5,a5,-56
     dac:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     db0:	fe843783          	ld	a5,-24(s0)
     db4:	863e                	mv	a2,a5
     db6:	fd843583          	ld	a1,-40(s0)
     dba:	4505                	li	a0,1
     dbc:	00000097          	auipc	ra,0x0
     dc0:	d04080e7          	jalr	-764(ra) # ac0 <vprintf>
}
     dc4:	0001                	nop
     dc6:	70a2                	ld	ra,40(sp)
     dc8:	7402                	ld	s0,32(sp)
     dca:	6165                	addi	sp,sp,112
     dcc:	8082                	ret

0000000000000dce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     dce:	7179                	addi	sp,sp,-48
     dd0:	f422                	sd	s0,40(sp)
     dd2:	1800                	addi	s0,sp,48
     dd4:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     dd8:	fd843783          	ld	a5,-40(s0)
     ddc:	17c1                	addi	a5,a5,-16
     dde:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     de2:	00000797          	auipc	a5,0x0
     de6:	34678793          	addi	a5,a5,838 # 1128 <freep>
     dea:	639c                	ld	a5,0(a5)
     dec:	fef43423          	sd	a5,-24(s0)
     df0:	a815                	j	e24 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     df2:	fe843783          	ld	a5,-24(s0)
     df6:	639c                	ld	a5,0(a5)
     df8:	fe843703          	ld	a4,-24(s0)
     dfc:	00f76f63          	bltu	a4,a5,e1a <free+0x4c>
     e00:	fe043703          	ld	a4,-32(s0)
     e04:	fe843783          	ld	a5,-24(s0)
     e08:	02e7eb63          	bltu	a5,a4,e3e <free+0x70>
     e0c:	fe843783          	ld	a5,-24(s0)
     e10:	639c                	ld	a5,0(a5)
     e12:	fe043703          	ld	a4,-32(s0)
     e16:	02f76463          	bltu	a4,a5,e3e <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e1a:	fe843783          	ld	a5,-24(s0)
     e1e:	639c                	ld	a5,0(a5)
     e20:	fef43423          	sd	a5,-24(s0)
     e24:	fe043703          	ld	a4,-32(s0)
     e28:	fe843783          	ld	a5,-24(s0)
     e2c:	fce7f3e3          	bgeu	a5,a4,df2 <free+0x24>
     e30:	fe843783          	ld	a5,-24(s0)
     e34:	639c                	ld	a5,0(a5)
     e36:	fe043703          	ld	a4,-32(s0)
     e3a:	faf77ce3          	bgeu	a4,a5,df2 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e3e:	fe043783          	ld	a5,-32(s0)
     e42:	479c                	lw	a5,8(a5)
     e44:	1782                	slli	a5,a5,0x20
     e46:	9381                	srli	a5,a5,0x20
     e48:	0792                	slli	a5,a5,0x4
     e4a:	fe043703          	ld	a4,-32(s0)
     e4e:	973e                	add	a4,a4,a5
     e50:	fe843783          	ld	a5,-24(s0)
     e54:	639c                	ld	a5,0(a5)
     e56:	02f71763          	bne	a4,a5,e84 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     e5a:	fe043783          	ld	a5,-32(s0)
     e5e:	4798                	lw	a4,8(a5)
     e60:	fe843783          	ld	a5,-24(s0)
     e64:	639c                	ld	a5,0(a5)
     e66:	479c                	lw	a5,8(a5)
     e68:	9fb9                	addw	a5,a5,a4
     e6a:	0007871b          	sext.w	a4,a5
     e6e:	fe043783          	ld	a5,-32(s0)
     e72:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     e74:	fe843783          	ld	a5,-24(s0)
     e78:	639c                	ld	a5,0(a5)
     e7a:	6398                	ld	a4,0(a5)
     e7c:	fe043783          	ld	a5,-32(s0)
     e80:	e398                	sd	a4,0(a5)
     e82:	a039                	j	e90 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     e84:	fe843783          	ld	a5,-24(s0)
     e88:	6398                	ld	a4,0(a5)
     e8a:	fe043783          	ld	a5,-32(s0)
     e8e:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     e90:	fe843783          	ld	a5,-24(s0)
     e94:	479c                	lw	a5,8(a5)
     e96:	1782                	slli	a5,a5,0x20
     e98:	9381                	srli	a5,a5,0x20
     e9a:	0792                	slli	a5,a5,0x4
     e9c:	fe843703          	ld	a4,-24(s0)
     ea0:	97ba                	add	a5,a5,a4
     ea2:	fe043703          	ld	a4,-32(s0)
     ea6:	02f71563          	bne	a4,a5,ed0 <free+0x102>
    p->s.size += bp->s.size;
     eaa:	fe843783          	ld	a5,-24(s0)
     eae:	4798                	lw	a4,8(a5)
     eb0:	fe043783          	ld	a5,-32(s0)
     eb4:	479c                	lw	a5,8(a5)
     eb6:	9fb9                	addw	a5,a5,a4
     eb8:	0007871b          	sext.w	a4,a5
     ebc:	fe843783          	ld	a5,-24(s0)
     ec0:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ec2:	fe043783          	ld	a5,-32(s0)
     ec6:	6398                	ld	a4,0(a5)
     ec8:	fe843783          	ld	a5,-24(s0)
     ecc:	e398                	sd	a4,0(a5)
     ece:	a031                	j	eda <free+0x10c>
  } else
    p->s.ptr = bp;
     ed0:	fe843783          	ld	a5,-24(s0)
     ed4:	fe043703          	ld	a4,-32(s0)
     ed8:	e398                	sd	a4,0(a5)
  freep = p;
     eda:	00000797          	auipc	a5,0x0
     ede:	24e78793          	addi	a5,a5,590 # 1128 <freep>
     ee2:	fe843703          	ld	a4,-24(s0)
     ee6:	e398                	sd	a4,0(a5)
}
     ee8:	0001                	nop
     eea:	7422                	ld	s0,40(sp)
     eec:	6145                	addi	sp,sp,48
     eee:	8082                	ret

0000000000000ef0 <morecore>:

static Header*
morecore(uint nu)
{
     ef0:	7179                	addi	sp,sp,-48
     ef2:	f406                	sd	ra,40(sp)
     ef4:	f022                	sd	s0,32(sp)
     ef6:	1800                	addi	s0,sp,48
     ef8:	87aa                	mv	a5,a0
     efa:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     efe:	fdc42783          	lw	a5,-36(s0)
     f02:	0007871b          	sext.w	a4,a5
     f06:	6785                	lui	a5,0x1
     f08:	00f77563          	bgeu	a4,a5,f12 <morecore+0x22>
    nu = 4096;
     f0c:	6785                	lui	a5,0x1
     f0e:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     f12:	fdc42783          	lw	a5,-36(s0)
     f16:	0047979b          	slliw	a5,a5,0x4
     f1a:	2781                	sext.w	a5,a5
     f1c:	2781                	sext.w	a5,a5
     f1e:	853e                	mv	a0,a5
     f20:	00000097          	auipc	ra,0x0
     f24:	9b0080e7          	jalr	-1616(ra) # 8d0 <sbrk>
     f28:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f2c:	fe843703          	ld	a4,-24(s0)
     f30:	57fd                	li	a5,-1
     f32:	00f71463          	bne	a4,a5,f3a <morecore+0x4a>
    return 0;
     f36:	4781                	li	a5,0
     f38:	a03d                	j	f66 <morecore+0x76>
  hp = (Header*)p;
     f3a:	fe843783          	ld	a5,-24(s0)
     f3e:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f42:	fe043783          	ld	a5,-32(s0)
     f46:	fdc42703          	lw	a4,-36(s0)
     f4a:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     f4c:	fe043783          	ld	a5,-32(s0)
     f50:	07c1                	addi	a5,a5,16
     f52:	853e                	mv	a0,a5
     f54:	00000097          	auipc	ra,0x0
     f58:	e7a080e7          	jalr	-390(ra) # dce <free>
  return freep;
     f5c:	00000797          	auipc	a5,0x0
     f60:	1cc78793          	addi	a5,a5,460 # 1128 <freep>
     f64:	639c                	ld	a5,0(a5)
}
     f66:	853e                	mv	a0,a5
     f68:	70a2                	ld	ra,40(sp)
     f6a:	7402                	ld	s0,32(sp)
     f6c:	6145                	addi	sp,sp,48
     f6e:	8082                	ret

0000000000000f70 <malloc>:

void*
malloc(uint nbytes)
{
     f70:	7139                	addi	sp,sp,-64
     f72:	fc06                	sd	ra,56(sp)
     f74:	f822                	sd	s0,48(sp)
     f76:	0080                	addi	s0,sp,64
     f78:	87aa                	mv	a5,a0
     f7a:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f7e:	fcc46783          	lwu	a5,-52(s0)
     f82:	07bd                	addi	a5,a5,15
     f84:	8391                	srli	a5,a5,0x4
     f86:	2781                	sext.w	a5,a5
     f88:	2785                	addiw	a5,a5,1
     f8a:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     f8e:	00000797          	auipc	a5,0x0
     f92:	19a78793          	addi	a5,a5,410 # 1128 <freep>
     f96:	639c                	ld	a5,0(a5)
     f98:	fef43023          	sd	a5,-32(s0)
     f9c:	fe043783          	ld	a5,-32(s0)
     fa0:	ef95                	bnez	a5,fdc <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     fa2:	00000797          	auipc	a5,0x0
     fa6:	17678793          	addi	a5,a5,374 # 1118 <base>
     faa:	fef43023          	sd	a5,-32(s0)
     fae:	00000797          	auipc	a5,0x0
     fb2:	17a78793          	addi	a5,a5,378 # 1128 <freep>
     fb6:	fe043703          	ld	a4,-32(s0)
     fba:	e398                	sd	a4,0(a5)
     fbc:	00000797          	auipc	a5,0x0
     fc0:	16c78793          	addi	a5,a5,364 # 1128 <freep>
     fc4:	6398                	ld	a4,0(a5)
     fc6:	00000797          	auipc	a5,0x0
     fca:	15278793          	addi	a5,a5,338 # 1118 <base>
     fce:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     fd0:	00000797          	auipc	a5,0x0
     fd4:	14878793          	addi	a5,a5,328 # 1118 <base>
     fd8:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fdc:	fe043783          	ld	a5,-32(s0)
     fe0:	639c                	ld	a5,0(a5)
     fe2:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     fe6:	fe843783          	ld	a5,-24(s0)
     fea:	4798                	lw	a4,8(a5)
     fec:	fdc42783          	lw	a5,-36(s0)
     ff0:	2781                	sext.w	a5,a5
     ff2:	06f76863          	bltu	a4,a5,1062 <malloc+0xf2>
      if(p->s.size == nunits)
     ff6:	fe843783          	ld	a5,-24(s0)
     ffa:	4798                	lw	a4,8(a5)
     ffc:	fdc42783          	lw	a5,-36(s0)
    1000:	2781                	sext.w	a5,a5
    1002:	00e79963          	bne	a5,a4,1014 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1006:	fe843783          	ld	a5,-24(s0)
    100a:	6398                	ld	a4,0(a5)
    100c:	fe043783          	ld	a5,-32(s0)
    1010:	e398                	sd	a4,0(a5)
    1012:	a82d                	j	104c <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1014:	fe843783          	ld	a5,-24(s0)
    1018:	4798                	lw	a4,8(a5)
    101a:	fdc42783          	lw	a5,-36(s0)
    101e:	40f707bb          	subw	a5,a4,a5
    1022:	0007871b          	sext.w	a4,a5
    1026:	fe843783          	ld	a5,-24(s0)
    102a:	c798                	sw	a4,8(a5)
        p += p->s.size;
    102c:	fe843783          	ld	a5,-24(s0)
    1030:	479c                	lw	a5,8(a5)
    1032:	1782                	slli	a5,a5,0x20
    1034:	9381                	srli	a5,a5,0x20
    1036:	0792                	slli	a5,a5,0x4
    1038:	fe843703          	ld	a4,-24(s0)
    103c:	97ba                	add	a5,a5,a4
    103e:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1042:	fe843783          	ld	a5,-24(s0)
    1046:	fdc42703          	lw	a4,-36(s0)
    104a:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    104c:	00000797          	auipc	a5,0x0
    1050:	0dc78793          	addi	a5,a5,220 # 1128 <freep>
    1054:	fe043703          	ld	a4,-32(s0)
    1058:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    105a:	fe843783          	ld	a5,-24(s0)
    105e:	07c1                	addi	a5,a5,16
    1060:	a091                	j	10a4 <malloc+0x134>
    }
    if(p == freep)
    1062:	00000797          	auipc	a5,0x0
    1066:	0c678793          	addi	a5,a5,198 # 1128 <freep>
    106a:	639c                	ld	a5,0(a5)
    106c:	fe843703          	ld	a4,-24(s0)
    1070:	02f71063          	bne	a4,a5,1090 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    1074:	fdc42783          	lw	a5,-36(s0)
    1078:	853e                	mv	a0,a5
    107a:	00000097          	auipc	ra,0x0
    107e:	e76080e7          	jalr	-394(ra) # ef0 <morecore>
    1082:	fea43423          	sd	a0,-24(s0)
    1086:	fe843783          	ld	a5,-24(s0)
    108a:	e399                	bnez	a5,1090 <malloc+0x120>
        return 0;
    108c:	4781                	li	a5,0
    108e:	a819                	j	10a4 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1090:	fe843783          	ld	a5,-24(s0)
    1094:	fef43023          	sd	a5,-32(s0)
    1098:	fe843783          	ld	a5,-24(s0)
    109c:	639c                	ld	a5,0(a5)
    109e:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    10a2:	b791                	j	fe6 <malloc+0x76>
  }
}
    10a4:	853e                	mv	a0,a5
    10a6:	70e2                	ld	ra,56(sp)
    10a8:	7442                	ld	s0,48(sp)
    10aa:	6121                	addi	sp,sp,64
    10ac:	8082                	ret
