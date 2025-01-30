using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("simpleApi")]
public class Controller : ControllerBase
{
    [HttpGet]
    public string Get()
    {
        return "Test API Test API Test";
    }
}
