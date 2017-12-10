---
title:  "public Blog b = new Blog();"
date:   "2017-07-29"
---

Hello and welcome. 

I've decided to pull together this blog, as an attempt at documenting my coding/software activities to some extent. It also comes with the nice side effect of being able to share with others, the wild and wonderful things I've found on the internet, and maybe improve my grammar a bob or two.

So, hopefully some (or all) of the articles I'll publish here will interest you. I won't lie and say I'll publish anywhere close to a regular timeframe, but every time I find something interesting, or I script up something which I think may interest others, I'll endeavour to post something!

You may have inferred from the title, that I'm an OO (more specifically a C# developer), which would be correct in the most part, however I don't focus soley on C# in or out of work, so that won't be the main focus of this blog. Fingers crossed it will be slightly more varied!

Quick summary of my skills and interests? What better way than a cliche' class.

{{< highlight csharp >}}
public class Tom 
{
  public string Location { get; } = "London";
  public IDictionary<Language, Skill> Languages { get; } = new Dictionary<Language, Skill>[]
  {
    [Language.CSharp] = Skill.Experienced,
    [Language.Java] = Skill.Alright,
    [Language.Python] = Skill.BitsAndPieces,
    [Language.Javascript] = Skill.IDabbleAFairAmount,
  }

  public IDE GetIDE(Language language)
  {
    switch(language)
    {
      case Langauge.CSharp: return IDE.VisualStudio.GetCurrentVersion();
      case Langauge.Java: return (DateTime.Now > new DateTime(2014, 1, 1)) ? IDE.IntelliJ : IDE.NetBeans;
      case Langauge.Python:
      case Langauge.Javascript:
      case Langauge.HTML:
      default: return IDE.Atom;
    }
  }
}
{{< / highlight >}}

Anyway, over the next few days/weeks/months I'll shell out this website and backdate all the stuff I've done previously. I think small bits and peices will take the form of a post, whereas larger scale more permantent projects/collaberations, I'll make a seperate area for.

Until next time.
Tom.
