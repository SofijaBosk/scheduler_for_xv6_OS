
user/_zombie:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(void)
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  if(fork() > 0)
   8:	00000097          	auipc	ra,0x0
   c:	4aa080e7          	jalr	1194(ra) # 4b2 <fork>
  10:	87aa                	mv	a5,a0
  12:	00f05763          	blez	a5,20 <main+0x20>
    sleep(5);  // Let child exit before parent.
  16:	4515                	li	a0,5
  18:	00000097          	auipc	ra,0x0
  1c:	532080e7          	jalr	1330(ra) # 54a <sleep>
  exit(0);
  20:	4501                	li	a0,0
  22:	00000097          	auipc	ra,0x0
  26:	498080e7          	jalr	1176(ra) # 4ba <exit>

000000000000002a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  2a:	7179                	addi	sp,sp,-48
  2c:	f422                	sd	s0,40(sp)
  2e:	1800                	addi	s0,sp,48
  30:	fca43c23          	sd	a0,-40(s0)
  34:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  38:	fd843783          	ld	a5,-40(s0)
  3c:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  40:	0001                	nop
  42:	fd043703          	ld	a4,-48(s0)
  46:	00170793          	addi	a5,a4,1
  4a:	fcf43823          	sd	a5,-48(s0)
  4e:	fd843783          	ld	a5,-40(s0)
  52:	00178693          	addi	a3,a5,1
  56:	fcd43c23          	sd	a3,-40(s0)
  5a:	00074703          	lbu	a4,0(a4)
  5e:	00e78023          	sb	a4,0(a5)
  62:	0007c783          	lbu	a5,0(a5)
  66:	fff1                	bnez	a5,42 <strcpy+0x18>
    ;
  return os;
  68:	fe843783          	ld	a5,-24(s0)
}
  6c:	853e                	mv	a0,a5
  6e:	7422                	ld	s0,40(sp)
  70:	6145                	addi	sp,sp,48
  72:	8082                	ret

0000000000000074 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  74:	1101                	addi	sp,sp,-32
  76:	ec22                	sd	s0,24(sp)
  78:	1000                	addi	s0,sp,32
  7a:	fea43423          	sd	a0,-24(s0)
  7e:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  82:	a819                	j	98 <strcmp+0x24>
    p++, q++;
  84:	fe843783          	ld	a5,-24(s0)
  88:	0785                	addi	a5,a5,1
  8a:	fef43423          	sd	a5,-24(s0)
  8e:	fe043783          	ld	a5,-32(s0)
  92:	0785                	addi	a5,a5,1
  94:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  98:	fe843783          	ld	a5,-24(s0)
  9c:	0007c783          	lbu	a5,0(a5)
  a0:	cb99                	beqz	a5,b6 <strcmp+0x42>
  a2:	fe843783          	ld	a5,-24(s0)
  a6:	0007c703          	lbu	a4,0(a5)
  aa:	fe043783          	ld	a5,-32(s0)
  ae:	0007c783          	lbu	a5,0(a5)
  b2:	fcf709e3          	beq	a4,a5,84 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
  b6:	fe843783          	ld	a5,-24(s0)
  ba:	0007c783          	lbu	a5,0(a5)
  be:	0007871b          	sext.w	a4,a5
  c2:	fe043783          	ld	a5,-32(s0)
  c6:	0007c783          	lbu	a5,0(a5)
  ca:	2781                	sext.w	a5,a5
  cc:	40f707bb          	subw	a5,a4,a5
  d0:	2781                	sext.w	a5,a5
}
  d2:	853e                	mv	a0,a5
  d4:	6462                	ld	s0,24(sp)
  d6:	6105                	addi	sp,sp,32
  d8:	8082                	ret

00000000000000da <strlen>:

uint
strlen(const char *s)
{
  da:	7179                	addi	sp,sp,-48
  dc:	f422                	sd	s0,40(sp)
  de:	1800                	addi	s0,sp,48
  e0:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
  e4:	fe042623          	sw	zero,-20(s0)
  e8:	a031                	j	f4 <strlen+0x1a>
  ea:	fec42783          	lw	a5,-20(s0)
  ee:	2785                	addiw	a5,a5,1
  f0:	fef42623          	sw	a5,-20(s0)
  f4:	fec42783          	lw	a5,-20(s0)
  f8:	fd843703          	ld	a4,-40(s0)
  fc:	97ba                	add	a5,a5,a4
  fe:	0007c783          	lbu	a5,0(a5)
 102:	f7e5                	bnez	a5,ea <strlen+0x10>
    ;
  return n;
 104:	fec42783          	lw	a5,-20(s0)
}
 108:	853e                	mv	a0,a5
 10a:	7422                	ld	s0,40(sp)
 10c:	6145                	addi	sp,sp,48
 10e:	8082                	ret

0000000000000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	7179                	addi	sp,sp,-48
 112:	f422                	sd	s0,40(sp)
 114:	1800                	addi	s0,sp,48
 116:	fca43c23          	sd	a0,-40(s0)
 11a:	87ae                	mv	a5,a1
 11c:	8732                	mv	a4,a2
 11e:	fcf42a23          	sw	a5,-44(s0)
 122:	87ba                	mv	a5,a4
 124:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 128:	fd843783          	ld	a5,-40(s0)
 12c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 130:	fe042623          	sw	zero,-20(s0)
 134:	a00d                	j	156 <memset+0x46>
    cdst[i] = c;
 136:	fec42783          	lw	a5,-20(s0)
 13a:	fe043703          	ld	a4,-32(s0)
 13e:	97ba                	add	a5,a5,a4
 140:	fd442703          	lw	a4,-44(s0)
 144:	0ff77713          	andi	a4,a4,255
 148:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 14c:	fec42783          	lw	a5,-20(s0)
 150:	2785                	addiw	a5,a5,1
 152:	fef42623          	sw	a5,-20(s0)
 156:	fec42703          	lw	a4,-20(s0)
 15a:	fd042783          	lw	a5,-48(s0)
 15e:	2781                	sext.w	a5,a5
 160:	fcf76be3          	bltu	a4,a5,136 <memset+0x26>
  }
  return dst;
 164:	fd843783          	ld	a5,-40(s0)
}
 168:	853e                	mv	a0,a5
 16a:	7422                	ld	s0,40(sp)
 16c:	6145                	addi	sp,sp,48
 16e:	8082                	ret

0000000000000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	1101                	addi	sp,sp,-32
 172:	ec22                	sd	s0,24(sp)
 174:	1000                	addi	s0,sp,32
 176:	fea43423          	sd	a0,-24(s0)
 17a:	87ae                	mv	a5,a1
 17c:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 180:	a01d                	j	1a6 <strchr+0x36>
    if(*s == c)
 182:	fe843783          	ld	a5,-24(s0)
 186:	0007c703          	lbu	a4,0(a5)
 18a:	fe744783          	lbu	a5,-25(s0)
 18e:	0ff7f793          	andi	a5,a5,255
 192:	00e79563          	bne	a5,a4,19c <strchr+0x2c>
      return (char*)s;
 196:	fe843783          	ld	a5,-24(s0)
 19a:	a821                	j	1b2 <strchr+0x42>
  for(; *s; s++)
 19c:	fe843783          	ld	a5,-24(s0)
 1a0:	0785                	addi	a5,a5,1
 1a2:	fef43423          	sd	a5,-24(s0)
 1a6:	fe843783          	ld	a5,-24(s0)
 1aa:	0007c783          	lbu	a5,0(a5)
 1ae:	fbf1                	bnez	a5,182 <strchr+0x12>
  return 0;
 1b0:	4781                	li	a5,0
}
 1b2:	853e                	mv	a0,a5
 1b4:	6462                	ld	s0,24(sp)
 1b6:	6105                	addi	sp,sp,32
 1b8:	8082                	ret

00000000000001ba <gets>:

char*
gets(char *buf, int max)
{
 1ba:	7179                	addi	sp,sp,-48
 1bc:	f406                	sd	ra,40(sp)
 1be:	f022                	sd	s0,32(sp)
 1c0:	1800                	addi	s0,sp,48
 1c2:	fca43c23          	sd	a0,-40(s0)
 1c6:	87ae                	mv	a5,a1
 1c8:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	fe042623          	sw	zero,-20(s0)
 1d0:	a8a1                	j	228 <gets+0x6e>
    cc = read(0, &c, 1);
 1d2:	fe740793          	addi	a5,s0,-25
 1d6:	4605                	li	a2,1
 1d8:	85be                	mv	a1,a5
 1da:	4501                	li	a0,0
 1dc:	00000097          	auipc	ra,0x0
 1e0:	2f6080e7          	jalr	758(ra) # 4d2 <read>
 1e4:	87aa                	mv	a5,a0
 1e6:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 1ea:	fe842783          	lw	a5,-24(s0)
 1ee:	2781                	sext.w	a5,a5
 1f0:	04f05763          	blez	a5,23e <gets+0x84>
      break;
    buf[i++] = c;
 1f4:	fec42783          	lw	a5,-20(s0)
 1f8:	0017871b          	addiw	a4,a5,1
 1fc:	fee42623          	sw	a4,-20(s0)
 200:	873e                	mv	a4,a5
 202:	fd843783          	ld	a5,-40(s0)
 206:	97ba                	add	a5,a5,a4
 208:	fe744703          	lbu	a4,-25(s0)
 20c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 210:	fe744783          	lbu	a5,-25(s0)
 214:	873e                	mv	a4,a5
 216:	47a9                	li	a5,10
 218:	02f70463          	beq	a4,a5,240 <gets+0x86>
 21c:	fe744783          	lbu	a5,-25(s0)
 220:	873e                	mv	a4,a5
 222:	47b5                	li	a5,13
 224:	00f70e63          	beq	a4,a5,240 <gets+0x86>
  for(i=0; i+1 < max; ){
 228:	fec42783          	lw	a5,-20(s0)
 22c:	2785                	addiw	a5,a5,1
 22e:	0007871b          	sext.w	a4,a5
 232:	fd442783          	lw	a5,-44(s0)
 236:	2781                	sext.w	a5,a5
 238:	f8f74de3          	blt	a4,a5,1d2 <gets+0x18>
 23c:	a011                	j	240 <gets+0x86>
      break;
 23e:	0001                	nop
      break;
  }
  buf[i] = '\0';
 240:	fec42783          	lw	a5,-20(s0)
 244:	fd843703          	ld	a4,-40(s0)
 248:	97ba                	add	a5,a5,a4
 24a:	00078023          	sb	zero,0(a5)
  return buf;
 24e:	fd843783          	ld	a5,-40(s0)
}
 252:	853e                	mv	a0,a5
 254:	70a2                	ld	ra,40(sp)
 256:	7402                	ld	s0,32(sp)
 258:	6145                	addi	sp,sp,48
 25a:	8082                	ret

000000000000025c <stat>:

int
stat(const char *n, struct stat *st)
{
 25c:	7179                	addi	sp,sp,-48
 25e:	f406                	sd	ra,40(sp)
 260:	f022                	sd	s0,32(sp)
 262:	1800                	addi	s0,sp,48
 264:	fca43c23          	sd	a0,-40(s0)
 268:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26c:	4581                	li	a1,0
 26e:	fd843503          	ld	a0,-40(s0)
 272:	00000097          	auipc	ra,0x0
 276:	288080e7          	jalr	648(ra) # 4fa <open>
 27a:	87aa                	mv	a5,a0
 27c:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 280:	fec42783          	lw	a5,-20(s0)
 284:	2781                	sext.w	a5,a5
 286:	0007d463          	bgez	a5,28e <stat+0x32>
    return -1;
 28a:	57fd                	li	a5,-1
 28c:	a035                	j	2b8 <stat+0x5c>
  r = fstat(fd, st);
 28e:	fec42783          	lw	a5,-20(s0)
 292:	fd043583          	ld	a1,-48(s0)
 296:	853e                	mv	a0,a5
 298:	00000097          	auipc	ra,0x0
 29c:	27a080e7          	jalr	634(ra) # 512 <fstat>
 2a0:	87aa                	mv	a5,a0
 2a2:	fef42423          	sw	a5,-24(s0)
  close(fd);
 2a6:	fec42783          	lw	a5,-20(s0)
 2aa:	853e                	mv	a0,a5
 2ac:	00000097          	auipc	ra,0x0
 2b0:	236080e7          	jalr	566(ra) # 4e2 <close>
  return r;
 2b4:	fe842783          	lw	a5,-24(s0)
}
 2b8:	853e                	mv	a0,a5
 2ba:	70a2                	ld	ra,40(sp)
 2bc:	7402                	ld	s0,32(sp)
 2be:	6145                	addi	sp,sp,48
 2c0:	8082                	ret

00000000000002c2 <atoi>:

int
atoi(const char *s)
{
 2c2:	7179                	addi	sp,sp,-48
 2c4:	f422                	sd	s0,40(sp)
 2c6:	1800                	addi	s0,sp,48
 2c8:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 2cc:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 2d0:	a815                	j	304 <atoi+0x42>
    n = n*10 + *s++ - '0';
 2d2:	fec42703          	lw	a4,-20(s0)
 2d6:	87ba                	mv	a5,a4
 2d8:	0027979b          	slliw	a5,a5,0x2
 2dc:	9fb9                	addw	a5,a5,a4
 2de:	0017979b          	slliw	a5,a5,0x1
 2e2:	0007871b          	sext.w	a4,a5
 2e6:	fd843783          	ld	a5,-40(s0)
 2ea:	00178693          	addi	a3,a5,1
 2ee:	fcd43c23          	sd	a3,-40(s0)
 2f2:	0007c783          	lbu	a5,0(a5)
 2f6:	2781                	sext.w	a5,a5
 2f8:	9fb9                	addw	a5,a5,a4
 2fa:	2781                	sext.w	a5,a5
 2fc:	fd07879b          	addiw	a5,a5,-48
 300:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 304:	fd843783          	ld	a5,-40(s0)
 308:	0007c783          	lbu	a5,0(a5)
 30c:	873e                	mv	a4,a5
 30e:	02f00793          	li	a5,47
 312:	00e7fb63          	bgeu	a5,a4,328 <atoi+0x66>
 316:	fd843783          	ld	a5,-40(s0)
 31a:	0007c783          	lbu	a5,0(a5)
 31e:	873e                	mv	a4,a5
 320:	03900793          	li	a5,57
 324:	fae7f7e3          	bgeu	a5,a4,2d2 <atoi+0x10>
  return n;
 328:	fec42783          	lw	a5,-20(s0)
}
 32c:	853e                	mv	a0,a5
 32e:	7422                	ld	s0,40(sp)
 330:	6145                	addi	sp,sp,48
 332:	8082                	ret

0000000000000334 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 334:	7139                	addi	sp,sp,-64
 336:	fc22                	sd	s0,56(sp)
 338:	0080                	addi	s0,sp,64
 33a:	fca43c23          	sd	a0,-40(s0)
 33e:	fcb43823          	sd	a1,-48(s0)
 342:	87b2                	mv	a5,a2
 344:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 348:	fd843783          	ld	a5,-40(s0)
 34c:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 350:	fd043783          	ld	a5,-48(s0)
 354:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 358:	fe043703          	ld	a4,-32(s0)
 35c:	fe843783          	ld	a5,-24(s0)
 360:	02e7fc63          	bgeu	a5,a4,398 <memmove+0x64>
    while(n-- > 0)
 364:	a00d                	j	386 <memmove+0x52>
      *dst++ = *src++;
 366:	fe043703          	ld	a4,-32(s0)
 36a:	00170793          	addi	a5,a4,1
 36e:	fef43023          	sd	a5,-32(s0)
 372:	fe843783          	ld	a5,-24(s0)
 376:	00178693          	addi	a3,a5,1
 37a:	fed43423          	sd	a3,-24(s0)
 37e:	00074703          	lbu	a4,0(a4)
 382:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 386:	fcc42783          	lw	a5,-52(s0)
 38a:	fff7871b          	addiw	a4,a5,-1
 38e:	fce42623          	sw	a4,-52(s0)
 392:	fcf04ae3          	bgtz	a5,366 <memmove+0x32>
 396:	a891                	j	3ea <memmove+0xb6>
  } else {
    dst += n;
 398:	fcc42783          	lw	a5,-52(s0)
 39c:	fe843703          	ld	a4,-24(s0)
 3a0:	97ba                	add	a5,a5,a4
 3a2:	fef43423          	sd	a5,-24(s0)
    src += n;
 3a6:	fcc42783          	lw	a5,-52(s0)
 3aa:	fe043703          	ld	a4,-32(s0)
 3ae:	97ba                	add	a5,a5,a4
 3b0:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 3b4:	a01d                	j	3da <memmove+0xa6>
      *--dst = *--src;
 3b6:	fe043783          	ld	a5,-32(s0)
 3ba:	17fd                	addi	a5,a5,-1
 3bc:	fef43023          	sd	a5,-32(s0)
 3c0:	fe843783          	ld	a5,-24(s0)
 3c4:	17fd                	addi	a5,a5,-1
 3c6:	fef43423          	sd	a5,-24(s0)
 3ca:	fe043783          	ld	a5,-32(s0)
 3ce:	0007c703          	lbu	a4,0(a5)
 3d2:	fe843783          	ld	a5,-24(s0)
 3d6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3da:	fcc42783          	lw	a5,-52(s0)
 3de:	fff7871b          	addiw	a4,a5,-1
 3e2:	fce42623          	sw	a4,-52(s0)
 3e6:	fcf048e3          	bgtz	a5,3b6 <memmove+0x82>
  }
  return vdst;
 3ea:	fd843783          	ld	a5,-40(s0)
}
 3ee:	853e                	mv	a0,a5
 3f0:	7462                	ld	s0,56(sp)
 3f2:	6121                	addi	sp,sp,64
 3f4:	8082                	ret

00000000000003f6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3f6:	7139                	addi	sp,sp,-64
 3f8:	fc22                	sd	s0,56(sp)
 3fa:	0080                	addi	s0,sp,64
 3fc:	fca43c23          	sd	a0,-40(s0)
 400:	fcb43823          	sd	a1,-48(s0)
 404:	87b2                	mv	a5,a2
 406:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 40a:	fd843783          	ld	a5,-40(s0)
 40e:	fef43423          	sd	a5,-24(s0)
 412:	fd043783          	ld	a5,-48(s0)
 416:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 41a:	a0a1                	j	462 <memcmp+0x6c>
    if (*p1 != *p2) {
 41c:	fe843783          	ld	a5,-24(s0)
 420:	0007c703          	lbu	a4,0(a5)
 424:	fe043783          	ld	a5,-32(s0)
 428:	0007c783          	lbu	a5,0(a5)
 42c:	02f70163          	beq	a4,a5,44e <memcmp+0x58>
      return *p1 - *p2;
 430:	fe843783          	ld	a5,-24(s0)
 434:	0007c783          	lbu	a5,0(a5)
 438:	0007871b          	sext.w	a4,a5
 43c:	fe043783          	ld	a5,-32(s0)
 440:	0007c783          	lbu	a5,0(a5)
 444:	2781                	sext.w	a5,a5
 446:	40f707bb          	subw	a5,a4,a5
 44a:	2781                	sext.w	a5,a5
 44c:	a01d                	j	472 <memcmp+0x7c>
    }
    p1++;
 44e:	fe843783          	ld	a5,-24(s0)
 452:	0785                	addi	a5,a5,1
 454:	fef43423          	sd	a5,-24(s0)
    p2++;
 458:	fe043783          	ld	a5,-32(s0)
 45c:	0785                	addi	a5,a5,1
 45e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 462:	fcc42783          	lw	a5,-52(s0)
 466:	fff7871b          	addiw	a4,a5,-1
 46a:	fce42623          	sw	a4,-52(s0)
 46e:	f7dd                	bnez	a5,41c <memcmp+0x26>
  }
  return 0;
 470:	4781                	li	a5,0
}
 472:	853e                	mv	a0,a5
 474:	7462                	ld	s0,56(sp)
 476:	6121                	addi	sp,sp,64
 478:	8082                	ret

000000000000047a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 47a:	7179                	addi	sp,sp,-48
 47c:	f406                	sd	ra,40(sp)
 47e:	f022                	sd	s0,32(sp)
 480:	1800                	addi	s0,sp,48
 482:	fea43423          	sd	a0,-24(s0)
 486:	feb43023          	sd	a1,-32(s0)
 48a:	87b2                	mv	a5,a2
 48c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 490:	fdc42783          	lw	a5,-36(s0)
 494:	863e                	mv	a2,a5
 496:	fe043583          	ld	a1,-32(s0)
 49a:	fe843503          	ld	a0,-24(s0)
 49e:	00000097          	auipc	ra,0x0
 4a2:	e96080e7          	jalr	-362(ra) # 334 <memmove>
 4a6:	87aa                	mv	a5,a0
}
 4a8:	853e                	mv	a0,a5
 4aa:	70a2                	ld	ra,40(sp)
 4ac:	7402                	ld	s0,32(sp)
 4ae:	6145                	addi	sp,sp,48
 4b0:	8082                	ret

00000000000004b2 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4b2:	4885                	li	a7,1
 ecall
 4b4:	00000073          	ecall
 ret
 4b8:	8082                	ret

00000000000004ba <exit>:
.global exit
exit:
 li a7, SYS_exit
 4ba:	4889                	li	a7,2
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4c2:	488d                	li	a7,3
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ca:	4891                	li	a7,4
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <read>:
.global read
read:
 li a7, SYS_read
 4d2:	4895                	li	a7,5
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <write>:
.global write
write:
 li a7, SYS_write
 4da:	48c1                	li	a7,16
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <close>:
.global close
close:
 li a7, SYS_close
 4e2:	48d5                	li	a7,21
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ea:	4899                	li	a7,6
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4f2:	489d                	li	a7,7
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <open>:
.global open
open:
 li a7, SYS_open
 4fa:	48bd                	li	a7,15
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 502:	48c5                	li	a7,17
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 50a:	48c9                	li	a7,18
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 512:	48a1                	li	a7,8
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <link>:
.global link
link:
 li a7, SYS_link
 51a:	48cd                	li	a7,19
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 522:	48d1                	li	a7,20
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 52a:	48a5                	li	a7,9
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <dup>:
.global dup
dup:
 li a7, SYS_dup
 532:	48a9                	li	a7,10
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 53a:	48ad                	li	a7,11
 ecall
 53c:	00000073          	ecall
 ret
 540:	8082                	ret

0000000000000542 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 542:	48b1                	li	a7,12
 ecall
 544:	00000073          	ecall
 ret
 548:	8082                	ret

000000000000054a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 54a:	48b5                	li	a7,13
 ecall
 54c:	00000073          	ecall
 ret
 550:	8082                	ret

0000000000000552 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 552:	48b9                	li	a7,14
 ecall
 554:	00000073          	ecall
 ret
 558:	8082                	ret

000000000000055a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 55a:	1101                	addi	sp,sp,-32
 55c:	ec06                	sd	ra,24(sp)
 55e:	e822                	sd	s0,16(sp)
 560:	1000                	addi	s0,sp,32
 562:	87aa                	mv	a5,a0
 564:	872e                	mv	a4,a1
 566:	fef42623          	sw	a5,-20(s0)
 56a:	87ba                	mv	a5,a4
 56c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 570:	feb40713          	addi	a4,s0,-21
 574:	fec42783          	lw	a5,-20(s0)
 578:	4605                	li	a2,1
 57a:	85ba                	mv	a1,a4
 57c:	853e                	mv	a0,a5
 57e:	00000097          	auipc	ra,0x0
 582:	f5c080e7          	jalr	-164(ra) # 4da <write>
}
 586:	0001                	nop
 588:	60e2                	ld	ra,24(sp)
 58a:	6442                	ld	s0,16(sp)
 58c:	6105                	addi	sp,sp,32
 58e:	8082                	ret

0000000000000590 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	7139                	addi	sp,sp,-64
 592:	fc06                	sd	ra,56(sp)
 594:	f822                	sd	s0,48(sp)
 596:	0080                	addi	s0,sp,64
 598:	87aa                	mv	a5,a0
 59a:	8736                	mv	a4,a3
 59c:	fcf42623          	sw	a5,-52(s0)
 5a0:	87ae                	mv	a5,a1
 5a2:	fcf42423          	sw	a5,-56(s0)
 5a6:	87b2                	mv	a5,a2
 5a8:	fcf42223          	sw	a5,-60(s0)
 5ac:	87ba                	mv	a5,a4
 5ae:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5b2:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 5b6:	fc042783          	lw	a5,-64(s0)
 5ba:	2781                	sext.w	a5,a5
 5bc:	c38d                	beqz	a5,5de <printint+0x4e>
 5be:	fc842783          	lw	a5,-56(s0)
 5c2:	2781                	sext.w	a5,a5
 5c4:	0007dd63          	bgez	a5,5de <printint+0x4e>
    neg = 1;
 5c8:	4785                	li	a5,1
 5ca:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 5ce:	fc842783          	lw	a5,-56(s0)
 5d2:	40f007bb          	negw	a5,a5
 5d6:	2781                	sext.w	a5,a5
 5d8:	fef42223          	sw	a5,-28(s0)
 5dc:	a029                	j	5e6 <printint+0x56>
  } else {
    x = xx;
 5de:	fc842783          	lw	a5,-56(s0)
 5e2:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 5e6:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 5ea:	fc442783          	lw	a5,-60(s0)
 5ee:	fe442703          	lw	a4,-28(s0)
 5f2:	02f777bb          	remuw	a5,a4,a5
 5f6:	0007861b          	sext.w	a2,a5
 5fa:	fec42783          	lw	a5,-20(s0)
 5fe:	0017871b          	addiw	a4,a5,1
 602:	fee42623          	sw	a4,-20(s0)
 606:	00000697          	auipc	a3,0x0
 60a:	71a68693          	addi	a3,a3,1818 # d20 <digits>
 60e:	02061713          	slli	a4,a2,0x20
 612:	9301                	srli	a4,a4,0x20
 614:	9736                	add	a4,a4,a3
 616:	00074703          	lbu	a4,0(a4)
 61a:	ff040693          	addi	a3,s0,-16
 61e:	97b6                	add	a5,a5,a3
 620:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 624:	fc442783          	lw	a5,-60(s0)
 628:	fe442703          	lw	a4,-28(s0)
 62c:	02f757bb          	divuw	a5,a4,a5
 630:	fef42223          	sw	a5,-28(s0)
 634:	fe442783          	lw	a5,-28(s0)
 638:	2781                	sext.w	a5,a5
 63a:	fbc5                	bnez	a5,5ea <printint+0x5a>
  if(neg)
 63c:	fe842783          	lw	a5,-24(s0)
 640:	2781                	sext.w	a5,a5
 642:	cf95                	beqz	a5,67e <printint+0xee>
    buf[i++] = '-';
 644:	fec42783          	lw	a5,-20(s0)
 648:	0017871b          	addiw	a4,a5,1
 64c:	fee42623          	sw	a4,-20(s0)
 650:	ff040713          	addi	a4,s0,-16
 654:	97ba                	add	a5,a5,a4
 656:	02d00713          	li	a4,45
 65a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 65e:	a005                	j	67e <printint+0xee>
    putc(fd, buf[i]);
 660:	fec42783          	lw	a5,-20(s0)
 664:	ff040713          	addi	a4,s0,-16
 668:	97ba                	add	a5,a5,a4
 66a:	fe07c703          	lbu	a4,-32(a5)
 66e:	fcc42783          	lw	a5,-52(s0)
 672:	85ba                	mv	a1,a4
 674:	853e                	mv	a0,a5
 676:	00000097          	auipc	ra,0x0
 67a:	ee4080e7          	jalr	-284(ra) # 55a <putc>
  while(--i >= 0)
 67e:	fec42783          	lw	a5,-20(s0)
 682:	37fd                	addiw	a5,a5,-1
 684:	fef42623          	sw	a5,-20(s0)
 688:	fec42783          	lw	a5,-20(s0)
 68c:	2781                	sext.w	a5,a5
 68e:	fc07d9e3          	bgez	a5,660 <printint+0xd0>
}
 692:	0001                	nop
 694:	0001                	nop
 696:	70e2                	ld	ra,56(sp)
 698:	7442                	ld	s0,48(sp)
 69a:	6121                	addi	sp,sp,64
 69c:	8082                	ret

000000000000069e <printptr>:

static void
printptr(int fd, uint64 x) {
 69e:	7179                	addi	sp,sp,-48
 6a0:	f406                	sd	ra,40(sp)
 6a2:	f022                	sd	s0,32(sp)
 6a4:	1800                	addi	s0,sp,48
 6a6:	87aa                	mv	a5,a0
 6a8:	fcb43823          	sd	a1,-48(s0)
 6ac:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 6b0:	fdc42783          	lw	a5,-36(s0)
 6b4:	03000593          	li	a1,48
 6b8:	853e                	mv	a0,a5
 6ba:	00000097          	auipc	ra,0x0
 6be:	ea0080e7          	jalr	-352(ra) # 55a <putc>
  putc(fd, 'x');
 6c2:	fdc42783          	lw	a5,-36(s0)
 6c6:	07800593          	li	a1,120
 6ca:	853e                	mv	a0,a5
 6cc:	00000097          	auipc	ra,0x0
 6d0:	e8e080e7          	jalr	-370(ra) # 55a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6d4:	fe042623          	sw	zero,-20(s0)
 6d8:	a82d                	j	712 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6da:	fd043783          	ld	a5,-48(s0)
 6de:	93f1                	srli	a5,a5,0x3c
 6e0:	00000717          	auipc	a4,0x0
 6e4:	64070713          	addi	a4,a4,1600 # d20 <digits>
 6e8:	97ba                	add	a5,a5,a4
 6ea:	0007c703          	lbu	a4,0(a5)
 6ee:	fdc42783          	lw	a5,-36(s0)
 6f2:	85ba                	mv	a1,a4
 6f4:	853e                	mv	a0,a5
 6f6:	00000097          	auipc	ra,0x0
 6fa:	e64080e7          	jalr	-412(ra) # 55a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6fe:	fec42783          	lw	a5,-20(s0)
 702:	2785                	addiw	a5,a5,1
 704:	fef42623          	sw	a5,-20(s0)
 708:	fd043783          	ld	a5,-48(s0)
 70c:	0792                	slli	a5,a5,0x4
 70e:	fcf43823          	sd	a5,-48(s0)
 712:	fec42783          	lw	a5,-20(s0)
 716:	873e                	mv	a4,a5
 718:	47bd                	li	a5,15
 71a:	fce7f0e3          	bgeu	a5,a4,6da <printptr+0x3c>
}
 71e:	0001                	nop
 720:	0001                	nop
 722:	70a2                	ld	ra,40(sp)
 724:	7402                	ld	s0,32(sp)
 726:	6145                	addi	sp,sp,48
 728:	8082                	ret

000000000000072a <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 72a:	715d                	addi	sp,sp,-80
 72c:	e486                	sd	ra,72(sp)
 72e:	e0a2                	sd	s0,64(sp)
 730:	0880                	addi	s0,sp,80
 732:	87aa                	mv	a5,a0
 734:	fcb43023          	sd	a1,-64(s0)
 738:	fac43c23          	sd	a2,-72(s0)
 73c:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 740:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 744:	fe042223          	sw	zero,-28(s0)
 748:	a42d                	j	972 <vprintf+0x248>
    c = fmt[i] & 0xff;
 74a:	fe442783          	lw	a5,-28(s0)
 74e:	fc043703          	ld	a4,-64(s0)
 752:	97ba                	add	a5,a5,a4
 754:	0007c783          	lbu	a5,0(a5)
 758:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 75c:	fe042783          	lw	a5,-32(s0)
 760:	2781                	sext.w	a5,a5
 762:	eb9d                	bnez	a5,798 <vprintf+0x6e>
      if(c == '%'){
 764:	fdc42783          	lw	a5,-36(s0)
 768:	0007871b          	sext.w	a4,a5
 76c:	02500793          	li	a5,37
 770:	00f71763          	bne	a4,a5,77e <vprintf+0x54>
        state = '%';
 774:	02500793          	li	a5,37
 778:	fef42023          	sw	a5,-32(s0)
 77c:	a2f5                	j	968 <vprintf+0x23e>
      } else {
        putc(fd, c);
 77e:	fdc42783          	lw	a5,-36(s0)
 782:	0ff7f713          	andi	a4,a5,255
 786:	fcc42783          	lw	a5,-52(s0)
 78a:	85ba                	mv	a1,a4
 78c:	853e                	mv	a0,a5
 78e:	00000097          	auipc	ra,0x0
 792:	dcc080e7          	jalr	-564(ra) # 55a <putc>
 796:	aac9                	j	968 <vprintf+0x23e>
      }
    } else if(state == '%'){
 798:	fe042783          	lw	a5,-32(s0)
 79c:	0007871b          	sext.w	a4,a5
 7a0:	02500793          	li	a5,37
 7a4:	1cf71263          	bne	a4,a5,968 <vprintf+0x23e>
      if(c == 'd'){
 7a8:	fdc42783          	lw	a5,-36(s0)
 7ac:	0007871b          	sext.w	a4,a5
 7b0:	06400793          	li	a5,100
 7b4:	02f71463          	bne	a4,a5,7dc <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 7b8:	fb843783          	ld	a5,-72(s0)
 7bc:	00878713          	addi	a4,a5,8
 7c0:	fae43c23          	sd	a4,-72(s0)
 7c4:	4398                	lw	a4,0(a5)
 7c6:	fcc42783          	lw	a5,-52(s0)
 7ca:	4685                	li	a3,1
 7cc:	4629                	li	a2,10
 7ce:	85ba                	mv	a1,a4
 7d0:	853e                	mv	a0,a5
 7d2:	00000097          	auipc	ra,0x0
 7d6:	dbe080e7          	jalr	-578(ra) # 590 <printint>
 7da:	a269                	j	964 <vprintf+0x23a>
      } else if(c == 'l') {
 7dc:	fdc42783          	lw	a5,-36(s0)
 7e0:	0007871b          	sext.w	a4,a5
 7e4:	06c00793          	li	a5,108
 7e8:	02f71663          	bne	a4,a5,814 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7ec:	fb843783          	ld	a5,-72(s0)
 7f0:	00878713          	addi	a4,a5,8
 7f4:	fae43c23          	sd	a4,-72(s0)
 7f8:	639c                	ld	a5,0(a5)
 7fa:	0007871b          	sext.w	a4,a5
 7fe:	fcc42783          	lw	a5,-52(s0)
 802:	4681                	li	a3,0
 804:	4629                	li	a2,10
 806:	85ba                	mv	a1,a4
 808:	853e                	mv	a0,a5
 80a:	00000097          	auipc	ra,0x0
 80e:	d86080e7          	jalr	-634(ra) # 590 <printint>
 812:	aa89                	j	964 <vprintf+0x23a>
      } else if(c == 'x') {
 814:	fdc42783          	lw	a5,-36(s0)
 818:	0007871b          	sext.w	a4,a5
 81c:	07800793          	li	a5,120
 820:	02f71463          	bne	a4,a5,848 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 824:	fb843783          	ld	a5,-72(s0)
 828:	00878713          	addi	a4,a5,8
 82c:	fae43c23          	sd	a4,-72(s0)
 830:	4398                	lw	a4,0(a5)
 832:	fcc42783          	lw	a5,-52(s0)
 836:	4681                	li	a3,0
 838:	4641                	li	a2,16
 83a:	85ba                	mv	a1,a4
 83c:	853e                	mv	a0,a5
 83e:	00000097          	auipc	ra,0x0
 842:	d52080e7          	jalr	-686(ra) # 590 <printint>
 846:	aa39                	j	964 <vprintf+0x23a>
      } else if(c == 'p') {
 848:	fdc42783          	lw	a5,-36(s0)
 84c:	0007871b          	sext.w	a4,a5
 850:	07000793          	li	a5,112
 854:	02f71263          	bne	a4,a5,878 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 858:	fb843783          	ld	a5,-72(s0)
 85c:	00878713          	addi	a4,a5,8
 860:	fae43c23          	sd	a4,-72(s0)
 864:	6398                	ld	a4,0(a5)
 866:	fcc42783          	lw	a5,-52(s0)
 86a:	85ba                	mv	a1,a4
 86c:	853e                	mv	a0,a5
 86e:	00000097          	auipc	ra,0x0
 872:	e30080e7          	jalr	-464(ra) # 69e <printptr>
 876:	a0fd                	j	964 <vprintf+0x23a>
      } else if(c == 's'){
 878:	fdc42783          	lw	a5,-36(s0)
 87c:	0007871b          	sext.w	a4,a5
 880:	07300793          	li	a5,115
 884:	04f71c63          	bne	a4,a5,8dc <vprintf+0x1b2>
        s = va_arg(ap, char*);
 888:	fb843783          	ld	a5,-72(s0)
 88c:	00878713          	addi	a4,a5,8
 890:	fae43c23          	sd	a4,-72(s0)
 894:	639c                	ld	a5,0(a5)
 896:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 89a:	fe843783          	ld	a5,-24(s0)
 89e:	eb8d                	bnez	a5,8d0 <vprintf+0x1a6>
          s = "(null)";
 8a0:	00000797          	auipc	a5,0x0
 8a4:	47878793          	addi	a5,a5,1144 # d18 <malloc+0x13e>
 8a8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8ac:	a015                	j	8d0 <vprintf+0x1a6>
          putc(fd, *s);
 8ae:	fe843783          	ld	a5,-24(s0)
 8b2:	0007c703          	lbu	a4,0(a5)
 8b6:	fcc42783          	lw	a5,-52(s0)
 8ba:	85ba                	mv	a1,a4
 8bc:	853e                	mv	a0,a5
 8be:	00000097          	auipc	ra,0x0
 8c2:	c9c080e7          	jalr	-868(ra) # 55a <putc>
          s++;
 8c6:	fe843783          	ld	a5,-24(s0)
 8ca:	0785                	addi	a5,a5,1
 8cc:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8d0:	fe843783          	ld	a5,-24(s0)
 8d4:	0007c783          	lbu	a5,0(a5)
 8d8:	fbf9                	bnez	a5,8ae <vprintf+0x184>
 8da:	a069                	j	964 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 8dc:	fdc42783          	lw	a5,-36(s0)
 8e0:	0007871b          	sext.w	a4,a5
 8e4:	06300793          	li	a5,99
 8e8:	02f71463          	bne	a4,a5,910 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 8ec:	fb843783          	ld	a5,-72(s0)
 8f0:	00878713          	addi	a4,a5,8
 8f4:	fae43c23          	sd	a4,-72(s0)
 8f8:	439c                	lw	a5,0(a5)
 8fa:	0ff7f713          	andi	a4,a5,255
 8fe:	fcc42783          	lw	a5,-52(s0)
 902:	85ba                	mv	a1,a4
 904:	853e                	mv	a0,a5
 906:	00000097          	auipc	ra,0x0
 90a:	c54080e7          	jalr	-940(ra) # 55a <putc>
 90e:	a899                	j	964 <vprintf+0x23a>
      } else if(c == '%'){
 910:	fdc42783          	lw	a5,-36(s0)
 914:	0007871b          	sext.w	a4,a5
 918:	02500793          	li	a5,37
 91c:	00f71f63          	bne	a4,a5,93a <vprintf+0x210>
        putc(fd, c);
 920:	fdc42783          	lw	a5,-36(s0)
 924:	0ff7f713          	andi	a4,a5,255
 928:	fcc42783          	lw	a5,-52(s0)
 92c:	85ba                	mv	a1,a4
 92e:	853e                	mv	a0,a5
 930:	00000097          	auipc	ra,0x0
 934:	c2a080e7          	jalr	-982(ra) # 55a <putc>
 938:	a035                	j	964 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 93a:	fcc42783          	lw	a5,-52(s0)
 93e:	02500593          	li	a1,37
 942:	853e                	mv	a0,a5
 944:	00000097          	auipc	ra,0x0
 948:	c16080e7          	jalr	-1002(ra) # 55a <putc>
        putc(fd, c);
 94c:	fdc42783          	lw	a5,-36(s0)
 950:	0ff7f713          	andi	a4,a5,255
 954:	fcc42783          	lw	a5,-52(s0)
 958:	85ba                	mv	a1,a4
 95a:	853e                	mv	a0,a5
 95c:	00000097          	auipc	ra,0x0
 960:	bfe080e7          	jalr	-1026(ra) # 55a <putc>
      }
      state = 0;
 964:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 968:	fe442783          	lw	a5,-28(s0)
 96c:	2785                	addiw	a5,a5,1
 96e:	fef42223          	sw	a5,-28(s0)
 972:	fe442783          	lw	a5,-28(s0)
 976:	fc043703          	ld	a4,-64(s0)
 97a:	97ba                	add	a5,a5,a4
 97c:	0007c783          	lbu	a5,0(a5)
 980:	dc0795e3          	bnez	a5,74a <vprintf+0x20>
    }
  }
}
 984:	0001                	nop
 986:	0001                	nop
 988:	60a6                	ld	ra,72(sp)
 98a:	6406                	ld	s0,64(sp)
 98c:	6161                	addi	sp,sp,80
 98e:	8082                	ret

0000000000000990 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 990:	7159                	addi	sp,sp,-112
 992:	fc06                	sd	ra,56(sp)
 994:	f822                	sd	s0,48(sp)
 996:	0080                	addi	s0,sp,64
 998:	fcb43823          	sd	a1,-48(s0)
 99c:	e010                	sd	a2,0(s0)
 99e:	e414                	sd	a3,8(s0)
 9a0:	e818                	sd	a4,16(s0)
 9a2:	ec1c                	sd	a5,24(s0)
 9a4:	03043023          	sd	a6,32(s0)
 9a8:	03143423          	sd	a7,40(s0)
 9ac:	87aa                	mv	a5,a0
 9ae:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 9b2:	03040793          	addi	a5,s0,48
 9b6:	fcf43423          	sd	a5,-56(s0)
 9ba:	fc843783          	ld	a5,-56(s0)
 9be:	fd078793          	addi	a5,a5,-48
 9c2:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 9c6:	fe843703          	ld	a4,-24(s0)
 9ca:	fdc42783          	lw	a5,-36(s0)
 9ce:	863a                	mv	a2,a4
 9d0:	fd043583          	ld	a1,-48(s0)
 9d4:	853e                	mv	a0,a5
 9d6:	00000097          	auipc	ra,0x0
 9da:	d54080e7          	jalr	-684(ra) # 72a <vprintf>
}
 9de:	0001                	nop
 9e0:	70e2                	ld	ra,56(sp)
 9e2:	7442                	ld	s0,48(sp)
 9e4:	6165                	addi	sp,sp,112
 9e6:	8082                	ret

00000000000009e8 <printf>:

void
printf(const char *fmt, ...)
{
 9e8:	7159                	addi	sp,sp,-112
 9ea:	f406                	sd	ra,40(sp)
 9ec:	f022                	sd	s0,32(sp)
 9ee:	1800                	addi	s0,sp,48
 9f0:	fca43c23          	sd	a0,-40(s0)
 9f4:	e40c                	sd	a1,8(s0)
 9f6:	e810                	sd	a2,16(s0)
 9f8:	ec14                	sd	a3,24(s0)
 9fa:	f018                	sd	a4,32(s0)
 9fc:	f41c                	sd	a5,40(s0)
 9fe:	03043823          	sd	a6,48(s0)
 a02:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a06:	04040793          	addi	a5,s0,64
 a0a:	fcf43823          	sd	a5,-48(s0)
 a0e:	fd043783          	ld	a5,-48(s0)
 a12:	fc878793          	addi	a5,a5,-56
 a16:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a1a:	fe843783          	ld	a5,-24(s0)
 a1e:	863e                	mv	a2,a5
 a20:	fd843583          	ld	a1,-40(s0)
 a24:	4505                	li	a0,1
 a26:	00000097          	auipc	ra,0x0
 a2a:	d04080e7          	jalr	-764(ra) # 72a <vprintf>
}
 a2e:	0001                	nop
 a30:	70a2                	ld	ra,40(sp)
 a32:	7402                	ld	s0,32(sp)
 a34:	6165                	addi	sp,sp,112
 a36:	8082                	ret

0000000000000a38 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a38:	7179                	addi	sp,sp,-48
 a3a:	f422                	sd	s0,40(sp)
 a3c:	1800                	addi	s0,sp,48
 a3e:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a42:	fd843783          	ld	a5,-40(s0)
 a46:	17c1                	addi	a5,a5,-16
 a48:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4c:	00000797          	auipc	a5,0x0
 a50:	2fc78793          	addi	a5,a5,764 # d48 <freep>
 a54:	639c                	ld	a5,0(a5)
 a56:	fef43423          	sd	a5,-24(s0)
 a5a:	a815                	j	a8e <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a5c:	fe843783          	ld	a5,-24(s0)
 a60:	639c                	ld	a5,0(a5)
 a62:	fe843703          	ld	a4,-24(s0)
 a66:	00f76f63          	bltu	a4,a5,a84 <free+0x4c>
 a6a:	fe043703          	ld	a4,-32(s0)
 a6e:	fe843783          	ld	a5,-24(s0)
 a72:	02e7eb63          	bltu	a5,a4,aa8 <free+0x70>
 a76:	fe843783          	ld	a5,-24(s0)
 a7a:	639c                	ld	a5,0(a5)
 a7c:	fe043703          	ld	a4,-32(s0)
 a80:	02f76463          	bltu	a4,a5,aa8 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a84:	fe843783          	ld	a5,-24(s0)
 a88:	639c                	ld	a5,0(a5)
 a8a:	fef43423          	sd	a5,-24(s0)
 a8e:	fe043703          	ld	a4,-32(s0)
 a92:	fe843783          	ld	a5,-24(s0)
 a96:	fce7f3e3          	bgeu	a5,a4,a5c <free+0x24>
 a9a:	fe843783          	ld	a5,-24(s0)
 a9e:	639c                	ld	a5,0(a5)
 aa0:	fe043703          	ld	a4,-32(s0)
 aa4:	faf77ce3          	bgeu	a4,a5,a5c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aa8:	fe043783          	ld	a5,-32(s0)
 aac:	479c                	lw	a5,8(a5)
 aae:	1782                	slli	a5,a5,0x20
 ab0:	9381                	srli	a5,a5,0x20
 ab2:	0792                	slli	a5,a5,0x4
 ab4:	fe043703          	ld	a4,-32(s0)
 ab8:	973e                	add	a4,a4,a5
 aba:	fe843783          	ld	a5,-24(s0)
 abe:	639c                	ld	a5,0(a5)
 ac0:	02f71763          	bne	a4,a5,aee <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 ac4:	fe043783          	ld	a5,-32(s0)
 ac8:	4798                	lw	a4,8(a5)
 aca:	fe843783          	ld	a5,-24(s0)
 ace:	639c                	ld	a5,0(a5)
 ad0:	479c                	lw	a5,8(a5)
 ad2:	9fb9                	addw	a5,a5,a4
 ad4:	0007871b          	sext.w	a4,a5
 ad8:	fe043783          	ld	a5,-32(s0)
 adc:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 ade:	fe843783          	ld	a5,-24(s0)
 ae2:	639c                	ld	a5,0(a5)
 ae4:	6398                	ld	a4,0(a5)
 ae6:	fe043783          	ld	a5,-32(s0)
 aea:	e398                	sd	a4,0(a5)
 aec:	a039                	j	afa <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 aee:	fe843783          	ld	a5,-24(s0)
 af2:	6398                	ld	a4,0(a5)
 af4:	fe043783          	ld	a5,-32(s0)
 af8:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 afa:	fe843783          	ld	a5,-24(s0)
 afe:	479c                	lw	a5,8(a5)
 b00:	1782                	slli	a5,a5,0x20
 b02:	9381                	srli	a5,a5,0x20
 b04:	0792                	slli	a5,a5,0x4
 b06:	fe843703          	ld	a4,-24(s0)
 b0a:	97ba                	add	a5,a5,a4
 b0c:	fe043703          	ld	a4,-32(s0)
 b10:	02f71563          	bne	a4,a5,b3a <free+0x102>
    p->s.size += bp->s.size;
 b14:	fe843783          	ld	a5,-24(s0)
 b18:	4798                	lw	a4,8(a5)
 b1a:	fe043783          	ld	a5,-32(s0)
 b1e:	479c                	lw	a5,8(a5)
 b20:	9fb9                	addw	a5,a5,a4
 b22:	0007871b          	sext.w	a4,a5
 b26:	fe843783          	ld	a5,-24(s0)
 b2a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b2c:	fe043783          	ld	a5,-32(s0)
 b30:	6398                	ld	a4,0(a5)
 b32:	fe843783          	ld	a5,-24(s0)
 b36:	e398                	sd	a4,0(a5)
 b38:	a031                	j	b44 <free+0x10c>
  } else
    p->s.ptr = bp;
 b3a:	fe843783          	ld	a5,-24(s0)
 b3e:	fe043703          	ld	a4,-32(s0)
 b42:	e398                	sd	a4,0(a5)
  freep = p;
 b44:	00000797          	auipc	a5,0x0
 b48:	20478793          	addi	a5,a5,516 # d48 <freep>
 b4c:	fe843703          	ld	a4,-24(s0)
 b50:	e398                	sd	a4,0(a5)
}
 b52:	0001                	nop
 b54:	7422                	ld	s0,40(sp)
 b56:	6145                	addi	sp,sp,48
 b58:	8082                	ret

0000000000000b5a <morecore>:

static Header*
morecore(uint nu)
{
 b5a:	7179                	addi	sp,sp,-48
 b5c:	f406                	sd	ra,40(sp)
 b5e:	f022                	sd	s0,32(sp)
 b60:	1800                	addi	s0,sp,48
 b62:	87aa                	mv	a5,a0
 b64:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 b68:	fdc42783          	lw	a5,-36(s0)
 b6c:	0007871b          	sext.w	a4,a5
 b70:	6785                	lui	a5,0x1
 b72:	00f77563          	bgeu	a4,a5,b7c <morecore+0x22>
    nu = 4096;
 b76:	6785                	lui	a5,0x1
 b78:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 b7c:	fdc42783          	lw	a5,-36(s0)
 b80:	0047979b          	slliw	a5,a5,0x4
 b84:	2781                	sext.w	a5,a5
 b86:	2781                	sext.w	a5,a5
 b88:	853e                	mv	a0,a5
 b8a:	00000097          	auipc	ra,0x0
 b8e:	9b8080e7          	jalr	-1608(ra) # 542 <sbrk>
 b92:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 b96:	fe843703          	ld	a4,-24(s0)
 b9a:	57fd                	li	a5,-1
 b9c:	00f71463          	bne	a4,a5,ba4 <morecore+0x4a>
    return 0;
 ba0:	4781                	li	a5,0
 ba2:	a03d                	j	bd0 <morecore+0x76>
  hp = (Header*)p;
 ba4:	fe843783          	ld	a5,-24(s0)
 ba8:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 bac:	fe043783          	ld	a5,-32(s0)
 bb0:	fdc42703          	lw	a4,-36(s0)
 bb4:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 bb6:	fe043783          	ld	a5,-32(s0)
 bba:	07c1                	addi	a5,a5,16
 bbc:	853e                	mv	a0,a5
 bbe:	00000097          	auipc	ra,0x0
 bc2:	e7a080e7          	jalr	-390(ra) # a38 <free>
  return freep;
 bc6:	00000797          	auipc	a5,0x0
 bca:	18278793          	addi	a5,a5,386 # d48 <freep>
 bce:	639c                	ld	a5,0(a5)
}
 bd0:	853e                	mv	a0,a5
 bd2:	70a2                	ld	ra,40(sp)
 bd4:	7402                	ld	s0,32(sp)
 bd6:	6145                	addi	sp,sp,48
 bd8:	8082                	ret

0000000000000bda <malloc>:

void*
malloc(uint nbytes)
{
 bda:	7139                	addi	sp,sp,-64
 bdc:	fc06                	sd	ra,56(sp)
 bde:	f822                	sd	s0,48(sp)
 be0:	0080                	addi	s0,sp,64
 be2:	87aa                	mv	a5,a0
 be4:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 be8:	fcc46783          	lwu	a5,-52(s0)
 bec:	07bd                	addi	a5,a5,15
 bee:	8391                	srli	a5,a5,0x4
 bf0:	2781                	sext.w	a5,a5
 bf2:	2785                	addiw	a5,a5,1
 bf4:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 bf8:	00000797          	auipc	a5,0x0
 bfc:	15078793          	addi	a5,a5,336 # d48 <freep>
 c00:	639c                	ld	a5,0(a5)
 c02:	fef43023          	sd	a5,-32(s0)
 c06:	fe043783          	ld	a5,-32(s0)
 c0a:	ef95                	bnez	a5,c46 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c0c:	00000797          	auipc	a5,0x0
 c10:	12c78793          	addi	a5,a5,300 # d38 <base>
 c14:	fef43023          	sd	a5,-32(s0)
 c18:	00000797          	auipc	a5,0x0
 c1c:	13078793          	addi	a5,a5,304 # d48 <freep>
 c20:	fe043703          	ld	a4,-32(s0)
 c24:	e398                	sd	a4,0(a5)
 c26:	00000797          	auipc	a5,0x0
 c2a:	12278793          	addi	a5,a5,290 # d48 <freep>
 c2e:	6398                	ld	a4,0(a5)
 c30:	00000797          	auipc	a5,0x0
 c34:	10878793          	addi	a5,a5,264 # d38 <base>
 c38:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 c3a:	00000797          	auipc	a5,0x0
 c3e:	0fe78793          	addi	a5,a5,254 # d38 <base>
 c42:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c46:	fe043783          	ld	a5,-32(s0)
 c4a:	639c                	ld	a5,0(a5)
 c4c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 c50:	fe843783          	ld	a5,-24(s0)
 c54:	4798                	lw	a4,8(a5)
 c56:	fdc42783          	lw	a5,-36(s0)
 c5a:	2781                	sext.w	a5,a5
 c5c:	06f76863          	bltu	a4,a5,ccc <malloc+0xf2>
      if(p->s.size == nunits)
 c60:	fe843783          	ld	a5,-24(s0)
 c64:	4798                	lw	a4,8(a5)
 c66:	fdc42783          	lw	a5,-36(s0)
 c6a:	2781                	sext.w	a5,a5
 c6c:	00e79963          	bne	a5,a4,c7e <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 c70:	fe843783          	ld	a5,-24(s0)
 c74:	6398                	ld	a4,0(a5)
 c76:	fe043783          	ld	a5,-32(s0)
 c7a:	e398                	sd	a4,0(a5)
 c7c:	a82d                	j	cb6 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 c7e:	fe843783          	ld	a5,-24(s0)
 c82:	4798                	lw	a4,8(a5)
 c84:	fdc42783          	lw	a5,-36(s0)
 c88:	40f707bb          	subw	a5,a4,a5
 c8c:	0007871b          	sext.w	a4,a5
 c90:	fe843783          	ld	a5,-24(s0)
 c94:	c798                	sw	a4,8(a5)
        p += p->s.size;
 c96:	fe843783          	ld	a5,-24(s0)
 c9a:	479c                	lw	a5,8(a5)
 c9c:	1782                	slli	a5,a5,0x20
 c9e:	9381                	srli	a5,a5,0x20
 ca0:	0792                	slli	a5,a5,0x4
 ca2:	fe843703          	ld	a4,-24(s0)
 ca6:	97ba                	add	a5,a5,a4
 ca8:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 cac:	fe843783          	ld	a5,-24(s0)
 cb0:	fdc42703          	lw	a4,-36(s0)
 cb4:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 cb6:	00000797          	auipc	a5,0x0
 cba:	09278793          	addi	a5,a5,146 # d48 <freep>
 cbe:	fe043703          	ld	a4,-32(s0)
 cc2:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 cc4:	fe843783          	ld	a5,-24(s0)
 cc8:	07c1                	addi	a5,a5,16
 cca:	a091                	j	d0e <malloc+0x134>
    }
    if(p == freep)
 ccc:	00000797          	auipc	a5,0x0
 cd0:	07c78793          	addi	a5,a5,124 # d48 <freep>
 cd4:	639c                	ld	a5,0(a5)
 cd6:	fe843703          	ld	a4,-24(s0)
 cda:	02f71063          	bne	a4,a5,cfa <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 cde:	fdc42783          	lw	a5,-36(s0)
 ce2:	853e                	mv	a0,a5
 ce4:	00000097          	auipc	ra,0x0
 ce8:	e76080e7          	jalr	-394(ra) # b5a <morecore>
 cec:	fea43423          	sd	a0,-24(s0)
 cf0:	fe843783          	ld	a5,-24(s0)
 cf4:	e399                	bnez	a5,cfa <malloc+0x120>
        return 0;
 cf6:	4781                	li	a5,0
 cf8:	a819                	j	d0e <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cfa:	fe843783          	ld	a5,-24(s0)
 cfe:	fef43023          	sd	a5,-32(s0)
 d02:	fe843783          	ld	a5,-24(s0)
 d06:	639c                	ld	a5,0(a5)
 d08:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d0c:	b791                	j	c50 <malloc+0x76>
  }
}
 d0e:	853e                	mv	a0,a5
 d10:	70e2                	ld	ra,56(sp)
 d12:	7442                	ld	s0,48(sp)
 d14:	6121                	addi	sp,sp,64
 d16:	8082                	ret
