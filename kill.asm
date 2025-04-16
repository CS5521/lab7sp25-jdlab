
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 40 09 00 	movl   $0x940,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 51 05 00 00       	call   574 <printf>
    exit();
  23:	e8 c4 03 00 00       	call   3ec <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 27                	jmp    59 <main+0x59>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 f1 01 00 00       	call   23d <atoi>
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 c8 03 00 00       	call   41c <kill>
  for(i=1; i<argc; i++)
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5d:	3b 45 08             	cmp    0x8(%ebp),%eax
  60:	7c d0                	jl     32 <main+0x32>
  exit();
  62:	e8 85 03 00 00       	call   3ec <exit>

00000067 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	57                   	push   %edi
  6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6f:	8b 55 10             	mov    0x10(%ebp),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	89 cb                	mov    %ecx,%ebx
  77:	89 df                	mov    %ebx,%edi
  79:	89 d1                	mov    %edx,%ecx
  7b:	fc                   	cld    
  7c:	f3 aa                	rep stos %al,%es:(%edi)
  7e:	89 ca                	mov    %ecx,%edx
  80:	89 fb                	mov    %edi,%ebx
  82:	89 5d 08             	mov    %ebx,0x8(%ebp)
  85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  88:	5b                   	pop    %ebx
  89:	5f                   	pop    %edi
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  98:	90                   	nop
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	89 55 08             	mov    %edx,0x8(%ebp)
  a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  a5:	8d 4a 01             	lea    0x1(%edx),%ecx
  a8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ab:	0f b6 12             	movzbl (%edx),%edx
  ae:	88 10                	mov    %dl,(%eax)
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	84 c0                	test   %al,%al
  b5:	75 e2                	jne    99 <strcpy+0xd>
    ;
  return os;
  b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ba:	c9                   	leave  
  bb:	c3                   	ret    

000000bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  bf:	eb 08                	jmp    c9 <strcmp+0xd>
    p++, q++;
  c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	0f b6 00             	movzbl (%eax),%eax
  cf:	84 c0                	test   %al,%al
  d1:	74 10                	je     e3 <strcmp+0x27>
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 10             	movzbl (%eax),%edx
  d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	38 c2                	cmp    %al,%dl
  e1:	74 de                	je     c1 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	0f b6 d0             	movzbl %al,%edx
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	0f b6 c0             	movzbl %al,%eax
  f5:	29 c2                	sub    %eax,%edx
  f7:	89 d0                	mov    %edx,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <strlen>:

uint
strlen(const char *s)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 108:	eb 04                	jmp    10e <strlen+0x13>
 10a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	01 d0                	add    %edx,%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 ed                	jne    10a <strlen+0xf>
    ;
  return n;
 11d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <memset>:

void*
memset(void *dst, int c, uint n)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 128:	8b 45 10             	mov    0x10(%ebp),%eax
 12b:	89 44 24 08          	mov    %eax,0x8(%esp)
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 44 24 04          	mov    %eax,0x4(%esp)
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	89 04 24             	mov    %eax,(%esp)
 13c:	e8 26 ff ff ff       	call   67 <stosb>
  return dst;
 141:	8b 45 08             	mov    0x8(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 04             	sub    $0x4,%esp
 14c:	8b 45 0c             	mov    0xc(%ebp),%eax
 14f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 152:	eb 14                	jmp    168 <strchr+0x22>
    if(*s == c)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15d:	75 05                	jne    164 <strchr+0x1e>
      return (char*)s;
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	eb 13                	jmp    177 <strchr+0x31>
  for(; *s; s++)
 164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	84 c0                	test   %al,%al
 170:	75 e2                	jne    154 <strchr+0xe>
  return 0;
 172:	b8 00 00 00 00       	mov    $0x0,%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <gets>:

char*
gets(char *buf, int max)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 186:	eb 4c                	jmp    1d4 <gets+0x5b>
    cc = read(0, &c, 1);
 188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18f:	00 
 190:	8d 45 ef             	lea    -0x11(%ebp),%eax
 193:	89 44 24 04          	mov    %eax,0x4(%esp)
 197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19e:	e8 61 02 00 00       	call   404 <read>
 1a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1aa:	7f 02                	jg     1ae <gets+0x35>
      break;
 1ac:	eb 31                	jmp    1df <gets+0x66>
    buf[i++] = c;
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	8d 50 01             	lea    0x1(%eax),%edx
 1b4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b7:	89 c2                	mov    %eax,%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 c2                	add    %eax,%edx
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0a                	cmp    $0xa,%al
 1ca:	74 13                	je     1df <gets+0x66>
 1cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d0:	3c 0d                	cmp    $0xd,%al
 1d2:	74 0b                	je     1df <gets+0x66>
  for(i=0; i+1 < max; ){
 1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1dd:	7c a9                	jl     188 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1df:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ed:	c9                   	leave  
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fc:	00 
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	89 04 24             	mov    %eax,(%esp)
 203:	e8 24 02 00 00       	call   42c <open>
 208:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 20f:	79 07                	jns    218 <stat+0x29>
    return -1;
 211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 216:	eb 23                	jmp    23b <stat+0x4c>
  r = fstat(fd, st);
 218:	8b 45 0c             	mov    0xc(%ebp),%eax
 21b:	89 44 24 04          	mov    %eax,0x4(%esp)
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 1a 02 00 00       	call   444 <fstat>
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 230:	89 04 24             	mov    %eax,(%esp)
 233:	e8 dc 01 00 00       	call   414 <close>
  return r;
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <atoi>:

int
atoi(const char *s)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24a:	eb 25                	jmp    271 <atoi+0x34>
    n = n*10 + *s++ - '0';
 24c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24f:	89 d0                	mov    %edx,%eax
 251:	c1 e0 02             	shl    $0x2,%eax
 254:	01 d0                	add    %edx,%eax
 256:	01 c0                	add    %eax,%eax
 258:	89 c1                	mov    %eax,%ecx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 08             	mov    %edx,0x8(%ebp)
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f be c0             	movsbl %al,%eax
 269:	01 c8                	add    %ecx,%eax
 26b:	83 e8 30             	sub    $0x30,%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	0f b6 00             	movzbl (%eax),%eax
 277:	3c 2f                	cmp    $0x2f,%al
 279:	7e 0a                	jle    285 <atoi+0x48>
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	3c 39                	cmp    $0x39,%al
 283:	7e c7                	jle    24c <atoi+0xf>
  return n;
 285:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29c:	eb 17                	jmp    2b5 <memmove+0x2b>
    *dst++ = *src++;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a1:	8d 50 01             	lea    0x1(%eax),%edx
 2a4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2aa:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ad:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b0:	0f b6 12             	movzbl (%edx),%edx
 2b3:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2b5:	8b 45 10             	mov    0x10(%ebp),%eax
 2b8:	8d 50 ff             	lea    -0x1(%eax),%edx
 2bb:	89 55 10             	mov    %edx,0x10(%ebp)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7f dc                	jg     29e <memmove+0x14>
  return vdst;
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <ps>:

void
ps(void)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2d3:	c7 44 24 04 54 09 00 	movl   $0x954,0x4(%esp)
 2da:	00 
 2db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e2:	e8 8d 02 00 00       	call   574 <printf>
  getpinfo(&pinfo);
 2e7:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2ed:	89 04 24             	mov    %eax,(%esp)
 2f0:	e8 97 01 00 00       	call   48c <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 2f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2fc:	e9 ce 00 00 00       	jmp    3cf <ps+0x108>
      if (pinfo[i].inuse) {
 301:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 304:	89 d0                	mov    %edx,%eax
 306:	c1 e0 03             	shl    $0x3,%eax
 309:	01 d0                	add    %edx,%eax
 30b:	c1 e0 02             	shl    $0x2,%eax
 30e:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 311:	01 d8                	add    %ebx,%eax
 313:	2d 04 09 00 00       	sub    $0x904,%eax
 318:	8b 00                	mov    (%eax),%eax
 31a:	85 c0                	test   %eax,%eax
 31c:	0f 84 a9 00 00 00    	je     3cb <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 322:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 328:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 32b:	89 d0                	mov    %edx,%eax
 32d:	c1 e0 03             	shl    $0x3,%eax
 330:	01 d0                	add    %edx,%eax
 332:	c1 e0 02             	shl    $0x2,%eax
 335:	83 c0 10             	add    $0x10,%eax
 338:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 33b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 33e:	89 d0                	mov    %edx,%eax
 340:	c1 e0 03             	shl    $0x3,%eax
 343:	01 d0                	add    %edx,%eax
 345:	c1 e0 02             	shl    $0x2,%eax
 348:	8d 75 e8             	lea    -0x18(%ebp),%esi
 34b:	01 f0                	add    %esi,%eax
 34d:	2d e4 08 00 00       	sub    $0x8e4,%eax
 352:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 355:	0f be f0             	movsbl %al,%esi
 358:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 35b:	89 d0                	mov    %edx,%eax
 35d:	c1 e0 03             	shl    $0x3,%eax
 360:	01 d0                	add    %edx,%eax
 362:	c1 e0 02             	shl    $0x2,%eax
 365:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 368:	01 c8                	add    %ecx,%eax
 36a:	2d f8 08 00 00       	sub    $0x8f8,%eax
 36f:	8b 18                	mov    (%eax),%ebx
 371:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 374:	89 d0                	mov    %edx,%eax
 376:	c1 e0 03             	shl    $0x3,%eax
 379:	01 d0                	add    %edx,%eax
 37b:	c1 e0 02             	shl    $0x2,%eax
 37e:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 381:	01 c8                	add    %ecx,%eax
 383:	2d 00 09 00 00       	sub    $0x900,%eax
 388:	8b 08                	mov    (%eax),%ecx
 38a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 38d:	89 d0                	mov    %edx,%eax
 38f:	c1 e0 03             	shl    $0x3,%eax
 392:	01 d0                	add    %edx,%eax
 394:	c1 e0 02             	shl    $0x2,%eax
 397:	8d 55 e8             	lea    -0x18(%ebp),%edx
 39a:	01 d0                	add    %edx,%eax
 39c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3a1:	8b 00                	mov    (%eax),%eax
 3a3:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3a7:	89 74 24 14          	mov    %esi,0x14(%esp)
 3ab:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3af:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3b3:	89 44 24 08          	mov    %eax,0x8(%esp)
 3b7:	c7 44 24 04 6d 09 00 	movl   $0x96d,0x4(%esp)
 3be:	00 
 3bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3c6:	e8 a9 01 00 00       	call   574 <printf>
  for (i = 0; i < NPROC; i++) {
 3cb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3cf:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3d3:	0f 8e 28 ff ff ff    	jle    301 <ps+0x3a>
      }
  }

}
 3d9:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3df:	5b                   	pop    %ebx
 3e0:	5e                   	pop    %esi
 3e1:	5f                   	pop    %edi
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    

000003e4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e4:	b8 01 00 00 00       	mov    $0x1,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <exit>:
SYSCALL(exit)
 3ec:	b8 02 00 00 00       	mov    $0x2,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <wait>:
SYSCALL(wait)
 3f4:	b8 03 00 00 00       	mov    $0x3,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <pipe>:
SYSCALL(pipe)
 3fc:	b8 04 00 00 00       	mov    $0x4,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <read>:
SYSCALL(read)
 404:	b8 05 00 00 00       	mov    $0x5,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <write>:
SYSCALL(write)
 40c:	b8 10 00 00 00       	mov    $0x10,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <close>:
SYSCALL(close)
 414:	b8 15 00 00 00       	mov    $0x15,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <kill>:
SYSCALL(kill)
 41c:	b8 06 00 00 00       	mov    $0x6,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <exec>:
SYSCALL(exec)
 424:	b8 07 00 00 00       	mov    $0x7,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <open>:
SYSCALL(open)
 42c:	b8 0f 00 00 00       	mov    $0xf,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <mknod>:
SYSCALL(mknod)
 434:	b8 11 00 00 00       	mov    $0x11,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <unlink>:
SYSCALL(unlink)
 43c:	b8 12 00 00 00       	mov    $0x12,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <fstat>:
SYSCALL(fstat)
 444:	b8 08 00 00 00       	mov    $0x8,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <link>:
SYSCALL(link)
 44c:	b8 13 00 00 00       	mov    $0x13,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <mkdir>:
SYSCALL(mkdir)
 454:	b8 14 00 00 00       	mov    $0x14,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <chdir>:
SYSCALL(chdir)
 45c:	b8 09 00 00 00       	mov    $0x9,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <dup>:
SYSCALL(dup)
 464:	b8 0a 00 00 00       	mov    $0xa,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <getpid>:
SYSCALL(getpid)
 46c:	b8 0b 00 00 00       	mov    $0xb,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <sbrk>:
SYSCALL(sbrk)
 474:	b8 0c 00 00 00       	mov    $0xc,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <sleep>:
SYSCALL(sleep)
 47c:	b8 0d 00 00 00       	mov    $0xd,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <uptime>:
SYSCALL(uptime)
 484:	b8 0e 00 00 00       	mov    $0xe,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <getpinfo>:
SYSCALL(getpinfo)
 48c:	b8 16 00 00 00       	mov    $0x16,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	83 ec 18             	sub    $0x18,%esp
 49a:	8b 45 0c             	mov    0xc(%ebp),%eax
 49d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a7:	00 
 4a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 4af:	8b 45 08             	mov    0x8(%ebp),%eax
 4b2:	89 04 24             	mov    %eax,(%esp)
 4b5:	e8 52 ff ff ff       	call   40c <write>
}
 4ba:	c9                   	leave  
 4bb:	c3                   	ret    

000004bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4bc:	55                   	push   %ebp
 4bd:	89 e5                	mov    %esp,%ebp
 4bf:	56                   	push   %esi
 4c0:	53                   	push   %ebx
 4c1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4cb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4cf:	74 17                	je     4e8 <printint+0x2c>
 4d1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4d5:	79 11                	jns    4e8 <printint+0x2c>
    neg = 1;
 4d7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4de:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e1:	f7 d8                	neg    %eax
 4e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e6:	eb 06                	jmp    4ee <printint+0x32>
  } else {
    x = xx;
 4e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4f5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4f8:	8d 41 01             	lea    0x1(%ecx),%eax
 4fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
 501:	8b 45 ec             	mov    -0x14(%ebp),%eax
 504:	ba 00 00 00 00       	mov    $0x0,%edx
 509:	f7 f3                	div    %ebx
 50b:	89 d0                	mov    %edx,%eax
 50d:	0f b6 80 f8 0b 00 00 	movzbl 0xbf8(%eax),%eax
 514:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 518:	8b 75 10             	mov    0x10(%ebp),%esi
 51b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 51e:	ba 00 00 00 00       	mov    $0x0,%edx
 523:	f7 f6                	div    %esi
 525:	89 45 ec             	mov    %eax,-0x14(%ebp)
 528:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 52c:	75 c7                	jne    4f5 <printint+0x39>
  if(neg)
 52e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 532:	74 10                	je     544 <printint+0x88>
    buf[i++] = '-';
 534:	8b 45 f4             	mov    -0xc(%ebp),%eax
 537:	8d 50 01             	lea    0x1(%eax),%edx
 53a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 53d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 542:	eb 1f                	jmp    563 <printint+0xa7>
 544:	eb 1d                	jmp    563 <printint+0xa7>
    putc(fd, buf[i]);
 546:	8d 55 dc             	lea    -0x24(%ebp),%edx
 549:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54c:	01 d0                	add    %edx,%eax
 54e:	0f b6 00             	movzbl (%eax),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	89 44 24 04          	mov    %eax,0x4(%esp)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 04 24             	mov    %eax,(%esp)
 55e:	e8 31 ff ff ff       	call   494 <putc>
  while(--i >= 0)
 563:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 567:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56b:	79 d9                	jns    546 <printint+0x8a>
}
 56d:	83 c4 30             	add    $0x30,%esp
 570:	5b                   	pop    %ebx
 571:	5e                   	pop    %esi
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    

00000574 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 581:	8d 45 0c             	lea    0xc(%ebp),%eax
 584:	83 c0 04             	add    $0x4,%eax
 587:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 591:	e9 7c 01 00 00       	jmp    712 <printf+0x19e>
    c = fmt[i] & 0xff;
 596:	8b 55 0c             	mov    0xc(%ebp),%edx
 599:	8b 45 f0             	mov    -0x10(%ebp),%eax
 59c:	01 d0                	add    %edx,%eax
 59e:	0f b6 00             	movzbl (%eax),%eax
 5a1:	0f be c0             	movsbl %al,%eax
 5a4:	25 ff 00 00 00       	and    $0xff,%eax
 5a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5ac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b0:	75 2c                	jne    5de <printf+0x6a>
      if(c == '%'){
 5b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b6:	75 0c                	jne    5c4 <printf+0x50>
        state = '%';
 5b8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5bf:	e9 4a 01 00 00       	jmp    70e <printf+0x19a>
      } else {
        putc(fd, c);
 5c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c7:	0f be c0             	movsbl %al,%eax
 5ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ce:	8b 45 08             	mov    0x8(%ebp),%eax
 5d1:	89 04 24             	mov    %eax,(%esp)
 5d4:	e8 bb fe ff ff       	call   494 <putc>
 5d9:	e9 30 01 00 00       	jmp    70e <printf+0x19a>
      }
    } else if(state == '%'){
 5de:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e2:	0f 85 26 01 00 00    	jne    70e <printf+0x19a>
      if(c == 'd'){
 5e8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5ec:	75 2d                	jne    61b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f1:	8b 00                	mov    (%eax),%eax
 5f3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5fa:	00 
 5fb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 602:	00 
 603:	89 44 24 04          	mov    %eax,0x4(%esp)
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	89 04 24             	mov    %eax,(%esp)
 60d:	e8 aa fe ff ff       	call   4bc <printint>
        ap++;
 612:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 616:	e9 ec 00 00 00       	jmp    707 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 61b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 61f:	74 06                	je     627 <printf+0xb3>
 621:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 625:	75 2d                	jne    654 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 627:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62a:	8b 00                	mov    (%eax),%eax
 62c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 633:	00 
 634:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 63b:	00 
 63c:	89 44 24 04          	mov    %eax,0x4(%esp)
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	89 04 24             	mov    %eax,(%esp)
 646:	e8 71 fe ff ff       	call   4bc <printint>
        ap++;
 64b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64f:	e9 b3 00 00 00       	jmp    707 <printf+0x193>
      } else if(c == 's'){
 654:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 658:	75 45                	jne    69f <printf+0x12b>
        s = (char*)*ap;
 65a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65d:	8b 00                	mov    (%eax),%eax
 65f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 662:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 666:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66a:	75 09                	jne    675 <printf+0x101>
          s = "(null)";
 66c:	c7 45 f4 7d 09 00 00 	movl   $0x97d,-0xc(%ebp)
        while(*s != 0){
 673:	eb 1e                	jmp    693 <printf+0x11f>
 675:	eb 1c                	jmp    693 <printf+0x11f>
          putc(fd, *s);
 677:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67a:	0f b6 00             	movzbl (%eax),%eax
 67d:	0f be c0             	movsbl %al,%eax
 680:	89 44 24 04          	mov    %eax,0x4(%esp)
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	89 04 24             	mov    %eax,(%esp)
 68a:	e8 05 fe ff ff       	call   494 <putc>
          s++;
 68f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 693:	8b 45 f4             	mov    -0xc(%ebp),%eax
 696:	0f b6 00             	movzbl (%eax),%eax
 699:	84 c0                	test   %al,%al
 69b:	75 da                	jne    677 <printf+0x103>
 69d:	eb 68                	jmp    707 <printf+0x193>
        }
      } else if(c == 'c'){
 69f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a3:	75 1d                	jne    6c2 <printf+0x14e>
        putc(fd, *ap);
 6a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a8:	8b 00                	mov    (%eax),%eax
 6aa:	0f be c0             	movsbl %al,%eax
 6ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	89 04 24             	mov    %eax,(%esp)
 6b7:	e8 d8 fd ff ff       	call   494 <putc>
        ap++;
 6bc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c0:	eb 45                	jmp    707 <printf+0x193>
      } else if(c == '%'){
 6c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c6:	75 17                	jne    6df <printf+0x16b>
        putc(fd, c);
 6c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cb:	0f be c0             	movsbl %al,%eax
 6ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	89 04 24             	mov    %eax,(%esp)
 6d8:	e8 b7 fd ff ff       	call   494 <putc>
 6dd:	eb 28                	jmp    707 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6df:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6e6:	00 
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	89 04 24             	mov    %eax,(%esp)
 6ed:	e8 a2 fd ff ff       	call   494 <putc>
        putc(fd, c);
 6f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f5:	0f be c0             	movsbl %al,%eax
 6f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 8d fd ff ff       	call   494 <putc>
      }
      state = 0;
 707:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 70e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 712:	8b 55 0c             	mov    0xc(%ebp),%edx
 715:	8b 45 f0             	mov    -0x10(%ebp),%eax
 718:	01 d0                	add    %edx,%eax
 71a:	0f b6 00             	movzbl (%eax),%eax
 71d:	84 c0                	test   %al,%al
 71f:	0f 85 71 fe ff ff    	jne    596 <printf+0x22>
    }
  }
}
 725:	c9                   	leave  
 726:	c3                   	ret    

00000727 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 727:	55                   	push   %ebp
 728:	89 e5                	mov    %esp,%ebp
 72a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	83 e8 08             	sub    $0x8,%eax
 733:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 736:	a1 14 0c 00 00       	mov    0xc14,%eax
 73b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 73e:	eb 24                	jmp    764 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 748:	77 12                	ja     75c <free+0x35>
 74a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 750:	77 24                	ja     776 <free+0x4f>
 752:	8b 45 fc             	mov    -0x4(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75a:	77 1a                	ja     776 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75f:	8b 00                	mov    (%eax),%eax
 761:	89 45 fc             	mov    %eax,-0x4(%ebp)
 764:	8b 45 f8             	mov    -0x8(%ebp),%eax
 767:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76a:	76 d4                	jbe    740 <free+0x19>
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 00                	mov    (%eax),%eax
 771:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 774:	76 ca                	jbe    740 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 776:	8b 45 f8             	mov    -0x8(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	01 c2                	add    %eax,%edx
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	8b 00                	mov    (%eax),%eax
 78d:	39 c2                	cmp    %eax,%edx
 78f:	75 24                	jne    7b5 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 791:	8b 45 f8             	mov    -0x8(%ebp),%eax
 794:	8b 50 04             	mov    0x4(%eax),%edx
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	8b 40 04             	mov    0x4(%eax),%eax
 79f:	01 c2                	add    %eax,%edx
 7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a4:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	8b 10                	mov    (%eax),%edx
 7ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b1:	89 10                	mov    %edx,(%eax)
 7b3:	eb 0a                	jmp    7bf <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 10                	mov    (%eax),%edx
 7ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bd:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c2:	8b 40 04             	mov    0x4(%eax),%eax
 7c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cf:	01 d0                	add    %edx,%eax
 7d1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d4:	75 20                	jne    7f6 <free+0xcf>
    p->s.size += bp->s.size;
 7d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d9:	8b 50 04             	mov    0x4(%eax),%edx
 7dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7df:	8b 40 04             	mov    0x4(%eax),%eax
 7e2:	01 c2                	add    %eax,%edx
 7e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f2:	89 10                	mov    %edx,(%eax)
 7f4:	eb 08                	jmp    7fe <free+0xd7>
  } else
    p->s.ptr = bp;
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7fc:	89 10                	mov    %edx,(%eax)
  freep = p;
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	a3 14 0c 00 00       	mov    %eax,0xc14
}
 806:	c9                   	leave  
 807:	c3                   	ret    

00000808 <morecore>:

static Header*
morecore(uint nu)
{
 808:	55                   	push   %ebp
 809:	89 e5                	mov    %esp,%ebp
 80b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 80e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 815:	77 07                	ja     81e <morecore+0x16>
    nu = 4096;
 817:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 81e:	8b 45 08             	mov    0x8(%ebp),%eax
 821:	c1 e0 03             	shl    $0x3,%eax
 824:	89 04 24             	mov    %eax,(%esp)
 827:	e8 48 fc ff ff       	call   474 <sbrk>
 82c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 82f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 833:	75 07                	jne    83c <morecore+0x34>
    return 0;
 835:	b8 00 00 00 00       	mov    $0x0,%eax
 83a:	eb 22                	jmp    85e <morecore+0x56>
  hp = (Header*)p;
 83c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 842:	8b 45 f0             	mov    -0x10(%ebp),%eax
 845:	8b 55 08             	mov    0x8(%ebp),%edx
 848:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 84b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84e:	83 c0 08             	add    $0x8,%eax
 851:	89 04 24             	mov    %eax,(%esp)
 854:	e8 ce fe ff ff       	call   727 <free>
  return freep;
 859:	a1 14 0c 00 00       	mov    0xc14,%eax
}
 85e:	c9                   	leave  
 85f:	c3                   	ret    

00000860 <malloc>:

void*
malloc(uint nbytes)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	83 c0 07             	add    $0x7,%eax
 86c:	c1 e8 03             	shr    $0x3,%eax
 86f:	83 c0 01             	add    $0x1,%eax
 872:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 875:	a1 14 0c 00 00       	mov    0xc14,%eax
 87a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 87d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 881:	75 23                	jne    8a6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 883:	c7 45 f0 0c 0c 00 00 	movl   $0xc0c,-0x10(%ebp)
 88a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88d:	a3 14 0c 00 00       	mov    %eax,0xc14
 892:	a1 14 0c 00 00       	mov    0xc14,%eax
 897:	a3 0c 0c 00 00       	mov    %eax,0xc0c
    base.s.size = 0;
 89c:	c7 05 10 0c 00 00 00 	movl   $0x0,0xc10
 8a3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a9:	8b 00                	mov    (%eax),%eax
 8ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	8b 40 04             	mov    0x4(%eax),%eax
 8b4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b7:	72 4d                	jb     906 <malloc+0xa6>
      if(p->s.size == nunits)
 8b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bc:	8b 40 04             	mov    0x4(%eax),%eax
 8bf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c2:	75 0c                	jne    8d0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c7:	8b 10                	mov    (%eax),%edx
 8c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cc:	89 10                	mov    %edx,(%eax)
 8ce:	eb 26                	jmp    8f6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	8b 40 04             	mov    0x4(%eax),%eax
 8d6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8d9:	89 c2                	mov    %eax,%edx
 8db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8de:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e4:	8b 40 04             	mov    0x4(%eax),%eax
 8e7:	c1 e0 03             	shl    $0x3,%eax
 8ea:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8f3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f9:	a3 14 0c 00 00       	mov    %eax,0xc14
      return (void*)(p + 1);
 8fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 901:	83 c0 08             	add    $0x8,%eax
 904:	eb 38                	jmp    93e <malloc+0xde>
    }
    if(p == freep)
 906:	a1 14 0c 00 00       	mov    0xc14,%eax
 90b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 90e:	75 1b                	jne    92b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 910:	8b 45 ec             	mov    -0x14(%ebp),%eax
 913:	89 04 24             	mov    %eax,(%esp)
 916:	e8 ed fe ff ff       	call   808 <morecore>
 91b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 91e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 922:	75 07                	jne    92b <malloc+0xcb>
        return 0;
 924:	b8 00 00 00 00       	mov    $0x0,%eax
 929:	eb 13                	jmp    93e <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 931:	8b 45 f4             	mov    -0xc(%ebp),%eax
 934:	8b 00                	mov    (%eax),%eax
 936:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 939:	e9 70 ff ff ff       	jmp    8ae <malloc+0x4e>
}
 93e:	c9                   	leave  
 93f:	c3                   	ret    
