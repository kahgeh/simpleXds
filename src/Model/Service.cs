namespace simpleXds.Model
{
    public class Service
    {
        public string Name { get; set; }
        public List<Endpoint> Endpoints { get; set; }
    }
}