#!/usr/bin/env python3
import re
import subprocess
import time

found = []

all_domains = [
    '1rx.io',
    '2mdn.net',
    '33across.com',
    '360yield.com',
    '3gppnetwork.org',
    '3lift.com',
    '4dex.io',
    'a-mo.net',
    'a-msedge.net',
    'a2z.com',
    'aaplimg.com',
    'ad.gt',
    'adform.net',
    'adgrx.com',
    'adjust.com',
    'adnxs.com',
    'adobe.com',
    'adobe.io',
    'adobedtm.com',
    'adroll.com',
    'adsafeprotected.com',
    'adsrvr.org',
    'afcdn.net',
    'agkn.com',
    'aiv-cdn.net',
    'aiv-delivery.net',
    'akadns.net',
    'akamai.net',
    'akamaiedge.net',
    'akamaihd.net',
    'akamaized.net',
    'al-array.com',
    'alibaba.com',
    'alicdn.com',
    'aliexpress.com',
    'aliyun.com',
    'aliyuncs.com',
    'allawnos.com',
    'alphonso.tv',
    'amazon-adsystem.com',
    'amazon.com',
    'amazon.dev',
    'amazonalexa.com',
    'amazonaws.com',
    'amazontrust.com',
    'amazonvideo.com',
    'amplitude.com',
    'ampproject.org',
    'android.com',
    'aniview.com',
    'anydesk.com',
    'ap4r.com',
    'app-analytics-services.com',
    'app-measurement.com',
    'appcenter.ms',
    'appier.net',
    'apple-dns.net',
    'apple.com',
    'applovin.com',
    'appsflyer.com',
    'appsflyersdk.com',
    'atomile.com',
    'autodesk.com',
    'avast.com',
    'avcdn.net',
    'avsxappcaptiveportal.com',
    'aws.dev',
    'azure-devices.net',
    'azure.com',
    'azureedge.net',
    'azurefd.net',
    'azurewebsites.net',
    'b-cdn.net',
    'baidu.com',
    'bamgrid.com',
    'bidr.io',
    'bidswitch.net',
    'bigo.sg',
    'bing.com',
    'bitdefender.com',
    'bitdefender.net',
    'blockdh100b.net',
    'blockdh100c.co',
    'bluekai.com',
    'booking.com',
    'bootstrapcdn.com',
    'branch.io',
    'brave.com',
    'braze.com',
    'browser-intake-datadoghq.com',
    'btloader.com',
    'bugsnag.com',
    'bytefcdn-oversea.com',
    'bytefcdn-ttpeu.com',
    'byteglb.com',
    'byteoversea.com',
    'byteoversea.net',
    'bytetcdn.com',
    'canva.com',
    'capcutapi.com',
    'casalemedia.com',
    'cdn-apple.com',
    'cdn20.com',
    'cdn77.org',
    'cdninstagram.com',
    'chartbeat.com',
    'chartbeat.net',
    'chartboost.com',
    'chatgpt.com',
    'checkpoint.com',
    'cisco.com',
    'clarity.ms',
    'cloud.microsoft',
    'cloudflare-dns.com',
    'cloudflare.com',
    'cloudflare.net',
    'cloudflareclient.com',
    'cloudflareinsights.com',
    'cloudfront.net',
    'coloros.com',
    'contentsquare.net',
    'contextweb.com',
    'conviva.com',
    'cookielaw.org',
    'crashlytics.com',
    'creativecdn.com',
    'criteo.com',
    'criteo.net',
    'crwdcntrl.net',
    'cspserver.net',
    'dbankcloud.cn',
    'dbankcloud.com',
    'demdex.net',
    'digicert.com',
    'discord.com',
    'discordapp.com',
    'disqus.com',
    'dns.google',
    'dotomi.com',
    'doubleclick.net',
    'doubleverify.com',
    'douyincdn.com',
    'douyinliving.com',
    'dropbox.com',
    'dropboxapi.com',
    'duckduckgo.com',
    'duolingo.com',
    'dynatrace.com',
    'ea.com',
    'ebay.com',
    'edgekey.net',
    'edgesuite.net',
    'entrust.net',
    'epicgames.com',
    'epicgames.dev',
    'eset.com',
    'espn.com',
    'everesttech.net',
    'example.com',
    'exp-tas.com',
    'facebook.com',
    'facebook.net',
    'fastly-edge.com',
    'fastly.net',
    'fbcdn.net',
    'fbpigeon.com',
    'fbsbx.com',
    'firebaseio.com',
    'firefox.com',
    'firetvcaptiveportal.com',
    'flashtalking.com',
    'fontawesome.com',
    'forter.com',
    'gamepass.com',
    'gcdn.co',
    'ggpht.com',
    'giphy.com',
    'github.com',
    'githubusercontent.com',
    'globalsign.com',
    'globo.com',
    'gmail.com',
    'go-mpulse.net',
    'godaddy.com',
    'google-analytics.com',
    'google.cn',
    'google.com',
    'google.com.br',
    'google.com.hk',
    'googleadservices.com',
    'googleapis.cn',
    'googleapis.com',
    'googlesyndication.com',
    'googletagmanager.com',
    'googletagservices.com',
    'googleusercontent.com',
    'googlevideo.com',
    'googlezip.net',
    'grammarly.com',
    'grammarly.io',
    'gravatar.com',
    'gstatic.com',
    'gumgum.com',
    'gvt1.com',
    'gvt2.com',
    'heytapdl.com',
    'heytapmobi.com',
    'heytapmobile.com',
    'hicloud.com',
    'hihonorcloud.com',
    'hotjar.com',
    'hotmail.com',
    'hp.com',
    'hubspot.com',
    'i18n-pglstatp.com',
    'ibyteimg.com',
    'icloud-content.com',
    'icloud.com',
    'id5-sync.com',
    'igamecj.com',
    'imrworldwide.com',
    'indexww.com',
    'inkuai.com',
    'inmobi.com',
    'inner-active.mobi',
    'innovid.com',
    'instabug.com',
    'instagram.com',
    'intentiq.com',
    'intercom.io',
    'ip-api.com',
    'ipify.org',
    'ipredictive.com',
    'isappcloud.com',
    'isnssdk.com',
    'jquery.com',
    'jsdelivr.net',
    'kargo.com',
    'kaspersky-labs.com',
    'kaspersky.com',
    'klaviyo.com',
    'kwai-pro.com',
    'kwai.net',
    'kwaipros.com',
    'kwcdn.com',
    'kwimgs.com',
    'l-msedge.net',
    'launchdarkly.com',
    'lencr.org',
    'lgtvcommon.com',
    'lgtvsdp.com',
    'liadm.com',
    'licdn.com',
    'life360.com',
    'liftoff.io',
    'lijit.com',
    'linkedin.com',
    'live.com',
    'live.net',
    'mail.ru',
    'mcafee.com',
    'me.com',
    'media-amazon.com',
    'media.net',
    'mediatek.com',
    'meethue.com',
    'meraki.com',
    'mgid.com',
    'mi.com',
    'microsoft.com',
    'microsoftapp.net',
    'microsoftonline.com',
    'microsoftpersonalcontent.com',
    'mikrotik.com',
    'miui.com',
    'miwifi.com',
    'mixpanel.com',
    'mmechocaptiveportal.com',
    'moatads.com',
    'mozgcp.net',
    'mozilla.com',
    'mozilla.net',
    'mozilla.org',
    'msecnd.net',
    'msedge.net',
    'msftconnecttest.com',
    'msftncsi.com',
    'msidentity.com',
    'msn.com',
    'mtgglobals.com',
    'myqcloud.com',
    'mythad.com',
    'mzstatic.com',
    'nel.goog',
    'netflix.com',
    'netflix.net',
    'netgear.com',
    'newrelic.com',
    'nflximg.com',
    'nflxso.net',
    'nflxvideo.net',
    'nist.gov',
    'nr-data.net',
    'ntp.org',
    'ntppool.org',
    'nubank.com.br',
    'nvidia.com',
    'office.com',
    'office.net',
    'office365.com',
    'omnitagjs.com',
    'omtrdc.net',
    'one.one',
    'onedrive.com',
    'onesignal.com',
    'onetag-sys.com',
    'onetrust.com',
    'online-metrix.net',
    'openx.net',
    'opera.com',
    'optimizely.com',
    'outbrain.com',
    'outlook.com',
    'ovscdns.net',
    'paloaltonetworks.com',
    'pangle.io',
    'paypal.com',
    'phicdn.net',
    'phncdn.com',
    'pinimg.com',
    'pinterest.com',
    'pki.goog',
    'playstation.com',
    'playstation.net',
    'postrelease.com',
    'presage.io',
    'pubmatic.com',
    'pubmnet.com',
    'pvp.net',
    'qlivecdn.com',
    'qq.com',
    'qualtrics.com',
    'quantserve.com',
    'rbxcdn.com',
    'recaptcha.net',
    'redd.it',
    'reddit.com',
    'rfihub.com',
    'richaudience.com',
    'ring.com',
    'rlcdn.com',
    'roblox.com',
    'rocket-cdn.com',
    'roku.com',
    'root-servers.net',
    'rubiconproject.com',
    's-msedge.net',
    'safebrowsing.apple',
    'salesforceliveagent.com',
    'samsung.com',
    'samsungacr.com',
    'samsungapps.com',
    'samsungcloud.com',
    'samsungcloud.tv',
    'samsungcloudsolution.com',
    'samsungcloudsolution.net',
    'samsungelectronics.com',
    'samsungosp.com',
    'samsungqbe.com',
    'sc-cdn.net',
    'sc-gw.com',
    'scdn.co',
    'scorecardresearch.com',
    'segment.io',
    'sentinelone.net',
    'sentry.io',
    'sfx.ms',
    'sgsnssdk.com',
    'shalltry.com',
    'sharepoint.com',
    'sharethis.com',
    'sharethrough.com',
    'shopeemobile.com',
    'shopify.com',
    'sitescout.com',
    'skype.com',
    'slack.com',
    'smaato.net',
    'smartadserver.com',
    'smartthings.com',
    'snackvideo.in',
    'snapchat.com',
    'sonobi.com',
    'sophos.com',
    'spamhaus.org',
    'spbycdn.com',
    'speedtest.net',
    'split.io',
    'spo-msedge.net',
    'spot.im',
    'spotify.com',
    'spotifycdn.com',
    'ssl-images-amazon.com',
    'stackadapt.com',
    'static.microsoft',
    'steampowered.com',
    'steamserver.net',
    'steamstatic.com',
    'stickyadstv.com',
    'stripe.com',
    'strpst.com',
    'supercell.com',
    'supersonicads.com',
    'surfshark.com',
    'susercontent.com',
    'svc.ms',
    'symcb.com',
    'synology.com',
    't-msedge.net',
    't.co',
    'taboola.com',
    'taobao.com',
    'tapad.com',
    'teads.tv',
    'teamviewer.com',
    'telegram.org',
    'temu.com',
    'tencent-cloud.net',
    'tiktok.com',
    'tiktokcdn-eu.com',
    'tiktokcdn-us.com',
    'tiktokcdn.com',
    'tiktokv.com',
    'tiktokv.us',
    'tiqcdn.com',
    'tp-link.com',
    'tradingview.com',
    'trafficmanager.net',
    'tremorhub.com',
    'trendmicro.com',
    'tsyndicate.com',
    'ttdns2.com',
    'ttlivecdn.com',
    'ttvnw.net',
    'turn.com',
    'twimg.com',
    'twitch.tv',
    'twitter.com',
    'typekit.net',
    'ubnt.com',
    'ubuntu.com',
    'ui.com',
    'umeng.com',
    'unifi-ai.com',
    'unity3d.com',
    'unpkg.com',
    'unrulymedia.com',
    'userapi.com',
    'verisign.com',
    'viber.com',
    'virtualearth.net',
    'visualstudio.com',
    'vivo.com.cn',
    'vivoglobal.com',
    'vk.com',
    'vungle.com',
    'w55c.net',
    'wac-msedge.net',
    'wbx2.com',
    'weather.com',
    'webex.com',
    'whatsapp.com',
    'whatsapp.net',
    'wikipedia.org',
    'windows.com',
    'windows.net',
    'windowsupdate.com',
    'withgoogle.com',
    'worldfcdn2.com',
    'wsdvs.com',
    'wshareit.com',
    'x.com',
    'xboxlive.com',
    'xhcdn.com',
    'xiaomi.com',
    'xiaomi.net',
    'xnxx-cdn.com',
    'xvideos-cdn.com',
    'yahoo.com',
    'yahoodns.net',
    'yandex.net',
    'yandex.ru',
    'yandexadexchange.net',
    'yellowblue.io',
    'yieldmo.com',
    'youtube.com',
    'ytimg.com',
    'yximgs.com',
    'zemanta.com',
    'zoom.us',
]

start = time.time()
ns_results = []
a_results = []

command = "/home/gitlo/test_html/benchmark/dig.sh "
for domain in all_domains:
    command += domain.strip() + " "
subprocess.Popen(command, shell=True)

look_for = []
for domain in all_domains:
    look_for.append([domain, '', '', '', '', '', ''])
    #1 a record
    #2 ns record
    #3 ip up or down
    #4 org
    #5 country
    #6 asn

prev = 0
for i in range(1):
    not_found = []
    a_haystack = []
    ns_haystack = []
    fping_stack = []
    with open('/tmpfs/dns', 'r') as file:
        lines = file.readlines()
        for line in lines[prev:]:
            if line[0] != ';':
                if 'NS' in line:
                    ns_haystack.append(line.strip())
                elif 'SOA' not in line and 'A' in line:
                    a_haystack.append(line.strip())
        prev = len(lines)

    for domain in look_for:
        if domain[1] == '':
            index = next((i for i, s in enumerate(a_haystack) if domain[0] in s), -1)
            if index >= 0:
                #print(a_haystack[index])
                match = re.search(r'\S+$', a_haystack[index])
                if match:
                    if domain[1] == '':
                        domain[1] = match.group(0).strip()
                        fping_stack.append(match.group(0).strip())
        else:
            fping_stack.append(domain[1])

        if domain[2] == '':
            index = next((i for i, s in enumerate(ns_haystack) if domain[0] in s), -1)
            if index >= 0:
                #print(ns_haystack[index])
                match = re.search(r'\S+$', ns_haystack[index])
                if match:
                    domain[2] = match.group(0).strip()

    command = '/usr/bin/fping '
    for ip  in fping_stack:
        command += ip + ' '
    #print(command)
print(f'Complete duration: {(time.time() - start) * 1000:.3f}')
