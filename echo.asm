
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 45 09 00 00       	mov    $0x945,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 47 09 00 00       	mov    $0x947,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 49 09 00 	movl   $0x949,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 20 05 00 00       	call   579 <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 85 03 00 00       	call   3f1 <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 10                	mov    %dl,(%eax)
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 08                	jmp    ce <strcmp+0xd>
    p++, q++;
  c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	74 10                	je     e8 <strcmp+0x27>
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	0f b6 10             	movzbl (%eax),%edx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	38 c2                	cmp    %al,%dl
  e6:	74 de                	je     c6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	0f b6 d0             	movzbl %al,%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	29 c2                	sub    %eax,%edx
  fc:	89 d0                	mov    %edx,%eax
}
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10d:	eb 04                	jmp    113 <strlen+0x13>
 10f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 113:	8b 55 fc             	mov    -0x4(%ebp),%edx
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	01 d0                	add    %edx,%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ed                	jne    10f <strlen+0xf>
    ;
  return n;
 122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <memset>:

void*
memset(void *dst, int c, uint n)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12d:	8b 45 10             	mov    0x10(%ebp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 04 24             	mov    %eax,(%esp)
 141:	e8 26 ff ff ff       	call   6c <stosb>
  return dst;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
}
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 157:	eb 14                	jmp    16d <strchr+0x22>
    if(*s == c)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 162:	75 05                	jne    169 <strchr+0x1e>
      return (char*)s;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	eb 13                	jmp    17c <strchr+0x31>
  for(; *s; s++)
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 e2                	jne    159 <strchr+0xe>
  return 0;
 177:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17c:	c9                   	leave  
 17d:	c3                   	ret    

0000017e <gets>:

char*
gets(char *buf, int max)
{
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18b:	eb 4c                	jmp    1d9 <gets+0x5b>
    cc = read(0, &c, 1);
 18d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 194:	00 
 195:	8d 45 ef             	lea    -0x11(%ebp),%eax
 198:	89 44 24 04          	mov    %eax,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 61 02 00 00       	call   409 <read>
 1a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1af:	7f 02                	jg     1b3 <gets+0x35>
      break;
 1b1:	eb 31                	jmp    1e4 <gets+0x66>
    buf[i++] = c;
 1b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b6:	8d 50 01             	lea    0x1(%eax),%edx
 1b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bc:	89 c2                	mov    %eax,%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 c2                	add    %eax,%edx
 1c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 13                	je     1e4 <gets+0x66>
 1d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 0b                	je     1e4 <gets+0x66>
  for(i=0; i+1 < max; ){
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e2:	7c a9                	jl     18d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 201:	00 
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 04 24             	mov    %eax,(%esp)
 208:	e8 24 02 00 00       	call   431 <open>
 20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 1a 02 00 00       	call   449 <fstat>
 22f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 232:	8b 45 f4             	mov    -0xc(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 dc 01 00 00       	call   419 <close>
  return r;
 23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <atoi>:

int
atoi(const char *s)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24f:	eb 25                	jmp    276 <atoi+0x34>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c1                	mov    %eax,%ecx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 08             	mov    %edx,0x8(%ebp)
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	0f be c0             	movsbl %al,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	83 e8 30             	sub    $0x30,%eax
 273:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	0f b6 00             	movzbl (%eax),%eax
 27c:	3c 2f                	cmp    $0x2f,%al
 27e:	7e 0a                	jle    28a <atoi+0x48>
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	3c 39                	cmp    $0x39,%al
 288:	7e c7                	jle    251 <atoi+0xf>
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a1:	eb 17                	jmp    2ba <memmove+0x2b>
    *dst++ = *src++;
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 50 01             	lea    0x1(%eax),%edx
 2a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2af:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b5:	0f b6 12             	movzbl (%edx),%edx
 2b8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
 2bd:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c0:	89 55 10             	mov    %edx,0x10(%ebp)
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f dc                	jg     2a3 <memmove+0x14>
  return vdst;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <ps>:

void
ps(void)
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2d8:	c7 44 24 04 4e 09 00 	movl   $0x94e,0x4(%esp)
 2df:	00 
 2e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e7:	e8 8d 02 00 00       	call   579 <printf>
  getpinfo(&pinfo);
 2ec:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2f2:	89 04 24             	mov    %eax,(%esp)
 2f5:	e8 97 01 00 00       	call   491 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 2fa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 301:	e9 ce 00 00 00       	jmp    3d4 <ps+0x108>
      if (pinfo[i].inuse) {
 306:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 309:	89 d0                	mov    %edx,%eax
 30b:	c1 e0 03             	shl    $0x3,%eax
 30e:	01 d0                	add    %edx,%eax
 310:	c1 e0 02             	shl    $0x2,%eax
 313:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 316:	01 d8                	add    %ebx,%eax
 318:	2d 04 09 00 00       	sub    $0x904,%eax
 31d:	8b 00                	mov    (%eax),%eax
 31f:	85 c0                	test   %eax,%eax
 321:	0f 84 a9 00 00 00    	je     3d0 <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 327:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 32d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 330:	89 d0                	mov    %edx,%eax
 332:	c1 e0 03             	shl    $0x3,%eax
 335:	01 d0                	add    %edx,%eax
 337:	c1 e0 02             	shl    $0x2,%eax
 33a:	83 c0 10             	add    $0x10,%eax
 33d:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 340:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 343:	89 d0                	mov    %edx,%eax
 345:	c1 e0 03             	shl    $0x3,%eax
 348:	01 d0                	add    %edx,%eax
 34a:	c1 e0 02             	shl    $0x2,%eax
 34d:	8d 75 e8             	lea    -0x18(%ebp),%esi
 350:	01 f0                	add    %esi,%eax
 352:	2d e4 08 00 00       	sub    $0x8e4,%eax
 357:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 35a:	0f be f0             	movsbl %al,%esi
 35d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 360:	89 d0                	mov    %edx,%eax
 362:	c1 e0 03             	shl    $0x3,%eax
 365:	01 d0                	add    %edx,%eax
 367:	c1 e0 02             	shl    $0x2,%eax
 36a:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 36d:	01 c8                	add    %ecx,%eax
 36f:	2d f8 08 00 00       	sub    $0x8f8,%eax
 374:	8b 18                	mov    (%eax),%ebx
 376:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 379:	89 d0                	mov    %edx,%eax
 37b:	c1 e0 03             	shl    $0x3,%eax
 37e:	01 d0                	add    %edx,%eax
 380:	c1 e0 02             	shl    $0x2,%eax
 383:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 386:	01 c8                	add    %ecx,%eax
 388:	2d 00 09 00 00       	sub    $0x900,%eax
 38d:	8b 08                	mov    (%eax),%ecx
 38f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 392:	89 d0                	mov    %edx,%eax
 394:	c1 e0 03             	shl    $0x3,%eax
 397:	01 d0                	add    %edx,%eax
 399:	c1 e0 02             	shl    $0x2,%eax
 39c:	8d 55 e8             	lea    -0x18(%ebp),%edx
 39f:	01 d0                	add    %edx,%eax
 3a1:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3a6:	8b 00                	mov    (%eax),%eax
 3a8:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3ac:	89 74 24 14          	mov    %esi,0x14(%esp)
 3b0:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3b4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3b8:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bc:	c7 44 24 04 67 09 00 	movl   $0x967,0x4(%esp)
 3c3:	00 
 3c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3cb:	e8 a9 01 00 00       	call   579 <printf>
  for (i = 0; i < NPROC; i++) {
 3d0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3d4:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3d8:	0f 8e 28 ff ff ff    	jle    306 <ps+0x3a>
      }
  }

}
 3de:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3e4:	5b                   	pop    %ebx
 3e5:	5e                   	pop    %esi
 3e6:	5f                   	pop    %edi
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e9:	b8 01 00 00 00       	mov    $0x1,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <exit>:
SYSCALL(exit)
 3f1:	b8 02 00 00 00       	mov    $0x2,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <wait>:
SYSCALL(wait)
 3f9:	b8 03 00 00 00       	mov    $0x3,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <pipe>:
SYSCALL(pipe)
 401:	b8 04 00 00 00       	mov    $0x4,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <read>:
SYSCALL(read)
 409:	b8 05 00 00 00       	mov    $0x5,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <write>:
SYSCALL(write)
 411:	b8 10 00 00 00       	mov    $0x10,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <close>:
SYSCALL(close)
 419:	b8 15 00 00 00       	mov    $0x15,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <kill>:
SYSCALL(kill)
 421:	b8 06 00 00 00       	mov    $0x6,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <exec>:
SYSCALL(exec)
 429:	b8 07 00 00 00       	mov    $0x7,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <open>:
SYSCALL(open)
 431:	b8 0f 00 00 00       	mov    $0xf,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <mknod>:
SYSCALL(mknod)
 439:	b8 11 00 00 00       	mov    $0x11,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <unlink>:
SYSCALL(unlink)
 441:	b8 12 00 00 00       	mov    $0x12,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <fstat>:
SYSCALL(fstat)
 449:	b8 08 00 00 00       	mov    $0x8,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <link>:
SYSCALL(link)
 451:	b8 13 00 00 00       	mov    $0x13,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <mkdir>:
SYSCALL(mkdir)
 459:	b8 14 00 00 00       	mov    $0x14,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <chdir>:
SYSCALL(chdir)
 461:	b8 09 00 00 00       	mov    $0x9,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <dup>:
SYSCALL(dup)
 469:	b8 0a 00 00 00       	mov    $0xa,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <getpid>:
SYSCALL(getpid)
 471:	b8 0b 00 00 00       	mov    $0xb,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <sbrk>:
SYSCALL(sbrk)
 479:	b8 0c 00 00 00       	mov    $0xc,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <sleep>:
SYSCALL(sleep)
 481:	b8 0d 00 00 00       	mov    $0xd,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <uptime>:
SYSCALL(uptime)
 489:	b8 0e 00 00 00       	mov    $0xe,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <getpinfo>:
SYSCALL(getpinfo)
 491:	b8 16 00 00 00       	mov    $0x16,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	83 ec 18             	sub    $0x18,%esp
 49f:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a2:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ac:	00 
 4ad:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	89 04 24             	mov    %eax,(%esp)
 4ba:	e8 52 ff ff ff       	call   411 <write>
}
 4bf:	c9                   	leave  
 4c0:	c3                   	ret    

000004c1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4d0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d4:	74 17                	je     4ed <printint+0x2c>
 4d6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4da:	79 11                	jns    4ed <printint+0x2c>
    neg = 1;
 4dc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e6:	f7 d8                	neg    %eax
 4e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4eb:	eb 06                	jmp    4f3 <printint+0x32>
  } else {
    x = xx;
 4ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4fa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4fd:	8d 41 01             	lea    0x1(%ecx),%eax
 500:	89 45 f4             	mov    %eax,-0xc(%ebp)
 503:	8b 5d 10             	mov    0x10(%ebp),%ebx
 506:	8b 45 ec             	mov    -0x14(%ebp),%eax
 509:	ba 00 00 00 00       	mov    $0x0,%edx
 50e:	f7 f3                	div    %ebx
 510:	89 d0                	mov    %edx,%eax
 512:	0f b6 80 f4 0b 00 00 	movzbl 0xbf4(%eax),%eax
 519:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 51d:	8b 75 10             	mov    0x10(%ebp),%esi
 520:	8b 45 ec             	mov    -0x14(%ebp),%eax
 523:	ba 00 00 00 00       	mov    $0x0,%edx
 528:	f7 f6                	div    %esi
 52a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 531:	75 c7                	jne    4fa <printint+0x39>
  if(neg)
 533:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 537:	74 10                	je     549 <printint+0x88>
    buf[i++] = '-';
 539:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53c:	8d 50 01             	lea    0x1(%eax),%edx
 53f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 542:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 547:	eb 1f                	jmp    568 <printint+0xa7>
 549:	eb 1d                	jmp    568 <printint+0xa7>
    putc(fd, buf[i]);
 54b:	8d 55 dc             	lea    -0x24(%ebp),%edx
 54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 551:	01 d0                	add    %edx,%eax
 553:	0f b6 00             	movzbl (%eax),%eax
 556:	0f be c0             	movsbl %al,%eax
 559:	89 44 24 04          	mov    %eax,0x4(%esp)
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	89 04 24             	mov    %eax,(%esp)
 563:	e8 31 ff ff ff       	call   499 <putc>
  while(--i >= 0)
 568:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 56c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 570:	79 d9                	jns    54b <printint+0x8a>
}
 572:	83 c4 30             	add    $0x30,%esp
 575:	5b                   	pop    %ebx
 576:	5e                   	pop    %esi
 577:	5d                   	pop    %ebp
 578:	c3                   	ret    

00000579 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 586:	8d 45 0c             	lea    0xc(%ebp),%eax
 589:	83 c0 04             	add    $0x4,%eax
 58c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 596:	e9 7c 01 00 00       	jmp    717 <printf+0x19e>
    c = fmt[i] & 0xff;
 59b:	8b 55 0c             	mov    0xc(%ebp),%edx
 59e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a1:	01 d0                	add    %edx,%eax
 5a3:	0f b6 00             	movzbl (%eax),%eax
 5a6:	0f be c0             	movsbl %al,%eax
 5a9:	25 ff 00 00 00       	and    $0xff,%eax
 5ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b5:	75 2c                	jne    5e3 <printf+0x6a>
      if(c == '%'){
 5b7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5bb:	75 0c                	jne    5c9 <printf+0x50>
        state = '%';
 5bd:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5c4:	e9 4a 01 00 00       	jmp    713 <printf+0x19a>
      } else {
        putc(fd, c);
 5c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5cc:	0f be c0             	movsbl %al,%eax
 5cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	89 04 24             	mov    %eax,(%esp)
 5d9:	e8 bb fe ff ff       	call   499 <putc>
 5de:	e9 30 01 00 00       	jmp    713 <printf+0x19a>
      }
    } else if(state == '%'){
 5e3:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e7:	0f 85 26 01 00 00    	jne    713 <printf+0x19a>
      if(c == 'd'){
 5ed:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5f1:	75 2d                	jne    620 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f6:	8b 00                	mov    (%eax),%eax
 5f8:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5ff:	00 
 600:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 607:	00 
 608:	89 44 24 04          	mov    %eax,0x4(%esp)
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	89 04 24             	mov    %eax,(%esp)
 612:	e8 aa fe ff ff       	call   4c1 <printint>
        ap++;
 617:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 61b:	e9 ec 00 00 00       	jmp    70c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 620:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 624:	74 06                	je     62c <printf+0xb3>
 626:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 62a:	75 2d                	jne    659 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 62c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 638:	00 
 639:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 640:	00 
 641:	89 44 24 04          	mov    %eax,0x4(%esp)
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	89 04 24             	mov    %eax,(%esp)
 64b:	e8 71 fe ff ff       	call   4c1 <printint>
        ap++;
 650:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 654:	e9 b3 00 00 00       	jmp    70c <printf+0x193>
      } else if(c == 's'){
 659:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 65d:	75 45                	jne    6a4 <printf+0x12b>
        s = (char*)*ap;
 65f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 662:	8b 00                	mov    (%eax),%eax
 664:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 667:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 66b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66f:	75 09                	jne    67a <printf+0x101>
          s = "(null)";
 671:	c7 45 f4 77 09 00 00 	movl   $0x977,-0xc(%ebp)
        while(*s != 0){
 678:	eb 1e                	jmp    698 <printf+0x11f>
 67a:	eb 1c                	jmp    698 <printf+0x11f>
          putc(fd, *s);
 67c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67f:	0f b6 00             	movzbl (%eax),%eax
 682:	0f be c0             	movsbl %al,%eax
 685:	89 44 24 04          	mov    %eax,0x4(%esp)
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	89 04 24             	mov    %eax,(%esp)
 68f:	e8 05 fe ff ff       	call   499 <putc>
          s++;
 694:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 698:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69b:	0f b6 00             	movzbl (%eax),%eax
 69e:	84 c0                	test   %al,%al
 6a0:	75 da                	jne    67c <printf+0x103>
 6a2:	eb 68                	jmp    70c <printf+0x193>
        }
      } else if(c == 'c'){
 6a4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a8:	75 1d                	jne    6c7 <printf+0x14e>
        putc(fd, *ap);
 6aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ad:	8b 00                	mov    (%eax),%eax
 6af:	0f be c0             	movsbl %al,%eax
 6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	89 04 24             	mov    %eax,(%esp)
 6bc:	e8 d8 fd ff ff       	call   499 <putc>
        ap++;
 6c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c5:	eb 45                	jmp    70c <printf+0x193>
      } else if(c == '%'){
 6c7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6cb:	75 17                	jne    6e4 <printf+0x16b>
        putc(fd, c);
 6cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d0:	0f be c0             	movsbl %al,%eax
 6d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d7:	8b 45 08             	mov    0x8(%ebp),%eax
 6da:	89 04 24             	mov    %eax,(%esp)
 6dd:	e8 b7 fd ff ff       	call   499 <putc>
 6e2:	eb 28                	jmp    70c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6eb:	00 
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 a2 fd ff ff       	call   499 <putc>
        putc(fd, c);
 6f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fa:	0f be c0             	movsbl %al,%eax
 6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 701:	8b 45 08             	mov    0x8(%ebp),%eax
 704:	89 04 24             	mov    %eax,(%esp)
 707:	e8 8d fd ff ff       	call   499 <putc>
      }
      state = 0;
 70c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 713:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 717:	8b 55 0c             	mov    0xc(%ebp),%edx
 71a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71d:	01 d0                	add    %edx,%eax
 71f:	0f b6 00             	movzbl (%eax),%eax
 722:	84 c0                	test   %al,%al
 724:	0f 85 71 fe ff ff    	jne    59b <printf+0x22>
    }
  }
}
 72a:	c9                   	leave  
 72b:	c3                   	ret    

0000072c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72c:	55                   	push   %ebp
 72d:	89 e5                	mov    %esp,%ebp
 72f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	83 e8 08             	sub    $0x8,%eax
 738:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73b:	a1 10 0c 00 00       	mov    0xc10,%eax
 740:	89 45 fc             	mov    %eax,-0x4(%ebp)
 743:	eb 24                	jmp    769 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74d:	77 12                	ja     761 <free+0x35>
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 755:	77 24                	ja     77b <free+0x4f>
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75f:	77 1a                	ja     77b <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	89 45 fc             	mov    %eax,-0x4(%ebp)
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76f:	76 d4                	jbe    745 <free+0x19>
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 779:	76 ca                	jbe    745 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 788:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78b:	01 c2                	add    %eax,%edx
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 00                	mov    (%eax),%eax
 792:	39 c2                	cmp    %eax,%edx
 794:	75 24                	jne    7ba <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 796:	8b 45 f8             	mov    -0x8(%ebp),%eax
 799:	8b 50 04             	mov    0x4(%eax),%edx
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	8b 00                	mov    (%eax),%eax
 7a1:	8b 40 04             	mov    0x4(%eax),%eax
 7a4:	01 c2                	add    %eax,%edx
 7a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	8b 00                	mov    (%eax),%eax
 7b1:	8b 10                	mov    (%eax),%edx
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	89 10                	mov    %edx,(%eax)
 7b8:	eb 0a                	jmp    7c4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	8b 40 04             	mov    0x4(%eax),%eax
 7ca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	01 d0                	add    %edx,%eax
 7d6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d9:	75 20                	jne    7fb <free+0xcf>
    p->s.size += bp->s.size;
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	8b 50 04             	mov    0x4(%eax),%edx
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	8b 40 04             	mov    0x4(%eax),%eax
 7e7:	01 c2                	add    %eax,%edx
 7e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ec:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	89 10                	mov    %edx,(%eax)
 7f9:	eb 08                	jmp    803 <free+0xd7>
  } else
    p->s.ptr = bp;
 7fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fe:	8b 55 f8             	mov    -0x8(%ebp),%edx
 801:	89 10                	mov    %edx,(%eax)
  freep = p;
 803:	8b 45 fc             	mov    -0x4(%ebp),%eax
 806:	a3 10 0c 00 00       	mov    %eax,0xc10
}
 80b:	c9                   	leave  
 80c:	c3                   	ret    

0000080d <morecore>:

static Header*
morecore(uint nu)
{
 80d:	55                   	push   %ebp
 80e:	89 e5                	mov    %esp,%ebp
 810:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 813:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 81a:	77 07                	ja     823 <morecore+0x16>
    nu = 4096;
 81c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 823:	8b 45 08             	mov    0x8(%ebp),%eax
 826:	c1 e0 03             	shl    $0x3,%eax
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 48 fc ff ff       	call   479 <sbrk>
 831:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 834:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 838:	75 07                	jne    841 <morecore+0x34>
    return 0;
 83a:	b8 00 00 00 00       	mov    $0x0,%eax
 83f:	eb 22                	jmp    863 <morecore+0x56>
  hp = (Header*)p;
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 847:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84a:	8b 55 08             	mov    0x8(%ebp),%edx
 84d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 850:	8b 45 f0             	mov    -0x10(%ebp),%eax
 853:	83 c0 08             	add    $0x8,%eax
 856:	89 04 24             	mov    %eax,(%esp)
 859:	e8 ce fe ff ff       	call   72c <free>
  return freep;
 85e:	a1 10 0c 00 00       	mov    0xc10,%eax
}
 863:	c9                   	leave  
 864:	c3                   	ret    

00000865 <malloc>:

void*
malloc(uint nbytes)
{
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	83 c0 07             	add    $0x7,%eax
 871:	c1 e8 03             	shr    $0x3,%eax
 874:	83 c0 01             	add    $0x1,%eax
 877:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 87a:	a1 10 0c 00 00       	mov    0xc10,%eax
 87f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 882:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 886:	75 23                	jne    8ab <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 888:	c7 45 f0 08 0c 00 00 	movl   $0xc08,-0x10(%ebp)
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	a3 10 0c 00 00       	mov    %eax,0xc10
 897:	a1 10 0c 00 00       	mov    0xc10,%eax
 89c:	a3 08 0c 00 00       	mov    %eax,0xc08
    base.s.size = 0;
 8a1:	c7 05 0c 0c 00 00 00 	movl   $0x0,0xc0c
 8a8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ae:	8b 00                	mov    (%eax),%eax
 8b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b6:	8b 40 04             	mov    0x4(%eax),%eax
 8b9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8bc:	72 4d                	jb     90b <malloc+0xa6>
      if(p->s.size == nunits)
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	8b 40 04             	mov    0x4(%eax),%eax
 8c4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c7:	75 0c                	jne    8d5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	8b 10                	mov    (%eax),%edx
 8ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d1:	89 10                	mov    %edx,(%eax)
 8d3:	eb 26                	jmp    8fb <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d8:	8b 40 04             	mov    0x4(%eax),%eax
 8db:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8de:	89 c2                	mov    %eax,%edx
 8e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e9:	8b 40 04             	mov    0x4(%eax),%eax
 8ec:	c1 e0 03             	shl    $0x3,%eax
 8ef:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f5:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8f8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fe:	a3 10 0c 00 00       	mov    %eax,0xc10
      return (void*)(p + 1);
 903:	8b 45 f4             	mov    -0xc(%ebp),%eax
 906:	83 c0 08             	add    $0x8,%eax
 909:	eb 38                	jmp    943 <malloc+0xde>
    }
    if(p == freep)
 90b:	a1 10 0c 00 00       	mov    0xc10,%eax
 910:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 913:	75 1b                	jne    930 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 915:	8b 45 ec             	mov    -0x14(%ebp),%eax
 918:	89 04 24             	mov    %eax,(%esp)
 91b:	e8 ed fe ff ff       	call   80d <morecore>
 920:	89 45 f4             	mov    %eax,-0xc(%ebp)
 923:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 927:	75 07                	jne    930 <malloc+0xcb>
        return 0;
 929:	b8 00 00 00 00       	mov    $0x0,%eax
 92e:	eb 13                	jmp    943 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 930:	8b 45 f4             	mov    -0xc(%ebp),%eax
 933:	89 45 f0             	mov    %eax,-0x10(%ebp)
 936:	8b 45 f4             	mov    -0xc(%ebp),%eax
 939:	8b 00                	mov    (%eax),%eax
 93b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 93e:	e9 70 ff ff ff       	jmp    8b3 <malloc+0x4e>
}
 943:	c9                   	leave  
 944:	c3                   	ret    
