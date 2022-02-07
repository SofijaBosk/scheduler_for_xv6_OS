
user/_change_scheduler:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/fs.h"
//#include <string.h>

int
main(int args, char *argv[])
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
   8:	87aa                	mv	a5,a0
   a:	feb43023          	sd	a1,-32(s0)
   e:	fef42623          	sw	a5,-20(s0)
    if(argv[1]){
  12:	fe043783          	ld	a5,-32(s0)
  16:	07a1                	addi	a5,a5,8
  18:	639c                	ld	a5,0(a5)
  1a:	cf99                	beqz	a5,38 <main+0x38>
        changeSchedulingAlgorithm(argv[1]);
  1c:	fe043783          	ld	a5,-32(s0)
  20:	07a1                	addi	a5,a5,8
  22:	639c                	ld	a5,0(a5)
  24:	853e                	mv	a0,a5
  26:	00000097          	auipc	ra,0x0
  2a:	55c080e7          	jalr	1372(ra) # 582 <changeSchedulingAlgorithm>
        exit(0);
  2e:	4501                	li	a0,0
  30:	00000097          	auipc	ra,0x0
  34:	4b2080e7          	jalr	1202(ra) # 4e2 <exit>
    }
    else{
        printf("Not enough parameters \n");
  38:	00001517          	auipc	a0,0x1
  3c:	d1050513          	addi	a0,a0,-752 # d48 <malloc+0x13e>
  40:	00001097          	auipc	ra,0x1
  44:	9d8080e7          	jalr	-1576(ra) # a18 <printf>
        exit(-2);
  48:	5579                	li	a0,-2
  4a:	00000097          	auipc	ra,0x0
  4e:	498080e7          	jalr	1176(ra) # 4e2 <exit>

0000000000000052 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  52:	7179                	addi	sp,sp,-48
  54:	f422                	sd	s0,40(sp)
  56:	1800                	addi	s0,sp,48
  58:	fca43c23          	sd	a0,-40(s0)
  5c:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  60:	fd843783          	ld	a5,-40(s0)
  64:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  68:	0001                	nop
  6a:	fd043703          	ld	a4,-48(s0)
  6e:	00170793          	addi	a5,a4,1
  72:	fcf43823          	sd	a5,-48(s0)
  76:	fd843783          	ld	a5,-40(s0)
  7a:	00178693          	addi	a3,a5,1
  7e:	fcd43c23          	sd	a3,-40(s0)
  82:	00074703          	lbu	a4,0(a4)
  86:	00e78023          	sb	a4,0(a5)
  8a:	0007c783          	lbu	a5,0(a5)
  8e:	fff1                	bnez	a5,6a <strcpy+0x18>
    ;
  return os;
  90:	fe843783          	ld	a5,-24(s0)
}
  94:	853e                	mv	a0,a5
  96:	7422                	ld	s0,40(sp)
  98:	6145                	addi	sp,sp,48
  9a:	8082                	ret

000000000000009c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  9c:	1101                	addi	sp,sp,-32
  9e:	ec22                	sd	s0,24(sp)
  a0:	1000                	addi	s0,sp,32
  a2:	fea43423          	sd	a0,-24(s0)
  a6:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  aa:	a819                	j	c0 <strcmp+0x24>
    p++, q++;
  ac:	fe843783          	ld	a5,-24(s0)
  b0:	0785                	addi	a5,a5,1
  b2:	fef43423          	sd	a5,-24(s0)
  b6:	fe043783          	ld	a5,-32(s0)
  ba:	0785                	addi	a5,a5,1
  bc:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  c0:	fe843783          	ld	a5,-24(s0)
  c4:	0007c783          	lbu	a5,0(a5)
  c8:	cb99                	beqz	a5,de <strcmp+0x42>
  ca:	fe843783          	ld	a5,-24(s0)
  ce:	0007c703          	lbu	a4,0(a5)
  d2:	fe043783          	ld	a5,-32(s0)
  d6:	0007c783          	lbu	a5,0(a5)
  da:	fcf709e3          	beq	a4,a5,ac <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
  de:	fe843783          	ld	a5,-24(s0)
  e2:	0007c783          	lbu	a5,0(a5)
  e6:	0007871b          	sext.w	a4,a5
  ea:	fe043783          	ld	a5,-32(s0)
  ee:	0007c783          	lbu	a5,0(a5)
  f2:	2781                	sext.w	a5,a5
  f4:	40f707bb          	subw	a5,a4,a5
  f8:	2781                	sext.w	a5,a5
}
  fa:	853e                	mv	a0,a5
  fc:	6462                	ld	s0,24(sp)
  fe:	6105                	addi	sp,sp,32
 100:	8082                	ret

0000000000000102 <strlen>:

uint
strlen(const char *s)
{
 102:	7179                	addi	sp,sp,-48
 104:	f422                	sd	s0,40(sp)
 106:	1800                	addi	s0,sp,48
 108:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 10c:	fe042623          	sw	zero,-20(s0)
 110:	a031                	j	11c <strlen+0x1a>
 112:	fec42783          	lw	a5,-20(s0)
 116:	2785                	addiw	a5,a5,1
 118:	fef42623          	sw	a5,-20(s0)
 11c:	fec42783          	lw	a5,-20(s0)
 120:	fd843703          	ld	a4,-40(s0)
 124:	97ba                	add	a5,a5,a4
 126:	0007c783          	lbu	a5,0(a5)
 12a:	f7e5                	bnez	a5,112 <strlen+0x10>
    ;
  return n;
 12c:	fec42783          	lw	a5,-20(s0)
}
 130:	853e                	mv	a0,a5
 132:	7422                	ld	s0,40(sp)
 134:	6145                	addi	sp,sp,48
 136:	8082                	ret

0000000000000138 <memset>:

void*
memset(void *dst, int c, uint n)
{
 138:	7179                	addi	sp,sp,-48
 13a:	f422                	sd	s0,40(sp)
 13c:	1800                	addi	s0,sp,48
 13e:	fca43c23          	sd	a0,-40(s0)
 142:	87ae                	mv	a5,a1
 144:	8732                	mv	a4,a2
 146:	fcf42a23          	sw	a5,-44(s0)
 14a:	87ba                	mv	a5,a4
 14c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 150:	fd843783          	ld	a5,-40(s0)
 154:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 158:	fe042623          	sw	zero,-20(s0)
 15c:	a00d                	j	17e <memset+0x46>
    cdst[i] = c;
 15e:	fec42783          	lw	a5,-20(s0)
 162:	fe043703          	ld	a4,-32(s0)
 166:	97ba                	add	a5,a5,a4
 168:	fd442703          	lw	a4,-44(s0)
 16c:	0ff77713          	andi	a4,a4,255
 170:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 174:	fec42783          	lw	a5,-20(s0)
 178:	2785                	addiw	a5,a5,1
 17a:	fef42623          	sw	a5,-20(s0)
 17e:	fec42703          	lw	a4,-20(s0)
 182:	fd042783          	lw	a5,-48(s0)
 186:	2781                	sext.w	a5,a5
 188:	fcf76be3          	bltu	a4,a5,15e <memset+0x26>
  }
  return dst;
 18c:	fd843783          	ld	a5,-40(s0)
}
 190:	853e                	mv	a0,a5
 192:	7422                	ld	s0,40(sp)
 194:	6145                	addi	sp,sp,48
 196:	8082                	ret

0000000000000198 <strchr>:

char*
strchr(const char *s, char c)
{
 198:	1101                	addi	sp,sp,-32
 19a:	ec22                	sd	s0,24(sp)
 19c:	1000                	addi	s0,sp,32
 19e:	fea43423          	sd	a0,-24(s0)
 1a2:	87ae                	mv	a5,a1
 1a4:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1a8:	a01d                	j	1ce <strchr+0x36>
    if(*s == c)
 1aa:	fe843783          	ld	a5,-24(s0)
 1ae:	0007c703          	lbu	a4,0(a5)
 1b2:	fe744783          	lbu	a5,-25(s0)
 1b6:	0ff7f793          	andi	a5,a5,255
 1ba:	00e79563          	bne	a5,a4,1c4 <strchr+0x2c>
      return (char*)s;
 1be:	fe843783          	ld	a5,-24(s0)
 1c2:	a821                	j	1da <strchr+0x42>
  for(; *s; s++)
 1c4:	fe843783          	ld	a5,-24(s0)
 1c8:	0785                	addi	a5,a5,1
 1ca:	fef43423          	sd	a5,-24(s0)
 1ce:	fe843783          	ld	a5,-24(s0)
 1d2:	0007c783          	lbu	a5,0(a5)
 1d6:	fbf1                	bnez	a5,1aa <strchr+0x12>
  return 0;
 1d8:	4781                	li	a5,0
}
 1da:	853e                	mv	a0,a5
 1dc:	6462                	ld	s0,24(sp)
 1de:	6105                	addi	sp,sp,32
 1e0:	8082                	ret

00000000000001e2 <gets>:

char*
gets(char *buf, int max)
{
 1e2:	7179                	addi	sp,sp,-48
 1e4:	f406                	sd	ra,40(sp)
 1e6:	f022                	sd	s0,32(sp)
 1e8:	1800                	addi	s0,sp,48
 1ea:	fca43c23          	sd	a0,-40(s0)
 1ee:	87ae                	mv	a5,a1
 1f0:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	fe042623          	sw	zero,-20(s0)
 1f8:	a8a1                	j	250 <gets+0x6e>
    cc = read(0, &c, 1);
 1fa:	fe740793          	addi	a5,s0,-25
 1fe:	4605                	li	a2,1
 200:	85be                	mv	a1,a5
 202:	4501                	li	a0,0
 204:	00000097          	auipc	ra,0x0
 208:	2f6080e7          	jalr	758(ra) # 4fa <read>
 20c:	87aa                	mv	a5,a0
 20e:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 212:	fe842783          	lw	a5,-24(s0)
 216:	2781                	sext.w	a5,a5
 218:	04f05763          	blez	a5,266 <gets+0x84>
      break;
    buf[i++] = c;
 21c:	fec42783          	lw	a5,-20(s0)
 220:	0017871b          	addiw	a4,a5,1
 224:	fee42623          	sw	a4,-20(s0)
 228:	873e                	mv	a4,a5
 22a:	fd843783          	ld	a5,-40(s0)
 22e:	97ba                	add	a5,a5,a4
 230:	fe744703          	lbu	a4,-25(s0)
 234:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 238:	fe744783          	lbu	a5,-25(s0)
 23c:	873e                	mv	a4,a5
 23e:	47a9                	li	a5,10
 240:	02f70463          	beq	a4,a5,268 <gets+0x86>
 244:	fe744783          	lbu	a5,-25(s0)
 248:	873e                	mv	a4,a5
 24a:	47b5                	li	a5,13
 24c:	00f70e63          	beq	a4,a5,268 <gets+0x86>
  for(i=0; i+1 < max; ){
 250:	fec42783          	lw	a5,-20(s0)
 254:	2785                	addiw	a5,a5,1
 256:	0007871b          	sext.w	a4,a5
 25a:	fd442783          	lw	a5,-44(s0)
 25e:	2781                	sext.w	a5,a5
 260:	f8f74de3          	blt	a4,a5,1fa <gets+0x18>
 264:	a011                	j	268 <gets+0x86>
      break;
 266:	0001                	nop
      break;
  }
  buf[i] = '\0';
 268:	fec42783          	lw	a5,-20(s0)
 26c:	fd843703          	ld	a4,-40(s0)
 270:	97ba                	add	a5,a5,a4
 272:	00078023          	sb	zero,0(a5)
  return buf;
 276:	fd843783          	ld	a5,-40(s0)
}
 27a:	853e                	mv	a0,a5
 27c:	70a2                	ld	ra,40(sp)
 27e:	7402                	ld	s0,32(sp)
 280:	6145                	addi	sp,sp,48
 282:	8082                	ret

0000000000000284 <stat>:

int
stat(const char *n, struct stat *st)
{
 284:	7179                	addi	sp,sp,-48
 286:	f406                	sd	ra,40(sp)
 288:	f022                	sd	s0,32(sp)
 28a:	1800                	addi	s0,sp,48
 28c:	fca43c23          	sd	a0,-40(s0)
 290:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 294:	4581                	li	a1,0
 296:	fd843503          	ld	a0,-40(s0)
 29a:	00000097          	auipc	ra,0x0
 29e:	288080e7          	jalr	648(ra) # 522 <open>
 2a2:	87aa                	mv	a5,a0
 2a4:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2a8:	fec42783          	lw	a5,-20(s0)
 2ac:	2781                	sext.w	a5,a5
 2ae:	0007d463          	bgez	a5,2b6 <stat+0x32>
    return -1;
 2b2:	57fd                	li	a5,-1
 2b4:	a035                	j	2e0 <stat+0x5c>
  r = fstat(fd, st);
 2b6:	fec42783          	lw	a5,-20(s0)
 2ba:	fd043583          	ld	a1,-48(s0)
 2be:	853e                	mv	a0,a5
 2c0:	00000097          	auipc	ra,0x0
 2c4:	27a080e7          	jalr	634(ra) # 53a <fstat>
 2c8:	87aa                	mv	a5,a0
 2ca:	fef42423          	sw	a5,-24(s0)
  close(fd);
 2ce:	fec42783          	lw	a5,-20(s0)
 2d2:	853e                	mv	a0,a5
 2d4:	00000097          	auipc	ra,0x0
 2d8:	236080e7          	jalr	566(ra) # 50a <close>
  return r;
 2dc:	fe842783          	lw	a5,-24(s0)
}
 2e0:	853e                	mv	a0,a5
 2e2:	70a2                	ld	ra,40(sp)
 2e4:	7402                	ld	s0,32(sp)
 2e6:	6145                	addi	sp,sp,48
 2e8:	8082                	ret

00000000000002ea <atoi>:

int
atoi(const char *s)
{
 2ea:	7179                	addi	sp,sp,-48
 2ec:	f422                	sd	s0,40(sp)
 2ee:	1800                	addi	s0,sp,48
 2f0:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 2f4:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 2f8:	a815                	j	32c <atoi+0x42>
    n = n*10 + *s++ - '0';
 2fa:	fec42703          	lw	a4,-20(s0)
 2fe:	87ba                	mv	a5,a4
 300:	0027979b          	slliw	a5,a5,0x2
 304:	9fb9                	addw	a5,a5,a4
 306:	0017979b          	slliw	a5,a5,0x1
 30a:	0007871b          	sext.w	a4,a5
 30e:	fd843783          	ld	a5,-40(s0)
 312:	00178693          	addi	a3,a5,1
 316:	fcd43c23          	sd	a3,-40(s0)
 31a:	0007c783          	lbu	a5,0(a5)
 31e:	2781                	sext.w	a5,a5
 320:	9fb9                	addw	a5,a5,a4
 322:	2781                	sext.w	a5,a5
 324:	fd07879b          	addiw	a5,a5,-48
 328:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 32c:	fd843783          	ld	a5,-40(s0)
 330:	0007c783          	lbu	a5,0(a5)
 334:	873e                	mv	a4,a5
 336:	02f00793          	li	a5,47
 33a:	00e7fb63          	bgeu	a5,a4,350 <atoi+0x66>
 33e:	fd843783          	ld	a5,-40(s0)
 342:	0007c783          	lbu	a5,0(a5)
 346:	873e                	mv	a4,a5
 348:	03900793          	li	a5,57
 34c:	fae7f7e3          	bgeu	a5,a4,2fa <atoi+0x10>
  return n;
 350:	fec42783          	lw	a5,-20(s0)
}
 354:	853e                	mv	a0,a5
 356:	7422                	ld	s0,40(sp)
 358:	6145                	addi	sp,sp,48
 35a:	8082                	ret

000000000000035c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35c:	7139                	addi	sp,sp,-64
 35e:	fc22                	sd	s0,56(sp)
 360:	0080                	addi	s0,sp,64
 362:	fca43c23          	sd	a0,-40(s0)
 366:	fcb43823          	sd	a1,-48(s0)
 36a:	87b2                	mv	a5,a2
 36c:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 370:	fd843783          	ld	a5,-40(s0)
 374:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 378:	fd043783          	ld	a5,-48(s0)
 37c:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 380:	fe043703          	ld	a4,-32(s0)
 384:	fe843783          	ld	a5,-24(s0)
 388:	02e7fc63          	bgeu	a5,a4,3c0 <memmove+0x64>
    while(n-- > 0)
 38c:	a00d                	j	3ae <memmove+0x52>
      *dst++ = *src++;
 38e:	fe043703          	ld	a4,-32(s0)
 392:	00170793          	addi	a5,a4,1
 396:	fef43023          	sd	a5,-32(s0)
 39a:	fe843783          	ld	a5,-24(s0)
 39e:	00178693          	addi	a3,a5,1
 3a2:	fed43423          	sd	a3,-24(s0)
 3a6:	00074703          	lbu	a4,0(a4)
 3aa:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3ae:	fcc42783          	lw	a5,-52(s0)
 3b2:	fff7871b          	addiw	a4,a5,-1
 3b6:	fce42623          	sw	a4,-52(s0)
 3ba:	fcf04ae3          	bgtz	a5,38e <memmove+0x32>
 3be:	a891                	j	412 <memmove+0xb6>
  } else {
    dst += n;
 3c0:	fcc42783          	lw	a5,-52(s0)
 3c4:	fe843703          	ld	a4,-24(s0)
 3c8:	97ba                	add	a5,a5,a4
 3ca:	fef43423          	sd	a5,-24(s0)
    src += n;
 3ce:	fcc42783          	lw	a5,-52(s0)
 3d2:	fe043703          	ld	a4,-32(s0)
 3d6:	97ba                	add	a5,a5,a4
 3d8:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 3dc:	a01d                	j	402 <memmove+0xa6>
      *--dst = *--src;
 3de:	fe043783          	ld	a5,-32(s0)
 3e2:	17fd                	addi	a5,a5,-1
 3e4:	fef43023          	sd	a5,-32(s0)
 3e8:	fe843783          	ld	a5,-24(s0)
 3ec:	17fd                	addi	a5,a5,-1
 3ee:	fef43423          	sd	a5,-24(s0)
 3f2:	fe043783          	ld	a5,-32(s0)
 3f6:	0007c703          	lbu	a4,0(a5)
 3fa:	fe843783          	ld	a5,-24(s0)
 3fe:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 402:	fcc42783          	lw	a5,-52(s0)
 406:	fff7871b          	addiw	a4,a5,-1
 40a:	fce42623          	sw	a4,-52(s0)
 40e:	fcf048e3          	bgtz	a5,3de <memmove+0x82>
  }
  return vdst;
 412:	fd843783          	ld	a5,-40(s0)
}
 416:	853e                	mv	a0,a5
 418:	7462                	ld	s0,56(sp)
 41a:	6121                	addi	sp,sp,64
 41c:	8082                	ret

000000000000041e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 41e:	7139                	addi	sp,sp,-64
 420:	fc22                	sd	s0,56(sp)
 422:	0080                	addi	s0,sp,64
 424:	fca43c23          	sd	a0,-40(s0)
 428:	fcb43823          	sd	a1,-48(s0)
 42c:	87b2                	mv	a5,a2
 42e:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 432:	fd843783          	ld	a5,-40(s0)
 436:	fef43423          	sd	a5,-24(s0)
 43a:	fd043783          	ld	a5,-48(s0)
 43e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 442:	a0a1                	j	48a <memcmp+0x6c>
    if (*p1 != *p2) {
 444:	fe843783          	ld	a5,-24(s0)
 448:	0007c703          	lbu	a4,0(a5)
 44c:	fe043783          	ld	a5,-32(s0)
 450:	0007c783          	lbu	a5,0(a5)
 454:	02f70163          	beq	a4,a5,476 <memcmp+0x58>
      return *p1 - *p2;
 458:	fe843783          	ld	a5,-24(s0)
 45c:	0007c783          	lbu	a5,0(a5)
 460:	0007871b          	sext.w	a4,a5
 464:	fe043783          	ld	a5,-32(s0)
 468:	0007c783          	lbu	a5,0(a5)
 46c:	2781                	sext.w	a5,a5
 46e:	40f707bb          	subw	a5,a4,a5
 472:	2781                	sext.w	a5,a5
 474:	a01d                	j	49a <memcmp+0x7c>
    }
    p1++;
 476:	fe843783          	ld	a5,-24(s0)
 47a:	0785                	addi	a5,a5,1
 47c:	fef43423          	sd	a5,-24(s0)
    p2++;
 480:	fe043783          	ld	a5,-32(s0)
 484:	0785                	addi	a5,a5,1
 486:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 48a:	fcc42783          	lw	a5,-52(s0)
 48e:	fff7871b          	addiw	a4,a5,-1
 492:	fce42623          	sw	a4,-52(s0)
 496:	f7dd                	bnez	a5,444 <memcmp+0x26>
  }
  return 0;
 498:	4781                	li	a5,0
}
 49a:	853e                	mv	a0,a5
 49c:	7462                	ld	s0,56(sp)
 49e:	6121                	addi	sp,sp,64
 4a0:	8082                	ret

00000000000004a2 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4a2:	7179                	addi	sp,sp,-48
 4a4:	f406                	sd	ra,40(sp)
 4a6:	f022                	sd	s0,32(sp)
 4a8:	1800                	addi	s0,sp,48
 4aa:	fea43423          	sd	a0,-24(s0)
 4ae:	feb43023          	sd	a1,-32(s0)
 4b2:	87b2                	mv	a5,a2
 4b4:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 4b8:	fdc42783          	lw	a5,-36(s0)
 4bc:	863e                	mv	a2,a5
 4be:	fe043583          	ld	a1,-32(s0)
 4c2:	fe843503          	ld	a0,-24(s0)
 4c6:	00000097          	auipc	ra,0x0
 4ca:	e96080e7          	jalr	-362(ra) # 35c <memmove>
 4ce:	87aa                	mv	a5,a0
}
 4d0:	853e                	mv	a0,a5
 4d2:	70a2                	ld	ra,40(sp)
 4d4:	7402                	ld	s0,32(sp)
 4d6:	6145                	addi	sp,sp,48
 4d8:	8082                	ret

00000000000004da <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4da:	4885                	li	a7,1
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <exit>:
.global exit
exit:
 li a7, SYS_exit
 4e2:	4889                	li	a7,2
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <wait>:
.global wait
wait:
 li a7, SYS_wait
 4ea:	488d                	li	a7,3
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4f2:	4891                	li	a7,4
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <read>:
.global read
read:
 li a7, SYS_read
 4fa:	4895                	li	a7,5
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <write>:
.global write
write:
 li a7, SYS_write
 502:	48c1                	li	a7,16
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <close>:
.global close
close:
 li a7, SYS_close
 50a:	48d5                	li	a7,21
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <kill>:
.global kill
kill:
 li a7, SYS_kill
 512:	4899                	li	a7,6
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <exec>:
.global exec
exec:
 li a7, SYS_exec
 51a:	489d                	li	a7,7
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <open>:
.global open
open:
 li a7, SYS_open
 522:	48bd                	li	a7,15
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 52a:	48c5                	li	a7,17
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 532:	48c9                	li	a7,18
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 53a:	48a1                	li	a7,8
 ecall
 53c:	00000073          	ecall
 ret
 540:	8082                	ret

0000000000000542 <link>:
.global link
link:
 li a7, SYS_link
 542:	48cd                	li	a7,19
 ecall
 544:	00000073          	ecall
 ret
 548:	8082                	ret

000000000000054a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 54a:	48d1                	li	a7,20
 ecall
 54c:	00000073          	ecall
 ret
 550:	8082                	ret

0000000000000552 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 552:	48a5                	li	a7,9
 ecall
 554:	00000073          	ecall
 ret
 558:	8082                	ret

000000000000055a <dup>:
.global dup
dup:
 li a7, SYS_dup
 55a:	48a9                	li	a7,10
 ecall
 55c:	00000073          	ecall
 ret
 560:	8082                	ret

0000000000000562 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 562:	48ad                	li	a7,11
 ecall
 564:	00000073          	ecall
 ret
 568:	8082                	ret

000000000000056a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 56a:	48b1                	li	a7,12
 ecall
 56c:	00000073          	ecall
 ret
 570:	8082                	ret

0000000000000572 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 572:	48b5                	li	a7,13
 ecall
 574:	00000073          	ecall
 ret
 578:	8082                	ret

000000000000057a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 57a:	48b9                	li	a7,14
 ecall
 57c:	00000073          	ecall
 ret
 580:	8082                	ret

0000000000000582 <changeSchedulingAlgorithm>:
.global changeSchedulingAlgorithm
changeSchedulingAlgorithm:
 li a7, SYS_changeSchedulingAlgorithm
 582:	48d9                	li	a7,22
 ecall
 584:	00000073          	ecall
 588:	8082                	ret

000000000000058a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 58a:	1101                	addi	sp,sp,-32
 58c:	ec06                	sd	ra,24(sp)
 58e:	e822                	sd	s0,16(sp)
 590:	1000                	addi	s0,sp,32
 592:	87aa                	mv	a5,a0
 594:	872e                	mv	a4,a1
 596:	fef42623          	sw	a5,-20(s0)
 59a:	87ba                	mv	a5,a4
 59c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5a0:	feb40713          	addi	a4,s0,-21
 5a4:	fec42783          	lw	a5,-20(s0)
 5a8:	4605                	li	a2,1
 5aa:	85ba                	mv	a1,a4
 5ac:	853e                	mv	a0,a5
 5ae:	00000097          	auipc	ra,0x0
 5b2:	f54080e7          	jalr	-172(ra) # 502 <write>
}
 5b6:	0001                	nop
 5b8:	60e2                	ld	ra,24(sp)
 5ba:	6442                	ld	s0,16(sp)
 5bc:	6105                	addi	sp,sp,32
 5be:	8082                	ret

00000000000005c0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c0:	7139                	addi	sp,sp,-64
 5c2:	fc06                	sd	ra,56(sp)
 5c4:	f822                	sd	s0,48(sp)
 5c6:	0080                	addi	s0,sp,64
 5c8:	87aa                	mv	a5,a0
 5ca:	8736                	mv	a4,a3
 5cc:	fcf42623          	sw	a5,-52(s0)
 5d0:	87ae                	mv	a5,a1
 5d2:	fcf42423          	sw	a5,-56(s0)
 5d6:	87b2                	mv	a5,a2
 5d8:	fcf42223          	sw	a5,-60(s0)
 5dc:	87ba                	mv	a5,a4
 5de:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5e2:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 5e6:	fc042783          	lw	a5,-64(s0)
 5ea:	2781                	sext.w	a5,a5
 5ec:	c38d                	beqz	a5,60e <printint+0x4e>
 5ee:	fc842783          	lw	a5,-56(s0)
 5f2:	2781                	sext.w	a5,a5
 5f4:	0007dd63          	bgez	a5,60e <printint+0x4e>
    neg = 1;
 5f8:	4785                	li	a5,1
 5fa:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 5fe:	fc842783          	lw	a5,-56(s0)
 602:	40f007bb          	negw	a5,a5
 606:	2781                	sext.w	a5,a5
 608:	fef42223          	sw	a5,-28(s0)
 60c:	a029                	j	616 <printint+0x56>
  } else {
    x = xx;
 60e:	fc842783          	lw	a5,-56(s0)
 612:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 616:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 61a:	fc442783          	lw	a5,-60(s0)
 61e:	fe442703          	lw	a4,-28(s0)
 622:	02f777bb          	remuw	a5,a4,a5
 626:	0007861b          	sext.w	a2,a5
 62a:	fec42783          	lw	a5,-20(s0)
 62e:	0017871b          	addiw	a4,a5,1
 632:	fee42623          	sw	a4,-20(s0)
 636:	00000697          	auipc	a3,0x0
 63a:	73268693          	addi	a3,a3,1842 # d68 <digits>
 63e:	02061713          	slli	a4,a2,0x20
 642:	9301                	srli	a4,a4,0x20
 644:	9736                	add	a4,a4,a3
 646:	00074703          	lbu	a4,0(a4)
 64a:	ff040693          	addi	a3,s0,-16
 64e:	97b6                	add	a5,a5,a3
 650:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 654:	fc442783          	lw	a5,-60(s0)
 658:	fe442703          	lw	a4,-28(s0)
 65c:	02f757bb          	divuw	a5,a4,a5
 660:	fef42223          	sw	a5,-28(s0)
 664:	fe442783          	lw	a5,-28(s0)
 668:	2781                	sext.w	a5,a5
 66a:	fbc5                	bnez	a5,61a <printint+0x5a>
  if(neg)
 66c:	fe842783          	lw	a5,-24(s0)
 670:	2781                	sext.w	a5,a5
 672:	cf95                	beqz	a5,6ae <printint+0xee>
    buf[i++] = '-';
 674:	fec42783          	lw	a5,-20(s0)
 678:	0017871b          	addiw	a4,a5,1
 67c:	fee42623          	sw	a4,-20(s0)
 680:	ff040713          	addi	a4,s0,-16
 684:	97ba                	add	a5,a5,a4
 686:	02d00713          	li	a4,45
 68a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 68e:	a005                	j	6ae <printint+0xee>
    putc(fd, buf[i]);
 690:	fec42783          	lw	a5,-20(s0)
 694:	ff040713          	addi	a4,s0,-16
 698:	97ba                	add	a5,a5,a4
 69a:	fe07c703          	lbu	a4,-32(a5)
 69e:	fcc42783          	lw	a5,-52(s0)
 6a2:	85ba                	mv	a1,a4
 6a4:	853e                	mv	a0,a5
 6a6:	00000097          	auipc	ra,0x0
 6aa:	ee4080e7          	jalr	-284(ra) # 58a <putc>
  while(--i >= 0)
 6ae:	fec42783          	lw	a5,-20(s0)
 6b2:	37fd                	addiw	a5,a5,-1
 6b4:	fef42623          	sw	a5,-20(s0)
 6b8:	fec42783          	lw	a5,-20(s0)
 6bc:	2781                	sext.w	a5,a5
 6be:	fc07d9e3          	bgez	a5,690 <printint+0xd0>
}
 6c2:	0001                	nop
 6c4:	0001                	nop
 6c6:	70e2                	ld	ra,56(sp)
 6c8:	7442                	ld	s0,48(sp)
 6ca:	6121                	addi	sp,sp,64
 6cc:	8082                	ret

00000000000006ce <printptr>:

static void
printptr(int fd, uint64 x) {
 6ce:	7179                	addi	sp,sp,-48
 6d0:	f406                	sd	ra,40(sp)
 6d2:	f022                	sd	s0,32(sp)
 6d4:	1800                	addi	s0,sp,48
 6d6:	87aa                	mv	a5,a0
 6d8:	fcb43823          	sd	a1,-48(s0)
 6dc:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 6e0:	fdc42783          	lw	a5,-36(s0)
 6e4:	03000593          	li	a1,48
 6e8:	853e                	mv	a0,a5
 6ea:	00000097          	auipc	ra,0x0
 6ee:	ea0080e7          	jalr	-352(ra) # 58a <putc>
  putc(fd, 'x');
 6f2:	fdc42783          	lw	a5,-36(s0)
 6f6:	07800593          	li	a1,120
 6fa:	853e                	mv	a0,a5
 6fc:	00000097          	auipc	ra,0x0
 700:	e8e080e7          	jalr	-370(ra) # 58a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 704:	fe042623          	sw	zero,-20(s0)
 708:	a82d                	j	742 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 70a:	fd043783          	ld	a5,-48(s0)
 70e:	93f1                	srli	a5,a5,0x3c
 710:	00000717          	auipc	a4,0x0
 714:	65870713          	addi	a4,a4,1624 # d68 <digits>
 718:	97ba                	add	a5,a5,a4
 71a:	0007c703          	lbu	a4,0(a5)
 71e:	fdc42783          	lw	a5,-36(s0)
 722:	85ba                	mv	a1,a4
 724:	853e                	mv	a0,a5
 726:	00000097          	auipc	ra,0x0
 72a:	e64080e7          	jalr	-412(ra) # 58a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 72e:	fec42783          	lw	a5,-20(s0)
 732:	2785                	addiw	a5,a5,1
 734:	fef42623          	sw	a5,-20(s0)
 738:	fd043783          	ld	a5,-48(s0)
 73c:	0792                	slli	a5,a5,0x4
 73e:	fcf43823          	sd	a5,-48(s0)
 742:	fec42783          	lw	a5,-20(s0)
 746:	873e                	mv	a4,a5
 748:	47bd                	li	a5,15
 74a:	fce7f0e3          	bgeu	a5,a4,70a <printptr+0x3c>
}
 74e:	0001                	nop
 750:	0001                	nop
 752:	70a2                	ld	ra,40(sp)
 754:	7402                	ld	s0,32(sp)
 756:	6145                	addi	sp,sp,48
 758:	8082                	ret

000000000000075a <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 75a:	715d                	addi	sp,sp,-80
 75c:	e486                	sd	ra,72(sp)
 75e:	e0a2                	sd	s0,64(sp)
 760:	0880                	addi	s0,sp,80
 762:	87aa                	mv	a5,a0
 764:	fcb43023          	sd	a1,-64(s0)
 768:	fac43c23          	sd	a2,-72(s0)
 76c:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 770:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 774:	fe042223          	sw	zero,-28(s0)
 778:	a42d                	j	9a2 <vprintf+0x248>
    c = fmt[i] & 0xff;
 77a:	fe442783          	lw	a5,-28(s0)
 77e:	fc043703          	ld	a4,-64(s0)
 782:	97ba                	add	a5,a5,a4
 784:	0007c783          	lbu	a5,0(a5)
 788:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 78c:	fe042783          	lw	a5,-32(s0)
 790:	2781                	sext.w	a5,a5
 792:	eb9d                	bnez	a5,7c8 <vprintf+0x6e>
      if(c == '%'){
 794:	fdc42783          	lw	a5,-36(s0)
 798:	0007871b          	sext.w	a4,a5
 79c:	02500793          	li	a5,37
 7a0:	00f71763          	bne	a4,a5,7ae <vprintf+0x54>
        state = '%';
 7a4:	02500793          	li	a5,37
 7a8:	fef42023          	sw	a5,-32(s0)
 7ac:	a2f5                	j	998 <vprintf+0x23e>
      } else {
        putc(fd, c);
 7ae:	fdc42783          	lw	a5,-36(s0)
 7b2:	0ff7f713          	andi	a4,a5,255
 7b6:	fcc42783          	lw	a5,-52(s0)
 7ba:	85ba                	mv	a1,a4
 7bc:	853e                	mv	a0,a5
 7be:	00000097          	auipc	ra,0x0
 7c2:	dcc080e7          	jalr	-564(ra) # 58a <putc>
 7c6:	aac9                	j	998 <vprintf+0x23e>
      }
    } else if(state == '%'){
 7c8:	fe042783          	lw	a5,-32(s0)
 7cc:	0007871b          	sext.w	a4,a5
 7d0:	02500793          	li	a5,37
 7d4:	1cf71263          	bne	a4,a5,998 <vprintf+0x23e>
      if(c == 'd'){
 7d8:	fdc42783          	lw	a5,-36(s0)
 7dc:	0007871b          	sext.w	a4,a5
 7e0:	06400793          	li	a5,100
 7e4:	02f71463          	bne	a4,a5,80c <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 7e8:	fb843783          	ld	a5,-72(s0)
 7ec:	00878713          	addi	a4,a5,8
 7f0:	fae43c23          	sd	a4,-72(s0)
 7f4:	4398                	lw	a4,0(a5)
 7f6:	fcc42783          	lw	a5,-52(s0)
 7fa:	4685                	li	a3,1
 7fc:	4629                	li	a2,10
 7fe:	85ba                	mv	a1,a4
 800:	853e                	mv	a0,a5
 802:	00000097          	auipc	ra,0x0
 806:	dbe080e7          	jalr	-578(ra) # 5c0 <printint>
 80a:	a269                	j	994 <vprintf+0x23a>
      } else if(c == 'l') {
 80c:	fdc42783          	lw	a5,-36(s0)
 810:	0007871b          	sext.w	a4,a5
 814:	06c00793          	li	a5,108
 818:	02f71663          	bne	a4,a5,844 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 81c:	fb843783          	ld	a5,-72(s0)
 820:	00878713          	addi	a4,a5,8
 824:	fae43c23          	sd	a4,-72(s0)
 828:	639c                	ld	a5,0(a5)
 82a:	0007871b          	sext.w	a4,a5
 82e:	fcc42783          	lw	a5,-52(s0)
 832:	4681                	li	a3,0
 834:	4629                	li	a2,10
 836:	85ba                	mv	a1,a4
 838:	853e                	mv	a0,a5
 83a:	00000097          	auipc	ra,0x0
 83e:	d86080e7          	jalr	-634(ra) # 5c0 <printint>
 842:	aa89                	j	994 <vprintf+0x23a>
      } else if(c == 'x') {
 844:	fdc42783          	lw	a5,-36(s0)
 848:	0007871b          	sext.w	a4,a5
 84c:	07800793          	li	a5,120
 850:	02f71463          	bne	a4,a5,878 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 854:	fb843783          	ld	a5,-72(s0)
 858:	00878713          	addi	a4,a5,8
 85c:	fae43c23          	sd	a4,-72(s0)
 860:	4398                	lw	a4,0(a5)
 862:	fcc42783          	lw	a5,-52(s0)
 866:	4681                	li	a3,0
 868:	4641                	li	a2,16
 86a:	85ba                	mv	a1,a4
 86c:	853e                	mv	a0,a5
 86e:	00000097          	auipc	ra,0x0
 872:	d52080e7          	jalr	-686(ra) # 5c0 <printint>
 876:	aa39                	j	994 <vprintf+0x23a>
      } else if(c == 'p') {
 878:	fdc42783          	lw	a5,-36(s0)
 87c:	0007871b          	sext.w	a4,a5
 880:	07000793          	li	a5,112
 884:	02f71263          	bne	a4,a5,8a8 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 888:	fb843783          	ld	a5,-72(s0)
 88c:	00878713          	addi	a4,a5,8
 890:	fae43c23          	sd	a4,-72(s0)
 894:	6398                	ld	a4,0(a5)
 896:	fcc42783          	lw	a5,-52(s0)
 89a:	85ba                	mv	a1,a4
 89c:	853e                	mv	a0,a5
 89e:	00000097          	auipc	ra,0x0
 8a2:	e30080e7          	jalr	-464(ra) # 6ce <printptr>
 8a6:	a0fd                	j	994 <vprintf+0x23a>
      } else if(c == 's'){
 8a8:	fdc42783          	lw	a5,-36(s0)
 8ac:	0007871b          	sext.w	a4,a5
 8b0:	07300793          	li	a5,115
 8b4:	04f71c63          	bne	a4,a5,90c <vprintf+0x1b2>
        s = va_arg(ap, char*);
 8b8:	fb843783          	ld	a5,-72(s0)
 8bc:	00878713          	addi	a4,a5,8
 8c0:	fae43c23          	sd	a4,-72(s0)
 8c4:	639c                	ld	a5,0(a5)
 8c6:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 8ca:	fe843783          	ld	a5,-24(s0)
 8ce:	eb8d                	bnez	a5,900 <vprintf+0x1a6>
          s = "(null)";
 8d0:	00000797          	auipc	a5,0x0
 8d4:	49078793          	addi	a5,a5,1168 # d60 <malloc+0x156>
 8d8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8dc:	a015                	j	900 <vprintf+0x1a6>
          putc(fd, *s);
 8de:	fe843783          	ld	a5,-24(s0)
 8e2:	0007c703          	lbu	a4,0(a5)
 8e6:	fcc42783          	lw	a5,-52(s0)
 8ea:	85ba                	mv	a1,a4
 8ec:	853e                	mv	a0,a5
 8ee:	00000097          	auipc	ra,0x0
 8f2:	c9c080e7          	jalr	-868(ra) # 58a <putc>
          s++;
 8f6:	fe843783          	ld	a5,-24(s0)
 8fa:	0785                	addi	a5,a5,1
 8fc:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 900:	fe843783          	ld	a5,-24(s0)
 904:	0007c783          	lbu	a5,0(a5)
 908:	fbf9                	bnez	a5,8de <vprintf+0x184>
 90a:	a069                	j	994 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 90c:	fdc42783          	lw	a5,-36(s0)
 910:	0007871b          	sext.w	a4,a5
 914:	06300793          	li	a5,99
 918:	02f71463          	bne	a4,a5,940 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 91c:	fb843783          	ld	a5,-72(s0)
 920:	00878713          	addi	a4,a5,8
 924:	fae43c23          	sd	a4,-72(s0)
 928:	439c                	lw	a5,0(a5)
 92a:	0ff7f713          	andi	a4,a5,255
 92e:	fcc42783          	lw	a5,-52(s0)
 932:	85ba                	mv	a1,a4
 934:	853e                	mv	a0,a5
 936:	00000097          	auipc	ra,0x0
 93a:	c54080e7          	jalr	-940(ra) # 58a <putc>
 93e:	a899                	j	994 <vprintf+0x23a>
      } else if(c == '%'){
 940:	fdc42783          	lw	a5,-36(s0)
 944:	0007871b          	sext.w	a4,a5
 948:	02500793          	li	a5,37
 94c:	00f71f63          	bne	a4,a5,96a <vprintf+0x210>
        putc(fd, c);
 950:	fdc42783          	lw	a5,-36(s0)
 954:	0ff7f713          	andi	a4,a5,255
 958:	fcc42783          	lw	a5,-52(s0)
 95c:	85ba                	mv	a1,a4
 95e:	853e                	mv	a0,a5
 960:	00000097          	auipc	ra,0x0
 964:	c2a080e7          	jalr	-982(ra) # 58a <putc>
 968:	a035                	j	994 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 96a:	fcc42783          	lw	a5,-52(s0)
 96e:	02500593          	li	a1,37
 972:	853e                	mv	a0,a5
 974:	00000097          	auipc	ra,0x0
 978:	c16080e7          	jalr	-1002(ra) # 58a <putc>
        putc(fd, c);
 97c:	fdc42783          	lw	a5,-36(s0)
 980:	0ff7f713          	andi	a4,a5,255
 984:	fcc42783          	lw	a5,-52(s0)
 988:	85ba                	mv	a1,a4
 98a:	853e                	mv	a0,a5
 98c:	00000097          	auipc	ra,0x0
 990:	bfe080e7          	jalr	-1026(ra) # 58a <putc>
      }
      state = 0;
 994:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 998:	fe442783          	lw	a5,-28(s0)
 99c:	2785                	addiw	a5,a5,1
 99e:	fef42223          	sw	a5,-28(s0)
 9a2:	fe442783          	lw	a5,-28(s0)
 9a6:	fc043703          	ld	a4,-64(s0)
 9aa:	97ba                	add	a5,a5,a4
 9ac:	0007c783          	lbu	a5,0(a5)
 9b0:	dc0795e3          	bnez	a5,77a <vprintf+0x20>
    }
  }
}
 9b4:	0001                	nop
 9b6:	0001                	nop
 9b8:	60a6                	ld	ra,72(sp)
 9ba:	6406                	ld	s0,64(sp)
 9bc:	6161                	addi	sp,sp,80
 9be:	8082                	ret

00000000000009c0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9c0:	7159                	addi	sp,sp,-112
 9c2:	fc06                	sd	ra,56(sp)
 9c4:	f822                	sd	s0,48(sp)
 9c6:	0080                	addi	s0,sp,64
 9c8:	fcb43823          	sd	a1,-48(s0)
 9cc:	e010                	sd	a2,0(s0)
 9ce:	e414                	sd	a3,8(s0)
 9d0:	e818                	sd	a4,16(s0)
 9d2:	ec1c                	sd	a5,24(s0)
 9d4:	03043023          	sd	a6,32(s0)
 9d8:	03143423          	sd	a7,40(s0)
 9dc:	87aa                	mv	a5,a0
 9de:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 9e2:	03040793          	addi	a5,s0,48
 9e6:	fcf43423          	sd	a5,-56(s0)
 9ea:	fc843783          	ld	a5,-56(s0)
 9ee:	fd078793          	addi	a5,a5,-48
 9f2:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 9f6:	fe843703          	ld	a4,-24(s0)
 9fa:	fdc42783          	lw	a5,-36(s0)
 9fe:	863a                	mv	a2,a4
 a00:	fd043583          	ld	a1,-48(s0)
 a04:	853e                	mv	a0,a5
 a06:	00000097          	auipc	ra,0x0
 a0a:	d54080e7          	jalr	-684(ra) # 75a <vprintf>
}
 a0e:	0001                	nop
 a10:	70e2                	ld	ra,56(sp)
 a12:	7442                	ld	s0,48(sp)
 a14:	6165                	addi	sp,sp,112
 a16:	8082                	ret

0000000000000a18 <printf>:

void
printf(const char *fmt, ...)
{
 a18:	7159                	addi	sp,sp,-112
 a1a:	f406                	sd	ra,40(sp)
 a1c:	f022                	sd	s0,32(sp)
 a1e:	1800                	addi	s0,sp,48
 a20:	fca43c23          	sd	a0,-40(s0)
 a24:	e40c                	sd	a1,8(s0)
 a26:	e810                	sd	a2,16(s0)
 a28:	ec14                	sd	a3,24(s0)
 a2a:	f018                	sd	a4,32(s0)
 a2c:	f41c                	sd	a5,40(s0)
 a2e:	03043823          	sd	a6,48(s0)
 a32:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a36:	04040793          	addi	a5,s0,64
 a3a:	fcf43823          	sd	a5,-48(s0)
 a3e:	fd043783          	ld	a5,-48(s0)
 a42:	fc878793          	addi	a5,a5,-56
 a46:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a4a:	fe843783          	ld	a5,-24(s0)
 a4e:	863e                	mv	a2,a5
 a50:	fd843583          	ld	a1,-40(s0)
 a54:	4505                	li	a0,1
 a56:	00000097          	auipc	ra,0x0
 a5a:	d04080e7          	jalr	-764(ra) # 75a <vprintf>
}
 a5e:	0001                	nop
 a60:	70a2                	ld	ra,40(sp)
 a62:	7402                	ld	s0,32(sp)
 a64:	6165                	addi	sp,sp,112
 a66:	8082                	ret

0000000000000a68 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a68:	7179                	addi	sp,sp,-48
 a6a:	f422                	sd	s0,40(sp)
 a6c:	1800                	addi	s0,sp,48
 a6e:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a72:	fd843783          	ld	a5,-40(s0)
 a76:	17c1                	addi	a5,a5,-16
 a78:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a7c:	00000797          	auipc	a5,0x0
 a80:	31478793          	addi	a5,a5,788 # d90 <freep>
 a84:	639c                	ld	a5,0(a5)
 a86:	fef43423          	sd	a5,-24(s0)
 a8a:	a815                	j	abe <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a8c:	fe843783          	ld	a5,-24(s0)
 a90:	639c                	ld	a5,0(a5)
 a92:	fe843703          	ld	a4,-24(s0)
 a96:	00f76f63          	bltu	a4,a5,ab4 <free+0x4c>
 a9a:	fe043703          	ld	a4,-32(s0)
 a9e:	fe843783          	ld	a5,-24(s0)
 aa2:	02e7eb63          	bltu	a5,a4,ad8 <free+0x70>
 aa6:	fe843783          	ld	a5,-24(s0)
 aaa:	639c                	ld	a5,0(a5)
 aac:	fe043703          	ld	a4,-32(s0)
 ab0:	02f76463          	bltu	a4,a5,ad8 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab4:	fe843783          	ld	a5,-24(s0)
 ab8:	639c                	ld	a5,0(a5)
 aba:	fef43423          	sd	a5,-24(s0)
 abe:	fe043703          	ld	a4,-32(s0)
 ac2:	fe843783          	ld	a5,-24(s0)
 ac6:	fce7f3e3          	bgeu	a5,a4,a8c <free+0x24>
 aca:	fe843783          	ld	a5,-24(s0)
 ace:	639c                	ld	a5,0(a5)
 ad0:	fe043703          	ld	a4,-32(s0)
 ad4:	faf77ce3          	bgeu	a4,a5,a8c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad8:	fe043783          	ld	a5,-32(s0)
 adc:	479c                	lw	a5,8(a5)
 ade:	1782                	slli	a5,a5,0x20
 ae0:	9381                	srli	a5,a5,0x20
 ae2:	0792                	slli	a5,a5,0x4
 ae4:	fe043703          	ld	a4,-32(s0)
 ae8:	973e                	add	a4,a4,a5
 aea:	fe843783          	ld	a5,-24(s0)
 aee:	639c                	ld	a5,0(a5)
 af0:	02f71763          	bne	a4,a5,b1e <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 af4:	fe043783          	ld	a5,-32(s0)
 af8:	4798                	lw	a4,8(a5)
 afa:	fe843783          	ld	a5,-24(s0)
 afe:	639c                	ld	a5,0(a5)
 b00:	479c                	lw	a5,8(a5)
 b02:	9fb9                	addw	a5,a5,a4
 b04:	0007871b          	sext.w	a4,a5
 b08:	fe043783          	ld	a5,-32(s0)
 b0c:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b0e:	fe843783          	ld	a5,-24(s0)
 b12:	639c                	ld	a5,0(a5)
 b14:	6398                	ld	a4,0(a5)
 b16:	fe043783          	ld	a5,-32(s0)
 b1a:	e398                	sd	a4,0(a5)
 b1c:	a039                	j	b2a <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b1e:	fe843783          	ld	a5,-24(s0)
 b22:	6398                	ld	a4,0(a5)
 b24:	fe043783          	ld	a5,-32(s0)
 b28:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b2a:	fe843783          	ld	a5,-24(s0)
 b2e:	479c                	lw	a5,8(a5)
 b30:	1782                	slli	a5,a5,0x20
 b32:	9381                	srli	a5,a5,0x20
 b34:	0792                	slli	a5,a5,0x4
 b36:	fe843703          	ld	a4,-24(s0)
 b3a:	97ba                	add	a5,a5,a4
 b3c:	fe043703          	ld	a4,-32(s0)
 b40:	02f71563          	bne	a4,a5,b6a <free+0x102>
    p->s.size += bp->s.size;
 b44:	fe843783          	ld	a5,-24(s0)
 b48:	4798                	lw	a4,8(a5)
 b4a:	fe043783          	ld	a5,-32(s0)
 b4e:	479c                	lw	a5,8(a5)
 b50:	9fb9                	addw	a5,a5,a4
 b52:	0007871b          	sext.w	a4,a5
 b56:	fe843783          	ld	a5,-24(s0)
 b5a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b5c:	fe043783          	ld	a5,-32(s0)
 b60:	6398                	ld	a4,0(a5)
 b62:	fe843783          	ld	a5,-24(s0)
 b66:	e398                	sd	a4,0(a5)
 b68:	a031                	j	b74 <free+0x10c>
  } else
    p->s.ptr = bp;
 b6a:	fe843783          	ld	a5,-24(s0)
 b6e:	fe043703          	ld	a4,-32(s0)
 b72:	e398                	sd	a4,0(a5)
  freep = p;
 b74:	00000797          	auipc	a5,0x0
 b78:	21c78793          	addi	a5,a5,540 # d90 <freep>
 b7c:	fe843703          	ld	a4,-24(s0)
 b80:	e398                	sd	a4,0(a5)
}
 b82:	0001                	nop
 b84:	7422                	ld	s0,40(sp)
 b86:	6145                	addi	sp,sp,48
 b88:	8082                	ret

0000000000000b8a <morecore>:

static Header*
morecore(uint nu)
{
 b8a:	7179                	addi	sp,sp,-48
 b8c:	f406                	sd	ra,40(sp)
 b8e:	f022                	sd	s0,32(sp)
 b90:	1800                	addi	s0,sp,48
 b92:	87aa                	mv	a5,a0
 b94:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 b98:	fdc42783          	lw	a5,-36(s0)
 b9c:	0007871b          	sext.w	a4,a5
 ba0:	6785                	lui	a5,0x1
 ba2:	00f77563          	bgeu	a4,a5,bac <morecore+0x22>
    nu = 4096;
 ba6:	6785                	lui	a5,0x1
 ba8:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 bac:	fdc42783          	lw	a5,-36(s0)
 bb0:	0047979b          	slliw	a5,a5,0x4
 bb4:	2781                	sext.w	a5,a5
 bb6:	2781                	sext.w	a5,a5
 bb8:	853e                	mv	a0,a5
 bba:	00000097          	auipc	ra,0x0
 bbe:	9b0080e7          	jalr	-1616(ra) # 56a <sbrk>
 bc2:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 bc6:	fe843703          	ld	a4,-24(s0)
 bca:	57fd                	li	a5,-1
 bcc:	00f71463          	bne	a4,a5,bd4 <morecore+0x4a>
    return 0;
 bd0:	4781                	li	a5,0
 bd2:	a03d                	j	c00 <morecore+0x76>
  hp = (Header*)p;
 bd4:	fe843783          	ld	a5,-24(s0)
 bd8:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 bdc:	fe043783          	ld	a5,-32(s0)
 be0:	fdc42703          	lw	a4,-36(s0)
 be4:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 be6:	fe043783          	ld	a5,-32(s0)
 bea:	07c1                	addi	a5,a5,16
 bec:	853e                	mv	a0,a5
 bee:	00000097          	auipc	ra,0x0
 bf2:	e7a080e7          	jalr	-390(ra) # a68 <free>
  return freep;
 bf6:	00000797          	auipc	a5,0x0
 bfa:	19a78793          	addi	a5,a5,410 # d90 <freep>
 bfe:	639c                	ld	a5,0(a5)
}
 c00:	853e                	mv	a0,a5
 c02:	70a2                	ld	ra,40(sp)
 c04:	7402                	ld	s0,32(sp)
 c06:	6145                	addi	sp,sp,48
 c08:	8082                	ret

0000000000000c0a <malloc>:

void*
malloc(uint nbytes)
{
 c0a:	7139                	addi	sp,sp,-64
 c0c:	fc06                	sd	ra,56(sp)
 c0e:	f822                	sd	s0,48(sp)
 c10:	0080                	addi	s0,sp,64
 c12:	87aa                	mv	a5,a0
 c14:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c18:	fcc46783          	lwu	a5,-52(s0)
 c1c:	07bd                	addi	a5,a5,15
 c1e:	8391                	srli	a5,a5,0x4
 c20:	2781                	sext.w	a5,a5
 c22:	2785                	addiw	a5,a5,1
 c24:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c28:	00000797          	auipc	a5,0x0
 c2c:	16878793          	addi	a5,a5,360 # d90 <freep>
 c30:	639c                	ld	a5,0(a5)
 c32:	fef43023          	sd	a5,-32(s0)
 c36:	fe043783          	ld	a5,-32(s0)
 c3a:	ef95                	bnez	a5,c76 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c3c:	00000797          	auipc	a5,0x0
 c40:	14478793          	addi	a5,a5,324 # d80 <base>
 c44:	fef43023          	sd	a5,-32(s0)
 c48:	00000797          	auipc	a5,0x0
 c4c:	14878793          	addi	a5,a5,328 # d90 <freep>
 c50:	fe043703          	ld	a4,-32(s0)
 c54:	e398                	sd	a4,0(a5)
 c56:	00000797          	auipc	a5,0x0
 c5a:	13a78793          	addi	a5,a5,314 # d90 <freep>
 c5e:	6398                	ld	a4,0(a5)
 c60:	00000797          	auipc	a5,0x0
 c64:	12078793          	addi	a5,a5,288 # d80 <base>
 c68:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 c6a:	00000797          	auipc	a5,0x0
 c6e:	11678793          	addi	a5,a5,278 # d80 <base>
 c72:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c76:	fe043783          	ld	a5,-32(s0)
 c7a:	639c                	ld	a5,0(a5)
 c7c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 c80:	fe843783          	ld	a5,-24(s0)
 c84:	4798                	lw	a4,8(a5)
 c86:	fdc42783          	lw	a5,-36(s0)
 c8a:	2781                	sext.w	a5,a5
 c8c:	06f76863          	bltu	a4,a5,cfc <malloc+0xf2>
      if(p->s.size == nunits)
 c90:	fe843783          	ld	a5,-24(s0)
 c94:	4798                	lw	a4,8(a5)
 c96:	fdc42783          	lw	a5,-36(s0)
 c9a:	2781                	sext.w	a5,a5
 c9c:	00e79963          	bne	a5,a4,cae <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 ca0:	fe843783          	ld	a5,-24(s0)
 ca4:	6398                	ld	a4,0(a5)
 ca6:	fe043783          	ld	a5,-32(s0)
 caa:	e398                	sd	a4,0(a5)
 cac:	a82d                	j	ce6 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 cae:	fe843783          	ld	a5,-24(s0)
 cb2:	4798                	lw	a4,8(a5)
 cb4:	fdc42783          	lw	a5,-36(s0)
 cb8:	40f707bb          	subw	a5,a4,a5
 cbc:	0007871b          	sext.w	a4,a5
 cc0:	fe843783          	ld	a5,-24(s0)
 cc4:	c798                	sw	a4,8(a5)
        p += p->s.size;
 cc6:	fe843783          	ld	a5,-24(s0)
 cca:	479c                	lw	a5,8(a5)
 ccc:	1782                	slli	a5,a5,0x20
 cce:	9381                	srli	a5,a5,0x20
 cd0:	0792                	slli	a5,a5,0x4
 cd2:	fe843703          	ld	a4,-24(s0)
 cd6:	97ba                	add	a5,a5,a4
 cd8:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 cdc:	fe843783          	ld	a5,-24(s0)
 ce0:	fdc42703          	lw	a4,-36(s0)
 ce4:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 ce6:	00000797          	auipc	a5,0x0
 cea:	0aa78793          	addi	a5,a5,170 # d90 <freep>
 cee:	fe043703          	ld	a4,-32(s0)
 cf2:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 cf4:	fe843783          	ld	a5,-24(s0)
 cf8:	07c1                	addi	a5,a5,16
 cfa:	a091                	j	d3e <malloc+0x134>
    }
    if(p == freep)
 cfc:	00000797          	auipc	a5,0x0
 d00:	09478793          	addi	a5,a5,148 # d90 <freep>
 d04:	639c                	ld	a5,0(a5)
 d06:	fe843703          	ld	a4,-24(s0)
 d0a:	02f71063          	bne	a4,a5,d2a <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d0e:	fdc42783          	lw	a5,-36(s0)
 d12:	853e                	mv	a0,a5
 d14:	00000097          	auipc	ra,0x0
 d18:	e76080e7          	jalr	-394(ra) # b8a <morecore>
 d1c:	fea43423          	sd	a0,-24(s0)
 d20:	fe843783          	ld	a5,-24(s0)
 d24:	e399                	bnez	a5,d2a <malloc+0x120>
        return 0;
 d26:	4781                	li	a5,0
 d28:	a819                	j	d3e <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d2a:	fe843783          	ld	a5,-24(s0)
 d2e:	fef43023          	sd	a5,-32(s0)
 d32:	fe843783          	ld	a5,-24(s0)
 d36:	639c                	ld	a5,0(a5)
 d38:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d3c:	b791                	j	c80 <malloc+0x76>
  }
}
 d3e:	853e                	mv	a0,a5
 d40:	70e2                	ld	ra,56(sp)
 d42:	7442                	ld	s0,48(sp)
 d44:	6121                	addi	sp,sp,64
 d46:	8082                	ret
